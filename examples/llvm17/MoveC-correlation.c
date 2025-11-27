#include "_RV_memsafe.c"
#line 1 "/workspace/examples/llvm17/correlation-base.c"
/**
 * correlation.c: This file is part of the PolyBench/C 3.2 test suite.
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
#include "correlation.h"


/* Array initialization. */
static void _RV_init_array(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, int p1, int p2, double *p3, double p4[1000][1000]);

static
void init_array (int m,
		 int n,
		 double/*DATA_TYPE*/
#line 25
             *float_n,
		 double/*DATA_TYPE*/
#line 26
             data [ 1000 + 0 ] [ 1000 + 0 ]/*POLYBENCH_2D*/
#line 26
                         /*(data,M,N,m,n)*/
#line 26
                                       )
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_98488324205592 = 0;
unsigned char _RV_bc_flag_98488324205560 = 0;
__RV_pmd _RV_pmd_float_n_98488324202752 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_data_98488324203392 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_float_n_98488324202752, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_data_98488324203392, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1))
  );

  int i, j;

  *(double *)__RV_check_dpv(&_RV_pmd_float_n_98488324202752, float_n, sizeof(double), "correlation-base.c", "init_array", 30, 4, "float_n") = 1.2;

  for (i = 0; i < m; i++)
    {
for (j = 0; j < n; j++)
      {
data[__RV_check_dpv_ss(&_RV_pmd_data_98488324203392, data, i, sizeof(double [1000]), "correlation-base.c", "init_array", 34, 12, "data[i]")][__RV_check_dpv_ss(&_RV_pmd_data_98488324203392, data[i], j, sizeof(double), "correlation-base.c", "init_array", 34, 15, "data[i][j]")] = ((double/*DATA_TYPE*/
#line 34
                              ) i*j) / 1000/*M*/
#line 34
                                        ;
_RV_lbl_98488324205560:
if(_RV_ret_flag) goto _RV_lbl_98488324205592;
if(_RV_bc_flag_98488324205560 == 1) {
_RV_bc_flag_98488324205560 = 0;
break;
}
if(_RV_bc_flag_98488324205560 == 2) _RV_bc_flag_98488324205560 = 0;
}

_RV_lbl_98488324205592:
if(_RV_ret_flag) goto _RV_lbl_98488324205704;
if(_RV_bc_flag_98488324205592 == 1) {
_RV_bc_flag_98488324205592 = 0;
break;
}
if(_RV_bc_flag_98488324205592 == 2) _RV_bc_flag_98488324205592 = 0;
}


_RV_lbl_98488324205704:
__RV_pmd_set_null(&_RV_pmd_float_n_98488324202752);
__RV_pmd_set_null(&_RV_pmd_data_98488324203392);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, int p1, int p2, double *p3, double p4[1000][1000])
{
  __RV_fmd_tbl_create((__RV_func_addr)init_array, 2);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 0, p3_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 1, p4_pmd);
  init_array(p1, p2, p3, p4);
  __RV_fmd_tbl_remove((__RV_func_addr)init_array);
  __RV_pmd_free_null_ptr(p3_pmd);
  __RV_pmd_free_null_ptr(p4_pmd);
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static void _RV_print_array(__RV_pmd *p2_pmd, int p1, double p2[1000][1000]);

