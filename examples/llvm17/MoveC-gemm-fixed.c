#include "_RV_memsafe.c"
#line 1 "/workspace/examples/llvm17/gemm-fixed.c"
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
/*#ifndef DATA_TYPE*/
/*# define DATA_TYPE double*/
/*# define DATA_PRINTF_MODIFIER "%0.2lf "*/
/*#endif*/

/*#ifndef POLYBENCH_LOOP_BOUND*/
/*# define POLYBENCH_LOOP_BOUND(x,y) y*/
/*#endif*/

/* Array initialization. */
static void _RV_init_array(__RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, int p1, int p2, int p3, double *p4, double *p5, double (*p6)[p2], double (*p7)[p3], double (*p8)[p2]);

static
void init_array(int ni, int nj, int nk,
		double/*DATA_TYPE*/
#line 34
            *alpha,
		double/*DATA_TYPE*/
#line 35
            *beta,
		double/*DATA_TYPE*/
#line 36
            (*C)[nj],
		double/*DATA_TYPE*/
#line 37
            (*A)[nk],
		double/*DATA_TYPE*/
#line 38
            (*B)[nj])
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_100901833899968 = 0;
unsigned char _RV_bc_flag_100901833899936 = 0;
unsigned char _RV_bc_flag_100901833901336 = 0;
unsigned char _RV_bc_flag_100901833901304 = 0;
unsigned char _RV_bc_flag_100901833902704 = 0;
unsigned char _RV_bc_flag_100901833902672 = 0;
__RV_pmd _RV_pmd_alpha_100901833888848 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_beta_100901833888976 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_100901833889424 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_100901833889872 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_100901833890320 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_alpha_100901833888848, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_beta_100901833888976, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_100901833889424, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_100901833889872, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_100901833890320, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 4))
  );

  int i, j;

  *alpha = 32412;
  *beta = 2123;
  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nj; j++)
      {
C[i][j] = ((double/*DATA_TYPE*/
#line 46
                           ) i*j) / ni;
_RV_lbl_100901833899936:
if(_RV_ret_flag) goto _RV_lbl_100901833899968;
if(_RV_bc_flag_100901833899936 == 1) {
_RV_bc_flag_100901833899936 = 0;
break;
}
if(_RV_bc_flag_100901833899936 == 2) _RV_bc_flag_100901833899936 = 0;
}

_RV_lbl_100901833899968:
if(_RV_ret_flag) goto _RV_lbl_100901833902816;
if(_RV_bc_flag_100901833899968 == 1) {
_RV_bc_flag_100901833899968 = 0;
break;
}
if(_RV_bc_flag_100901833899968 == 2) _RV_bc_flag_100901833899968 = 0;
}

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nk; j++)
      {
A[i][j] = ((double/*DATA_TYPE*/
#line 49
                           ) i*j) / ni;
_RV_lbl_100901833901304:
if(_RV_ret_flag) goto _RV_lbl_100901833901336;
if(_RV_bc_flag_100901833901304 == 1) {
_RV_bc_flag_100901833901304 = 0;
break;
}
if(_RV_bc_flag_100901833901304 == 2) _RV_bc_flag_100901833901304 = 0;
}

_RV_lbl_100901833901336:
if(_RV_ret_flag) goto _RV_lbl_100901833902816;
if(_RV_bc_flag_100901833901336 == 1) {
_RV_bc_flag_100901833901336 = 0;
break;
}
if(_RV_bc_flag_100901833901336 == 2) _RV_bc_flag_100901833901336 = 0;
}

  for (i = 0; i < nk; i++)
    {
for (j = 0; j < nj; j++)
      {
B[i][j] = ((double/*DATA_TYPE*/
#line 52
                           ) i*j) / ni;
_RV_lbl_100901833902672:
if(_RV_ret_flag) goto _RV_lbl_100901833902704;
if(_RV_bc_flag_100901833902672 == 1) {
_RV_bc_flag_100901833902672 = 0;
break;
}
if(_RV_bc_flag_100901833902672 == 2) _RV_bc_flag_100901833902672 = 0;
}

_RV_lbl_100901833902704:
if(_RV_ret_flag) goto _RV_lbl_100901833902816;
if(_RV_bc_flag_100901833902704 == 1) {
_RV_bc_flag_100901833902704 = 0;
break;
}
if(_RV_bc_flag_100901833902704 == 2) _RV_bc_flag_100901833902704 = 0;
}


