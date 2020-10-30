/*
 *
 * Siyuan Shen
 * 
 * Starter code for proxy lab.
 * Feel free to modify this code in whatever way you wish.
 */

/* Some useful includes to help you get started */

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

/*
 * Debug macros, which can be enabled by adding -DDEBUG in the Makefile
 * Use these if you find them useful, or delete them if not
 */
#ifdef DEBUG
#define dbg_assert(...) assert(__VA_ARGS__)
#define dbg_printf(...) fprintf(stderr, __VA_ARGS__)
#else
#define dbg_assert(...)
#define dbg_printf(...)
#endif

/*
 * function declaration 
 * 
 */ 
void serve(int connfd);
void get_filetype(char *filename, char *filetype);
void parse_uri(char *uri, char *filename, char *host, char *port);
void Rio_writen(int fd, void *usrbuf, size_t n);
void unix_error(char *msg);
void Rio_readinitb(rio_t *rp, int fd);
ssize_t Rio_readlineb(rio_t *rp, void *usrbuf, size_t maxlen);
void create_request(char *buf_request, char *buf, char *buf_get, rio_t *rio, char *uri, char *filename, char *host, char *port);
ssize_t rio_readlineb2(rio_t *rp, void *usrbuf, size_t maxlen);
static ssize_t rio_read(rio_t *rp, char *usrbuf, size_t n);
void sigpipe_handler(int sig);
void add_to_cache(char * cache_data, size_t data_size, char * uri);
int check_cache(char* uri, int connfd);
/*
 * thread 
 */ 

void *thread(void *vargp);



/*
 * Max cache and object sizes
 * You might want to move these to the file containing your cache implementation
 */
#define MAX_CACHE_SIZE (1024*1024)
#define MAX_OBJECT_SIZE (100*1024)

/*
 * String to use for the User-Agent header.
 * Don't forget to terminate with \r\n
 */
static const char *header_user_agent = "Mozilla/5.0"
                                    " (X11; Linux x86_64; rv:3.10.0)"
                                    " Gecko/20190801 Firefox/63.0.1";

// struct for the cache



typedef struct cache_block {
    struct cache_block *prev;
    struct cache_block *next;
    char *uri;
    char *data;
    size_t data_size;
    int access_time;
} cache_block_t;


// typedef struct cache {
//     cache_block_t *root;
//     int access_count;
//     size_t current_cache_size;
// } cache_t;

cache_block_t *cache_root;
int access_count;
size_t current_cache_size;

pthread_mutex_t mutex;



/*
 * Main function of the proxy 
 * return: int, return 1 if there's an error in reading the command line
 */

int main(int argc, char** argv) {
    int listenfd, *connfdp;

    // char hostname[MAXLINE], port[MAXLINE];
    socklen_t clientlen;
    struct sockaddr clientaddr;
    pthread_t tid;

    Signal(SIGPIPE,  sigpipe_handler);
    printf("%s", header_user_agent);

    if (argc != 2) 
    {
        printf("Missing command line port number\n");
        exit(1); 
    }

    // initialize cache 
    access_count = 0;
    current_cache_size = 0;
    cache_root = malloc(sizeof(cache_block_t));
    cache_root->prev = NULL;
    cache_root->next = NULL;


    fprintf(stderr, "Initialize finished");

    listenfd = open_listenfd(argv[1]);
    if (listenfd < 0) 
    {
        fprintf(stderr, "Failed to listen on port: %s\n", argv[1]);
        exit(1);
    }

    pthread_mutex_init(&mutex, NULL);

    while (1) 
    {

        clientlen = sizeof(clientaddr);
        connfdp = malloc(sizeof(int));
        * connfdp = accept(listenfd, &clientaddr, &clientlen);
        // if (connfdp < 0) 
        // {
        //     perror("accept");
        //     continue;
        // }

        pthread_create(&tid, NULL, thread, connfdp);

        // getnameinfo(&clientaddr, clientlen, 
        //                 hostname, MAXLINE, 
        //                 port, MAXLINE, 0);
        // printf("Accepted connection from (%s, %s)\n", hostname, port);

        // serve(connfd);
        // close(connfd);

    }
    return 0;
}


void *thread(void *vargp) {
    int connfd = *((int *) vargp);
    pthread_detach(pthread_self());
    free(vargp);
    serve(connfd);
    close(connfd);
    return NULL;
}


