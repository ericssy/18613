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

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
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
  char cmdline[MAXLINE_TSH]; // Cmdline for fgets
  bool emit_prompt = true;   // Emit prompt (default)

  // Redirect stderr to stdout (so that driver will get all output
  // on the pipe connected to stdout)
  if (dup2(STDOUT_FILENO, STDERR_FILENO) < 0) {
    perror("dup2 error");
    exit(1);
  }

  // Parse the command line
  while ((c = getopt(argc, argv, "hvp")) != EOF) {
    switch (c) {
    case 'h': // Prints help message
      usage();
      break;
    case 'v': // Emits additional diagnostic info
      verbose = true;
      break;
    case 'p': // Disables prompt printing
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
  Signal(SIGINT, sigint_handler);   // Handles Ctrl-C
  Signal(SIGTSTP, sigtstp_handler); // Handles Ctrl-Z
  Signal(SIGCHLD, sigchld_handler); // Handles terminated or stopped child

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

  // Parse command line
  parse_result = parseline(cmdline, &token);

  if (parse_result == PARSELINE_ERROR || parse_result == PARSELINE_EMPTY) {
    return;
  }

  // TODO: Implement commands here.
}

/*****************
 * Signal handlers
 *****************/

/*
 * TODO: Delete this comment and replace it with your own.
 * <What does sigchld_handler do?>
 */
void sigchld_handler(int sig) {}

/*
 * TODO: Delete this comment and replace it with your own.
 * <What does sigint_handler do?>
 */
void sigint_handler(int sig) {}

/*
 * TODO: Delete this comment and replace it with your own.
 * <What does sigtstp_handler do?>
 */
void sigtstp_handler(int sig) {}

/*
 * cleanup - Attempt to clean up global resources when the program exits. In
 * particular, the job list must be freed at this time, since it may contain
 * leftover buffers from existing or even deleted jobs.
 */
void cleanup(void) {
  // Signals handlers need to be removed before destroying the joblist
  Signal(SIGINT, SIG_DFL);  // Handles Ctrl-C
  Signal(SIGTSTP, SIG_DFL); // Handles Ctrl-Z
  Signal(SIGCHLD, SIG_DFL); // Handles terminated or stopped child

  destroy_job_list();
}
