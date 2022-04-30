#include "_RV_memsafe.c"
#line 1 "/home/zyy/zyy/parallel_safec/softboundcets-34/tests/2mm/movec/2mm.c"
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


  static void _RV_init_array(_RV_pmd *p5_pmd, _RV_pmd *p6_pmd, _RV_pmd *p7_pmd, _RV_pmd *p8_pmd, _RV_pmd *p9_pmd, _RV_pmd *p10_pmd, int ni, int nj, int nk, int nl, double *p5, double *p6, double p7[ni][nl], double p8[nk][nj], double p9[nl][nj], double p10[ni][nl]);

static
void init_array(int ni, int nj, int nk, int nl,
    double *alpha,
    double *beta,
    double A[ni][nl],
    double B[nk][nj],
    double C[nl][nj],
    double D[ni][nl])
{
_RV_stat_node *_RV_stack_sa = _RV_stat_node_create(_RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_42885600 = 0;
unsigned char _RV_bc_flag_42885560 = 0;
unsigned char _RV_bc_flag_42887272 = 0;
unsigned char _RV_bc_flag_42887232 = 0;
unsigned char _RV_bc_flag_42889408 = 0;
unsigned char _RV_bc_flag_42889368 = 0;
unsigned char _RV_bc_flag_42891080 = 0;
unsigned char _RV_bc_flag_42891040 = 0;
_RV_pmd _RV_pmd_alpha_42855160 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_beta_42855280 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_A_42880832 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_B_42881328 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_C_42881824 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_D_42882320 = _RV_pmd_init_val;
_RV_pmd *_RV_param_pmds = (
_RV_pmd_cp_fmd_pmd(&_RV_pmd_alpha_42855160, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)init_array, 0)),
_RV_pmd_cp_fmd_pmd(&_RV_pmd_beta_42855280, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)init_array, 1)),
_RV_pmd_cp_fmd_pmd(&_RV_pmd_A_42880832, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)init_array, 2)),
_RV_pmd_cp_fmd_pmd(&_RV_pmd_B_42881328, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)init_array, 3)),
_RV_pmd_cp_fmd_pmd(&_RV_pmd_C_42881824, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)init_array, 4)),
_RV_pmd_cp_fmd_pmd(&_RV_pmd_D_42882320, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)init_array, 5))
  );

  int i, j;

  *(double *)_RV_check_dpv(&_RV_pmd_alpha_42855160, alpha, sizeof(double), "2mm.c", "init_array", 27, 4, "alpha") = 32412;
  *(double *)_RV_check_dpv(&_RV_pmd_beta_42855280, beta, sizeof(double), "2mm.c", "init_array", 28, 4, "beta") = 2123;
  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nk; j++)
      {
A[_RV_check_dpv_ss(&_RV_pmd_A_42880832, A, i, sizeof(double [nl]), "2mm.c", "init_array", 31, 9, "A[i]")][_RV_check_dpv_ss(&_RV_pmd_A_42880832, A[i], j, sizeof(double), "2mm.c", "init_array", 31, 12, "A[i][j]")] = ((double) i*j) / ni;
_RV_lbl_42885560:
if(_RV_ret_flag) goto _RV_lbl_42885600;
if(_RV_bc_flag_42885560 == 1) {
_RV_bc_flag_42885560 = 0;
break;
}
if(_RV_bc_flag_42885560 == 2) _RV_bc_flag_42885560 = 0;
}