/*
 * the serve function can be invoked by the main function
 * This function reads the command line and parsed the uri if available, the proxy then creates
 * a new request and forwarded to the server. The proxy then reads the file received from
 * the server and writes it back to the client. 
 * parameter: 
 *      connfd: the fd of the client after accept
 * 
 */
void serve(int connfd)
{

    fprintf(stderr, "\n ------------- NEW request ---------------\n");
    rio_t rio;
    // char *hostname[MAXLINE];
    // int port[MAXLINE];
    
    rio_readinitb(&rio, connfd);

    /* read request line */
    char buf[MAXLINE];
    char key[MAXLINE];

    

    if (rio_readlineb(&rio, buf, MAXLINE) <= 0)
    {
        return;
    }
    
    fprintf(stderr, " \n BUF firstline: %s\n ", buf);
    
    char method[MAXLINE];
    char uri[MAXLINE];
    char version;

    // get the method, uri and version 
    if (sscanf(buf, "%s %s HTTP/1.%c", method, uri, &version) != 3
            || (version != '0' && version != '1')) 
    {
        // clienterror(connfd, buf, "400", "Bad Request",
        //         "Tiny received a malformed request");
        perror("400, Bad Request, malformed request");
        return;
    }

    // check if GET method
    if (strncmp(method, "GET", sizeof("GET"))) 
    {
        // clienterror(connfd, method, "501", "Not Implemented",
        //         "Tiny does not implement this method");
        perror("501, Not Implemented");
        return;
    }

    char filename[MAXLINE];
    char filetype[MAXLINE];
    char host[MAXLINE];
    char port[MAXLINE];
    
    strcpy(key, uri);
    // parse the uri to get the filename, host, and port 
    parse_uri(uri, filename, host, port);

    // get the type of the file 
    get_filetype(filename, filetype);

    // fprintf(stderr,"uri: %s \n", uri);
    // fprintf(stderr, "file name: %s \n", filename);
    // fprintf(stderr, "host: %s \n", host);
    // fprintf(stderr, "port: %s \n", port);
    // fprintf(stderr, "file type: %s \n", filetype);

    char buf_request[MAXLINE];
    char buf_get[MAXLINE];
    size_t buf_request_len;

    // create request
    fprintf(stderr, "\nCREATE request\n");
    create_request(buf_request, buf, buf_get, &rio, uri, filename, host, port);

    fprintf(stderr, "\n print Request %s\n", buf_request);
    fprintf(stderr, "\n buf get %s\n", buf_get);
    buf_request_len = strlen(buf_request);


    if (buf_request_len >= MAXBUF) {
        return; // Overflow!
    }

    
    
    
    
    // strcat(key, uri);
    // strcat(key, ":");
    // strcat(key, port);
    // strcat(key, filename);
    // strcat(key, "\0");
    
    fprintf(stderr, "\nkey for check cache: %s\n", key);
    // check if available in cache 
    pthread_mutex_lock(&mutex);
    if (check_cache(key, connfd) == 1)
    {
        fprintf(stderr, "\nfound in cache %s", key);
        pthread_mutex_unlock(&mutex);
        return;
    }
    pthread_mutex_unlock(&mutex);


    // open_clientfd
    int clientfd;
    rio_t rio_server;
    // rio_t rio_content_length;
    ssize_t n;

    if ( (clientfd = open_clientfd(host, port)) < 0)
    {
        perror("open_clientfd error");
        return;
    }


    fprintf(stderr, "clientfd: %d\n", clientfd);
    fprintf(stderr, "\n Request %s\n", buf_request);

    n = rio_writen(clientfd, buf_request, buf_request_len);


    // char buf_response[MAXLINE];


    char buf_content_length[MAXLINE];
    char content_length[MAXLINE];
    size_t content_length_from_header;
    Rio_readinitb(&rio_server, clientfd);  
    fprintf(stderr, "\n n: %ld \n", n);

    // while loop to read from the server line by line and write the data received
    // to the client.
    char cache_data[MAX_OBJECT_SIZE];
    size_t current_size = 0;
    int overload = 0;


    
    while ( (n = rio_readlineb(&rio_server, buf_content_length, MAXLINE)) > 0 )
    {
        rio_writen(connfd, buf_content_length, n);
        fprintf(stderr, "WRITE %s", buf_content_length);
        memcpy(cache_data + current_size, buf_content_length, n);
        current_size += n;

        if (strstr(buf_content_length, "Content-length") || strstr(buf_content_length, "Content-Length"))
        {
            strcpy(content_length, buf_content_length);
            fprintf(stderr, "content length found %s,  key: %s\n", content_length, key);
        }

        if (strcmp(buf_content_length, "\r\n") == 0)
        {
            
            // strcpy(buf_content_length, "\r\n");
            // rio_writen(connfd, buf_content_length, 2);
            // memcpy(cache_data + current_size, buf_content_length, 2);
            // current_size += 2;
            
            // n = rio_readlineb(&rio_server, buf_content_length, MAXLINE);
            // rio_writen(connfd, buf_content_length, n);
            // memcpy(cache_data + current_size, buf_content_length, n);
            // current_size += n;
            // fprintf(stderr, "last line of header %s", buf_content_length);
            // fprintf(stderr, "size of last line %ld", n);
            // fprintf(stderr, "where to break %s", buf_content_length);
            break;
        }
    }

    char * dummy1;
    fprintf(stderr, "content length str %s,  key: %s\n", content_length, key);
    
    if (strlen(content_length) == 0)
    {
        fprintf(stderr, "str len equal 0,  key: %s\n", key);
        close(clientfd);
        return;
    }


    dummy1 = strstr(content_length, " ");
    dummy1 += 1;
    content_length_from_header = atoi(dummy1);

    fprintf(stderr, "key: %s content length %ld \n", key, content_length_from_header);

    char buf_response[content_length_from_header];

    fprintf(stderr, "key: %s TEST0 \n", key);
    n = rio_readnb(&rio_server, buf_response, content_length_from_header);
    fprintf(stderr, "key: %s  READNB n %ld \n", key, n);
    // if (n < 0 )
    // {
    //     close(clientfd);
    //     return;
    // }
    
    if (n + current_size < MAX_OBJECT_SIZE)
    {
        memcpy(cache_data + current_size, buf_response, n);
        current_size += n;
    } else {
        overload = 1;
    }
    // fprintf(stderr, "WRITE %s", buf_response);
    rio_writen(connfd, buf_response, n);

    fprintf(stderr, "key: %s Write Finish \n", key);
    // pthread_mutex_lock(&mutex);
    // while ( (n = rio_readlineb(&rio_server, buf_response, MAXLINE)) > 0 )
    // {
        
    //     if (n + current_size < MAX_OBJECT_SIZE)
    //     {
    //         memcpy(cache_data + current_size, buf_response, n);
    //         current_size += n;
    //     } else {
    //         overload = 1;
    //     }
        
    //     // fprintf(stderr, "response: %s\n", buf_response);
    //     // pthread_mutex_unlock(&mutex);
    //     rio_writen(connfd, buf_response, n);
    //     // pthread_mutex_lock(&mutex);
    // }
    // pthread_mutex_unlock(&mutex);


    // fprintf(stderr, "\n Buf response: %s \n ",  buf_response);
    fprintf(stderr, "\n Write finished: %s \n ",  key);

    close(clientfd);

    pthread_mutex_lock(&mutex);
    if (overload == 0)
    {
        fprintf(stderr, "\n SAVE TO CACHE cache data size: %ld, key: %s \n total size before add: %ld\n", current_size, key, current_cache_size);
        
        add_to_cache(cache_data, current_size, key);
        
    }
    pthread_mutex_unlock(&mutex);
    return;

}


