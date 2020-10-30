/*
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(size_t M, size_t N, double A[N][M], double B[M][N], double *tmp);
 * A is the source matrix, B is the destination
 * tmp points to a region of memory able to hold TMPCOUNT (set to 256) doubles
 * as temporaries
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 2KB direct mapped cache with a block size of 64 bytes.
 *
 * Programming restrictions:
 *   No out-of-bounds references are allowed
 *   No alterations may be made to the source array A
 *   Data in tmp can be read or written
 *   This file cannot contain any local or global doubles or arrays of doubles
 *   You may not use unions, casting, global variables, or
 *     other tricks to hide array data in other forms of local or global memory.
 */
#include "cachelab.h"
#include "contracts.h"
#include <stdbool.h>
#include <stdio.h>

/* Forward declarations */
static bool is_transpose(size_t M, size_t N, const double A[N][M],
                         const double B[M][N]);
static void trans(size_t M, size_t N, const double A[N][M], double B[M][N],
                  double *tmp);
static void trans_tmp(size_t M, size_t N, const double A[N][M], double B[M][N],
                      double *tmp);
static void trans_blocking(size_t M, size_t N, const double A[N][M], double B[M][N],
                  double *tmp);
static void trans_blocking_line_tmp(size_t M, size_t N, const double A[N][M], double B[M][N],
                  double *tmp);
static void trans_unrolling(size_t M, size_t N, const double A[N][M], double B[M][N],
                  double *tmp);
static void trans_rec(size_t M, size_t N, const double A[N][M], double B[M][N],
                  double *tmp);
static void trans_blocking3(size_t M, size_t N, const double A[N][M], double B[M][N],
                  double *tmp);
static void trans_no_temp(size_t M, size_t N, const double A[N][M], double B[M][N],
                  double *tmp);

/*
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded.
 */
static const char transpose_submit_desc[] = "Transpose submission";

static void transpose_submit(size_t M, size_t N, const double A[N][M],
                             double B[M][N], double *tmp) {
  /*
   * This is a good place to call your favorite transposition functions
   * It's OK to choose different functions based on array size, but
   * your code must be correct for all values of M and N
   */

  if (M == N && M == 32) {
    trans_no_temp(M, N, A, B, tmp);
  }
  else if (M == N) {
    trans(M, N, A, B, tmp);
  } else {
    trans_rec(M, N, A, B, tmp);
  }
    
}
/*
 * You can define additional transpose functions below. We've defined
 * some simple ones below to help you get started.
 */

/*
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
static const char trans_desc[] = "Simple row-wise scan transpose";

/*
 * The following shows an example of a correct, but cache-inefficient
 *   transpose function.  Note the use of macros (defined in
 *   contracts.h) that add checking code when the file is compiled in
 *   debugging mode.  See the Makefile for instructions on how to do
 *   this.
 *
 *   IMPORTANT: Enabling debugging will significantly reduce your
 *   cache performance.  Be sure to disable this checking when you
 *   want to measure performance.
 */
static void trans(size_t M, size_t N, const double A[N][M], double B[M][N],
                  double *tmp) {
  size_t i, j;

  REQUIRES(M > 0);
  REQUIRES(N > 0);

  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++) {
      B[j][i] = A[i][j];
    }
  }

  ENSURES(is_transpose(M, N, A, B));
}

/*
 * This is a contrived example to illustrate the use of the temporary array
 */

static const char trans_tmp_desc[] =
    "Simple row-wise scan transpose, using a 2X2 temporary array";

static void trans_tmp(size_t M, size_t N, const double A[N][M], double B[M][N],
                      double *tmp) {
  size_t i, j;
  /* Use the first four elements of tmp as a 2x2 array with row-major ordering.
   */
  REQUIRES(M > 0);
  REQUIRES(N > 0);

  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++) {
      int di = i % 2;
      int dj = j % 2;
      tmp[2 * di + dj] = A[i][j];
      B[j][i] = tmp[2 * di + dj];
    }
  }

  ENSURES(is_transpose(M, N, A, B));
}