static int _RV_fprintf_98488324251616(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
{
int ret;
const char *p = fmt;
unsigned char is_string[3] = {0};
unsigned char fmt_cnt = 0, i = 2;
while(p && *p != '\0')
{
  if(*p == '%' && *(p+1) == '%')
  {
    p = p + 2;
  }
  else if(*p == '%' && *(p+1) == '*' && *(p+2) == 'd')
  {
    p = p + 3; fmt_cnt+=2;
  }
  else if(*p == '%')
  {
    do {
      p++;
      if('0' <= *p && *p <= '9') continue;
      if(*p == '.' || *p == '*') continue;
      if(*p == 's')
        { is_string[i++] = 1; break; }
      else if(*p == '[')
        { is_string[i++] = 1; break; }
      else
        { is_string[i++] = 0; break; }
    } while(1);
    p++; fmt_cnt++;
  }
  else
  {
    p++;
  }
}
if(fmt_cnt > 1)
{
  fprintf(stderr, "correlation-base.c: In function 'fprintf':\n");
  fprintf(stderr, "correlation-base.c:49:24: error: the format string \"%%0.2lf \" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "correlation-base.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "correlation-base.c", "fprintf", 49, 24, "\"%0.2lf \"");
ret = fprintf(stream, "%0.2lf ", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_98488324252704(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
{
int ret;
const char *p = fmt;
unsigned char is_string[2] = {0};
unsigned char fmt_cnt = 0, i = 2;
while(p && *p != '\0')
{
  if(*p == '%' && *(p+1) == '%')
  {
    p = p + 2;
  }
  else if(*p == '%' && *(p+1) == '*' && *(p+2) == 'd')
  {
    p = p + 3; fmt_cnt+=2;
  }
  else if(*p == '%')
  {
    do {
      p++;
      if('0' <= *p && *p <= '9') continue;
      if(*p == '.' || *p == '*') continue;
      if(*p == 's')
        { is_string[i++] = 1; break; }
      else if(*p == '[')
        { is_string[i++] = 1; break; }
      else
        { is_string[i++] = 0; break; }
    } while(1);
    p++; fmt_cnt++;
  }
  else
  {
    p++;
  }
}
if(fmt_cnt > 0)
{
  fprintf(stderr, "correlation-base.c: In function 'fprintf':\n");
  fprintf(stderr, "correlation-base.c:50:51: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "correlation-base.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "correlation-base.c", "fprintf", 50, 51, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_98488324253168(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
{
int ret;
const char *p = fmt;
unsigned char is_string[2] = {0};
unsigned char fmt_cnt = 0, i = 2;
while(p && *p != '\0')
{
  if(*p == '%' && *(p+1) == '%')
  {
    p = p + 2;
  }
  else if(*p == '%' && *(p+1) == '*' && *(p+2) == 'd')
  {
    p = p + 3; fmt_cnt+=2;
  }
  else if(*p == '%')
  {
    do {
      p++;
      if('0' <= *p && *p <= '9') continue;
      if(*p == '.' || *p == '*') continue;
      if(*p == 's')
        { is_string[i++] = 1; break; }
      else if(*p == '[')
        { is_string[i++] = 1; break; }
      else
        { is_string[i++] = 0; break; }
    } while(1);
    p++; fmt_cnt++;
  }
  else
  {
    p++;
  }
}
if(fmt_cnt > 0)
{
  fprintf(stderr, "correlation-base.c: In function 'fprintf':\n");
  fprintf(stderr, "correlation-base.c:52:20: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "correlation-base.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "correlation-base.c", "fprintf", 52, 20, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static
void print_array(int m,
		 double/*DATA_TYPE*/
#line 42
             symmat [ 1000 + 0 ] [ 1000 + 0 ]/*POLYBENCH_2D*/
#line 42
                         /*(symmat,M,M,m,m)*/
#line 42
                                         )

{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_98488324252888 = 0;
unsigned char _RV_bc_flag_98488324252856 = 0;
__RV_pmd _RV_pmd_symmat_98488324206184 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_symmat_98488324206184, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  int i, j;

  for (i = 0; i < m; i++)
    {
for (j = 0; j < m; j++) {
      _RV_fprintf_98488324251616 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.2lf "), "%0.2lf "+8), stderr/*stderr*/
#line 49
                     , "%0.2lf "/*DATA_PRINTF_MODIFIER*/
#line 49
                                           , symmat[__RV_check_dpv_ss(&_RV_pmd_symmat_98488324206184, symmat, i, sizeof(double [1000]), "correlation-base.c", "print_array", 49, 53, "symmat[i]")][__RV_check_dpv_ss(&_RV_pmd_symmat_98488324206184, symmat[i], j, sizeof(double), "correlation-base.c", "print_array", 49, 56, "symmat[i][j]")]);
      if ((i * m + j) % 20 == 0) {
_RV_fprintf_98488324252704 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 50
                                                , "\n");
_RV_lbl_98488324252704:
if(_RV_ret_flag) goto _RV_lbl_98488324252856;
if(_RV_bc_flag_98488324252856 == 1 || _RV_bc_flag_98488324252856 == 2) goto _RV_lbl_98488324252856;
}

    
_RV_lbl_98488324252856:
if(_RV_ret_flag) goto _RV_lbl_98488324252888;
if(_RV_bc_flag_98488324252856 == 1) {
_RV_bc_flag_98488324252856 = 0;
break;
}
if(_RV_bc_flag_98488324252856 == 2) _RV_bc_flag_98488324252856 = 0;
}
_RV_lbl_98488324252888:
if(_RV_ret_flag) goto _RV_lbl_98488324253288;
if(_RV_bc_flag_98488324252888 == 1) {
_RV_bc_flag_98488324252888 = 0;
break;
}
if(_RV_bc_flag_98488324252888 == 2) _RV_bc_flag_98488324252888 = 0;
}

  _RV_fprintf_98488324253168 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 52
                 , "\n");

_RV_lbl_98488324253288:
__RV_pmd_set_null(&_RV_pmd_symmat_98488324206184);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_print_array(__RV_pmd *p2_pmd, int p1, double p2[1000][1000])
{
  __RV_fmd_tbl_create((__RV_func_addr)print_array, 1);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)print_array, 0, p2_pmd);
  print_array(p1, p2);
  __RV_fmd_tbl_remove((__RV_func_addr)print_array);
  __RV_pmd_free_null_ptr(p2_pmd);
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static void _RV_kernel_correlation(__RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, int p1, int p2, double p3, double p4[1000][1000], double p5[1000][1000], double p6[1000], double p7[1000]);

static
void kernel_correlation(int m, int n,
			double/*DATA_TYPE*/
#line 60
             float_n,
			double/*DATA_TYPE*/
#line 61
             data [ 1000 + 0 ] [ 1000 + 0 ]/*POLYBENCH_2D*/
#line 61
                         /*(data,M,N,m,n)*/
#line 61
                                       ,
			double/*DATA_TYPE*/
#line 62
             symmat [ 1000 + 0 ] [ 1000 + 0 ]/*POLYBENCH_2D*/
#line 62
                         /*(symmat,M,M,m,m)*/
#line 62
                                         ,
			double/*DATA_TYPE*/
#line 63
             mean [ 1000 + 0 ]/*POLYBENCH_1D*/
#line 63
                         /*(mean,M,m)*/
#line 63
                                   ,
			double/*DATA_TYPE*/
#line 64
             stddev [ 1000 + 0 ]/*POLYBENCH_1D*/
#line 64
                         /*(stddev,M,m)*/
#line 64
                                     )
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_98488324258008 = 0;
unsigned char _RV_bc_flag_98488324257656 = 0;
unsigned char _RV_bc_flag_98488324264744 = 0;
unsigned char _RV_bc_flag_98488324263232 = 0;
unsigned char _RV_bc_flag_98488324266608 = 0;
unsigned char _RV_bc_flag_98488324266576 = 0;
unsigned char _RV_bc_flag_98488324271384 = 0;
unsigned char _RV_bc_flag_98488324271288 = 0;
unsigned char _RV_bc_flag_98488324269280 = 0;
__RV_pmd _RV_pmd_data_98488324254024 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_symmat_98488324254440 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_mean_98488324254768 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_stddev_98488324255040 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_data_98488324254024, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_correlation, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_symmat_98488324254440, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_correlation, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_mean_98488324254768, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_correlation, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_stddev_98488324255040, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_correlation, 3))
  );

  int i, j, j1, j2;

  double/*DATA_TYPE*/
#line 68
            eps = 0.1f;

/*#define sqrt_of_array_cell(x,j) sqrt(x[j])*/

/*#pragma scop*/
  /* Determine mean of column vectors of input data matrix */
  for (j = 0; j < m/*_PB_M*/
#line 74
                       ; j++)
    {
      mean[__RV_check_dpv_ss(&_RV_pmd_mean_98488324254768, mean, j, sizeof(double), "correlation-base.c", "kernel_correlation", 76, 12, "mean[j]")] = 0.0;
      for (i = 0; i < n/*_PB_N*/
#line 77
                           ; i++)
	{
mean[__RV_check_dpv_ss(&_RV_pmd_mean_98488324254768, mean, j, sizeof(double), "correlation-base.c", "kernel_correlation", 78, 7, "mean[j]")] += data[__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data, i, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 78, 18, "data[i]")][__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data[i], j, sizeof(double), "correlation-base.c", "kernel_correlation", 78, 21, "data[i][j]")];
_RV_lbl_98488324257656:
if(_RV_ret_flag) goto _RV_lbl_98488324258008;
if(_RV_bc_flag_98488324257656 == 1) {
_RV_bc_flag_98488324257656 = 0;
break;
}
if(_RV_bc_flag_98488324257656 == 2) _RV_bc_flag_98488324257656 = 0;
}

      mean[__RV_check_dpv_ss(&_RV_pmd_mean_98488324254768, mean, j, sizeof(double), "correlation-base.c", "kernel_correlation", 79, 12, "mean[j]")] /= float_n;
    
_RV_lbl_98488324258008:
if(_RV_ret_flag) goto _RV_lbl_98488324271920;
if(_RV_bc_flag_98488324258008 == 1) {
_RV_bc_flag_98488324258008 = 0;
break;
}
if(_RV_bc_flag_98488324258008 == 2) _RV_bc_flag_98488324258008 = 0;
}

  /* Determine standard deviations of column vectors of data matrix. */
  for (j = 0; j < m/*_PB_M*/
#line 83
                       ; j++)
    {
      stddev[__RV_check_dpv_ss(&_RV_pmd_stddev_98488324255040, stddev, j, sizeof(double), "correlation-base.c", "kernel_correlation", 85, 14, "stddev[j]")] = 0.0;
      for (i = 0; i < n/*_PB_N*/
#line 86
                           ; i++)
	{
stddev[__RV_check_dpv_ss(&_RV_pmd_stddev_98488324255040, stddev, j, sizeof(double), "correlation-base.c", "kernel_correlation", 87, 9, "stddev[j]")] += (data[__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data, i, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 87, 21, "data[i]")][__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data[i], j, sizeof(double), "correlation-base.c", "kernel_correlation", 87, 24, "data[i][j]")] - mean[__RV_check_dpv_ss(&_RV_pmd_mean_98488324254768, mean, j, sizeof(double), "correlation-base.c", "kernel_correlation", 87, 34, "mean[j]")]) * (data[__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data, i, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 87, 46, "data[i]")][__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data[i], j, sizeof(double), "correlation-base.c", "kernel_correlation", 87, 49, "data[i][j]")] - mean[__RV_check_dpv_ss(&_RV_pmd_mean_98488324254768, mean, j, sizeof(double), "correlation-base.c", "kernel_correlation", 87, 59, "mean[j]")]);
_RV_lbl_98488324263232:
if(_RV_ret_flag) goto _RV_lbl_98488324264744;
if(_RV_bc_flag_98488324263232 == 1) {
_RV_bc_flag_98488324263232 = 0;
break;
}
if(_RV_bc_flag_98488324263232 == 2) _RV_bc_flag_98488324263232 = 0;
}

      stddev[__RV_check_dpv_ss(&_RV_pmd_stddev_98488324255040, stddev, j, sizeof(double), "correlation-base.c", "kernel_correlation", 88, 14, "stddev[j]")] /= float_n;
      stddev[__RV_check_dpv_ss(&_RV_pmd_stddev_98488324255040, stddev, j, sizeof(double), "correlation-base.c", "kernel_correlation", 89, 14, "stddev[j]")] = sqrt ( stddev [ __RV_check_dpv_ss(&_RV_pmd_stddev_98488324255040, stddev, j , sizeof(double), "correlation-base.c", "kernel_correlation", 89, 35, "stddev[j]")] )/*sqrt_of_array_cell*/
#line 89
                                    /*(stddev, j)*/
#line 89
                                               ;
      /* The following in an inelegant but usual way to handle
	 near-zero std. dev. values, which below would cause a zero-
	 divide. */
      stddev[__RV_check_dpv_ss(&_RV_pmd_stddev_98488324255040, stddev, j, sizeof(double), "correlation-base.c", "kernel_correlation", 93, 14, "stddev[j]")] = stddev[__RV_check_dpv_ss(&_RV_pmd_stddev_98488324255040, stddev, j, sizeof(double), "correlation-base.c", "kernel_correlation", 93, 26, "stddev[j]")] <= eps ? 1.0 : stddev[__RV_check_dpv_ss(&_RV_pmd_stddev_98488324255040, stddev, j, sizeof(double), "correlation-base.c", "kernel_correlation", 93, 51, "stddev[j]")];
    
_RV_lbl_98488324264744:
if(_RV_ret_flag) goto _RV_lbl_98488324271920;
if(_RV_bc_flag_98488324264744 == 1) {
_RV_bc_flag_98488324264744 = 0;
break;
}
if(_RV_bc_flag_98488324264744 == 2) _RV_bc_flag_98488324264744 = 0;
}

  /* Center and reduce the column vectors. */
  for (i = 0; i < n/*_PB_N*/
#line 97
                       ; i++)
    {
for (j = 0; j < m/*_PB_M*/
#line 98
                         ; j++)
      {
	data[__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data, i, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 100, 7, "data[i]")][__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data[i], j, sizeof(double), "correlation-base.c", "kernel_correlation", 100, 10, "data[i][j]")] -= mean[__RV_check_dpv_ss(&_RV_pmd_mean_98488324254768, mean, j, sizeof(double), "correlation-base.c", "kernel_correlation", 100, 21, "mean[j]")];
	data[__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data, i, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 101, 7, "data[i]")][__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data[i], j, sizeof(double), "correlation-base.c", "kernel_correlation", 101, 10, "data[i][j]")] /= sqrt(float_n) * stddev[__RV_check_dpv_ss(&_RV_pmd_stddev_98488324255040, stddev, j, sizeof(double), "correlation-base.c", "kernel_correlation", 101, 39, "stddev[j]")];
      