void add_to_cache(char * cache_data, size_t data_size, char * uri)
{


    cache_block_t *block_ptr = cache_root->next;
    while (block_ptr != NULL)
    {
        if (strcmp(block_ptr->uri, uri) == 0)
        {
            fprintf(stderr, "duplicate found in adding cache %s \n", uri);
            return;
        }
        block_ptr = block_ptr->next;
    }
    
    fprintf(stderr, "current cache size before add %ld, %s\n", current_cache_size, uri);
    while (current_cache_size + data_size >= MAX_CACHE_SIZE)
    {  
        fprintf(stderr, "cache full %ld, %s\n", current_cache_size, uri);
        int least_recent_time = INT32_MAX;
        cache_block_t * least_recent_block = cache_root->next;
        cache_block_t * tmp = cache_root->next;
        while (tmp != NULL)
        {
            if (tmp->access_time < least_recent_time)
            {
                fprintf(stderr, "compare %d, %d \n", tmp->access_time, least_recent_time);
                least_recent_time = tmp->access_time;
                least_recent_block = tmp;
            }
            tmp = tmp->next;
        }

        // evict that block;
        fprintf(stderr, "EVICT: %s \n", least_recent_block->uri);
        cache_block_t *prev_block = least_recent_block->prev;
        cache_block_t *next_block = least_recent_block->next;

        current_cache_size = current_cache_size - least_recent_block->data_size;
        
        if (prev_block != NULL)
        {
            prev_block->next = next_block;
        }
        
        if (next_block != NULL)
        {
            next_block->prev = prev_block;
        }
        fprintf(stderr, "EVICT FINISH: %s \n", least_recent_block->uri);
        
        
    }

    // size_t data_size = sizeof(cache_data);
    size_t uri_size = strlen(uri);
    // size_t block_size = sizeof(cache_data) + 16 + sizeof(uri) + sizeof(size_t) + sizeof(int); 
    size_t block_size = 8 * 4 + sizeof(size_t) + sizeof(int); 
    cache_block_t * block = malloc(block_size);



    if (cache_root->next == NULL)
    {
        block->prev = cache_root;
        block->next = NULL;
        cache_root->next = block;
        
    } else 
    {
        cache_block_t *old_next = cache_root->next;
        block->next = old_next;
        block->prev = cache_root;
        old_next->prev = block;
        cache_root->next = block;
    }

    char *uri_ptr = malloc(uri_size);
    char *data_ptr = malloc(data_size);


    strcpy(uri_ptr, uri);
    memcpy(data_ptr, cache_data, data_size);
    block->uri = uri_ptr;
    block->data = data_ptr;

    block->data_size = data_size;
    block->access_time = access_count;
    access_count ++;

    current_cache_size += data_size;

    fprintf(stderr, "KEY: %s \n" , block->uri);

}

