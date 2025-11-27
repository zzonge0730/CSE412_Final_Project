#include <math.h>
#include <stdio.h>
#include <stdlib.h>

static void init_array(int nx, int ny, double *A, double *x) {
  for (int i = 0; i < ny; ++i) {
    x[i] = i * M_PI;
  }
  for (int i = 0; i < nx; ++i) {
    for (int j = 0; j < ny; ++j) {
      A[i * ny + j] = ((double)i * (j + 1)) / nx;
    }
  }
}

static void print_array(int ny, double *y) {
  for (int i = 0; i < ny; ++i) {
    fprintf(stderr, "%0.6lf ", y[i]);
    if (i % 20 == 0) {
      fprintf(stderr, "\n");
    }
  }
  fprintf(stderr, "\n");
}

static void kernel_atax(int nx,
                        int ny,
                        double *A,
                        double *x,
                        double *y,
                        double *tmp) {
  for (int i = 0; i < ny; ++i) {
    y[i] = 0.0;
  }

  for (int i = 0; i < nx; ++i) {
    tmp[i] = 0.0;
    for (int j = 0; j < ny; ++j) {
      tmp[i] += A[i * ny + j] * x[j];
    }
    for (int j = 0; j < ny; ++j) {
      y[j] += A[i * ny + j] * tmp[i];
    }
  }
}

int main(int argc, char **argv) {
  if (argc < 4) {
    fprintf(stderr, "Usage: %s dump_code nx ny\n", argv[0]);
    return 1;
  }

  int dump_code = atoi(argv[1]);
  int nx = atoi(argv[2]);
  int ny = atoi(argv[3]);

  double *A = (double *)malloc(sizeof(double) * nx * ny);
  double *x = (double *)malloc(sizeof(double) * ny);
  double *y = (double *)malloc(sizeof(double) * ny);
  double *tmp = (double *)malloc(sizeof(double) * nx);

  if (!A || !x || !y || !tmp) {
    fprintf(stderr, "Allocation failed\n");
    free(A);
    free(x);
    free(y);
    free(tmp);
    return 1;
  }

  init_array(nx, ny, A, x);

  kernel_atax(nx, ny, A, x, y, tmp);

  if (dump_code == 1) {
    print_array(ny, y);
  } else if (ny > 0) {
    fprintf(stderr, "Check: %f\n", y[ny / 2]);
  }

  free(A);
  free(x);
  free(y);
  free(tmp);

  return 0;
}
