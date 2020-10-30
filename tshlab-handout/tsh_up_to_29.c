/*
 * TODO: Include your name and Andrew ID here.
 */

/*
 * TODO: Delete this comment and replace it with your own.
 * tsh - A tiny shell program with job control
 * <The line above is not a sufficient documentation.
 *  You will need to write your program documentation.
 *  Follow the 15-213/18-213/15-513 style guide at
 *  http://www.cs.cmu.edu/~213/codeStyle.html.>
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
 * TODO: Delete this comment and replace it with your own.
 * <Write main's function header documentation. What does main do?>
 * "Each function should be prefaced with a comment describing the purpose
 *  of the function (in a sentence or two), the function's arguments and
 *  return value, any error cases that are relevant to the caller,
 *  any pertinent side effects, and any assumptions that the function makes."
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
 *
 * NOTE: The shell is supposed to be a long-running process, so this function
 *       (and its helpers) should avoid exiting on error.  This is not to say
 *       they shouldn't detect and print (or otherwise handle) errors!
 */
void eval(const char *cmdline) {
    parseline_return parse_result;
    struct cmdline_tokens token;
    pid_t pid;
    sigset_t mask, prev_mask;


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

    // sigemptyset(&mask_child);
    // sigaddset(&mask_child, SIGCHLD);

    // sigemptyset(&mask_sig_tstp);
    // sigaddset(&mask_sig_tstp, SIGINT);
    // sigaddset(&mask_sig_tstp, SIGTSTP);



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
            list_jobs(STDOUT_FILENO);
            sigprocmask(SIG_SETMASK, &prev_mask, NULL);
        }
    }


    // I/O




    if (token.builtin == BUILTIN_NONE) {
        // block SIGCHLD
        // sigprocmask(SIG_BLOCK, &mask_child, &prev_mask);
        sigprocmask(SIG_BLOCK, &mask, &prev_mask);
        if ( (pid = Fork()) == 0) {
            // child 
            // a new process group 
            setpgid(0, 0);


            int fd1;
            int fd2; 
            int old_errno = errno;

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
                dup2(fd2, STDOUT_FILENO);
                close(fd2);
                // if (jobs_outfile== 1) {
                //     list_jobs(STDOUT_FILENO);
                // }
            }


            // unblock SIGCHLD
            sigprocmask(SIG_SETMASK, &prev_mask, NULL);
            if (execve(token.argv[0], token.argv, environ) < 0) {
                sio_printf("failed to execute: %s\n", cmdline);
                exit(0);
            }
        }
        // sigprocmask(SIG_SETMASK, &prev_mask, NULL);

        // parents waiting for foreground job to terminate
 
        jid_t jid;
        
        if (parse_result == PARSELINE_FG) {
            // pid_global = pid;
            // int status;

            //sio_printf(" FG Job %d \n", fg_job());
            
            //sio_printf(" PID: %d \n", pid);
            if ( (jid = add_job(pid, FG, cmdline)) <= 0)
                unix_error("add_job failed");

            // sigprocmask(SIG_UNBLOCK, &mask_child, &prev_mask);
            //sio_printf("jid: %d, pid:%d \n", jid, pid);
            // pid_global = 0;
            while (fg_job() != 0){   // while pid == 0
                sigemptyset(&prev_mask);
                sigsuspend(&prev_mask);   // prev_mask has everything unblocked
            }
            // sigprocmask(SIG_SETMASK, &prev_mask, NULL);
            //sio_printf(" FG Job %d \n", fg_job());
            // if (waitpid(pid, &status, 0) < 0) {
            //     unix_error("waitfg: waitpid error");
            // }

            // delete_job(jid);
            // pid = 0;
            // while (!pid)
            //     sigsuspend(&prev_mask);
            
            
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
 * TODO: Delete this comment and replace it with your own.
 * <What does sigchld_handler do?>
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
        
        //sio_printf("PID from waitpid %d \n", pid);
        // if (job_exists(fg_job()) && job_get_pid(fg_job()) == pid) {
        //     pid_global = pid;
        // }
        // sio_printf("PID %d ", pid);
        // sio_printf("JID %d ", job_from_pid(pid));
        if (WIFEXITED(status)) {
            // sio_printf("WIFEXITED\n");
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

        // if (WIFCONTINUED(status)) {
        //     int jid = job_from_pid(pid);
        //     job_set_state(jid, ST);
        // }

        // sio_printf("PID %d", pid);
        // if (WIFSTOPPED(status)) {
        //     sigtstp_handler(WSTOPSIG(status));
        // }

        // sio_printf("PID: %d", pid);
        // sio_printf("fg job: %d", fg_job());
        // else if (WIFSTOPPED(status) && job_get_state(job_from_pid(pid)) != ST) {
        //     int sig = WSTOPSIG(status);
        //     int jid = job_from_pid(pid);
        //     job_set_state(jid, ST);
        //     // kill(-pid, sig);
        //     sio_printf("Job [%d] (%d) stopped by signal %d\n", jid, pid, sig);
        // }

        // else if (WIFSIGNALED(status)) {
        //     // SIGINT and SIGTERM 
        //     if (WTERMSIG(status) == SIGINT){
        //         // SIGINT
        //         if (job_from_pid(pid) > 0 && job_get_state(job_from_pid(pid)) == BG) {
        //             // If SIGINT from background job 
        //             int jid = job_from_pid(pid);
        //             if (delete_job(jid) == 0) {
        //                 unix_error("delete job error");
        //             }
        //             kill(-pid, SIGINT);
        //             sio_printf("Job [%d] (%d) terminated by signal %d\n", jid, pid, SIGINT);
        //         } 
        //         else {
        //             // if foreground sigint
        //             sigint_handler(SIGINT);
        //         }
                
        //     } else{
        //         // SIGTERM
        //         int sig = WTERMSIG(status);
        //         int jid = job_from_pid(pid);
        //         job_set_state(jid, ST);
        //         if (delete_job(jid) == 0) {
        //                 unix_error("delete job error");
        //             }
        //         kill(-pid, sig);
        //         sio_printf("Job [%d] (%d) terminated by signal %d\n", jid, pid, sig);
        //     }
        // }

        
    }
    sigprocmask(SIG_SETMASK, &prev_mask, NULL);
    

    // if (errno != ECHILD) {
    //     unix_error("waitpid error");
    // }

    errno = old_errno;

}

/*
 * TODO: Delete this comment and replace it with your own.
 * <What does sigint_handler do?>
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
        // if (delete_job(jid) == 0) {
        //     unix_error("delete job error");
        // }
        kill(-pid, SIGINT);
        // sio_printf("Job [%d] (%d) terminated by signal %d\n", jid, pid, sig);
    }

    sigprocmask(SIG_SETMASK, &prev_mask, NULL);


    errno = old_errno;

}

/*
 * TODO: Delete this comment and replace it with your own.
 * <What does sigtstp_handler do?>
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
        // job_set_state(jid, ST);
        kill(-pid, SIGTSTP);
        // sio_printf("Job [%d] (%d) stopped by signal %d\n", jid, pid, sig);
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
