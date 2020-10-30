/*
 * Siyuan Shen
 * siyuan@andrew.cmu.edu
 */

/*
 * tsh - A tiny shell program with job control
 * The shell supports
 *      1) quit command that terminates the shell
 *      2) jobs command that lists all the background jobs
 *      3) bd job command restarts and runs a program in the background
 *      4) fg job restarts the job and runs it in the foreground 
 *      5) the shell runs a job in the background if the command line ends with an 
 *          ampersand (&)
 *      6) Implements SIGINT and SIGTSTP handlers so that the signals have no effect
 *          on jobs running in the background 
 *      7) the shell reaps all the zombie children. 
 *      8) the shell supports I/O redirection with "<" and ">"
 */

#include "csapp.h"
#include "tsh_helper.h"

#include <sys/wait.h>
#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

/*
 * If DEBUG is defined, enable contracts and printing on dbg_printf.
 */
#ifdef DEBUG
/* When debugging is enabled, these form aliases to useful functions */
#define dbg_printf(...) printf(__VA_ARGS__)
#define dbg_requires(...) assert(__VA_ARGS__)
#define dbg_assert(...) assert(__VA_ARGS__)
#define dbg_ensures(...) assert(__VA_ARGS__)
#else
/* When debugging is disabled, no code gets generated for these */
#define dbg_printf(...)
#define dbg_requires(...)
#define dbg_assert(...)
#define dbg_ensures(...)
#endif

/* Function prototypes */
void eval(const char *cmdline);

void sigchld_handler(int sig);
void sigtstp_handler(int sig);
void sigint_handler(int sig);
void sigquit_handler(int sig);
void cleanup(void);
pid_t Fork(void);
void unix_error(char *msg);

volatile pid_t pid_global;


/*
 * The main function gets the command line user typed. It initialized the job list 
 * and most importantly, invokes the eval() function. 
 * 
 * Arguments: 
 *      argc: the number of arguments
 *      argv: the content of arguments as an array of character pointers  
 */
int main(int argc, char **argv) {
    char c;
    char cmdline[MAXLINE_TSH];  // Cmdline for fgets
    bool emit_prompt = true;    // Emit prompt (default)

    // Redirect stderr to stdout (so that driver will get all output
    // on the pipe connected to stdout)
    if (dup2(STDOUT_FILENO, STDERR_FILENO) < 0) {
        perror("dup2 error");
        exit(1);
    }

    // Parse the command line
    while ((c = getopt(argc, argv, "hvp")) != EOF) {
        switch (c) {
        case 'h':                   // Prints help message
            usage();
            break;
        case 'v':                   // Emits additional diagnostic info
            verbose = true;
            break;
        case 'p':                   // Disables prompt printing
            emit_prompt = false;
            break;
        default:
            usage();
        }
    }

    // Create environment variable
    if (putenv("MY_ENV=42") < 0) {
        perror("putenv");
        exit(1);
    }

    // Set buffering mode of stdout to line buffering.
    // This prevents lines from being printed in the wrong order.
    if (setvbuf(stdout, NULL, _IOLBF, 0) < 0) {
        perror("setvbuf");
        exit(1);
    }

    // Initialize the job list
    init_job_list();

    // Register a function to clean up the job list on program termination.
    // The function may not run in the case of abnormal termination (e.g. when
    // using exit or terminating due to a signal handler), so in those cases,
    // we trust that the OS will clean up any remaining resources.
    if (atexit(cleanup) < 0) {
        perror("atexit");
        exit(1);
    }

    // Install the signal handlers
    Signal(SIGINT,  sigint_handler);   // Handles Ctrl-C
    Signal(SIGTSTP, sigtstp_handler);  // Handles Ctrl-Z
    Signal(SIGCHLD, sigchld_handler);  // Handles terminated or stopped child

    Signal(SIGTTIN, SIG_IGN);
    Signal(SIGTTOU, SIG_IGN);

    Signal(SIGQUIT, sigquit_handler);

    // Execute the shell's read/eval loop
    while (true) {
        if (emit_prompt) {
            printf("%s", prompt);

            // We must flush stdout since we are not printing a full line.
            fflush(stdout);
        }

        if ((fgets(cmdline, MAXLINE_TSH, stdin) == NULL) && ferror(stdin)) {
            perror("fgets error");
            exit(1);
        }

        if (feof(stdin)) {
            // End of file (Ctrl-D)
            printf("\n");
            return 0;
        }

        // Remove any trailing newline
        char *newline = strchr(cmdline, '\n');
        if (newline != NULL) {
            *newline = '\0';
        }

        // Evaluate the command line
        eval(cmdline);
    }

    return -1; // control never reaches here
}