_RV_lbl_100901833902816:
__RV_pmd_set_null(&_RV_pmd_alpha_100901833888848);
__RV_pmd_set_null(&_RV_pmd_beta_100901833888976);
__RV_pmd_set_null(&_RV_pmd_C_100901833889424);
__RV_pmd_set_null(&_RV_pmd_A_100901833889872);
__RV_pmd_set_null(&_RV_pmd_B_100901833890320);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, int p1, int p2, int p3, double *p4, double *p5, double (*p6)[p2], double (*p7)[p3], double (*p8)[p2])
{
  __RV_fmd_tbl_create((__RV_func_addr)init_array, 5);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 0, p4_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 1, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 2, p6_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 3, p7_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 4, p8_pmd);
  init_array(p1, p2, p3, p4, p5, p6, p7, p8);
  __RV_fmd_tbl_remove((__RV_func_addr)init_array);
  __RV_pmd_free_null_ptr(p4_pmd);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
  __RV_pmd_free_null_ptr(p7_pmd);
  __RV_pmd_free_null_ptr(p8_pmd);
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double (*p3)[p2]);

static
void print_array(int ni, int nj,
		 double/*DATA_TYPE*/
#line 60
             (*C)[nj])
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_100901833906744 = 0;
unsigned char _RV_bc_flag_100901833906712 = 0;
__RV_pmd _RV_pmd_C_100901833903472 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_100901833903472, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  int i, j;

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nj; j++) {
	fprintf (stderr/*stderr*/
#line 66
                , "%0.2lf "/*DATA_PRINTF_MODIFIER*/
#line 66
                                      , C[i][j]);
	if ((i * ni + j) % 20 == 0) {
fprintf (stderr/*stderr*/
#line 67
                                            , "\n");
_RV_lbl_100901833906560:
if(_RV_ret_flag) goto _RV_lbl_100901833906712;
if(_RV_bc_flag_100901833906712 == 1 || _RV_bc_flag_100901833906712 == 2) goto _RV_lbl_100901833906712;
}

    
_RV_lbl_100901833906712:
if(_RV_ret_flag) goto _RV_lbl_100901833906744;
if(_RV_bc_flag_100901833906712 == 1) {
_RV_bc_flag_100901833906712 = 0;
break;
}
if(_RV_bc_flag_100901833906712 == 2) _RV_bc_flag_100901833906712 = 0;
}
_RV_lbl_100901833906744:
if(_RV_ret_flag) goto _RV_lbl_100901833907144;
if(_RV_bc_flag_100901833906744 == 1) {
_RV_bc_flag_100901833906744 = 0;
break;
}
if(_RV_bc_flag_100901833906744 == 2) _RV_bc_flag_100901833906744 = 0;
}

  fprintf (stderr/*stderr*/
#line 69
                 , "\n");

_RV_lbl_100901833907144:
__RV_pmd_set_null(&_RV_pmd_C_100901833903472);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double (*p3)[p2])
{
  __RV_fmd_tbl_create((__RV_func_addr)print_array, 1);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)print_array, 0, p3_pmd);
  print_array(p1, p2, p3);
  __RV_fmd_tbl_remove((__RV_func_addr)print_array);
  __RV_pmd_free_null_ptr(p3_pmd);
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static void _RV_kernel_gemm(__RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, int p1, int p2, int p3, double p4, double p5, double (*p6)[p2], double (*p7)[p3], double (*p8)[p2]);

