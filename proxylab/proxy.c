
#include "csapp.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <ctype.h>
#include <stdbool.h>
#include <inttypes.h>
#include <unistd.h>
#include <assert.h>

#include <pthread.h>
#include <signal.h>
#include <errno.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <sys/stat.h>

/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400
#define MAX_CACHE_NUMBER (MAX_CACHE_SIZE/MAX_OBJECT_SIZE)

/* You won't lose style points for including this long line in your code */
static const char *user_agent_hdr = "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3\r\n";

struct cache *pCache;
pthread_mutex_t lock;

struct cache{
    int flag;
    char url[MAXLINE];
    int dataSize;
    char data[MAX_OBJECT_SIZE];
    int time;
    pthread_rwlock_t rwlock;
};


void doit(int fd);
void parseUrl(char *url, char *hostname, char *port);
void buildRequest(char *request,char *url,char *hostname,rio_t *rio);
void *threadDoit(void *args);

struct cache* initCache();
int readCache(struct cache* cache, char *url,int fd);
void writeCache(struct cache* cache, char *url, char *data, int dataSize);
void freeCache(struct cache *cache);

int main(int argc, char *argv[])
{
    if(argc != 2){
        fprintf(stderr,"usage:%s <port> \n",argv[0]);
        exit(0);
    }

    pthread_t th;
    int listenfd,connfd;
    struct sockaddr clientaddr;
    socklen_t clientlen;
    listenfd = open_listenfd(argv[1]);
    if(listenfd == -1){
        fprintf(stderr,"can't open port %s \n",argv[1]);
        exit(0);
    }

    /* init cache */
    pCache = initCache();
   

    while(1){
        clientlen = sizeof(clientaddr);
        connfd = Accept(listenfd,&clientaddr,&clientlen);

        // doit(connfd);
        // close(connfd);
         /* multithreading */
        pthread_create(&th,NULL,threadDoit,(void *)connfd);
    }

    freeCache(pCache);
    return 0;
}

void doit(int fd){
    int serverfd;
    char buf[MAXLINE],method[MAXLINE],url[MAXLINE],version[MAXLINE],hostname[MAXLINE],uri[MAXLINE];
    char port[MAXLINE];
    char request[MAXLINE];

    rio_t clientrio,serverrio;
    /* Read request line and headers */
    Rio_readinitb(&clientrio,fd);
    Rio_readlineb(&clientrio,buf,MAXLINE);
    sscanf(buf,"%s %s %s",method,url,version);
    if(strcasecmp(method,"GET") != 0){
        fprintf(stderr,"Proxy does not implement this method\n");
        return;
    }
    strcpy(uri,url);
    parseUrl(uri,hostname,port);

    /* read cache */
    int ret = readCache(pCache,url,fd);
    if(ret == 1){
        Close(fd);
        return;
    }

    buildRequest(request,uri,hostname,&clientrio);
    serverfd = open_clientfd(hostname,port);
    if(serverfd == -1){
        fprintf(stderr,"connect to server failed\n");
        return;
    }
    Rio_readinitb(&serverrio,serverfd);
    Rio_writen(serverfd,request,(size_t)strlen(request));
    size_t n;
    char data[MAX_OBJECT_SIZE];
    int dataSize = 0;
    while( (n = Rio_readlineb(&serverrio,buf,MAXLINE)) >0 ){
        printf("%s",buf);
        if(dataSize + n <= MAX_OBJECT_SIZE){
            memcpy(data+dataSize,buf,n);
        }
        dataSize += n ;
        Rio_writen(fd,buf,n);
    }
    if(dataSize <= MAX_OBJECT_SIZE){
        writeCache(pCache,url,data,dataSize);
    }
    Close(serverfd);
}

void parseUrl(char *url, char *hostname, char *port){
    char buf[MAXLINE];
    strcpy(buf,url);
    char *p1,*p2;
    p1 = strstr(buf,"//");
    if(p1 == NULL){
        p1 = buf;
    }else{
        p1 += 2;
    }
    p2 = strstr(p1,":");
    if(p2 == NULL){
        strcpy(port,"80");
        p2 = strstr(p1,"/");
        if(p2 == NULL){
            p2 = buf + strlen(url);
        }
        *p2 = '\0';
        strcpy(hostname,p1);
    }else{
        *p2 = '\0';
        strcpy(hostname,p1);
        p1 = p2 + 1;
        p2 = strstr(p2+1,"/");
        if(p2 == NULL){
            p2 = buf + strlen(url);
        }
        *p2 = '\0';
        strcpy(port,p1);
    }


    strcpy(buf,url);
    p1 = strstr(buf,"//");
    if(p1 == NULL){
        p1 = buf;
    }else{
        p1 += 2;
    }
    p2 = strstr(p1,"/");
    if(p2 == NULL){
        strcpy(url,"/");
    }else{
        strcpy(url,p2);
    }
    printf("url = %s\n",url);
}

