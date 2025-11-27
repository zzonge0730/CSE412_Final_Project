#include <stdio.h>
#include <stdlib.h>

static void init_array(int ni, int nj, int nk,
                       double *alpha,
                       double *beta,
                       double *C,
                       double *A,
                       double *B) {
  int i, j;
  *alpha = 32412.0;
  *beta = 2123.0;
  for (i = 0; i < ni; i++) {
    for (j = 0; j < nj; j++) {
      C[(size_t)i * nj + j] = ((double)i * j) / ni;
    }
  }
  for (i = 0; i < ni; i++) {
    for (j = 0; j < nk; j++) {
      A[(size_t)i * nk + j] = ((double)i * (j + 1)) / nk;
    }
  }
  for (i = 0; i < nk; i++) {
    for (j = 0; j < nj; j++) {
      B[(size_t)i * nj + j] = ((double)(i + 1) * j) / nj;
    }
  }
}

static void kernel_gemm(int ni, int nj, int nk,
                        double alpha,
                        double beta,
                        double *C,
                        double *A,
                        double *B) {
  int i, j, k;
  for (i = 0; i < ni; i++) {
    for (j = 0; j < nj; j++) {
      double sum = beta * C[(size_t)i * nj + j];
      for (k = 0; k < nk; k++) {
        sum += alpha * A[(size_t)i * nk + k] * B[(size_t)k * nj + j];
      }
      C[(size_t)i * nj + j] = sum;
    }
  }
}

static void print_array(int ni, int nj, double *C) {
  int i, j;
  for (i = 0; i < ni; i++) {
    for (j = 0; j < nj; j++) {
      fprintf(stderr, "%0.2lf ", C[(size_t)i * nj + j]);
      if (((size_t)i * nj + j) % 20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}

int main(int argc, char **argv) {
  if (argc < 5) {
    fprintf(stderr, "usage: %s ni nj nk print_flag\n", argv[0]);
    return 1;
  }

  int ni = atoi(argv[1]);
  int nj = atoi(argv[2]);
  int nk = atoi(argv[3]);
  int print_flag = atoi(argv[4]);

  double alpha = 0.0;
  double beta = 0.0;
  size_t sizeC = (size_t)ni * nj;
  size_t sizeA = (size_t)ni * nk;
  size_t sizeB = (size_t)nk * nj;

  double *C = (double *)malloc(sizeC * sizeof(double));
  double *A = (double *)malloc(sizeA * sizeof(double));
  double *B = (double *)malloc(sizeB * sizeof(double));
  if (!C || !A || !B) {
    fprintf(stderr, "malloc failed\n");
    free(C);
    free(A);
    free(B);
    return 1;
  }

  init_array(ni, nj, nk, &alpha, &beta, C, A, B);
  kernel_gemm(ni, nj, nk, alpha, beta, C, A, B);

  if (print_flag) {
    print_array(ni, nj, C);
  }

  free(C);
  free(A);
  free(B);
  return 0;
}

