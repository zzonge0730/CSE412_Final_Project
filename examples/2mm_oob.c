/**
 * 2mm.c with intentional Out-of-Bounds access for Spatial Safety verification
 * This is a fault injection test to verify that Catamaran correctly detects spatial errors
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

static volatile double oob_guard = 0.0;

  static
void init_array(int ni, int nj, int nk, int nl,
    double *alpha,
    double *beta,
    double A[ni][nl],
    double B[nk][nj],
    double C[nl][nj],
    double D[ni][nl])
{
  int i, j;

  *alpha = 32412;
  *beta = 2123;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = ((double) i*j) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = ((double) i*(j+1)) / nj;
  for (i = 0; i < nl; i++)
    for (j = 0; j < nj; j++)
      C[i][j] = ((double) i*(j+3)) / nl;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
      D[i][j] = ((double) i*(j+2)) / nk;
}




  static
void print_array(int ni, int nl,
    double D[ni][nl])
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++) {
      fprintf (stderr, "%0.2lf ", D[i][j]);
      if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}




  static
void kernel_2mm(int ni, int nj, int nk, int nl,
    double alpha,
    double beta,
    double tmp[ni][nj],
    double A[ni][nk],
    double B[nk][nj],
    double C[nl][nj],
    double D[ni][nl])
{
  int i, j, k;

#pragma scop

  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
    {
      tmp[i][j] = 0;
      for (k = 0; k < nk; ++k)
        tmp[i][j] += alpha * A[i][k] * B[k][j];
    }
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
    {
      D[i][j] *= beta;
      for (k = 0; k < nj; ++k) {
        // INTENTIONAL BUG: Access tmp[i][k+bad_offset] to cause OOB.
        // Use volatile to prevent compiler from eliminating this as UB at compile-time.
        volatile int bad_offset = 99999999;
        double oob_val = tmp[i][k+bad_offset];
        oob_guard += oob_val;
        D[i][j] += oob_val * C[k][j];
      }
    }
#pragma endscop

}


int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);
  int nk = atoi(argv[4]);
  int nl = atoi(argv[5]);

  double *alpha = (double*)malloc(sizeof(double));
  double *beta = (double*)malloc(sizeof(double));
  double (*A)[nl] = (double(*)[nl])malloc((ni) * (nl) * sizeof(double));
  double (*B)[nj] = (double(*)[nj])malloc((nk) * (nj) * sizeof(double));
  double (*C)[nj] = (double(*)[nj])malloc((nl) * (nj) * sizeof(double));
  double (*D)[nl] = (double(*)[nl])malloc((ni) * (nl) * sizeof(double));
  double (*tmp)[nj] = (double(*)[nj])malloc((ni) * (nj) * sizeof(double));

  init_array(ni, nj, nk, nl, alpha, beta, A, B, C, D);

  kernel_2mm(ni, nj, nk, nl, *alpha, *beta, tmp, A, B, C, D);

  if (dump_code == 1) print_array(ni, nl, D);

  fprintf(stderr, "Check: %f\n", D[ni/2][nl/2]);

  free((void*)alpha);;
  free((void*)beta);;
  free((void*)A);;
  free((void*)B);;
  free((void*)C);;
  free((void*)D);;
  free((void*)tmp);;

  return 0;
}