static
void kernel_gemm(int ni, int nj, int nk,
		 double/*DATA_TYPE*/
#line 77
             alpha,
		 double/*DATA_TYPE*/
#line 78
             beta,
		 double/*DATA_TYPE*/
#line 79
             (*C)[nj],
		 double/*DATA_TYPE*/
#line 80
             (*A)[nk],
		 double/*DATA_TYPE*/
#line 81
             (*B)[nj])
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_100901833916224 = 0;
unsigned char _RV_bc_flag_100901833916192 = 0;
unsigned char _RV_bc_flag_100901833916088 = 0;
__RV_pmd _RV_pmd_C_100901833911584 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_100901833912032 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_100901833912480 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_100901833911584, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemm, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_100901833912032, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemm, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_100901833912480, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemm, 2))
  );

  int i, j, k;

/*#pragma scop*/
  /* C := alpha*A*B + beta*C */
  for (i = 0; i < ni/*_PB_NI*/
#line 87
                        ; i++)
    {
for (j = 0; j < nj/*_PB_NJ*/
#line 88
                          ; j++)
      {
	C[i][j] *= beta;
	for (k = 0; k < nk/*_PB_NK*/
#line 91
                       ; ++k)
	  {
C[i][j] += alpha * A[i][k] * B[k][j];
_RV_lbl_100901833916088:
if(_RV_ret_flag) goto _RV_lbl_100901833916192;
if(_RV_bc_flag_100901833916088 == 1) {
_RV_bc_flag_100901833916088 = 0;
break;
}
if(_RV_bc_flag_100901833916088 == 2) _RV_bc_flag_100901833916088 = 0;
}

      
_RV_lbl_100901833916192:
if(_RV_ret_flag) goto _RV_lbl_100901833916224;
if(_RV_bc_flag_100901833916192 == 1) {
_RV_bc_flag_100901833916192 = 0;
break;
}
if(_RV_bc_flag_100901833916192 == 2) _RV_bc_flag_100901833916192 = 0;
}
_RV_lbl_100901833916224:
if(_RV_ret_flag) goto _RV_lbl_100901833916336;
if(_RV_bc_flag_100901833916224 == 1) {
_RV_bc_flag_100901833916224 = 0;
break;
}
if(_RV_bc_flag_100901833916224 == 2) _RV_bc_flag_100901833916224 = 0;
}

/*#pragma endscop*/


_RV_lbl_100901833916336:
__RV_pmd_set_null(&_RV_pmd_C_100901833911584);
__RV_pmd_set_null(&_RV_pmd_A_100901833912032);
__RV_pmd_set_null(&_RV_pmd_B_100901833912480);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_gemm(__RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, int p1, int p2, int p3, double p4, double p5, double (*p6)[p2], double (*p7)[p3], double (*p8)[p2])
{
  __RV_fmd_tbl_create((__RV_func_addr)kernel_gemm, 3);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemm, 0, p6_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemm, 1, p7_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemm, 2, p8_pmd);
  kernel_gemm(p1, p2, p3, p4, p5, p6, p7, p8);
  __RV_fmd_tbl_remove((__RV_func_addr)kernel_gemm);
  __RV_pmd_free_null_ptr(p6_pmd);
  __RV_pmd_free_null_ptr(p7_pmd);
  __RV_pmd_free_null_ptr(p8_pmd);
}

/* PolyBench instrumentation placeholders */
void polybench_start_instruments() {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;

_RV_lbl_100901833916600:
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}
void polybench_stop_instruments() {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;

_RV_lbl_100901833916808:
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}
void polybench_print_instruments() {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;

_RV_lbl_100901833917016:
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}
void _RV_polybench_prevent_dce(__RV_pmd *p1_pmd, void *p1);

void polybench_prevent_dce(void* ptr) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
__RV_pmd _RV_pmd_ptr_100901833917056 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_ptr_100901833917056, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)polybench_prevent_dce, 0))
  );

_RV_lbl_100901833917368:
__RV_pmd_set_null(&_RV_pmd_ptr_100901833917056);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

