#include "_RV_memsafe.c"
#line 1 "/workspace/examples/2mm.c"
/**
 * 2mm.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <math.h>


  static void _RV_init_array(__RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, int p1, int p2, int p3, int p4, double *p5, double *p6, double p7[ni][nl], double p8[nk][nj], double p9[nl][nj], double p10[ni][nl]);

static
void init_array(int ni, int nj, int nk, int nl,
    double *alpha,
    double *beta,
    double A[ni][nl],
    double B[nk][nj],
    double C[nl][nj],
    double D[ni][nl])
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_107862588215976 = 0;
unsigned char _RV_bc_flag_107862588215944 = 0;
unsigned char _RV_bc_flag_107862588217440 = 0;
unsigned char _RV_bc_flag_107862588217408 = 0;
unsigned char _RV_bc_flag_107862588218904 = 0;
unsigned char _RV_bc_flag_107862588218872 = 0;
unsigned char _RV_bc_flag_107862588220368 = 0;
unsigned char _RV_bc_flag_107862588220336 = 0;
__RV_pmd _RV_pmd_alpha_107862588193288 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_beta_107862588193416 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_107862588193952 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_107862588194496 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_107862588195040 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_107862588195584 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_alpha_107862588193288, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_beta_107862588193416, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_107862588193952, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_107862588194496, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_107862588195040, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 4)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_107862588195584, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 5))
  );

  int i, j;

  *(double *)__RV_check_dpv(&_RV_pmd_alpha_107862588193288, alpha, sizeof(double), "2mm.c", "init_array", 27, 4, "alpha") = 32412;
  *(double *)__RV_check_dpv(&_RV_pmd_beta_107862588193416, beta, sizeof(double), "2mm.c", "init_array", 28, 4, "beta") = 2123;
  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nk; j++)
      {
A[__RV_check_dpv_ss(&_RV_pmd_A_107862588193952, A, i, sizeof(double [nl]), "2mm.c", "init_array", 31, 9, "A[i]")][__RV_check_dpv_ss(&_RV_pmd_A_107862588193952, A[i], j, sizeof(double), "2mm.c", "init_array", 31, 12, "A[i][j]")] = ((double) i*j) / ni;
_RV_lbl_107862588215944:
if(_RV_ret_flag) goto _RV_lbl_107862588215976;
if(_RV_bc_flag_107862588215944 == 1) {
_RV_bc_flag_107862588215944 = 0;
break;
}
if(_RV_bc_flag_107862588215944 == 2) _RV_bc_flag_107862588215944 = 0;
}

_RV_lbl_107862588215976:
if(_RV_ret_flag) goto _RV_lbl_107862588220480;
if(_RV_bc_flag_107862588215976 == 1) {
_RV_bc_flag_107862588215976 = 0;
break;
}
if(_RV_bc_flag_107862588215976 == 2) _RV_bc_flag_107862588215976 = 0;
}

  for (i = 0; i < nk; i++)
    {
for (j = 0; j < nj; j++)
      {
B[__RV_check_dpv_ss(&_RV_pmd_B_107862588194496, B, i, sizeof(double [nj]), "2mm.c", "init_array", 34, 9, "B[i]")][__RV_check_dpv_ss(&_RV_pmd_B_107862588194496, B[i], j, sizeof(double), "2mm.c", "init_array", 34, 12, "B[i][j]")] = ((double) i*(j+1)) / nj;
_RV_lbl_107862588217408:
if(_RV_ret_flag) goto _RV_lbl_107862588217440;
if(_RV_bc_flag_107862588217408 == 1) {
_RV_bc_flag_107862588217408 = 0;
break;
}
if(_RV_bc_flag_107862588217408 == 2) _RV_bc_flag_107862588217408 = 0;
}

_RV_lbl_107862588217440:
if(_RV_ret_flag) goto _RV_lbl_107862588220480;
if(_RV_bc_flag_107862588217440 == 1) {
_RV_bc_flag_107862588217440 = 0;
break;
}
if(_RV_bc_flag_107862588217440 == 2) _RV_bc_flag_107862588217440 = 0;
}

  for (i = 0; i < nl; i++)
    {
for (j = 0; j < nj; j++)
      {
C[__RV_check_dpv_ss(&_RV_pmd_C_107862588195040, C, i, sizeof(double [nj]), "2mm.c", "init_array", 37, 9, "C[i]")][__RV_check_dpv_ss(&_RV_pmd_C_107862588195040, C[i], j, sizeof(double), "2mm.c", "init_array", 37, 12, "C[i][j]")] = ((double) i*(j+3)) / nl;
_RV_lbl_107862588218872:
if(_RV_ret_flag) goto _RV_lbl_107862588218904;
if(_RV_bc_flag_107862588218872 == 1) {
_RV_bc_flag_107862588218872 = 0;
break;
}
if(_RV_bc_flag_107862588218872 == 2) _RV_bc_flag_107862588218872 = 0;
}

_RV_lbl_107862588218904:
if(_RV_ret_flag) goto _RV_lbl_107862588220480;
if(_RV_bc_flag_107862588218904 == 1) {
_RV_bc_flag_107862588218904 = 0;
break;
}
if(_RV_bc_flag_107862588218904 == 2) _RV_bc_flag_107862588218904 = 0;
}

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++)
      {
D[__RV_check_dpv_ss(&_RV_pmd_D_107862588195584, D, i, sizeof(double [nl]), "2mm.c", "init_array", 40, 9, "D[i]")][__RV_check_dpv_ss(&_RV_pmd_D_107862588195584, D[i], j, sizeof(double), "2mm.c", "init_array", 40, 12, "D[i][j]")] = ((double) i*(j+2)) / nk;
_RV_lbl_107862588220336:
if(_RV_ret_flag) goto _RV_lbl_107862588220368;
if(_RV_bc_flag_107862588220336 == 1) {
_RV_bc_flag_107862588220336 = 0;
break;
}
if(_RV_bc_flag_107862588220336 == 2) _RV_bc_flag_107862588220336 = 0;
}

_RV_lbl_107862588220368:
if(_RV_ret_flag) goto _RV_lbl_107862588220480;
if(_RV_bc_flag_107862588220368 == 1) {
_RV_bc_flag_107862588220368 = 0;
break;
}
if(_RV_bc_flag_107862588220368 == 2) _RV_bc_flag_107862588220368 = 0;
}


_RV_lbl_107862588220480:
__RV_pmd_set_null(&_RV_pmd_alpha_107862588193288);
__RV_pmd_set_null(&_RV_pmd_beta_107862588193416);
__RV_pmd_set_null(&_RV_pmd_A_107862588193952);
__RV_pmd_set_null(&_RV_pmd_B_107862588194496);
__RV_pmd_set_null(&_RV_pmd_C_107862588195040);
__RV_pmd_set_null(&_RV_pmd_D_107862588195584);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, int p1, int p2, int p3, int p4, double *p5, double *p6, double p7[ni][nl], double p8[nk][nj], double p9[nl][nj], double p10[ni][nl])
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




  static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double p3[ni][nl]);

static int _RV_fprintf_107862588223264(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "2mm.c: In function 'fprintf':\n");
  fprintf(stderr, "2mm.c:54:24: error: the format string \"%%0.2lf \" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "2mm.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "2mm.c", "fprintf", 54, 24, "\"%0.2lf \"");
ret = fprintf(stream, "%0.2lf ", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_107862588224352(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "2mm.c: In function 'fprintf':\n");
  fprintf(stderr, "2mm.c:55:52: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "2mm.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "2mm.c", "fprintf", 55, 52, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_107862588224816(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "2mm.c: In function 'fprintf':\n");
  fprintf(stderr, "2mm.c:57:20: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "2mm.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "2mm.c", "fprintf", 57, 20, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static
void print_array(int ni, int nl,
    double D[ni][nl])
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_107862588224536 = 0;
unsigned char _RV_bc_flag_107862588224504 = 0;
__RV_pmd _RV_pmd_D_107862588221248 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_107862588221248, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  int i, j;

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++) {
      _RV_fprintf_107862588223264 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.2lf "), "%0.2lf "+8), stderr/*stderr*/