_RV_lbl_42885600:
if(_RV_ret_flag) goto _RV_lbl_42891192;
if(_RV_bc_flag_42885600 == 1) {
_RV_bc_flag_42885600 = 0;
break;
}
if(_RV_bc_flag_42885600 == 2) _RV_bc_flag_42885600 = 0;
}

  for (i = 0; i < nk; i++)
    {
for (j = 0; j < nj; j++)
      {
B[_RV_check_dpv_ss(&_RV_pmd_B_42881328, B, i, sizeof(double [nj]), "2mm.c", "init_array", 34, 9, "B[i]")][_RV_check_dpv_ss(&_RV_pmd_B_42881328, B[i], j, sizeof(double), "2mm.c", "init_array", 34, 12, "B[i][j]")] = ((double) i*(j+1)) / nj;
_RV_lbl_42887232:
if(_RV_ret_flag) goto _RV_lbl_42887272;
if(_RV_bc_flag_42887232 == 1) {
_RV_bc_flag_42887232 = 0;
break;
}
if(_RV_bc_flag_42887232 == 2) _RV_bc_flag_42887232 = 0;
}

_RV_lbl_42887272:
if(_RV_ret_flag) goto _RV_lbl_42891192;
if(_RV_bc_flag_42887272 == 1) {
_RV_bc_flag_42887272 = 0;
break;
}
if(_RV_bc_flag_42887272 == 2) _RV_bc_flag_42887272 = 0;
}

  for (i = 0; i < nl; i++)
    {
for (j = 0; j < nj; j++)
      {
C[_RV_check_dpv_ss(&_RV_pmd_C_42881824, C, i, sizeof(double [nj]), "2mm.c", "init_array", 37, 9, "C[i]")][_RV_check_dpv_ss(&_RV_pmd_C_42881824, C[i], j, sizeof(double), "2mm.c", "init_array", 37, 12, "C[i][j]")] = ((double) i*(j+3)) / nl;
_RV_lbl_42889368:
if(_RV_ret_flag) goto _RV_lbl_42889408;
if(_RV_bc_flag_42889368 == 1) {
_RV_bc_flag_42889368 = 0;
break;
}
if(_RV_bc_flag_42889368 == 2) _RV_bc_flag_42889368 = 0;
}

_RV_lbl_42889408:
if(_RV_ret_flag) goto _RV_lbl_42891192;
if(_RV_bc_flag_42889408 == 1) {
_RV_bc_flag_42889408 = 0;
break;
}
if(_RV_bc_flag_42889408 == 2) _RV_bc_flag_42889408 = 0;
}

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++)
      {
D[_RV_check_dpv_ss(&_RV_pmd_D_42882320, D, i, sizeof(double [nl]), "2mm.c", "init_array", 40, 9, "D[i]")][_RV_check_dpv_ss(&_RV_pmd_D_42882320, D[i], j, sizeof(double), "2mm.c", "init_array", 40, 12, "D[i][j]")] = ((double) i*(j+2)) / nk;
_RV_lbl_42891040:
if(_RV_ret_flag) goto _RV_lbl_42891080;
if(_RV_bc_flag_42891040 == 1) {
_RV_bc_flag_42891040 = 0;
break;
}
if(_RV_bc_flag_42891040 == 2) _RV_bc_flag_42891040 = 0;
}

_RV_lbl_42891080:
if(_RV_ret_flag) goto _RV_lbl_42891192;
if(_RV_bc_flag_42891080 == 1) {
_RV_bc_flag_42891080 = 0;
break;
}
if(_RV_bc_flag_42891080 == 2) _RV_bc_flag_42891080 = 0;
}


_RV_lbl_42891192:
_RV_pmd_set_null(&_RV_pmd_alpha_42855160);
_RV_pmd_set_null(&_RV_pmd_beta_42855280);
_RV_pmd_set_null(&_RV_pmd_A_42880832);
_RV_pmd_set_null(&_RV_pmd_B_42881328);
_RV_pmd_set_null(&_RV_pmd_C_42881824);
_RV_pmd_set_null(&_RV_pmd_D_42882320);
_RV_stack_sa->stat = _RV_invalid;
_RV_stat_node_dec(_RV_stack_sa);
return;
}

static void _RV_init_array(_RV_pmd *p5_pmd, _RV_pmd *p6_pmd, _RV_pmd *p7_pmd, _RV_pmd *p8_pmd, _RV_pmd *p9_pmd, _RV_pmd *p10_pmd, int ni, int nj, int nk, int nl, double *p5, double *p6, double p7[ni][nl], double p8[nk][nj], double p9[nl][nj], double p10[ni][nl])
{
  _RV_fmd_tbl_create((_RV_func_addr)init_array, 6);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)init_array, 0, p5_pmd);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)init_array, 1, p6_pmd);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)init_array, 2, p7_pmd);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)init_array, 3, p8_pmd);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)init_array, 4, p9_pmd);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)init_array, 5, p10_pmd);
  init_array(ni, nj, nk, nl, p5, p6, p7, p8, p9, p10);
  _RV_fmd_tbl_remove((_RV_func_addr)init_array);
  _RV_pmd_free_null_ptr(p5_pmd);
  _RV_pmd_free_null_ptr(p6_pmd);
  _RV_pmd_free_null_ptr(p7_pmd);
  _RV_pmd_free_null_ptr(p8_pmd);
  _RV_pmd_free_null_ptr(p9_pmd);
  _RV_pmd_free_null_ptr(p10_pmd);
}




  static void _RV_print_array(_RV_pmd *p3_pmd, int ni, int nl, double p3[ni][nl]);