static const char trans_blocking_desc[] =
    "8x8  diagonal tmp";

static void trans_blocking(size_t M, size_t N, const double A[N][M], double B[M][N],
                      double *tmp) {
  size_t i, j, i1, j1, k;
  /* Use the first four elements of tmp as a 2x2 array with row-major ordering.
   */
  REQUIRES(M > 0);
  REQUIRES(N > 0);
    for (i = 0; i < N; i += 8) {
      for (j = 0; j < M; j+=8) {
          for (i1 = i; i1 < i + 8; i1++) {
              for (j1 = j; j1 < j + 8; j1++){
                  if (i + i1 == j + j1){
                      tmp[i1] = A[i1][j1];
                  } else {
                    B[j1][i1] =  A[i1][j1];
                  }
              }
          }

          if (i == j) {
            for (k = 0; k < 8; k++) {
              B[i + k][i + k] = tmp[i+ k];
            }
          }
      }
    }
  ENSURES(is_transpose(M, N, A, B));
}


static const char trans_diagonal_outer_desc[] =
    "8x8  diagonal tmp";

static void trans_diagonal_outer(size_t M, size_t N, const double A[N][M], double B[M][N],
                      double *tmp) {
  size_t i, j, i1, j1;
  /* Use the first four elements of tmp as a 2x2 array with row-major ordering.
   */
  REQUIRES(M > 0);
  REQUIRES(N > 0);
  for (i = 0; i < N; i+=8) {
    for (j = 0; j < M; j+=8) {
      for (i1 = i; i1 < i + 8; i1++){

        for (j1 = j; j1 < j + 8; j1++){
          if (i1 == j1) {
            tmp[i1 - i] = A[i1][j1];

          } else {
            B[j1][i1] =  A[i1][j1];
          }
        }
      }
    }
  }

  ENSURES(is_transpose(M, N, A, B));
}


static const char trans_blocking3_desc[] =
    "tmp on digonal of each block";

static void trans_blocking3(size_t M, size_t N, const double A[N][M], double B[M][N],
                      double *tmp) {
  size_t i, j, i1, j1, k, d;
  /* Use the first four elements of tmp as a 2x2 array with row-major ordering.
   */
  REQUIRES(M > 0);
  REQUIRES(N > 0);
    for (i = 0; i < N; i += 8) {
      for (j = 0; j < M; j+=8) {
          for (i1 = i; i1 < i + 8; i1++) {
              for (j1 = j; j1 < j + 8; j1++){
                  if (i1 - i == j1 - j){
                      tmp[0] = A[i1][j1];
                      k = i1;
                      d = j1;
                  } else {
                    B[j1][i1] =  A[i1][j1];
                  }
              }
              B[d][k] = tmp[0];
          }
      }
    }

  ENSURES(is_transpose(M, N, A, B));
}


static const char trans_blocking_line_tmp_desc[] =
    "8x8 first line tmp";

static void trans_blocking_line_tmp(size_t M, size_t N, const double A[N][M], double B[M][N],
                      double *tmp) {
  size_t i, j, i1, j1;
  /* Use the first four elements of tmp as a 2x2 array with row-major ordering.
   */
  REQUIRES(M > 0);
  REQUIRES(N > 0);
   for (i = 0; i < N; i+=8) {
    for (j = 0; j < M; j+=8) {
      for (i1 = i; i1 < i + 8; i1++){
        for (j1 = j; j1 < j + 8; j1++){
          /* B[j1][i1] = A[i1][j1]; */
          if (i1 == i) {
            tmp[j1 - j] = A[i1][j1];
          }
          else {
            B[j1][i1] = A[i1][j1];
          }
        }
        if (i1 == i){
          B[j][i] = tmp[0];
          B[j+1][i] = tmp[1];
          B[j+2][i] = tmp[2];
          B[j+3][i] = tmp[3];
          B[j+4][i] = tmp[4];
          B[j+5][i] = tmp[5];
          B[j+6][i] = tmp[6];
          B[j+7][i] = tmp[7];
        }
      } 
    }
  }

  ENSURES(is_transpose(M, N, A, B));
}





