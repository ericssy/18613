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

int main()
{
    int fd1 = open("foo.txt", O_RDONLY);
    int fd2 = open("foo.txt", O_RDONLY);
    int fd3 = 0;
    char buf[ 100 ] = {0}; //initializes an array of all 0s
    if (fork() == 0){
        read(fd1, buf, 2);
        dup2(fd1, fd3);
        read(fd3, buf, 2);
        printf("%s", buf);
    } else {
        read(fd1, buf, 2);
        read(fd2, &buf[ 2 ], 2);
        printf("%s", buf);
        waitpid(-1, NULL, 0);
    }
    return 0;
}