static int _RV_fprintf_42894032(_RV_pmd *stm_pmd, _RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
_RV_check_dpv(stm_pmd, stream, sizeof(FILE), "2mm.c", "fprintf", 174, 16, "stderr");
_RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "2mm.c", "fprintf", 54, 24, "\"%0.2lf \"");
ret = fprintf(stream, "%0.2lf ", vp2);
_RV_pmd_free_null_ptr(stm_pmd);
_RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_42894848(_RV_pmd *stm_pmd, _RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
_RV_check_dpv(stm_pmd, stream, sizeof(FILE), "2mm.c", "fprintf", 174, 16, "stderr");
_RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "2mm.c", "fprintf", 55, 52, "\"\\n\"");
ret = fprintf(stream, "\n");
_RV_pmd_free_null_ptr(stm_pmd);
_RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_42895328(_RV_pmd *stm_pmd, _RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
_RV_check_dpv(stm_pmd, stream, sizeof(FILE), "2mm.c", "fprintf", 174, 16, "stderr");
_RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "2mm.c", "fprintf", 57, 20, "\"\\n\"");
ret = fprintf(stream, "\n");
_RV_pmd_free_null_ptr(stm_pmd);
_RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static
void print_array(int ni, int nl,
    double D[ni][nl])
{
_RV_stat_node *_RV_stack_sa = _RV_stat_node_create(_RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_42895064 = 0;
unsigned char _RV_bc_flag_42895032 = 0;
_RV_pmd _RV_pmd_D_42891904 = _RV_pmd_init_val;
_RV_pmd *_RV_param_pmds = (
_RV_pmd_cp_fmd_pmd(&_RV_pmd_D_42891904, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)print_array, 0))
  );

  int i, j;

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++) {
      _RV_fprintf_42894032 (_RV_pmd_tbl_lookup((_RV_ptr_addr)&stderr), _RV_pmd_create(NULL, _RV_global_sa, _RV_global, (void *)("%0.2lf "), "%0.2lf "+8), stderr, "%0.2lf ", D[_RV_check_dpv_ss(&_RV_pmd_D_42891904, D, i, sizeof(double [nl]), "2mm.c", "print_array", 54, 37, "D[i]")][_RV_check_dpv_ss(&_RV_pmd_D_42891904, D[i], j, sizeof(double), "2mm.c", "print_array", 54, 40, "D[i][j]")]);
      if ((i * ni + j) % 20 == 0) {
_RV_fprintf_42894848 (_RV_pmd_tbl_lookup((_RV_ptr_addr)&stderr), _RV_pmd_create(NULL, _RV_global_sa, _RV_global, (void *)("\n"), "\n"+2), stderr, "\n");
_RV_lbl_42894848:
if(_RV_ret_flag) goto _RV_lbl_42895032;
if(_RV_bc_flag_42895032 == 1 || _RV_bc_flag_42895032 == 2) goto _RV_lbl_42895032;
}

    
_RV_lbl_42895032:
if(_RV_ret_flag) goto _RV_lbl_42895064;
if(_RV_bc_flag_42895032 == 1) {
_RV_bc_flag_42895032 = 0;
break;
}
if(_RV_bc_flag_42895032 == 2) _RV_bc_flag_42895032 = 0;
}
_RV_lbl_42895064:
if(_RV_ret_flag) goto _RV_lbl_42895456;
if(_RV_bc_flag_42895064 == 1) {
_RV_bc_flag_42895064 = 0;
break;
}
if(_RV_bc_flag_42895064 == 2) _RV_bc_flag_42895064 = 0;
}

  _RV_fprintf_42895328 (_RV_pmd_tbl_lookup((_RV_ptr_addr)&stderr), _RV_pmd_create(NULL, _RV_global_sa, _RV_global, (void *)("\n"), "\n"+2), stderr, "\n");

