#include <stdio.h>
#include <stdlib.h>

static void init_array(int ni,
                       int nj,
                       double *alpha,
                       double *beta,
                       double *C,
                       double *A,
                       double *B) {
  *alpha = 32412.0;
  *beta = 2123.0;
  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < nj; ++j) {
      double val = ((double)i * j) / ni;
      A[i * nj + j] = val;
      B[i * nj + j] = val;
    }
    for (int j = 0; j < ni; ++j) {
      C[i * ni + j] = ((double)i * j) / ni;
    }
  }
}

static void print_array(int ni, double *C) {
  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < ni; ++j) {
      fprintf(stderr, "%0.6lf ", C[i * ni + j]);
      if (((i * ni + j) % 20) == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}

static void kernel_syr2k(int ni,
                         int nj,
                         double alpha,
                         double beta,
                         double *C,
                         double *A,
                         double *B) {
  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < ni; ++j) {
      C[i * ni + j] *= beta;
    }
  }

  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < ni; ++j) {
      for (int k = 0; k < nj; ++k) {
        C[i * ni + j] += alpha * A[i * nj + k] * B[j * nj + k] +
                         alpha * B[i * nj + k] * A[j * nj + k];
      }
    }
  }
}

int main(int argc, char **argv) {
  if (argc < 4) {
    fprintf(stderr, "Usage: %s dump_code ni nj\n", argv[0]);
    return 1;
  }

  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);

  double alpha, beta;
  double *C = (double *)malloc(sizeof(double) * ni * ni);
  double *A = (double *)malloc(sizeof(double) * ni * nj);
  double *B = (double *)malloc(sizeof(double) * ni * nj);

  if (!C || !A || !B) {
    fprintf(stderr, "Allocation failed\n");
    free(C);
    free(A);
    free(B);
    return 1;
  }

  init_array(ni, nj, &alpha, &beta, C, A, B);

  kernel_syr2k(ni, nj, alpha, beta, C, A, B);

  if (dump_code == 1) {
    print_array(ni, C);
  } else if (ni > 0) {
    fprintf(stderr, "Check: %f\n", C[(ni / 2) * ni + (ni / 2)]);
  }

  free(C);
  free(A);
  free(B);

  return 0;
}