#line 54
                     , "%0.2lf ", D[__RV_check_dpv_ss(&_RV_pmd_D_107862588221248, D, i, sizeof(double [nl]), "2mm.c", "print_array", 54, 37, "D[i]")][__RV_check_dpv_ss(&_RV_pmd_D_107862588221248, D[i], j, sizeof(double), "2mm.c", "print_array", 54, 40, "D[i][j]")]);
      if ((i * ni + j) % 20 == 0) {
_RV_fprintf_107862588224352 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 55
                                                 , "\n");
_RV_lbl_107862588224352:
if(_RV_ret_flag) goto _RV_lbl_107862588224504;
if(_RV_bc_flag_107862588224504 == 1 || _RV_bc_flag_107862588224504 == 2) goto _RV_lbl_107862588224504;
}

    
_RV_lbl_107862588224504:
if(_RV_ret_flag) goto _RV_lbl_107862588224536;
if(_RV_bc_flag_107862588224504 == 1) {
_RV_bc_flag_107862588224504 = 0;
break;
}
if(_RV_bc_flag_107862588224504 == 2) _RV_bc_flag_107862588224504 = 0;
}
_RV_lbl_107862588224536:
if(_RV_ret_flag) goto _RV_lbl_107862588224936;
if(_RV_bc_flag_107862588224536 == 1) {
_RV_bc_flag_107862588224536 = 0;
break;
}
if(_RV_bc_flag_107862588224536 == 2) _RV_bc_flag_107862588224536 = 0;
}

  _RV_fprintf_107862588224816 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 57
                 , "\n");

