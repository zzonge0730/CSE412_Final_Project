#include "_RV_memsafe.c"
#line 1 "/workspace/examples/llvm17/2mm-base.c"
/**
 * 2mm.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include <polybench.h>

/* Include benchmark-specific header. */
/* Default data type is double, default size is 4000. */
#include "2mm.h"


/* Array initialization. */
static void _RV_init_array(__RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, int p1, int p2, int p3, int p4, double *p5, double *p6, double p7[1024][1024], double p8[1024][1024], double p9[1024][1024], double p10[1024][1024]);

static
void init_array(int ni, int nj, int nk, int nl,
		double/*DATA_TYPE*/
#line 24
            *alpha,
		double/*DATA_TYPE*/
#line 25
            *beta,
		double/*DATA_TYPE*/
#line 26
            A [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 26
                        /*(A,NI,NK,ni,nl)*/
#line 26
                                       ,
		double/*DATA_TYPE*/
#line 27
            B [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 27
                        /*(B,NK,NJ,nk,nj)*/
#line 27
                                       ,
		double/*DATA_TYPE*/
#line 28
            C [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 28
                        /*(C,NL,NJ,nl,nj)*/
#line 28
                                       ,
		double/*DATA_TYPE*/
#line 29
            D [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 29
                        /*(D,NI,NL,ni,nl)*/
#line 29
                                       )
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_110944033334536 = 0;
unsigned char _RV_bc_flag_110944033334504 = 0;
unsigned char _RV_bc_flag_110944033336000 = 0;
unsigned char _RV_bc_flag_110944033335968 = 0;
unsigned char _RV_bc_flag_110944033337464 = 0;
unsigned char _RV_bc_flag_110944033337432 = 0;
unsigned char _RV_bc_flag_110944033338928 = 0;
unsigned char _RV_bc_flag_110944033338896 = 0;
__RV_pmd _RV_pmd_alpha_110944033286080 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_beta_110944033286208 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_110944033286848 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_110944033287264 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_110944033287680 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_110944033288096 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_alpha_110944033286080, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_beta_110944033286208, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_110944033286848, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_110944033287264, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_110944033287680, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 4)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_110944033288096, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 5))
  );

  int i, j;

  *alpha = 32412;
  *beta = 2123;
  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nk; j++)
      {
A[i][j] = ((double/*DATA_TYPE*/
#line 37
                           ) i*j) / ni;
_RV_lbl_110944033334504:
if(_RV_ret_flag) goto _RV_lbl_110944033334536;
if(_RV_bc_flag_110944033334504 == 1) {
_RV_bc_flag_110944033334504 = 0;
break;
}
if(_RV_bc_flag_110944033334504 == 2) _RV_bc_flag_110944033334504 = 0;
}

_RV_lbl_110944033334536:
if(_RV_ret_flag) goto _RV_lbl_110944033339040;
if(_RV_bc_flag_110944033334536 == 1) {
_RV_bc_flag_110944033334536 = 0;
break;
}
if(_RV_bc_flag_110944033334536 == 2) _RV_bc_flag_110944033334536 = 0;
}

  for (i = 0; i < nk; i++)
    {
for (j = 0; j < nj; j++)
      {
B[i][j] = ((double/*DATA_TYPE*/
#line 40
                           ) i*(j+1)) / nj;
_RV_lbl_110944033335968:
if(_RV_ret_flag) goto _RV_lbl_110944033336000;
if(_RV_bc_flag_110944033335968 == 1) {
_RV_bc_flag_110944033335968 = 0;
break;
}
if(_RV_bc_flag_110944033335968 == 2) _RV_bc_flag_110944033335968 = 0;
}

_RV_lbl_110944033336000:
if(_RV_ret_flag) goto _RV_lbl_110944033339040;
if(_RV_bc_flag_110944033336000 == 1) {
_RV_bc_flag_110944033336000 = 0;
break;
}
if(_RV_bc_flag_110944033336000 == 2) _RV_bc_flag_110944033336000 = 0;
}

  for (i = 0; i < nl; i++)
    {
for (j = 0; j < nj; j++)
      {
C[i][j] = ((double/*DATA_TYPE*/
#line 43
                           ) i*(j+3)) / nl;
_RV_lbl_110944033337432:
if(_RV_ret_flag) goto _RV_lbl_110944033337464;
if(_RV_bc_flag_110944033337432 == 1) {
_RV_bc_flag_110944033337432 = 0;
break;
}
if(_RV_bc_flag_110944033337432 == 2) _RV_bc_flag_110944033337432 = 0;
}

_RV_lbl_110944033337464:
if(_RV_ret_flag) goto _RV_lbl_110944033339040;
if(_RV_bc_flag_110944033337464 == 1) {
_RV_bc_flag_110944033337464 = 0;
break;
}
if(_RV_bc_flag_110944033337464 == 2) _RV_bc_flag_110944033337464 = 0;
}

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++)
      {
D[i][j] = ((double/*DATA_TYPE*/
#line 46
                           ) i*(j+2)) / nk;
_RV_lbl_110944033338896:
if(_RV_ret_flag) goto _RV_lbl_110944033338928;
if(_RV_bc_flag_110944033338896 == 1) {
_RV_bc_flag_110944033338896 = 0;
break;
}
if(_RV_bc_flag_110944033338896 == 2) _RV_bc_flag_110944033338896 = 0;
}