/*
 * TODO: Delete this comment and replace it with your own.
 * <What does eval do?>
 *      The eval method first invoked the parseline method to process the command line
 *      input by users. It also created the signal masks needed for signal blocking.
 *      This function contains almost all the logic of the shell, such as determing
 *      if the command is buildin command, background or foreground, and the logic for I/O
 * <arguments>
 *      cmdline: a character pointer that points to the start of the command line given by
 *      user in the shell. 
 * <return>
 *      None
 */
void eval(const char *cmdline) {
    parseline_return parse_result;
    struct cmdline_tokens token;
    pid_t pid;
    sigset_t mask, prev_mask;

    int fd1;
    int fd2; 
    int job_outfile = 0;


    // Parse command line
    parse_result = parseline(cmdline, &token);

    if (parse_result == PARSELINE_ERROR || parse_result == PARSELINE_EMPTY) {
        return;
    }

    // TODO: Implement commands here.

    sigemptyset(&mask);
    sigaddset(&mask, SIGCHLD);
    sigaddset(&mask, SIGINT);
    sigaddset(&mask, SIGTSTP);

    // ignore empty lines
    if (token.argv[0] == NULL) {
        return;
    }


    if (token.builtin != BUILTIN_NONE) {
    // build-in quit command
        if (token.builtin == BUILTIN_QUIT) {
            exit(0);
        }

        if (token.builtin == BUILTIN_JOBS) {
            sigprocmask(SIG_BLOCK, &mask, &prev_mask);
            if (token.outfile != NULL) {
                job_outfile = 1;
            } else {
                list_jobs(STDOUT_FILENO);
            }
            
            sigprocmask(SIG_SETMASK, &prev_mask, NULL);
        }
    }


    if (token.builtin == BUILTIN_NONE || job_outfile == 1) {
        // block all signals
        sigprocmask(SIG_BLOCK, &mask, &prev_mask);
        if ( (pid = Fork()) == 0) {
            // child 
            // a new process group 
            setpgid(0, 0);
            // save the old errno 
            int old_errno = errno;

            // i/o direction input 
            if (token.infile != NULL) {
                if ( (fd1 = open(token.infile, O_RDONLY, 0)) < 0) {
                    if (errno == EACCES) {
                        sio_printf("%s: Permission denied\n", token.infile);
                    } else {
                        sio_printf("%s: No such file or directory\n", token.infile);
                    }
                    errno = old_errno;
                    sigprocmask(SIG_SETMASK, &prev_mask, NULL);
                    exit(0);
                    return;
                }
                dup2(fd1, STDIN_FILENO);
                close(fd1);
            }

            // I/O redirection output
            if (token.outfile != NULL) {
                if ( (fd2 = open(token.outfile, O_WRONLY | O_TRUNC | O_CREAT, 0644) ) < 0) {
                    if (errno == EACCES) {
                        sio_printf("%s: Permission denied\n", token.outfile);
                    }
                    errno = old_errno;
                    sigprocmask(SIG_SETMASK, &prev_mask, NULL);
                    exit(0);
                    return;
                }
                if (job_outfile == 1) {
                    list_jobs(fd2);
                    job_outfile = 0;
                    dup2(fd2, STDOUT_FILENO);
                    close(fd2);
                    exit(0);
                    return;
                }
                dup2(fd2, STDOUT_FILENO);
                
                close(fd2);
                
            }

            // Unblock all signals
            sigprocmask(SIG_SETMASK, &prev_mask, NULL);
            if (execve(token.argv[0], token.argv, environ) < 0) {
                sio_printf("failed to execute: %s\n", cmdline);
                exit(0);
            }
        }


        jid_t jid;
        
        // foreground
        if (parse_result == PARSELINE_FG) {

            if ( (jid = add_job(pid, FG, cmdline)) <= 0)
                unix_error("add_job failed");

            // temporarily unblock all the signals, waiting for foreground process to terminate
            while (fg_job() != 0){   // while pid == 0
                sigemptyset(&prev_mask);
                sigsuspend(&prev_mask);   // prev_mask has everything unblocked
            }

        } else if (parse_result == PARSELINE_BG){

            if ( (jid = add_job(pid, BG, cmdline)) <= 0)
                unix_error("add_job failed");

            sio_printf("[%d] (%d) %s\n", jid, pid, cmdline);
        }
        sigprocmask(SIG_SETMASK, &prev_mask, NULL);
    }

    if (token.builtin == BUILTIN_BG) {

        if (token.argc == 1) {
            sio_printf("bg command requires PID or %%jobid argument\n");
            return;
        } 

        sigprocmask(SIG_BLOCK, &mask, &prev_mask);
        char * argument = token.argv[1];
        jid_t jid;

        if (argument[0] == '%') {
            // jid
            argument = argument + 1;

            jid = atoi(argument);
            if (!job_exists(jid)) {
                sio_printf("%%%d: No such job\n", jid);
                sigprocmask(SIG_SETMASK, &prev_mask, NULL);
                return;
            }
            pid = job_get_pid(jid);  
        } 
        
        else if (isdigit(argument[0])){
            // pid 
            pid = atoi(argument);
            if ( (jid = job_from_pid(pid)) <= 0) {
                sio_printf("(%d): No such process\n", pid);
                sigprocmask(SIG_SETMASK, &prev_mask, NULL);
                return;
            }
        }

        else {
            sio_printf("bg: argument must be a PID or %%jobid\n");
            sigprocmask(SIG_SETMASK, &prev_mask, NULL);
            return;
        }

        job_set_state(jid, BG);
        kill(-pid, SIGCONT);
        sio_printf("[%d] (%d) %s\n", jid, pid, job_get_cmdline(jid));
        sigprocmask(SIG_SETMASK, &prev_mask, NULL);
    }

    // build in fg 
    if (token.builtin == BUILTIN_FG) {
        sigprocmask(SIG_BLOCK, &mask, &prev_mask);
        
        if (token.argc == 1) {
            sio_printf("fg command requires PID or %%jobid argument\n");
            sigprocmask(SIG_SETMASK, &prev_mask, NULL);
            return;
        } 

        char * argument = token.argv[1];
        jid_t jid;

        if (argument[0] == '%') {
            // jid
            argument = argument + 1;
            jid = atoi(argument);
            if (!job_exists(jid)) {
                sio_printf("%%%d: No such job\n", jid);
                sigprocmask(SIG_SETMASK, &prev_mask, NULL);
                return;
            }
            pid = job_get_pid(jid);  
        } 

        else if (isdigit(argument[0])) {
            // pid 
            pid = atoi(argument);
            if ( (jid = job_from_pid(pid)) <= 0) {
                sio_printf("(%d): No such process\n", pid);
                sigprocmask(SIG_SETMASK, &prev_mask, NULL);
                return;
            }
        }

        else {
            sio_printf("fg: argument must be a PID or %%jobid\n");
            sigprocmask(SIG_SETMASK, &prev_mask, NULL);
            return;
        }
 
        job_set_state(jid, FG);
        kill(-pid, SIGCONT);
        while (fg_job() != 0){   // while there's FG job
                sigemptyset(&prev_mask);
                sigsuspend(&prev_mask);   // prev_mask has everything unblocked
        }

        sigprocmask(SIG_SETMASK, &prev_mask, NULL);
    }

    return;
}