_RV_lbl_107862588224936:
__RV_pmd_set_null(&_RV_pmd_D_107862588221248);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double p3[ni][nl])
{
  __RV_fmd_tbl_create((__RV_func_addr)print_array, 1);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)print_array, 0, p3_pmd);
  print_array(p1, p2, p3);
  __RV_fmd_tbl_remove((__RV_func_addr)print_array);
  __RV_pmd_free_null_ptr(p3_pmd);
}




  static void _RV_kernel_2mm(__RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, int p1, int p2, int p3, int p4, double p5, double p6, double p7[ni][nj], double p8[ni][nk], double p9[nk][nj], double p10[nl][nj], double p11[ni][nl]);

static
void kernel_2mm(int ni, int nj, int nk, int nl,
    double alpha,
    double beta,
    double tmp[ni][nj],
    double A[ni][nk],
    double B[nk][nj],
    double C[nl][nj],
    double D[ni][nl])
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_107862588235496 = 0;
unsigned char _RV_bc_flag_107862588235464 = 0;
unsigned char _RV_bc_flag_107862588235360 = 0;
unsigned char _RV_bc_flag_107862588237840 = 0;
unsigned char _RV_bc_flag_107862588237808 = 0;
unsigned char _RV_bc_flag_107862588237704 = 0;
__RV_pmd _RV_pmd_tmp_107862588226176 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_107862588226720 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_107862588227264 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_107862588227808 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_107862588228352 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_tmp_107862588226176, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_107862588226720, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_107862588227264, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_107862588227808, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_107862588228352, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 4))
  );

  int i, j, k;