_RV_lbl_98488324266576:
if(_RV_ret_flag) goto _RV_lbl_98488324266608;
if(_RV_bc_flag_98488324266576 == 1) {
_RV_bc_flag_98488324266576 = 0;
break;
}
if(_RV_bc_flag_98488324266576 == 2) _RV_bc_flag_98488324266576 = 0;
}
_RV_lbl_98488324266608:
if(_RV_ret_flag) goto _RV_lbl_98488324271920;
if(_RV_bc_flag_98488324266608 == 1) {
_RV_bc_flag_98488324266608 = 0;
break;
}
if(_RV_bc_flag_98488324266608 == 2) _RV_bc_flag_98488324266608 = 0;
}


  /* Calculate the m * m correlation matrix. */
  for (j1 = 0; j1 < m/*_PB_M*/
#line 105
                         -1; j1++)
    {
      symmat[__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat, j1, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 107, 14, "symmat[j1]")][__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat[j1], j1, sizeof(double), "correlation-base.c", "kernel_correlation", 107, 18, "symmat[j1][j1]")] = 1.0;
      for (j2 = j1+1; j2 < m/*_PB_M*/
#line 108
                                ; j2++)
	{
	  symmat[__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat, j1, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 110, 11, "symmat[j1]")][__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat[j1], j2, sizeof(double), "correlation-base.c", "kernel_correlation", 110, 15, "symmat[j1][j2]")] = 0.0;
	  for (i = 0; i < n/*_PB_N*/
#line 111
                        ; i++)
	    {
symmat[__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat, j1, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 112, 13, "symmat[j1]")][__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat[j1], j2, sizeof(double), "correlation-base.c", "kernel_correlation", 112, 17, "symmat[j1][j2]")] += (data[__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data, i, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 112, 30, "data[i]")][__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data[i], j1, sizeof(double), "correlation-base.c", "kernel_correlation", 112, 33, "data[i][j1]")] * data[__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data, i, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 112, 44, "data[i]")][__RV_check_dpv_ss(&_RV_pmd_data_98488324254024, data[i], j2, sizeof(double), "correlation-base.c", "kernel_correlation", 112, 47, "data[i][j2]")]);
_RV_lbl_98488324269280:
if(_RV_ret_flag) goto _RV_lbl_98488324271288;
if(_RV_bc_flag_98488324269280 == 1) {
_RV_bc_flag_98488324269280 = 0;
break;
}
if(_RV_bc_flag_98488324269280 == 2) _RV_bc_flag_98488324269280 = 0;
}

	  symmat[__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat, j2, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 113, 11, "symmat[j2]")][__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat[j2], j1, sizeof(double), "correlation-base.c", "kernel_correlation", 113, 15, "symmat[j2][j1]")] = symmat[__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat, j1, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 113, 28, "symmat[j1]")][__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat[j1], j2, sizeof(double), "correlation-base.c", "kernel_correlation", 113, 32, "symmat[j1][j2]")];
	