_RV_lbl_42895456:
_RV_pmd_set_null(&_RV_pmd_D_42891904);
_RV_stack_sa->stat = _RV_invalid;
_RV_stat_node_dec(_RV_stack_sa);
return;
}

static void _RV_print_array(_RV_pmd *p3_pmd, int ni, int nl, double p3[ni][nl])
{
  _RV_fmd_tbl_create((_RV_func_addr)print_array, 1);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)print_array, 0, p3_pmd);
  print_array(ni, nl, p3);
  _RV_fmd_tbl_remove((_RV_func_addr)print_array);
  _RV_pmd_free_null_ptr(p3_pmd);
}




  static void _RV_kernel_2mm(_RV_pmd *p7_pmd, _RV_pmd *p8_pmd, _RV_pmd *p9_pmd, _RV_pmd *p10_pmd, _RV_pmd *p11_pmd, int ni, int nj, int nk, int nl, double p5, double p6, double p7[ni][nj], double p8[ni][nk], double p9[nk][nj], double p10[nl][nj], double p11[ni][nl]);

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
_RV_stat_node *_RV_stack_sa = _RV_stat_node_create(_RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_42904200 = 0;
unsigned char _RV_bc_flag_42904168 = 0;
unsigned char _RV_bc_flag_42904056 = 0;
unsigned char _RV_bc_flag_42906952 = 0;
unsigned char _RV_bc_flag_42906920 = 0;
unsigned char _RV_bc_flag_42906760 = 0;
_RV_pmd _RV_pmd_tmp_42896608 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_A_42897104 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_B_42898816 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_C_42899312 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_D_42899808 = _RV_pmd_init_val;
_RV_pmd *_RV_param_pmds = (
_RV_pmd_cp_fmd_pmd(&_RV_pmd_tmp_42896608, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)kernel_2mm, 0)),
_RV_pmd_cp_fmd_pmd(&_RV_pmd_A_42897104, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)kernel_2mm, 1)),
_RV_pmd_cp_fmd_pmd(&_RV_pmd_B_42898816, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)kernel_2mm, 2)),
_RV_pmd_cp_fmd_pmd(&_RV_pmd_C_42899312, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)kernel_2mm, 3)),
_RV_pmd_cp_fmd_pmd(&_RV_pmd_D_42899808, _RV_fmd_tbl_lookup_fpmd((_RV_func_addr)kernel_2mm, 4))
  );

  int i, j, k;