/*#pragma scop*/

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nj; j++)
    {
      tmp[__RV_check_dpv_ss(&_RV_pmd_tmp_107862588226176, tmp, i, sizeof(double [nj]), "2mm.c", "kernel_2mm", 80, 11, "tmp[i]")][__RV_check_dpv_ss(&_RV_pmd_tmp_107862588226176, tmp[i], j, sizeof(double), "2mm.c", "kernel_2mm", 80, 14, "tmp[i][j]")] = 0;
      for (k = 0; k < nk; ++k)
        {
tmp[__RV_check_dpv_ss(&_RV_pmd_tmp_107862588226176, tmp, i, sizeof(double [nj]), "2mm.c", "kernel_2mm", 82, 13, "tmp[i]")][__RV_check_dpv_ss(&_RV_pmd_tmp_107862588226176, tmp[i], j, sizeof(double), "2mm.c", "kernel_2mm", 82, 16, "tmp[i][j]")] += alpha * A[__RV_check_dpv_ss(&_RV_pmd_A_107862588226720, A, i, sizeof(double [nk]), "2mm.c", "kernel_2mm", 82, 32, "A[i]")][__RV_check_dpv_ss(&_RV_pmd_A_107862588226720, A[i], k, sizeof(double), "2mm.c", "kernel_2mm", 82, 35, "A[i][k]")] * B[__RV_check_dpv_ss(&_RV_pmd_B_107862588227264, B, k, sizeof(double [nj]), "2mm.c", "kernel_2mm", 82, 42, "B[k]")][__RV_check_dpv_ss(&_RV_pmd_B_107862588227264, B[k], j, sizeof(double), "2mm.c", "kernel_2mm", 82, 45, "B[k][j]")];
_RV_lbl_107862588235360:
if(_RV_ret_flag) goto _RV_lbl_107862588235464;
if(_RV_bc_flag_107862588235360 == 1) {
_RV_bc_flag_107862588235360 = 0;
break;
}
if(_RV_bc_flag_107862588235360 == 2) _RV_bc_flag_107862588235360 = 0;
}

    
_RV_lbl_107862588235464:
if(_RV_ret_flag) goto _RV_lbl_107862588235496;
if(_RV_bc_flag_107862588235464 == 1) {
_RV_bc_flag_107862588235464 = 0;
break;
}
if(_RV_bc_flag_107862588235464 == 2) _RV_bc_flag_107862588235464 = 0;
}
_RV_lbl_107862588235496:
if(_RV_ret_flag) goto _RV_lbl_107862588237952;
if(_RV_bc_flag_107862588235496 == 1) {
_RV_bc_flag_107862588235496 = 0;
break;
}
if(_RV_bc_flag_107862588235496 == 2) _RV_bc_flag_107862588235496 = 0;
}

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++)
    {
      D[__RV_check_dpv_ss(&_RV_pmd_D_107862588228352, D, i, sizeof(double [nl]), "2mm.c", "kernel_2mm", 87, 9, "D[i]")][__RV_check_dpv_ss(&_RV_pmd_D_107862588228352, D[i], j, sizeof(double), "2mm.c", "kernel_2mm", 87, 12, "D[i][j]")] *= beta;
      for (k = 0; k < nj; ++k)
        {
D[__RV_check_dpv_ss(&_RV_pmd_D_107862588228352, D, i, sizeof(double [nl]), "2mm.c", "kernel_2mm", 89, 11, "D[i]")][__RV_check_dpv_ss(&_RV_pmd_D_107862588228352, D[i], j, sizeof(double), "2mm.c", "kernel_2mm", 89, 14, "D[i][j]")] += tmp[__RV_check_dpv_ss(&_RV_pmd_tmp_107862588226176, tmp, i, sizeof(double [nj]), "2mm.c", "kernel_2mm", 89, 24, "tmp[i]")][__RV_check_dpv_ss(&_RV_pmd_tmp_107862588226176, tmp[i], k, sizeof(double), "2mm.c", "kernel_2mm", 89, 27, "tmp[i][k]")] * C[__RV_check_dpv_ss(&_RV_pmd_C_107862588227808, C, k, sizeof(double [nj]), "2mm.c", "kernel_2mm", 89, 34, "C[k]")][__RV_check_dpv_ss(&_RV_pmd_C_107862588227808, C[k], j, sizeof(double), "2mm.c", "kernel_2mm", 89, 37, "C[k][j]")];
_RV_lbl_107862588237704:
if(_RV_ret_flag) goto _RV_lbl_107862588237808;
if(_RV_bc_flag_107862588237704 == 1) {
_RV_bc_flag_107862588237704 = 0;
break;
}
if(_RV_bc_flag_107862588237704 == 2) _RV_bc_flag_107862588237704 = 0;
}

    
_RV_lbl_107862588237808:
if(_RV_ret_flag) goto _RV_lbl_107862588237840;
if(_RV_bc_flag_107862588237808 == 1) {
_RV_bc_flag_107862588237808 = 0;
break;
}
if(_RV_bc_flag_107862588237808 == 2) _RV_bc_flag_107862588237808 = 0;
}
_RV_lbl_107862588237840:
if(_RV_ret_flag) goto _RV_lbl_107862588237952;
if(_RV_bc_flag_107862588237840 == 1) {
_RV_bc_flag_107862588237840 = 0;
break;
}
if(_RV_bc_flag_107862588237840 == 2) _RV_bc_flag_107862588237840 = 0;
}

