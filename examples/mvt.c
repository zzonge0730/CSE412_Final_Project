#include <math.h>
#include <stdio.h>
#include <stdlib.h>

static void init_array(int n,
                       double *x1,
                       double *x2,
                       double *y1,
                       double *y2,
                       double *A) {
  for (int i = 0; i < n; ++i) {
    x1[i] = ((double)i) / n;
    x2[i] = ((double)i + 1) / n;
    y1[i] = ((double)i + 3) / n;
    y2[i] = ((double)i + 4) / n;
    for (int j = 0; j < n; ++j) {
      A[i * n + j] = ((double)i * j) / n;
    }
  }
}

static void print_array(int n, double *x1, double *x2) {
  for (int i = 0; i < n; ++i) {
    fprintf(stderr, "%0.6lf %0.6lf ", x1[i], x2[i]);
    if (i % 20 == 0) {
      fprintf(stderr, "\n");
    }
  }
  fprintf(stderr, "\n");
}

static void kernel_mvt(int n,
                       double *x1,
                       double *x2,
                       double *y1,
                       double *y2,
                       double *A) {
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      x1[i] += A[i * n + j] * y1[j];
    }
  }

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      x2[i] += A[j * n + i] * y2[j];
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

  double *A = (double *)malloc(sizeof(double) * n * n);
  double *x1 = (double *)malloc(sizeof(double) * n);
  double *x2 = (double *)malloc(sizeof(double) * n);
  double *y1 = (double *)malloc(sizeof(double) * n);
  double *y2 = (double *)malloc(sizeof(double) * n);

  if (!A || !x1 || !x2 || !y1 || !y2) {
    fprintf(stderr, "Allocation failed\n");
    free(A);
    free(x1);
    free(x2);
    free(y1);
    free(y2);
    return 1;
  }

  init_array(n, x1, x2, y1, y2, A);

  kernel_mvt(n, x1, x2, y1, y2, A);

  if (dump_code == 1) {
    print_array(n, x1, x2);
  } else if (n > 0) {
    fprintf(stderr, "Check: %f %f\n", x1[n / 2], x2[n / 2]);
  }

  free(A);
  free(x1);
  free(x2);
  free(y1);
  free(y2);

  return 0;
}
