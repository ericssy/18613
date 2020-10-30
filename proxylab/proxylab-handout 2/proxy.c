/*
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

int main(int argc, char** argv) {
    int listenfd, connfd;
    char hostname[MAXLINE], port[MAXLINE];
    socklen_t clientlen;
    struct sockaddr clientaddr;


    Signal(SIGPIPE,  sigpipe_handler);
    printf("%s", header_user_agent);

    if (argc != 2) 
    {
        printf("Missing command line port number\n");
        exit(1); 
    }

    listenfd = open_listenfd(argv[1]);
    if (listenfd < 0) 
    {
        fprintf(stderr, "Failed to listen on port: %s\n", argv[1]);
        exit(1);
    }

    while (1) 
    {
        clientlen = sizeof(clientaddr);

        connfd = accept(listenfd, &clientaddr, &clientlen);
        if (connfd < 0) 
        {
            perror("accept");
            continue;
        }

        getnameinfo(&clientaddr, clientlen, 
                        hostname, MAXLINE, 
                        port, MAXLINE, 0);
        printf("Accepted connection from (%s, %s)\n", hostname, port);

        serve(connfd);
        close(connfd);

    }
    return 0;
}



void serve(int connfd)
{
    

    rio_t rio;
    // char *hostname[MAXLINE];
    // int port[MAXLINE];
    
    rio_readinitb(&rio, connfd);

    /* read request line */
    char buf[MAXLINE];
    if (rio_readlineb(&rio, buf, MAXLINE) <= 0)
    {
        return;
    }
    // fflush(stdout);
    



    // while ( (n = rio_readlineb(&rio, buf, MAXLINE)) != 0)
    // {
    //     fprintf(stdout, "%s\n", buf);
    //     strcat(old_request_buf, buf);
    // }

    
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

    // struct stat sbuf;
    // if (stat(filename, &buf) < 0) 
    // {

    // }
    
    parse_uri(uri, filename, host, port);

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

    /*
    buf_request_len = snprintf(buf_request, MAXBUF,
            "GET %s HTTP/1.0\r\n" \
            "Host: %s:%s\r\n" \
            "User-Agent: %s\r\n" \
            "Connection: close\r\n" \
            "Proxy-Connection: close\r\n\r\n", \
            filename, host, port, header_user_agent);
    */
    /*
    strcpy(buf_request, "GET /random-text.txt HTTP/1.0 \r\n \
                        Host: catshark.ics.cs.cmu.edu:2698 \r\n \
                        User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:3.10.0) Gecko/20190801 Firefox/63.0.1 \r\n \
                        Connection: close \r\n \
                        Proxy-Connection: close \r\n\r\n" );
    */
    if (buf_request_len >= MAXBUF) {
        return; // Overflow!
    }


    // fprintf(stdout, "\nRequest headers:%s \n", buf_request);
    // fprintf(stdout, "\nRequest length:%ld \n", buf_request_len);
    // fflush(stdout);


    // open_clientfd
    int clientfd;
    rio_t rio_server;

    // char buf_server[MAXLINE];
    // char buf_response[MAXLINE];
    // size_t buflen;
    ssize_t n;

    
    // strcat(host, ":");
    // strcat(host, port);
    fprintf(stderr, "hostname: %s\n", host);
    if ( (clientfd = open_clientfd(host, port)) < 0)
    {
        perror("open_clientfd error");
        return;
    }

    // clientfd = open_clientfd(host, port);




    fprintf(stderr, "clientfd: %d\n", clientfd);
    
    fprintf(stderr, "\n Request %s\n", buf_request);
    n = rio_writen(clientfd, buf_request, buf_request_len);

    char buf_response[MAXLINE];



    Rio_readinitb(&rio_server, clientfd);  

    fprintf(stderr, "\n n: %ld \n", n);


    fprintf(stderr, "\nTEST\n");

    while ( (n = rio_readlineb(&rio_server, buf_response, MAXLINE)) > 0 )
    {
        
        // fprintf(stdout, "TEST %d\n", __LINE__);
        // fflush(stdout);
        // fprintf(stdout, "server received %d bytes\n", (int)n);
        fprintf(stderr, "response: %s\n", buf_response);
        rio_writen(connfd, buf_response, n);

        // fprintf(stdout, "\nBUF response %s\n", buf_response);
        // rio_readlineb(&rio_server, buf_response, MAXLINE);
        
    }

    // rio_writen(connfd, buf_request, )
    
    
    // fflush(stdout);
    fprintf(stderr, "TEST3 %d\n", __LINE__);

    close(clientfd);


    return;

}


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


void parse_uri(char *uri, char *filename, char *host, char *port)
{
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
        sio_printf("parse uri error");
        return;
    }
}



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

void sigpipe_handler(int sig) 
{
    fprintf(stderr, "SIGPIPE\n");
    return;
}