/*#pragma endscop*/


_RV_lbl_107862588237952:
__RV_pmd_set_null(&_RV_pmd_tmp_107862588226176);
__RV_pmd_set_null(&_RV_pmd_A_107862588226720);
__RV_pmd_set_null(&_RV_pmd_B_107862588227264);
__RV_pmd_set_null(&_RV_pmd_C_107862588227808);
__RV_pmd_set_null(&_RV_pmd_D_107862588228352);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_2mm(__RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, int p1, int p2, int p3, int p4, double p5, double p6, double p7[ni][nj], double p8[ni][nk], double p9[nk][nj], double p10[nl][nj], double p11[ni][nl])
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
__RV_pmd _RV_pmd_argv_107862588238144 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_tmp_107862588241472 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_107862588243216 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_107862588244896 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_107862588246576 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_107862588248256 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_107862588238144, argv)
  );

  int dump_code = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[1]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_107862588238144, argv, 1, sizeof(char *), "2mm.c", "main", 98, 29, "argv[1]")], "2mm.c", "atoi", 98, 24, "argv[1]");
  int ni = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[2]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_107862588238144, argv, 2, sizeof(char *), "2mm.c", "main", 99, 22, "argv[2]")], "2mm.c", "atoi", 99, 17, "argv[2]");
  int nj = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[3]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_107862588238144, argv, 3, sizeof(char *), "2mm.c", "main", 100, 22, "argv[3]")], "2mm.c", "atoi", 100, 17, "argv[3]");
  int nk = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[4]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_107862588238144, argv, 4, sizeof(char *), "2mm.c", "main", 101, 22, "argv[4]")], "2mm.c", "atoi", 101, 17, "argv[4]");
  int nl = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[5]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_107862588238144, argv, 5, sizeof(char *), "2mm.c", "main", 102, 22, "argv[5]")], "2mm.c", "atoi", 102, 17, "argv[5]");


  double alpha;
  double beta;
  double (*tmp)[ni][nj]; tmp = (double(*)[ni][nj])_RV_malloc(&_RV_pmd_tmp_107862588241472, (ni) * (nj) * sizeof(double));;
  double (*A)[ni][nk]; A = (double(*)[ni][nk])_RV_malloc(&_RV_pmd_A_107862588243216, (ni) * (nk) * sizeof(double));;
  double (*B)[nk][nj]; B = (double(*)[nk][nj])_RV_malloc(&_RV_pmd_B_107862588244896, (nk) * (nj) * sizeof(double));;
  double (*C)[nl][nj]; C = (double(*)[nl][nj])_RV_malloc(&_RV_pmd_C_107862588246576, (nl) * (nj) * sizeof(double));;
  double (*D)[ni][nl]; D = (double(*)[ni][nl])_RV_malloc(&_RV_pmd_D_107862588248256, (ni) * (nl) * sizeof(double));;


  _RV_init_array (__RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&alpha), &alpha+1), __RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&beta), &beta+1), &_RV_pmd_A_107862588243216, &_RV_pmd_B_107862588244896, &_RV_pmd_C_107862588246576, &_RV_pmd_D_107862588248256, ni, nj, nk, nl, &alpha, &beta,
      *(double (*)[ni][nk])__RV_check_dpv(&_RV_pmd_A_107862588243216, A, sizeof(double [ni][nk]), "2mm.c", "main", 115, 8, "A"),
      *(double (*)[nk][nj])__RV_check_dpv(&_RV_pmd_B_107862588244896, B, sizeof(double [nk][nj]), "2mm.c", "main", 116, 8, "B"),
      *(double (*)[nl][nj])__RV_check_dpv(&_RV_pmd_C_107862588246576, C, sizeof(double [nl][nj]), "2mm.c", "main", 117, 8, "C"),
      *(double (*)[ni][nl])__RV_check_dpv(&_RV_pmd_D_107862588248256, D, sizeof(double [ni][nl]), "2mm.c", "main", 118, 8, "D"));




  _RV_kernel_2mm (&_RV_pmd_tmp_107862588241472, &_RV_pmd_A_107862588243216, &_RV_pmd_B_107862588244896, &_RV_pmd_C_107862588246576, &_RV_pmd_D_107862588248256, ni, nj, nk, nl,
      alpha, beta,
      *(double (*)[ni][nj])__RV_check_dpv(&_RV_pmd_tmp_107862588241472, tmp, sizeof(double [ni][nj]), "2mm.c", "main", 125, 8, "tmp"),
      *(double (*)[ni][nk])__RV_check_dpv(&_RV_pmd_A_107862588243216, A, sizeof(double [ni][nk]), "2mm.c", "main", 126, 8, "A"),
      *(double (*)[nk][nj])__RV_check_dpv(&_RV_pmd_B_107862588244896, B, sizeof(double [nk][nj]), "2mm.c", "main", 127, 8, "B"),
      *(double (*)[nl][nj])__RV_check_dpv(&_RV_pmd_C_107862588246576, C, sizeof(double [nl][nj]), "2mm.c", "main", 128, 8, "C"),
      *(double (*)[ni][nl])__RV_check_dpv(&_RV_pmd_D_107862588248256, D, sizeof(double [ni][nl]), "2mm.c", "main", 129, 8, "D"));





  if (dump_code == 1) {
_RV_print_array(&_RV_pmd_D_107862588248256, ni, nl, *(double (*)[ni][nl])__RV_check_dpv(&_RV_pmd_D_107862588248256, D, sizeof(double [ni][nl]), "2mm.c", "main", 135, 44, "D"));
_RV_lbl_107862588253472:
if(_RV_ret_flag) goto _RV_lbl_107862588254976;
}



  _RV_free(&_RV_pmd_tmp_107862588241472, (void*)tmp, "2mm.c", "free", 138, 8, "(void *)tmp");;
  _RV_free(&_RV_pmd_A_107862588243216, (void*)A, "2mm.c", "free", 139, 8, "(void *)A");;
  _RV_free(&_RV_pmd_B_107862588244896, (void*)B, "2mm.c", "free", 140, 8, "(void *)B");;
  _RV_free(&_RV_pmd_C_107862588246576, (void*)C, "2mm.c", "free", 141, 8, "(void *)C");;
  _RV_free(&_RV_pmd_D_107862588248256, (void*)D, "2mm.c", "free", 142, 8, "(void *)D");;

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_107862588254976;
  }

_RV_lbl_107862588254976:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_107862588238144, argv);
__RV_pmd_set_null(&_RV_pmd_tmp_107862588241472);
__RV_pmd_set_null(&_RV_pmd_A_107862588243216);
__RV_pmd_set_null(&_RV_pmd_B_107862588244896);
__RV_pmd_set_null(&_RV_pmd_C_107862588246576);
__RV_pmd_set_null(&_RV_pmd_D_107862588248256);
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