#pragma scop

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nj; j++)
    {
      tmp[_RV_check_dpv_ss(&_RV_pmd_tmp_42896608, tmp, i, sizeof(double [nj]), "2mm.c", "kernel_2mm", 80, 11, "tmp[i]")][_RV_check_dpv_ss(&_RV_pmd_tmp_42896608, tmp[i], j, sizeof(double), "2mm.c", "kernel_2mm", 80, 14, "tmp[i][j]")] = 0;
      for (k = 0; k < nk; ++k)
        {
tmp[_RV_check_dpv_ss(&_RV_pmd_tmp_42896608, tmp, i, sizeof(double [nj]), "2mm.c", "kernel_2mm", 82, 13, "tmp[i]")][_RV_check_dpv_ss(&_RV_pmd_tmp_42896608, tmp[i], j, sizeof(double), "2mm.c", "kernel_2mm", 82, 16, "tmp[i][j]")] += alpha * A[_RV_check_dpv_ss(&_RV_pmd_A_42897104, A, i, sizeof(double [nk]), "2mm.c", "kernel_2mm", 82, 32, "A[i]")][_RV_check_dpv_ss(&_RV_pmd_A_42897104, A[i], k, sizeof(double), "2mm.c", "kernel_2mm", 82, 35, "A[i][k]")] * B[_RV_check_dpv_ss(&_RV_pmd_B_42898816, B, k, sizeof(double [nj]), "2mm.c", "kernel_2mm", 82, 42, "B[k]")][_RV_check_dpv_ss(&_RV_pmd_B_42898816, B[k], j, sizeof(double), "2mm.c", "kernel_2mm", 82, 45, "B[k][j]")];
_RV_lbl_42904056:
if(_RV_ret_flag) goto _RV_lbl_42904168;
if(_RV_bc_flag_42904056 == 1) {
_RV_bc_flag_42904056 = 0;
break;
}
if(_RV_bc_flag_42904056 == 2) _RV_bc_flag_42904056 = 0;
}

    
_RV_lbl_42904168:
if(_RV_ret_flag) goto _RV_lbl_42904200;
if(_RV_bc_flag_42904168 == 1) {
_RV_bc_flag_42904168 = 0;
break;
}
if(_RV_bc_flag_42904168 == 2) _RV_bc_flag_42904168 = 0;
}
_RV_lbl_42904200:
if(_RV_ret_flag) goto _RV_lbl_42907064;
if(_RV_bc_flag_42904200 == 1) {
_RV_bc_flag_42904200 = 0;
break;
}
if(_RV_bc_flag_42904200 == 2) _RV_bc_flag_42904200 = 0;
}

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++)
    {
      D[_RV_check_dpv_ss(&_RV_pmd_D_42899808, D, i, sizeof(double [nl]), "2mm.c", "kernel_2mm", 87, 9, "D[i]")][_RV_check_dpv_ss(&_RV_pmd_D_42899808, D[i], j, sizeof(double), "2mm.c", "kernel_2mm", 87, 12, "D[i][j]")] *= beta;
      for (k = 0; k < nj; ++k)
        {
D[_RV_check_dpv_ss(&_RV_pmd_D_42899808, D, i, sizeof(double [nl]), "2mm.c", "kernel_2mm", 89, 11, "D[i]")][_RV_check_dpv_ss(&_RV_pmd_D_42899808, D[i], j, sizeof(double), "2mm.c", "kernel_2mm", 89, 14, "D[i][j]")] += tmp[_RV_check_dpv_ss(&_RV_pmd_tmp_42896608, tmp, i, sizeof(double [nj]), "2mm.c", "kernel_2mm", 89, 24, "tmp[i]")][_RV_check_dpv_ss(&_RV_pmd_tmp_42896608, tmp[i], k, sizeof(double), "2mm.c", "kernel_2mm", 89, 27, "tmp[i][k]")] * C[_RV_check_dpv_ss(&_RV_pmd_C_42899312, C, k, sizeof(double [nj]), "2mm.c", "kernel_2mm", 89, 34, "C[k]")][_RV_check_dpv_ss(&_RV_pmd_C_42899312, C[k], j, sizeof(double), "2mm.c", "kernel_2mm", 89, 37, "C[k][j]")];
_RV_lbl_42906760:
if(_RV_ret_flag) goto _RV_lbl_42906920;
if(_RV_bc_flag_42906760 == 1) {
_RV_bc_flag_42906760 = 0;
break;
}
if(_RV_bc_flag_42906760 == 2) _RV_bc_flag_42906760 = 0;
}

    
_RV_lbl_42906920:
if(_RV_ret_flag) goto _RV_lbl_42906952;
if(_RV_bc_flag_42906920 == 1) {
_RV_bc_flag_42906920 = 0;
break;
}
if(_RV_bc_flag_42906920 == 2) _RV_bc_flag_42906920 = 0;
}
_RV_lbl_42906952:
if(_RV_ret_flag) goto _RV_lbl_42907064;
if(_RV_bc_flag_42906952 == 1) {
_RV_bc_flag_42906952 = 0;
break;
}
if(_RV_bc_flag_42906952 == 2) _RV_bc_flag_42906952 = 0;
}

#pragma endscop


_RV_lbl_42907064:
_RV_pmd_set_null(&_RV_pmd_tmp_42896608);
_RV_pmd_set_null(&_RV_pmd_A_42897104);
_RV_pmd_set_null(&_RV_pmd_B_42898816);
_RV_pmd_set_null(&_RV_pmd_C_42899312);
_RV_pmd_set_null(&_RV_pmd_D_42899808);
_RV_stack_sa->stat = _RV_invalid;
_RV_stat_node_dec(_RV_stack_sa);
return;
}

