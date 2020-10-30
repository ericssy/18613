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
#include <sys/stat.h>

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
    
    // sio_printf("buf: %s\n", buf);

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

    // fprintf(stdout,"uri: %s \n", uri);
    // fprintf(stdout, "file name: %s \n", filename);
    // fprintf(stdout, "host: %s \n", host);
    // fprintf(stdout, "port: %s \n", port);
    // fprintf(stdout, "file type: %s \n", filetype);
    // fprintf(stdout, "file type: %s \n", filetype);

    

    
    char buf_request[MAXLINE];
    
    size_t buf_request_len;

    // create request

    buf_request_len = snprintf(buf_request, MAXBUF,
            "GET %s HTTP/1.0\r\n" \
            "Host: %s:%s\r\n" \
            "User-Agent: %s\r\n" \
            "Connection: close\r\n" \
            "Proxy-Connection: close\r\n\r\n", \
            filename, host, port, header_user_agent);

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




    if ((clientfd = open_clientfd(host, port) < 0))
    {
        perror("open_clientfd error");
        return;
    }



    char buf_response[MAXLINE];
    size_t n;

    
    
    Rio_writen(clientfd, buf_request, buf_request_len);

    
    Rio_readinitb(&rio_server, clientfd);
    
    fprintf(stdout, "FUCK %d\n", __LINE__);
    fflush(stdout);


    // rio_readnb(&rio_server, buf_request, MAXLINE);
    
    // if ( (n = rio_readlineb(&rio_server, buf_response, MAXLINE))< 0)
    // {
    //     fprintf(stdout, "READLINE \n");
    //     return;
    // }
    // fprintf(stdout, "\nN %d\n", (int) n);
    // fprintf(stdout, "\nBUF response %s\n", buf_response);
    // fflush(stdout);






    if ( (n = Rio_readlineb(&rio_server, buf_response, MAXLINE)) >= 0)
    {
        // fprintf(stdout, "TEST %d\n", __LINE__);
        // fflush(stdout);
        // fprintf(stdout, "server received %d bytes\n", (int)n);
        Rio_writen(connfd, buf_response, n);
        // fprintf(stdout, "\nBUF response %s\n", buf_response);
        
    }

    // rio_writen(connfd, buf_request, )
    
    fprintf(stdout, "TEST2 %d\n", __LINE__);
    // fflush(stdout);


    close(clientfd);


    return;

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