int check_cache(char* uri, int connfd)
{
    if (cache_root->next == NULL)
    {
        return 0;
    }

    cache_block_t * tmp = cache_root->next;
    while (tmp != NULL)
    {
        if (strcmp(uri, tmp->uri) == 0)
        {
            fprintf(stderr, "\nfound\n");
            pthread_mutex_unlock(&mutex);
            rio_writen(connfd, tmp->data, tmp->data_size);
            pthread_mutex_lock(&mutex);
            tmp->access_time = access_count;
            access_count ++;
            return 1;
        }
        tmp = tmp->next;
    }

    return 0;
}

/*
 * get_filetype determined the type of file
 * parameter: 
 *      filename: the name of the file
 *      filetype: passed by reference, 
 * return: 
 *      void 
 * 
 */
void get_filetype(char *filename, char *filetype) 
{
    if (strstr(filename, ".html")) {
        strcpy(filetype, "text/html");
    } else if (strstr(filename, ".gif")) {
        strcpy(filetype, "image/gif");
    } else if (strstr(filename, ".png")) {
        strcpy(filetype, "image/png");
    } else if (strstr(filename, ".jpg")) {
        strcpy(filetype, "image/jpeg");
    } else {
        strcpy(filetype, "text/plain");
    }
}

/*
 * get_filetype determined the type of file
 * parameter: 
 *      filename: the name of the file
 *      filetype: passed by reference, 
 * return: 
 *      void 
 */
void parse_uri(char *uri, char *filename, char *host, char *port)
{
    // dummy pointers
    char * dummy_ptr1;
    char * dummy_ptr2;
    char * dummy_ptr3;

    if ((dummy_ptr1 = strstr(uri, "//")))
    {
        dummy_ptr1 = dummy_ptr1 + 2;

        dummy_ptr2 = strstr(dummy_ptr1, "/");
        strcpy(filename, dummy_ptr2); 

        *dummy_ptr2 = '\0';

        if ((dummy_ptr3 = strstr(dummy_ptr1, ":")))
        {
            dummy_ptr3 = dummy_ptr3 + 1;
            strcpy(port, dummy_ptr3);
            dummy_ptr3 = dummy_ptr3 - 1;
            *dummy_ptr3 = '\0';
        } else
        {
            strcpy(port, "80");
        }
    strcpy(host, dummy_ptr1);
    } else 
    {
        printf("parse uri error");
        return;
    }
}


/*
 * create_request creates the HTTP request needed for the server
 * the result will be stored in buf_request 
 * return: 
 *      void 
 */