static const char trans_unrolling_desc[] =
    "8x8  diagonal tmp first line tmp";

static void trans_unrolling(size_t M, size_t N, const double A[N][M], double B[M][N],
                      double *tmp) {
  size_t i, j, i1, j1, k;
  /* Use the first four elements of tmp as a 2x2 array with row-major ordering.
   */
  REQUIRES(M > 0);
  REQUIRES(N > 0);
      for (i = 0; i < N; i += 8) {
      for (j = 0; j < M; j+=8) {
          for (i1 = i; i1 < i + 8; i1++) {
              for (j1 = j; j1 < j + 8; j1++){
                  if (i + i1 == j + j1){
                      tmp[255] = A[i1][j1];
                      k = j1;
                  } else {
                    B[j1][i1] =  A[i1][j1];
                  }
              }
            if (i == j) {
              B[k][k] = tmp[255];
            }
          }
      }
    }
  ENSURES(is_transpose(M, N, A, B));
}



static const char trans_no_temp_desc[] =
    "8x8  diagonal without tmp";

static void trans_no_temp(size_t M, size_t N, const double A[N][M], double B[M][N],
                      double *tmp) {
  size_t i, j, i1, j1;
  /* Use the first four elements of tmp as a 2x2 array with row-major ordering.
   */
  REQUIRES(M > 0);
  REQUIRES(N > 0);
  for (i = 0; i < N; i += 8) {
    for (j = 0; j < M; j+=8) {
      for (i1 = i; i1 < i + 8; i1++) {
        for (j1 = j; j1 < j + 8; j1++){
          if (i1 == j1){
            continue;
          } else {
            B[j1][i1] =  A[i1][j1];
          }
        }
        if (i == j) {
          B[i1][i1] = A[i1][i1];
        }
      }
    }
  } 

  ENSURES(is_transpose(M, N, A, B));
}


static const char trans_rec_desc[] =
    "63 * 65";

static void trans_rec(size_t M, size_t N, const double A[N][M], double B[M][N],
                      double *tmp) {
  size_t i, j, i1, j1;
  /* Use the first four elements of tmp as a 2x2 array with row-major ordering.
   */
  REQUIRES(M > 0);
  REQUIRES(N > 0);

  for (i = 0; i < N + 4; i+=4) {
    for (j = 0; j < M + 4; j+=4) {
      for (i1 = i; i1 < i + 4 && i1 < N; i1++){
        for (j1 = j; j1 < j + 4 && j1 < M; j1++){
          B[j1][i1] = A[i1][j1];
        }
      } 
    }
  }
  ENSURES(is_transpose(M, N, A, B));
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions(void) {
  /* Register your solution function */
  registerTransFunction(transpose_submit, transpose_submit_desc);

  /* Register any additional transpose functions */
  registerTransFunction(trans, trans_desc);
  registerTransFunction(trans_tmp, trans_tmp_desc);
  registerTransFunction(trans_blocking, trans_blocking_desc);
  registerTransFunction(trans_blocking_line_tmp, trans_blocking_line_tmp_desc);
  registerTransFunction(trans_unrolling, trans_unrolling_desc);
  registerTransFunction(trans_rec, trans_rec_desc);
  registerTransFunction(trans_blocking3, trans_blocking3_desc);
  registerTransFunction(trans_no_temp, trans_no_temp_desc);
}

/*
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
static bool is_transpose(size_t M, size_t N, const double A[N][M],
                         const double B[M][N]) {
  size_t i, j;

  for (i = 0; i < N; i++) {
    for (j = 0; j < M; ++j) {
      if (A[i][j] != B[j][i]) {
        return false;
      }
    }
  }
  return true;
}