_RV_lbl_98488324271288:
if(_RV_ret_flag) goto _RV_lbl_98488324271384;
if(_RV_bc_flag_98488324271288 == 1) {
_RV_bc_flag_98488324271288 = 0;
break;
}
if(_RV_bc_flag_98488324271288 == 2) _RV_bc_flag_98488324271288 = 0;
}
    
_RV_lbl_98488324271384:
if(_RV_ret_flag) goto _RV_lbl_98488324271920;
if(_RV_bc_flag_98488324271384 == 1) {
_RV_bc_flag_98488324271384 = 0;
break;
}
if(_RV_bc_flag_98488324271384 == 2) _RV_bc_flag_98488324271384 = 0;
}
  symmat[__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat, m/*_PB_M*/
#line 116
              -1, sizeof(double [1000]), "correlation-base.c", "kernel_correlation", 116, 10, "symmat[m - 1]")][__RV_check_dpv_ss(&_RV_pmd_symmat_98488324254440, symmat[m-1], m/*_PB_M*/
#line 116
                       -1, sizeof(double), "correlation-base.c", "kernel_correlation", 116, 19, "symmat[m - 1][m - 1]")] = 1.0;
/*#pragma endscop*/


_RV_lbl_98488324271920:
__RV_pmd_set_null(&_RV_pmd_data_98488324254024);
__RV_pmd_set_null(&_RV_pmd_symmat_98488324254440);
__RV_pmd_set_null(&_RV_pmd_mean_98488324254768);
__RV_pmd_set_null(&_RV_pmd_stddev_98488324255040);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_correlation(__RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, int p1, int p2, double p3, double p4[1000][1000], double p5[1000][1000], double p6[1000], double p7[1000])
{
  __RV_fmd_tbl_create((__RV_func_addr)kernel_correlation, 4);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_correlation, 0, p4_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_correlation, 1, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_correlation, 2, p6_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_correlation, 3, p7_pmd);
  kernel_correlation(p1, p2, p3, p4, p5, p6, p7);
  __RV_fmd_tbl_remove((__RV_func_addr)kernel_correlation);
  __RV_pmd_free_null_ptr(p4_pmd);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
  __RV_pmd_free_null_ptr(p7_pmd);
}