void buildRequest(char *request,char *uri,char *hostname,rio_t *rio){
    
    /* read request */
    char buf[MAXLINE];
    sprintf(request,"GET %s HTTP/1.0\r\n",uri);
    Rio_readlineb(rio,buf,MAXLINE);
    while(strcmp(buf,"\r\n") != 0){
        if(strstr(buf,"Host")){
            sprintf(request,"%sHost: %s\r\n",request,hostname);
        }else if(strstr(buf,"User-Agent")){
            sprintf(request,"%s%s",request,user_agent_hdr);
        }else if(strstr(uri,"Connection")){
            sprintf(request,"%sConnection: close\r\n",request);
        }else if(strstr(uri,"Proxy-Connection")){
            sprintf(request,"%sProxy-Connection: close\r\n",request);
        }else{
            sprintf(request,"%s%s",request,buf);
        }
        Rio_readlineb(rio,buf,MAXLINE);
    }
    sprintf(request,"%s%s",request,buf);
    printf("%s",request);
}

void *threadDoit(void *args){
    int fd = (int)args;
    pthread_detach(pthread_self());
    doit(fd);
    Close(fd);
}

struct cache* initCache(){
    pthread_mutex_init(&lock,NULL);
    struct cache *cache = (struct cache *)malloc(sizeof(struct cache) * MAX_CACHE_NUMBER);
    struct cache *p;
    int i;
    for(i=0, p=cache;i<MAX_CACHE_NUMBER;i++,p++){
        p->flag = 0;
        strcpy(p->url,"");
        p->dataSize = 0;
        memset(p->data,0,MAX_OBJECT_SIZE);
        p->time = INT_MAX;
        pthread_rwlock_init(&p->rwlock,NULL);
    }
    return cache;
}

int readCache(struct cache* cache, char *url,int fd){
    struct cache *p;
    int i;
    for(i=0,p=cache;i<MAX_CACHE_NUMBER;i++,p++){
        if(p->flag != 0 && strcmp(url,p->url) == 0){
            printf("url = %s p->url = %s\n",url,p->url);
            break;
        }
    }
    if(i == MAX_CACHE_NUMBER){
        printf("read cache fail\n");
        return 0;
    }
    pthread_rwlock_rdlock(&p->rwlock);
    if(strcmp(url,p->url) != 0){
        pthread_rwlock_unlock(&p->rwlock);
        return 0;
    }
    pthread_mutex_lock(&lock);

    p->time = INT_MAX;
    struct cache *pt;
    for(i=0,pt = cache;i<MAX_CACHE_NUMBER;i++,pt++){
        if(pt != p){
            pt->time--;
        }
    }
    pthread_mutex_unlock(&lock);
    Rio_writen(fd,p->data,p->dataSize);
    pthread_rwlock_unlock(&p->rwlock);
    printf("read cache successful\n");
    return 1;
}

void writeCache(struct cache* cache, char *url, char *data, int dataSize){
    /* find empty block */
    int i,j,max = INT_MAX;
    struct cache *p,*pt;
    for(i=0,p = cache;i<MAX_CACHE_NUMBER;i++,p++){
        if(p->flag == 0){
            break;
        }
    }
    /* find last visited */
    if(i == MAX_CACHE_NUMBER){
        for(i=0,pt = cache;i<MAX_CACHE_NUMBER;i++,pt++){
            if(pt->time <= max){
                max = pt->time;
                p = pt;
            }
        }
    }

    pthread_mutex_lock(&lock);
    p->time = INT_MAX;
    for(i=0,pt = cache;i<MAX_CACHE_NUMBER;i++,pt++){
        if(pt != p){
            pt->time--;
        }
    }
    pthread_mutex_unlock(&lock);
    p->flag = 1;
    pthread_rwlock_wrlock(&p->rwlock);
    memcpy(p->url,url,MAXLINE);
    memcpy(p->data,data,dataSize);
    p->dataSize = dataSize;
    pthread_rwlock_unlock(&p->rwlock);
    printf("write Cache\n");
}

void freeCache(struct cache *cache){
    pthread_mutex_destroy(&lock);
    int i;
    struct cache *p;
    for(i=0,p=cache;i<MAX_CACHE_NUMBER;i++,p++){
        pthread_rwlock_destroy(&p->rwlock);
    }
    free(cache);
}