void _RV_polybench_prevent_dce(__RV_pmd *p1_pmd, void *p1)
{
  __RV_fmd_tbl_create((__RV_func_addr)polybench_prevent_dce, 1);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)polybench_prevent_dce, 0, p1_pmd);
  polybench_prevent_dce(p1);
  __RV_fmd_tbl_remove((__RV_func_addr)polybench_prevent_dce);
  __RV_pmd_free_null_ptr(p1_pmd);
}


int _RV_main(int argc, char** argv)
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_100901833917536 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_100901833919136 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_100901833924560 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_100901833925792 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_100901833917536, argv)
  );

  /* Retrieve problem size. */
  int ni = 1024/*NI*/
#line 108
             ;
  int nj = 1024/*NJ*/
#line 109
             ;
  int nk = 1024/*NK*/
#line 110
             ;

  /* Variable declaration/allocation. */
  double/*DATA_TYPE*/
#line 113
            alpha;
  double/*DATA_TYPE*/
#line 114
            beta;
  
  /* POLYBENCH_2D_ARRAY_DECL replacement */
  /* DATA_TYPE POLYBENCH_2D(C,NI,NJ,ni,nj); */
  double/*DATA_TYPE*/
#line 118
            (*C)[nj] = (double/*DATA_TYPE*/
#line 118
                                  (*)[nj])malloc(ni * nj * sizeof(double/*DATA_TYPE*/
#line 118
                                                                           ));
  
  /* DATA_TYPE POLYBENCH_2D(A,NI,NK,ni,nk); */
  double/*DATA_TYPE*/
#line 121
            (*A)[nk] = (double/*DATA_TYPE*/
#line 121
                                  (*)[nk])malloc(ni * nk * sizeof(double/*DATA_TYPE*/
#line 121
                                                                           ));

  /* DATA_TYPE POLYBENCH_2D(B,NK,NJ,nk,nj); */
  double/*DATA_TYPE*/
#line 124
            (*B)[nj] = (double/*DATA_TYPE*/
#line 124
                                  (*)[nj])malloc(nk * nj * sizeof(double/*DATA_TYPE*/
#line 124
                                                                           ));


  /* Initialize array(s). */
  _RV_init_array (__RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&alpha), &alpha+1), __RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&beta), &beta+1), &_RV_pmd_C_100901833919136, &_RV_pmd_A_100901833924560, &_RV_pmd_B_100901833925792, ni, nj, nk, &alpha, &beta,
	      (double/*DATA_TYPE*/
#line 129
                  (*)[nj])C,
	      (double/*DATA_TYPE*/
#line 130
                  (*)[nk])A,
	      (double/*DATA_TYPE*/
#line 131
                  (*)[nj])B);

  /* Start timer. */
  polybench_start_instruments();

  /* Run kernel. */
  _RV_kernel_gemm (&_RV_pmd_C_100901833919136, &_RV_pmd_A_100901833924560, &_RV_pmd_B_100901833925792, ni, nj, nk,
	       alpha, beta,
	       (double/*DATA_TYPE*/
#line 139
                   (*)[nj])C,
	       (double/*DATA_TYPE*/
#line 140
                   (*)[nk])A,
	       (double/*DATA_TYPE*/
#line 141
                   (*)[nj])B);

  /* Stop and print timer. */
  polybench_stop_instruments();
  polybench_print_instruments();

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  /* polybench_prevent_dce(print_array(ni, nj,  (DATA_TYPE (*)[nj])C)); */
  _RV_print_array(&_RV_pmd_C_100901833919136, ni, nj, (double/*DATA_TYPE*/
#line 150
                                 (*)[nj])C);

  /* Be clean. */
  free(C);
  free(A);
  free(B);

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_100901833934328;
  }

_RV_lbl_100901833934328:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_100901833917536, argv);
__RV_pmd_set_null(&_RV_pmd_C_100901833919136);
__RV_pmd_set_null(&_RV_pmd_A_100901833924560);
__RV_pmd_set_null(&_RV_pmd_B_100901833925792);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return _RV_ret_val;
}

int main(int argc, char **argv)
{
  int ret_val;
  __RV_global_init_code();
  ret_val = _RV_main(argc, argv);
  __RV_print_error_count();
  return ret_val;
}

