/**
 * jacobi-2d-imper.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <stdlib.h>

static void init_array(int n, double *A, double *B) {
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      A[i * n + j] = ((double)i * (j + 2) + 2.0) / n;
      B[i * n + j] = ((double)i * (j + 3) + 3.0) / n;
    }
  }
}

static void print_array(int n, double *A) {
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      fprintf(stderr, "%0.6lf ", A[i * n + j]);
      if (((i * n + j) % 20) == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}

static void kernel_jacobi_2d_imper(int tsteps, int n, double *A, double *B) {
  for (int t = 0; t < tsteps; ++t) {
    for (int i = 1; i < n - 1; ++i) {
      for (int j = 1; j < n - 1; ++j) {
        B[i * n + j] = 0.2 *
                       (A[i * n + j] +
                        A[i * n + (j - 1)] +
                        A[i * n + (j + 1)] +
                        A[(i + 1) * n + j] +
                        A[(i - 1) * n + j]);
      }
    }

    for (int i = 1; i < n - 1; ++i) {
      for (int j = 1; j < n - 1; ++j) {
        A[i * n + j] = B[i * n + j];
      }
    }
  }
}

int main(int argc, char **argv) {
  if (argc < 4) {
    fprintf(stderr, "Usage: %s dump_code tsteps n\n", argv[0]);
    return 1;
  }

  int dump_code = atoi(argv[1]);
  int tsteps = atoi(argv[2]);
  int n = atoi(argv[3]);

  double *A = (double *)malloc(sizeof(double) * n * n);
  double *B = (double *)malloc(sizeof(double) * n * n);

  if (!A || !B) {
    fprintf(stderr, "Allocation failed\n");
    free(A);
    free(B);
    return 1;
  }

  init_array(n, A, B);

  kernel_jacobi_2d_imper(tsteps, n, A, B);

  if (dump_code == 1) {
    print_array(n, A);
  } else if (n > 1) {
    int mid = n / 2;
    fprintf(stderr, "Check: %f\n", A[mid * n + mid]);
  }

  free(A);
  free(B);

  return 0;
}