_RV_lbl_110944033338928:
if(_RV_ret_flag) goto _RV_lbl_110944033339040;
if(_RV_bc_flag_110944033338928 == 1) {
_RV_bc_flag_110944033338928 = 0;
break;
}
if(_RV_bc_flag_110944033338928 == 2) _RV_bc_flag_110944033338928 = 0;
}


_RV_lbl_110944033339040:
__RV_pmd_set_null(&_RV_pmd_alpha_110944033286080);
__RV_pmd_set_null(&_RV_pmd_beta_110944033286208);
__RV_pmd_set_null(&_RV_pmd_A_110944033286848);
__RV_pmd_set_null(&_RV_pmd_B_110944033287264);
__RV_pmd_set_null(&_RV_pmd_C_110944033287680);
__RV_pmd_set_null(&_RV_pmd_D_110944033288096);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, int p1, int p2, int p3, int p4, double *p5, double *p6, double p7[1024][1024], double p8[1024][1024], double p9[1024][1024], double p10[1024][1024])
{
  __RV_fmd_tbl_create((__RV_func_addr)init_array, 6);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 0, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 1, p6_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 2, p7_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 3, p8_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 4, p9_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 5, p10_pmd);
  init_array(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10);
  __RV_fmd_tbl_remove((__RV_func_addr)init_array);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
  __RV_pmd_free_null_ptr(p7_pmd);
  __RV_pmd_free_null_ptr(p8_pmd);
  __RV_pmd_free_null_ptr(p9_pmd);
  __RV_pmd_free_null_ptr(p10_pmd);
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double p3[1024][1024]);

static
void print_array(int ni, int nl,
		 double/*DATA_TYPE*/
#line 54
             D [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 54
                         /*(D,NI,NL,ni,nl)*/
#line 54
                                        )
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_110944033342856 = 0;
unsigned char _RV_bc_flag_110944033342824 = 0;
__RV_pmd _RV_pmd_D_110944033339680 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_110944033339680, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  int i, j;

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++) {
	fprintf (stderr/*stderr*/
#line 60
                , "%0.2lf "/*DATA_PRINTF_MODIFIER*/
#line 60
                                      , D[i][j]);
	if ((i * ni + j) % 20 == 0) {
fprintf (stderr/*stderr*/
#line 61
                                            , "\n");
_RV_lbl_110944033342672:
if(_RV_ret_flag) goto _RV_lbl_110944033342824;
if(_RV_bc_flag_110944033342824 == 1 || _RV_bc_flag_110944033342824 == 2) goto _RV_lbl_110944033342824;
}

    
_RV_lbl_110944033342824:
if(_RV_ret_flag) goto _RV_lbl_110944033342856;
if(_RV_bc_flag_110944033342824 == 1) {
_RV_bc_flag_110944033342824 = 0;
break;
}
if(_RV_bc_flag_110944033342824 == 2) _RV_bc_flag_110944033342824 = 0;
}
_RV_lbl_110944033342856:
if(_RV_ret_flag) goto _RV_lbl_110944033343256;
if(_RV_bc_flag_110944033342856 == 1) {
_RV_bc_flag_110944033342856 = 0;
break;
}
if(_RV_bc_flag_110944033342856 == 2) _RV_bc_flag_110944033342856 = 0;
}

  fprintf (stderr/*stderr*/
#line 63
                 , "\n");