static void _RV_kernel_2mm(_RV_pmd *p7_pmd, _RV_pmd *p8_pmd, _RV_pmd *p9_pmd, _RV_pmd *p10_pmd, _RV_pmd *p11_pmd, int ni, int nj, int nk, int nl, double p5, double p6, double p7[ni][nj], double p8[ni][nk], double p9[nk][nj], double p10[nl][nj], double p11[ni][nl])
{
  _RV_fmd_tbl_create((_RV_func_addr)kernel_2mm, 5);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)kernel_2mm, 0, p7_pmd);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)kernel_2mm, 1, p8_pmd);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)kernel_2mm, 2, p9_pmd);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)kernel_2mm, 3, p10_pmd);
  _RV_fmd_tbl_update_pmd((_RV_func_addr)kernel_2mm, 4, p11_pmd);
  kernel_2mm(ni, nj, nk, nl, p5, p6, p7, p8, p9, p10, p11);
  _RV_fmd_tbl_remove((_RV_func_addr)kernel_2mm);
  _RV_pmd_free_null_ptr(p7_pmd);
  _RV_pmd_free_null_ptr(p8_pmd);
  _RV_pmd_free_null_ptr(p9_pmd);
  _RV_pmd_free_null_ptr(p10_pmd);
  _RV_pmd_free_null_ptr(p11_pmd);
}