/*****************
 * Signal handlers
 *****************/

/*
 * <What does sigchld_handler do?>
 *      implement the sigchld_handler. It is used to reap zombine processes. 
 *      the waitpid method waits for state changes in a child process. and receives 
 *      information about the change in state.
 * <argument>
 *      sig: the sig number of the signal
 * <return value> 
 *      None
 * 
 */
void sigchld_handler(int sig) {
    int old_errno = errno;
    int status;
    sigset_t mask, prev_mask;
    pid_t pid;
    sigemptyset(&mask);
    sigfillset(&mask);

    sigprocmask(SIG_BLOCK, &mask, &prev_mask);
    while ( (pid = waitpid(-1, &status, WNOHANG | WUNTRACED)) > 0) {
        // WNOHANG return immediately with ret value 0 if none of the
        // child proess in the wait set has terminated. 

        if (WIFEXITED(status)) {
            delete_job(job_from_pid(pid));
        }
        
        if (WIFSTOPPED(status)) {
            int sig = WSTOPSIG(status);
            int jid = job_from_pid(pid);
            job_set_state(jid, ST);
            sio_printf("Job [%d] (%d) stopped by signal %d\n", jid, pid, sig);
        }

        if (WIFSIGNALED(status)) {
            int jid = job_from_pid(pid);
            if (delete_job(jid) == 0) {
                unix_error("delete job error");
            }
            sio_printf("Job [%d] (%d) terminated by signal %d\n", jid, pid, WTERMSIG(status));
        }
    }
    sigprocmask(SIG_SETMASK, &prev_mask, NULL);

    errno = old_errno;
}