_RV_lbl_110944033343256:
__RV_pmd_set_null(&_RV_pmd_D_110944033339680);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double p3[1024][1024])
{
  __RV_fmd_tbl_create((__RV_func_addr)print_array, 1);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)print_array, 0, p3_pmd);
  print_array(p1, p2, p3);
  __RV_fmd_tbl_remove((__RV_func_addr)print_array);
  __RV_pmd_free_null_ptr(p3_pmd);
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static void _RV_kernel_2mm(__RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, int p1, int p2, int p3, int p4, double p5, double p6, double p7[1024][1024], double p8[1024][1024], double p9[1024][1024], double p10[1024][1024], double p11[1024][1024]);

static
void kernel_2mm(int ni, int nj, int nk, int nl,
		double/*DATA_TYPE*/
#line 71
            alpha,
		double/*DATA_TYPE*/
#line 72
            beta,
		double/*DATA_TYPE*/
#line 73
            tmp [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 73
                        /*(tmp,NI,NJ,ni,nj)*/
#line 73
                                         ,
		double/*DATA_TYPE*/
#line 74
            A [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 74
                        /*(A,NI,NK,ni,nk)*/
#line 74
                                       ,
		double/*DATA_TYPE*/
#line 75
            B [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 75
                        /*(B,NK,NJ,nk,nj)*/
#line 75
                                       ,
		double/*DATA_TYPE*/
#line 76
            C [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 76
                        /*(C,NL,NJ,nl,nj)*/
#line 76
                                       ,
		double/*DATA_TYPE*/
#line 77
            D [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 77
                        /*(D,NI,NL,ni,nl)*/
#line 77
                                       )
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_110944033349512 = 0;
unsigned char _RV_bc_flag_110944033349480 = 0;
unsigned char _RV_bc_flag_110944033349376 = 0;
unsigned char _RV_bc_flag_110944033356280 = 0;
unsigned char _RV_bc_flag_110944033356248 = 0;
unsigned char _RV_bc_flag_110944033356144 = 0;
__RV_pmd _RV_pmd_tmp_110944033344376 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_110944033344792 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_110944033345208 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_110944033345624 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_110944033346040 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_tmp_110944033344376, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_110944033344792, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_110944033345208, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_110944033345624, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_110944033346040, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 4))
  );

  int i, j, k;

/*#pragma scop*/
  /* D := alpha*A*B*C + beta*D */
  for (i = 0; i < ni/*_PB_NI*/
#line 83
                        ; i++)
    {
for (j = 0; j < nj/*_PB_NJ*/
#line 84
                          ; j++)
      {
	tmp[i][j] = 0;
	for (k = 0; k < nk/*_PB_NK*/
#line 87
                       ; ++k)
	  {
tmp[i][j] += alpha * A[i][k] * B[k][j];
_RV_lbl_110944033349376:
if(_RV_ret_flag) goto _RV_lbl_110944033349480;
if(_RV_bc_flag_110944033349376 == 1) {
_RV_bc_flag_110944033349376 = 0;
break;
}
if(_RV_bc_flag_110944033349376 == 2) _RV_bc_flag_110944033349376 = 0;
}

      
_RV_lbl_110944033349480:
if(_RV_ret_flag) goto _RV_lbl_110944033349512;
if(_RV_bc_flag_110944033349480 == 1) {
_RV_bc_flag_110944033349480 = 0;
break;
}
if(_RV_bc_flag_110944033349480 == 2) _RV_bc_flag_110944033349480 = 0;
}
_RV_lbl_110944033349512:
if(_RV_ret_flag) goto _RV_lbl_110944033356392;
if(_RV_bc_flag_110944033349512 == 1) {
_RV_bc_flag_110944033349512 = 0;
break;
}
if(_RV_bc_flag_110944033349512 == 2) _RV_bc_flag_110944033349512 = 0;
}

  for (i = 0; i < ni/*_PB_NI*/
#line 90
                        ; i++)
    {
for (j = 0; j < nl/*_PB_NL*/
#line 91
                          ; j++)
      {
	D[i][j] *= beta;
	for (k = 0; k < nj/*_PB_NJ*/
#line 94
                       ; ++k)
	  {
D[i][j] += tmp[i][k] * C[k][j];
_RV_lbl_110944033356144:
if(_RV_ret_flag) goto _RV_lbl_110944033356248;
if(_RV_bc_flag_110944033356144 == 1) {
_RV_bc_flag_110944033356144 = 0;
break;
}
if(_RV_bc_flag_110944033356144 == 2) _RV_bc_flag_110944033356144 = 0;
}

      
_RV_lbl_110944033356248:
if(_RV_ret_flag) goto _RV_lbl_110944033356280;
if(_RV_bc_flag_110944033356248 == 1) {
_RV_bc_flag_110944033356248 = 0;
break;
}
if(_RV_bc_flag_110944033356248 == 2) _RV_bc_flag_110944033356248 = 0;
}
_RV_lbl_110944033356280:
if(_RV_ret_flag) goto _RV_lbl_110944033356392;
if(_RV_bc_flag_110944033356280 == 1) {
_RV_bc_flag_110944033356280 = 0;
break;
}
if(_RV_bc_flag_110944033356280 == 2) _RV_bc_flag_110944033356280 = 0;
}

/*#pragma endscop*/


_RV_lbl_110944033356392:
__RV_pmd_set_null(&_RV_pmd_tmp_110944033344376);
__RV_pmd_set_null(&_RV_pmd_A_110944033344792);
__RV_pmd_set_null(&_RV_pmd_B_110944033345208);
__RV_pmd_set_null(&_RV_pmd_C_110944033345624);
__RV_pmd_set_null(&_RV_pmd_D_110944033346040);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_2mm(__RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, int p1, int p2, int p3, int p4, double p5, double p6, double p7[1024][1024], double p8[1024][1024], double p9[1024][1024], double p10[1024][1024], double p11[1024][1024])
{
  __RV_fmd_tbl_create((__RV_func_addr)kernel_2mm, 5);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_2mm, 0, p7_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_2mm, 1, p8_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_2mm, 2, p9_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_2mm, 3, p10_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_2mm, 4, p11_pmd);
  kernel_2mm(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11);
  __RV_fmd_tbl_remove((__RV_func_addr)kernel_2mm);
  __RV_pmd_free_null_ptr(p7_pmd);
  __RV_pmd_free_null_ptr(p8_pmd);
  __RV_pmd_free_null_ptr(p9_pmd);
  __RV_pmd_free_null_ptr(p10_pmd);
  __RV_pmd_free_null_ptr(p11_pmd);
}


int _RV_main(int argc, char** argv)
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_110944033356584 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_tmp_110944033358480 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_110944033359920 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_110944033361312 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_110944033362720 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_110944033364112 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_110944033356584, argv)
  );

  /* Retrieve problem size. */
  int ni = 1024/*NI*/