int _RV_main(int argc, char** argv)
{
_RV_stat_node *_RV_stack_sa = _RV_stat_node_create(_RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
_RV_pmd _RV_pmd_argv_42907248 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_tmp_42910624 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_A_42912336 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_B_42914000 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_C_42916256 = _RV_pmd_init_val;
_RV_pmd _RV_pmd_D_42917920 = _RV_pmd_init_val;
_RV_pmd *_RV_param_pmds = (
_RV_pmd_var_update_argv(argc, &_RV_pmd_argv_42907248, argv)
  );

  int dump_code = _RV_atoi(_RV_pmd_tbl_lookup((_RV_ptr_addr)&argv[1]), argv[_RV_check_dpv_ss(&_RV_pmd_argv_42907248, argv, 1, sizeof(char *), "2mm.c", "main", 98, 29, "argv[1]")], "2mm.c", "atoi", 98, 24, "argv[1]");
  int ni = _RV_atoi(_RV_pmd_tbl_lookup((_RV_ptr_addr)&argv[2]), argv[_RV_check_dpv_ss(&_RV_pmd_argv_42907248, argv, 2, sizeof(char *), "2mm.c", "main", 99, 22, "argv[2]")], "2mm.c", "atoi", 99, 17, "argv[2]");
  int nj = _RV_atoi(_RV_pmd_tbl_lookup((_RV_ptr_addr)&argv[3]), argv[_RV_check_dpv_ss(&_RV_pmd_argv_42907248, argv, 3, sizeof(char *), "2mm.c", "main", 100, 22, "argv[3]")], "2mm.c", "atoi", 100, 17, "argv[3]");
  int nk = _RV_atoi(_RV_pmd_tbl_lookup((_RV_ptr_addr)&argv[4]), argv[_RV_check_dpv_ss(&_RV_pmd_argv_42907248, argv, 4, sizeof(char *), "2mm.c", "main", 101, 22, "argv[4]")], "2mm.c", "atoi", 101, 17, "argv[4]");
  int nl = _RV_atoi(_RV_pmd_tbl_lookup((_RV_ptr_addr)&argv[5]), argv[_RV_check_dpv_ss(&_RV_pmd_argv_42907248, argv, 5, sizeof(char *), "2mm.c", "main", 102, 22, "argv[5]")], "2mm.c", "atoi", 102, 17, "argv[5]");


  double alpha;
  double beta;
  double (*tmp)[ni][nj]; tmp = (double(*)[ni][nj])_RV_malloc(&_RV_pmd_tmp_42910624, (ni) * (nj) * sizeof(double));;
  double (*A)[ni][nk]; A = (double(*)[ni][nk])_RV_malloc(&_RV_pmd_A_42912336, (ni) * (nk) * sizeof(double));;
  double (*B)[nk][nj]; B = (double(*)[nk][nj])_RV_malloc(&_RV_pmd_B_42914000, (nk) * (nj) * sizeof(double));;
  double (*C)[nl][nj]; C = (double(*)[nl][nj])_RV_malloc(&_RV_pmd_C_42916256, (nl) * (nj) * sizeof(double));;
  double (*D)[ni][nl]; D = (double(*)[ni][nl])_RV_malloc(&_RV_pmd_D_42917920, (ni) * (nl) * sizeof(double));;


  _RV_init_array (_RV_pmd_create(NULL, _RV_stack_sa, _RV_stack, (void *)(&alpha), &alpha+1), _RV_pmd_create(NULL, _RV_stack_sa, _RV_stack, (void *)(&beta), &beta+1), &_RV_pmd_A_42912336, &_RV_pmd_B_42914000, &_RV_pmd_C_42916256, &_RV_pmd_D_42917920, ni, nj, nk, nl, &alpha, &beta,
      *(double (*)[ni][nk])_RV_check_dpv(&_RV_pmd_A_42912336, A, sizeof(double [ni][nk]), "2mm.c", "main", 115, 8, "A"),
      *(double (*)[nk][nj])_RV_check_dpv(&_RV_pmd_B_42914000, B, sizeof(double [nk][nj]), "2mm.c", "main", 116, 8, "B"),
      *(double (*)[nl][nj])_RV_check_dpv(&_RV_pmd_C_42916256, C, sizeof(double [nl][nj]), "2mm.c", "main", 117, 8, "C"),
      *(double (*)[ni][nl])_RV_check_dpv(&_RV_pmd_D_42917920, D, sizeof(double [ni][nl]), "2mm.c", "main", 118, 8, "D"));




  _RV_kernel_2mm (&_RV_pmd_tmp_42910624, &_RV_pmd_A_42912336, &_RV_pmd_B_42914000, &_RV_pmd_C_42916256, &_RV_pmd_D_42917920, ni, nj, nk, nl,
      alpha, beta,
      *(double (*)[ni][nj])_RV_check_dpv(&_RV_pmd_tmp_42910624, tmp, sizeof(double [ni][nj]), "2mm.c", "main", 125, 8, "tmp"),
      *(double (*)[ni][nk])_RV_check_dpv(&_RV_pmd_A_42912336, A, sizeof(double [ni][nk]), "2mm.c", "main", 126, 8, "A"),
      *(double (*)[nk][nj])_RV_check_dpv(&_RV_pmd_B_42914000, B, sizeof(double [nk][nj]), "2mm.c", "main", 127, 8, "B"),
      *(double (*)[nl][nj])_RV_check_dpv(&_RV_pmd_C_42916256, C, sizeof(double [nl][nj]), "2mm.c", "main", 128, 8, "C"),
      *(double (*)[ni][nl])_RV_check_dpv(&_RV_pmd_D_42917920, D, sizeof(double [ni][nl]), "2mm.c", "main", 129, 8, "D"));





  if (dump_code == 1) {
_RV_print_array(&_RV_pmd_D_42917920, ni, nl, *(double (*)[ni][nl])_RV_check_dpv(&_RV_pmd_D_42917920, D, sizeof(double [ni][nl]), "2mm.c", "main", 135, 44, "D"));
_RV_lbl_42923472:
if(_RV_ret_flag) goto _RV_lbl_42926232;
}



  _RV_free(&_RV_pmd_tmp_42910624, (void*)tmp, "2mm.c", "free", 138, 8, "(void *)tmp");;
  _RV_free(&_RV_pmd_A_42912336, (void*)A, "2mm.c", "free", 139, 8, "(void *)A");;
  _RV_free(&_RV_pmd_B_42914000, (void*)B, "2mm.c", "free", 140, 8, "(void *)B");;
  _RV_free(&_RV_pmd_C_42916256, (void*)C, "2mm.c", "free", 141, 8, "(void *)C");;
  _RV_free(&_RV_pmd_D_42917920, (void*)D, "2mm.c", "free", 142, 8, "(void *)D");;

  {
  _RV_ret_flag = 1;
  _RV_ret_val = 0;
  goto _RV_lbl_42926232;
  }

_RV_lbl_42926232:
_RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_42907248, argv);
_RV_pmd_set_null(&_RV_pmd_tmp_42910624);
_RV_pmd_set_null(&_RV_pmd_A_42912336);
_RV_pmd_set_null(&_RV_pmd_B_42914000);
_RV_pmd_set_null(&_RV_pmd_C_42916256);
_RV_pmd_set_null(&_RV_pmd_D_42917920);
_RV_stack_sa->stat = _RV_invalid;
_RV_stat_node_dec(_RV_stack_sa);
return _RV_ret_val;
}

int main(int argc, char **argv)
{
  int ret_val;
  _RV_global_init_code();
  ret_val = _RV_main(argc, argv);
  _RV_print_error_count();
  return ret_val;
}

