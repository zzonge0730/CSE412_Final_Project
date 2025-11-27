#include <stdio.h>
#include <stdlib.h>

static void init_array(int n,
                       double *alpha,
                       double *beta,
                       double *A,
                       double *u1,
                       double *u2,
                       double *v1,
                       double *v2,
                       double *w,
                       double *x,
                       double *y,
                       double *z) {
  *alpha = 43532.0;
  *beta = 12313.0;
  for (int i = 0; i < n; ++i) {
    u1[i] = i;
    u2[i] = (i + 1) / n;
    v1[i] = (i + 1) / (double)n;
    v2[i] = (i + 1) / (double)n;
    y[i] = (i + 3) / (double)n;
    z[i] = (i + 4) / (double)n;
    x[i] = 0.0;
    w[i] = 0.0;
    for (int j = 0; j < n; ++j) {
      A[i * n + j] = (i * j) / (double)n;
    }
  }
}

static void print_array(int n, double *w) {
  for (int i = 0; i < n; ++i) {
    fprintf(stderr, "%0.6lf ", w[i]);
    if ((i % 20) == 0) {
      fprintf(stderr, "\n");
    }
  }
  fprintf(stderr, "\n");
}

static void kernel_gemver(int n,
                          double alpha,
                          double beta,
                          double *A,
                          double *u1,
                          double *u2,
                          double *v1,
                          double *v2,
                          double *w,
                          double *x,
                          double *y,
                          double *z) {
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      A[i * n + j] += u1[i] * v1[j] + u2[i] * v2[j];
    }
  }

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      x[i] += beta * A[j * n + i] * y[j];
    }
  }

  for (int i = 0; i < n; ++i) {
    x[i] += z[i];
  }

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      w[i] += alpha * A[i * n + j] * x[j];
    }
  }
}

int main(int argc, char **argv) {
  if (argc < 3) {
    fprintf(stderr, "Usage: %s dump_code n\n", argv[0]);
    return 1;
  }

  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);

  double alpha, beta;
  double *A = (double *)malloc(sizeof(double) * n * n);
  double *u1 = (double *)malloc(sizeof(double) * n);
  double *u2 = (double *)malloc(sizeof(double) * n);
  double *v1 = (double *)malloc(sizeof(double) * n);
  double *v2 = (double *)malloc(sizeof(double) * n);
  double *w = (double *)malloc(sizeof(double) * n);
  double *x = (double *)malloc(sizeof(double) * n);
  double *y = (double *)malloc(sizeof(double) * n);
  double *z = (double *)malloc(sizeof(double) * n);

  if (!A || !u1 || !u2 || !v1 || !v2 || !w || !x || !y || !z) {
    fprintf(stderr, "Allocation failed\n");
    free(A); free(u1); free(u2); free(v1); free(v2);
    free(w); free(x); free(y); free(z);
    return 1;
  }

  init_array(n, &alpha, &beta, A, u1, u2, v1, v2, w, x, y, z);
  kernel_gemver(n, alpha, beta, A, u1, u2, v1, v2, w, x, y, z);

  if (dump_code == 1) {
    print_array(n, w);
  } else if (n > 0) {
    fprintf(stderr, "Check: %f\n", w[n / 2]);
  }

  free(A); free(u1); free(u2); free(v1); free(v2);
  free(w); free(x); free(y); free(z);

  return 0;
}