#line 105
             ;
  int nj = 1024/*NJ*/
#line 106
             ;
  int nk = 1024/*NK*/
#line 107
             ;
  int nl = 1024/*NL*/
#line 108
             ;

  /* Variable declaration/allocation. */
  double/*DATA_TYPE*/
#line 111
            alpha;
  double/*DATA_TYPE*/
#line 112
            beta;
  double ( * tmp ) [ 1024 + 0 ] [ 1024 + 0 ] ; tmp = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) polybench_alloc_data ( ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 113
                         /*(tmp,DATA_TYPE,NI,NJ,ni,nj)*/
#line 113
                                                    ;
  double ( * A ) [ 1024 + 0 ] [ 1024 + 0 ] ; A = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) polybench_alloc_data ( ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 114
                         /*(A,DATA_TYPE,NI,NK,ni,nk)*/
#line 114
                                                  ;
  double ( * B ) [ 1024 + 0 ] [ 1024 + 0 ] ; B = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) polybench_alloc_data ( ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 115
                         /*(B,DATA_TYPE,NK,NJ,nk,nj)*/
#line 115
                                                  ;
  double ( * C ) [ 1024 + 0 ] [ 1024 + 0 ] ; C = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) polybench_alloc_data ( ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 116
                         /*(C,DATA_TYPE,NL,NJ,nl,nj)*/
#line 116
                                                  ;
  double ( * D ) [ 1024 + 0 ] [ 1024 + 0 ] ; D = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) polybench_alloc_data ( ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 117
                         /*(D,DATA_TYPE,NI,NL,ni,nl)*/
#line 117
                                                  ;

  /* Initialize array(s). */
  _RV_init_array (__RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&alpha), &alpha+1), __RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&beta), &beta+1), &_RV_pmd_A_110944033359920, &_RV_pmd_B_110944033361312, &_RV_pmd_C_110944033362720, &_RV_pmd_D_110944033364112, ni, nj, nk, nl, &alpha, &beta,
	      * A/*POLYBENCH_ARRAY*/