/*
 * <What does sigchld_handler do?>
 *      implement the sigint_handler. If a foreground process receives the sigint 
 *      signal, it sends it to all process in the process group
 * <argument>
 *      sig: the sig number of the signal
 * <return value> 
 *      None
 */
void sigint_handler(int sig) {
    int old_errno = errno;
    pid_t pid;
    jid_t jid;

    sigset_t mask, prev_mask;
    sigemptyset(&mask);
    sigfillset(&mask);

    sigprocmask(SIG_BLOCK, &mask, &prev_mask);
  
    if ( (jid = fg_job()) != 0) {
        pid = job_get_pid(jid);
        kill(-pid, SIGINT);
    }

    sigprocmask(SIG_SETMASK, &prev_mask, NULL);


    errno = old_errno;

}

/*
 * <What does sigchld_handler do?>
 *      implement the sigtstp_handler. If a foreground process receives the sigtstp 
 *      signal, it sends it to all process in the process group
 * <argument>
 *      sig: the sig number of the signal
 * <return value> 
 *      None
 */
void sigtstp_handler(int sig) {
    int old_errno = errno;
    pid_t pid;
    jid_t jid;

    sigset_t mask, prev_mask;
    sigemptyset(&mask);
    sigfillset(&mask);

    sigprocmask(SIG_BLOCK, &mask, &prev_mask);

    if ( (jid = fg_job()) != 0) {
        pid = job_get_pid(jid);
        kill(-pid, SIGTSTP);
    }

    sigprocmask(SIG_SETMASK, &prev_mask, NULL);

    errno = old_errno;
}

/*
 * cleanup - Attempt to clean up global resources when the program exits. In
 * particular, the job list must be freed at this time, since it may contain
 * leftover buffers from existing or even deleted jobs.
 */
void cleanup(void) {
    // Signals handlers need to be removed before destroying the joblist
    Signal(SIGINT,  SIG_DFL);  // Handles Ctrl-C
    Signal(SIGTSTP, SIG_DFL);  // Handles Ctrl-Z
    Signal(SIGCHLD, SIG_DFL);  // Handles terminated or stopped child

    destroy_job_list();
}

pid_t Fork(void) {
    pid_t pid;

    if ((pid = fork()) < 0) {
        unix_error("Fork Error");
    }
    return pid;
}

void unix_error(char *msg) {
    fprintf(stderr, "%s: %s\n", msg, strerror(errno));
    exit(0);
}

// int Sigemptyset(sigset_t *set) {
//     if (sigemptyset(set) < 0 ) {
//         unix_error("Sigemptyset error");
//         return -1;
//     }
//     return 0;
// }

// int Sigaddset(sigset_t *set, int signo) {
//     if (sigaddset(set, signo) < 0 ) {
//         unix_error("Sigaddset error");
//         return -1;
//     }
//     return 0;
// }

// int Sigaddset(sigset_t *set, int signo) {
//     if (sigaddset(set, signo) < 0 ) {
//         unix_error("Sigaddset error");
//         return -1;
//     }
//     return 0;
// }