static void *_RV_polybench_alloc_data_98488324274336(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

static void *_RV_polybench_alloc_data_98488324275728(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

static void *_RV_polybench_alloc_data_98488324276784(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

static void *_RV_polybench_alloc_data_98488324277696(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

int _RV_main(int argc, char** argv)
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_98488324272144 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_data_98488324273536 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_symmat_98488324274976 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_mean_98488324276320 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_stddev_98488324277232 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_98488324272144, argv)
  );

  /* Retrieve problem size. */
  int n = 1000/*N*/
#line 125
           ;
  int m = 1000/*M*/
#line 126
           ;

  /* Variable declaration/allocation. */
  double/*DATA_TYPE*/
#line 129
            float_n;
  double ( * data ) [ 1000 + 0 ] [ 1000 + 0 ] ; data = ( double ( * ) [ 1000 + 0 ] [ 1000 + 0 ] ) _RV_polybench_alloc_data_98488324274336 ( &_RV_pmd_data_98488324273536, ( 1000 + 0 ) * ( 1000 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 130
                         /*(data,DATA_TYPE,M,N,m,n)*/
#line 130
                                                 ;
  double ( * symmat ) [ 1000 + 0 ] [ 1000 + 0 ] ; symmat = ( double ( * ) [ 1000 + 0 ] [ 1000 + 0 ] ) _RV_polybench_alloc_data_98488324275728 ( &_RV_pmd_symmat_98488324274976, ( 1000 + 0 ) * ( 1000 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 131
                         /*(symmat,DATA_TYPE,M,M,m,m)*/
#line 131
                                                   ;
  double ( * mean ) [ 1000 + 0 ] ; mean = ( double ( * ) [ 1000 + 0 ] ) _RV_polybench_alloc_data_98488324276784 ( &_RV_pmd_mean_98488324276320, 1000 + 0 , sizeof ( double ) ) ;/*POLYBENCH_1D_ARRAY_DECL*/
#line 132
                         /*(mean,DATA_TYPE,M,m)*/
#line 132
                                             ;
  double ( * stddev ) [ 1000 + 0 ] ; stddev = ( double ( * ) [ 1000 + 0 ] ) _RV_polybench_alloc_data_98488324277696 ( &_RV_pmd_stddev_98488324277232, 1000 + 0 , sizeof ( double ) ) ;/*POLYBENCH_1D_ARRAY_DECL*/
#line 133
                         /*(stddev,DATA_TYPE,M,m)*/
#line 133
                                               ;

  /* Initialize array(s). */
  _RV_init_array (__RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&float_n), &float_n+1), &_RV_pmd_data_98488324273536, m, n, &float_n, * (double (*)[1000][1000])__RV_check_dpv(&_RV_pmd_data_98488324273536, data, sizeof(double [1000][1000]), "correlation-base.c", "main", 136, 33, "data")/*POLYBENCH_ARRAY*/
#line 136
                                             /*(data)*/
#line 136
                                                   );

  /* Start timer. */
  /*polybench_start_instruments*/
#line 139
                             ;

  /* Run kernel. */
  _RV_kernel_correlation (&_RV_pmd_data_98488324273536, &_RV_pmd_symmat_98488324274976, &_RV_pmd_mean_98488324276320, &_RV_pmd_stddev_98488324277232, m, n, float_n,
		      * (double (*)[1000][1000])__RV_check_dpv(&_RV_pmd_data_98488324273536, data, sizeof(double [1000][1000]), "correlation-base.c", "main", 143, 11, "data")/*POLYBENCH_ARRAY*/
#line 143
                       /*(data)*/
#line 143
                             ,
		      * (double (*)[1000][1000])__RV_check_dpv(&_RV_pmd_symmat_98488324274976, symmat, sizeof(double [1000][1000]), "correlation-base.c", "main", 144, 11, "symmat")/*POLYBENCH_ARRAY*/
#line 144
                       /*(symmat)*/
#line 144
                               ,
		      * (double (*)[1000])__RV_check_dpv(&_RV_pmd_mean_98488324276320, mean, sizeof(double [1000]), "correlation-base.c", "main", 145, 11, "mean")/*POLYBENCH_ARRAY*/
#line 145
                       /*(mean)*/
#line 145
                             ,
		      * (double (*)[1000])__RV_check_dpv(&_RV_pmd_stddev_98488324277232, stddev, sizeof(double [1000]), "correlation-base.c", "main", 146, 11, "stddev")/*POLYBENCH_ARRAY*/
#line 146
                       /*(stddev)*/
#line 146
                               );

  /* Stop and print timer. */
  /*polybench_stop_instruments*/
#line 149
                            ;
  /*polybench_print_instruments*/
#line 150
                             ;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if ( argc > 42 && ! _RV_strcmp ( __RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[0]), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)(""), ""+1), argv [ __RV_check_dpv_ss(&_RV_pmd_argv_98488324272144, argv, 0 , sizeof(char *), "correlation-base.c", "main", 154, 39, "argv[0]")] , "" , "correlation-base.c", "strcmp", 154, 32, "argv[0]", 154, 45, "\"\"") ) {
_RV_print_array ( &_RV_pmd_symmat_98488324274976, m , * (double (*)[1000][1000])__RV_check_dpv(&_RV_pmd_symmat_98488324274976, symmat, sizeof(double [1000][1000]), "correlation-base.c", "main", 154, 72, "symmat") )/*polybench_prevent_dce*/
#line 154
                       /*(print_array(m, POLYBENCH_ARRAY(symmat)))*/
#line 154
                                                                ;
_RV_lbl_98488324280192:
if(_RV_ret_flag) goto _RV_lbl_98488324281312;
}


  /* Be clean. */
  _RV_free ( &_RV_pmd_data_98488324273536, ( void * ) data , "correlation-base.c", "free", 157, 10, "(void *)data") ;/*POLYBENCH_FREE_ARRAY*/
#line 157
                      /*(data)*/
#line 157
                            ;
  _RV_free ( &_RV_pmd_symmat_98488324274976, ( void * ) symmat , "correlation-base.c", "free", 158, 10, "(void *)symmat") ;/*POLYBENCH_FREE_ARRAY*/
#line 158
                      /*(symmat)*/
#line 158
                              ;
  _RV_free ( &_RV_pmd_mean_98488324276320, ( void * ) mean , "correlation-base.c", "free", 159, 10, "(void *)mean") ;/*POLYBENCH_FREE_ARRAY*/
#line 159
                      /*(mean)*/
#line 159
                            ;
  _RV_free ( &_RV_pmd_stddev_98488324277232, ( void * ) stddev , "correlation-base.c", "free", 160, 10, "(void *)stddev") ;/*POLYBENCH_FREE_ARRAY*/
#line 160
                      /*(stddev)*/
#line 160
                              ;

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_98488324281312;
  }

_RV_lbl_98488324281312:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_98488324272144, argv);
__RV_pmd_set_null(&_RV_pmd_data_98488324273536);
__RV_pmd_set_null(&_RV_pmd_symmat_98488324274976);
__RV_pmd_set_null(&_RV_pmd_mean_98488324276320);
__RV_pmd_set_null(&_RV_pmd_stddev_98488324277232);
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

