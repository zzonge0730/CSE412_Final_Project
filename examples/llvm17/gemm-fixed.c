/**
 * gemm.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <stdlib.h> // malloc, free

/* Include polybench common header. */
// #include <polybench.h> // Removed to prevent macro expansion issues

/* Include benchmark-specific header. */
/* Default data type is double, default size is 4000. */
#include "gemm.h"

/* Manually define PolyBench macros */
#ifndef DATA_TYPE
# define DATA_TYPE double
# define DATA_PRINTF_MODIFIER "%0.2lf "
#endif

#ifndef POLYBENCH_LOOP_BOUND
# define POLYBENCH_LOOP_BOUND(x,y) y
#endif

/* Array initialization. */
static
void init_array(int ni, int nj, int nk,
		DATA_TYPE *alpha,
		DATA_TYPE *beta,
		DATA_TYPE (*C)[nj],
		DATA_TYPE (*A)[nk],
		DATA_TYPE (*B)[nj])
{
  int i, j;

  *alpha = 32412;
  *beta = 2123;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      C[i][j] = ((DATA_TYPE) i*j) / ni;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = ((DATA_TYPE) i*j) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = ((DATA_TYPE) i*j) / ni;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int ni, int nj,
		 DATA_TYPE (*C)[nj])
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
	fprintf (stderr, DATA_PRINTF_MODIFIER, C[i][j]);
	if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_gemm(int ni, int nj, int nk,
		 DATA_TYPE alpha,
		 DATA_TYPE beta,
		 DATA_TYPE (*C)[nj],
		 DATA_TYPE (*A)[nk],
		 DATA_TYPE (*B)[nj])
{
  int i, j, k;

#pragma scop
  /* C := alpha*A*B + beta*C */
  for (i = 0; i < _PB_NI; i++)
    for (j = 0; j < _PB_NJ; j++)
      {
	C[i][j] *= beta;
	for (k = 0; k < _PB_NK; ++k)
	  C[i][j] += alpha * A[i][k] * B[k][j];
      }
#pragma endscop

}

/* PolyBench instrumentation placeholders */
void polybench_start_instruments() {}
void polybench_stop_instruments() {}
void polybench_print_instruments() {}
void polybench_prevent_dce(void* ptr) {}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int ni = NI;
  int nj = NJ;
  int nk = NK;

  /* Variable declaration/allocation. */
  DATA_TYPE alpha;
  DATA_TYPE beta;
  
  /* POLYBENCH_2D_ARRAY_DECL replacement */
  /* DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj); */
  DATA_TYPE (*C)[nj] = (DATA_TYPE (*)[nj])malloc(ni * nj * sizeof(DATA_TYPE));
  
  /* DATA_TYPE POLYBENCH_2D(A,NI,NK,ni,nk); */
  DATA_TYPE (*A)[nk] = (DATA_TYPE (*)[nk])malloc(ni * nk * sizeof(DATA_TYPE));

  /* DATA_TYPE POLYBENCH_2D(B,NK,NJ,nk,nj); */
  DATA_TYPE (*B)[nj] = (DATA_TYPE (*)[nj])malloc(nk * nj * sizeof(DATA_TYPE));


  /* Initialize array(s). */
  init_array (ni, nj, nk, &alpha, &beta,
	      (DATA_TYPE (*)[nj])C,
	      (DATA_TYPE (*)[nk])A,
	      (DATA_TYPE (*)[nj])B);

  /* Start timer. */
  polybench_start_instruments();

  /* Run kernel. */
  kernel_gemm (ni, nj, nk,
	       alpha, beta,
	       (DATA_TYPE (*)[nj])C,
	       (DATA_TYPE (*)[nk])A,
	       (DATA_TYPE (*)[nj])B);

  /* Stop and print timer. */
  polybench_stop_instruments();
  polybench_print_instruments();

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  /* polybench_prevent_dce(print_array(ni, nj,  (DATA_TYPE (*)[nj])C)); */
  print_array(ni, nj, (DATA_TYPE (*)[nj])C);

  /* Be clean. */
  free(C);
  free(A);
  free(B);

  return 0;
}