void create_request(char *buf_request, char *buf, char *buf_get, rio_t *rio, char *uri, char *filename, char *host, char *port)
{


    snprintf(buf_request, MAXBUF, "GET %s HTTP/1.0\r\n", filename);
    strcpy(buf_get, buf_request);
    Rio_readlineb(rio,buf,MAXLINE);
    while (strcmp(buf, "\r\n") != 0)
    {
        fprintf(stderr, "DEBUG: %s", buf);
        if (strstr(buf, "Host:"))
        {
            strcat(buf_request, buf);
            // fprintf(stderr, buf_request);
        } 
        else if (strstr(buf, "Proxy-Connection:"))
        {
            // snprintf(buf_request, MAXBUF, "%sProxy-Connection: close\r\n", buf_request);
            strcat(buf_request, "Proxy-Connection: close\r\n");
        }
        else if (strstr(buf, "Connection:"))
        {
            // snprintf(buf_request, MAXBUF, "%sConnection: close\r\n", buf_request);
            strcat(buf_request, "Connection: close\r\n");
        }
        else if (strstr(buf, "User-Agent:"))
        {
            // snprintf(buf_request, MAXBUF, "%sUser-Agent: %s\r\n", buf_request, header_user_agent);
            strcat(buf_request, "User-Agent: ");
            strcat(buf_request, header_user_agent);
            strcat(buf_request, "\r\n");
        }
        else 
        {
            // snprintf(buf_request, MAXBUF, "%s%s\r\n", buf_request, buf);
            strcat(buf_request, buf);
            // fprintf(stderr, buf_request);
        }
        
        Rio_readlineb(rio, buf, MAXLINE);
    }

    strcat(buf_request, "\r\n");

}

static ssize_t rio_read(rio_t *rp, char *usrbuf, size_t n)
{
    int cnt;

    while (rp->rio_cnt <= 0) {  /* Refill if buf is empty */
    rp->rio_cnt = read(rp->rio_fd, rp->rio_buf, 
               sizeof(rp->rio_buf));
    if (rp->rio_cnt < 0) {
        if (errno != EINTR) /* Interrupted by sig handler return */
        return -1;
    }
    else if (rp->rio_cnt == 0)  /* EOF */
        return 0;
    else 
        rp->rio_bufptr = rp->rio_buf; /* Reset buffer ptr */
    }

    /* Copy min(n, rp->rio_cnt) bytes from internal buf to user buf */
    cnt = n;          
    if (rp->rio_cnt < n)   
    cnt = rp->rio_cnt;
    memcpy(usrbuf, rp->rio_bufptr, cnt);
    rp->rio_bufptr += cnt;
    rp->rio_cnt -= cnt;
    return cnt;
}

void Rio_writen(int fd, void *usrbuf, size_t n) 
{
    if (rio_writen(fd, usrbuf, n) != n)
    unix_error("Rio_writen error");
}

void unix_error(char *msg) /* Unix-style error */
{
    fprintf(stderr, "%s: %s\n", msg, strerror(errno));
    exit(0);
}

ssize_t Rio_readlineb(rio_t *rp, void *usrbuf, size_t maxlen) 
{
    ssize_t rc;

    if ((rc = rio_readlineb(rp, usrbuf, maxlen)) < 0)
    unix_error("Rio_readlineb error");
    return rc;
} 

void Rio_readinitb(rio_t *rp, int fd)
{
    rio_readinitb(rp, fd);
} 

ssize_t rio_readlineb2(rio_t *rp, void *usrbuf, size_t maxlen) 
{
    int n, rc;
    char c, *bufp = usrbuf;
    fprintf(stderr, "FOR LOOP start\n");
    for (n = 1; n < maxlen; n++) { 
        if ((rc = rio_read(rp, &c, 1)) == 1) {
        fprintf(stderr, "RIO_read END\n");
        *bufp++ = c;
        if (c == '\n') {
                n++;
             break;
            }
    } else if (rc == 0) {
        if (n == 1)
        return 0; /* EOF, no data read */
        else
        break;    /* EOF, some data was read */
    } else
        return -1;      /* Error */
    }
    fprintf(stderr, "FOR LOOP END\n");
    *bufp = 0;
    return n-1;
}


/*
 * sigpipe handler for handling sigpipe 
 * return: 
 *      void 
 */
void sigpipe_handler(int sig) 
{
    fprintf(stderr, "SIGPIPE\n");
    return;
}