#line 121
                      /*(A)*/
#line 121
                         ,
	      * B/*POLYBENCH_ARRAY*/
#line 122
                      /*(B)*/
#line 122
                         ,
	      * C/*POLYBENCH_ARRAY*/
#line 123
                      /*(C)*/
#line 123
                         ,
	      * D/*POLYBENCH_ARRAY*/
#line 124
                      /*(D)*/
#line 124
                         );

  /* Start timer. */
  /*polybench_start_instruments*/
#line 127
                             ;

  /* Run kernel. */
  _RV_kernel_2mm (&_RV_pmd_tmp_110944033358480, &_RV_pmd_A_110944033359920, &_RV_pmd_B_110944033361312, &_RV_pmd_C_110944033362720, &_RV_pmd_D_110944033364112, ni, nj, nk, nl,
	      alpha, beta,
	      * tmp/*POLYBENCH_ARRAY*/
#line 132
                      /*(tmp)*/
#line 132
                           ,
	      * A/*POLYBENCH_ARRAY*/
#line 133
                      /*(A)*/
#line 133
                         ,
	      * B/*POLYBENCH_ARRAY*/
#line 134
                      /*(B)*/
#line 134
                         ,
	      * C/*POLYBENCH_ARRAY*/
#line 135
                      /*(C)*/
#line 135
                         ,
	      * D/*POLYBENCH_ARRAY*/
#line 136
                      /*(D)*/
#line 136
                         );

  /* Stop and print timer. */
  /*polybench_stop_instruments*/
#line 139
                            ;
  /*polybench_print_instruments*/
#line 140
                             ;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if ( argc > 42 && ! strcmp ( argv [ 0 ] , "" ) ) {
_RV_print_array ( &_RV_pmd_D_110944033364112, ni , nl , * D )/*polybench_prevent_dce*/
#line 144
                       /*(print_array(ni, nl,  POLYBENCH_ARRAY(D)))*/
#line 144
                                                                 ;
_RV_lbl_110944033368256:
if(_RV_ret_flag) goto _RV_lbl_110944033369632;
}


  /* Be clean. */
  free ( ( void * ) tmp ) ;/*POLYBENCH_FREE_ARRAY*/
#line 147
                      /*(tmp)*/
#line 147
                           ;
  free ( ( void * ) A ) ;/*POLYBENCH_FREE_ARRAY*/
#line 148
                      /*(A)*/
#line 148
                         ;
  free ( ( void * ) B ) ;/*POLYBENCH_FREE_ARRAY*/
#line 149
                      /*(B)*/
#line 149
                         ;
  free ( ( void * ) C ) ;/*POLYBENCH_FREE_ARRAY*/
#line 150
                      /*(C)*/
#line 150
                         ;
  free ( ( void * ) D ) ;/*POLYBENCH_FREE_ARRAY*/
#line 151
                      /*(D)*/
#line 151
                         ;

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_110944033369632;
  }

_RV_lbl_110944033369632:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_110944033356584, argv);
__RV_pmd_set_null(&_RV_pmd_tmp_110944033358480);
__RV_pmd_set_null(&_RV_pmd_A_110944033359920);
__RV_pmd_set_null(&_RV_pmd_B_110944033361312);
__RV_pmd_set_null(&_RV_pmd_C_110944033362720);
__RV_pmd_set_null(&_RV_pmd_D_110944033364112);
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

