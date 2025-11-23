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


  static void _RV_init_array(__RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, int p1, int p2, int p3, int p4, double *p5, double *p6, double p7[p1][p4], double p8[p3][p2], double p9[p4][p2], double p10[p1][p4]);

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
unsigned char _RV_bc_flag_106139917276552 = 0;
unsigned char _RV_bc_flag_106139917276520 = 0;
unsigned char _RV_bc_flag_106139917278016 = 0;
unsigned char _RV_bc_flag_106139917277984 = 0;
unsigned char _RV_bc_flag_106139917279480 = 0;
unsigned char _RV_bc_flag_106139917279448 = 0;
unsigned char _RV_bc_flag_106139917280944 = 0;
unsigned char _RV_bc_flag_106139917280912 = 0;
__RV_pmd _RV_pmd_alpha_106139917254712 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_beta_106139917254840 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_106139917255376 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_106139917255920 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_106139917256464 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_106139917257008 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_alpha_106139917254712, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_beta_106139917254840, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_106139917255376, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_106139917255920, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_106139917256464, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 4)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_106139917257008, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 5))
  );

  int i, j;

  *(double *)__RV_check_dpv(&_RV_pmd_alpha_106139917254712, alpha, sizeof(double), "examples/2mm.c", "init_array", 27, 4, "alpha") = 32412;
  *(double *)__RV_check_dpv(&_RV_pmd_beta_106139917254840, beta, sizeof(double), "examples/2mm.c", "init_array", 28, 4, "beta") = 2123;
  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nk; j++)
      {
A[__RV_check_dpv_ss(&_RV_pmd_A_106139917255376, A, i, sizeof(double [nl]), "examples/2mm.c", "init_array", 31, 9, "A[i]")][__RV_check_dpv_ss(&_RV_pmd_A_106139917255376, A[i], j, sizeof(double), "examples/2mm.c", "init_array", 31, 12, "A[i][j]")] = ((double) i*j) / ni;
_RV_lbl_106139917276520:
if(_RV_ret_flag) goto _RV_lbl_106139917276552;
if(_RV_bc_flag_106139917276520 == 1) {
_RV_bc_flag_106139917276520 = 0;
break;
}
if(_RV_bc_flag_106139917276520 == 2) _RV_bc_flag_106139917276520 = 0;
}

_RV_lbl_106139917276552:
if(_RV_ret_flag) goto _RV_lbl_106139917281056;
if(_RV_bc_flag_106139917276552 == 1) {
_RV_bc_flag_106139917276552 = 0;
break;
}
if(_RV_bc_flag_106139917276552 == 2) _RV_bc_flag_106139917276552 = 0;
}

  for (i = 0; i < nk; i++)
    {
for (j = 0; j < nj; j++)
      {
B[__RV_check_dpv_ss(&_RV_pmd_B_106139917255920, B, i, sizeof(double [nj]), "examples/2mm.c", "init_array", 34, 9, "B[i]")][__RV_check_dpv_ss(&_RV_pmd_B_106139917255920, B[i], j, sizeof(double), "examples/2mm.c", "init_array", 34, 12, "B[i][j]")] = ((double) i*(j+1)) / nj;
_RV_lbl_106139917277984:
if(_RV_ret_flag) goto _RV_lbl_106139917278016;
if(_RV_bc_flag_106139917277984 == 1) {
_RV_bc_flag_106139917277984 = 0;
break;
}
if(_RV_bc_flag_106139917277984 == 2) _RV_bc_flag_106139917277984 = 0;
}

_RV_lbl_106139917278016:
if(_RV_ret_flag) goto _RV_lbl_106139917281056;
if(_RV_bc_flag_106139917278016 == 1) {
_RV_bc_flag_106139917278016 = 0;
break;
}
if(_RV_bc_flag_106139917278016 == 2) _RV_bc_flag_106139917278016 = 0;
}

  for (i = 0; i < nl; i++)
    {
for (j = 0; j < nj; j++)
      {
C[__RV_check_dpv_ss(&_RV_pmd_C_106139917256464, C, i, sizeof(double [nj]), "examples/2mm.c", "init_array", 37, 9, "C[i]")][__RV_check_dpv_ss(&_RV_pmd_C_106139917256464, C[i], j, sizeof(double), "examples/2mm.c", "init_array", 37, 12, "C[i][j]")] = ((double) i*(j+3)) / nl;
_RV_lbl_106139917279448:
if(_RV_ret_flag) goto _RV_lbl_106139917279480;
if(_RV_bc_flag_106139917279448 == 1) {
_RV_bc_flag_106139917279448 = 0;
break;
}
if(_RV_bc_flag_106139917279448 == 2) _RV_bc_flag_106139917279448 = 0;
}

_RV_lbl_106139917279480:
if(_RV_ret_flag) goto _RV_lbl_106139917281056;
if(_RV_bc_flag_106139917279480 == 1) {
_RV_bc_flag_106139917279480 = 0;
break;
}
if(_RV_bc_flag_106139917279480 == 2) _RV_bc_flag_106139917279480 = 0;
}

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++)
      {
D[__RV_check_dpv_ss(&_RV_pmd_D_106139917257008, D, i, sizeof(double [nl]), "examples/2mm.c", "init_array", 40, 9, "D[i]")][__RV_check_dpv_ss(&_RV_pmd_D_106139917257008, D[i], j, sizeof(double), "examples/2mm.c", "init_array", 40, 12, "D[i][j]")] = ((double) i*(j+2)) / nk;
_RV_lbl_106139917280912:
if(_RV_ret_flag) goto _RV_lbl_106139917280944;
if(_RV_bc_flag_106139917280912 == 1) {
_RV_bc_flag_106139917280912 = 0;
break;
}
if(_RV_bc_flag_106139917280912 == 2) _RV_bc_flag_106139917280912 = 0;
}

_RV_lbl_106139917280944:
if(_RV_ret_flag) goto _RV_lbl_106139917281056;
if(_RV_bc_flag_106139917280944 == 1) {
_RV_bc_flag_106139917280944 = 0;
break;
}
if(_RV_bc_flag_106139917280944 == 2) _RV_bc_flag_106139917280944 = 0;
}


_RV_lbl_106139917281056:
__RV_pmd_set_null(&_RV_pmd_alpha_106139917254712);
__RV_pmd_set_null(&_RV_pmd_beta_106139917254840);
__RV_pmd_set_null(&_RV_pmd_A_106139917255376);
__RV_pmd_set_null(&_RV_pmd_B_106139917255920);
__RV_pmd_set_null(&_RV_pmd_C_106139917256464);
__RV_pmd_set_null(&_RV_pmd_D_106139917257008);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, int p1, int p2, int p3, int p4, double *p5, double *p6, double p7[p1][p4], double p8[p3][p2], double p9[p4][p2], double p10[p1][p4])
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




  static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double p3[p1][p2]);

static int _RV_fprintf_106139917283840(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "examples/2mm.c: In function 'fprintf':\n");
  fprintf(stderr, "examples/2mm.c:54:24: error: the format string \"%%0.2lf \" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "examples/2mm.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "examples/2mm.c", "fprintf", 54, 24, "\"%0.2lf \"");
ret = fprintf(stream, "%0.2lf ", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_106139917284928(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "examples/2mm.c: In function 'fprintf':\n");
  fprintf(stderr, "examples/2mm.c:55:52: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "examples/2mm.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "examples/2mm.c", "fprintf", 55, 52, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_106139917285392(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "examples/2mm.c: In function 'fprintf':\n");
  fprintf(stderr, "examples/2mm.c:57:20: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "examples/2mm.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "examples/2mm.c", "fprintf", 57, 20, "\"\\n\"");
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
unsigned char _RV_bc_flag_106139917285112 = 0;
unsigned char _RV_bc_flag_106139917285080 = 0;
__RV_pmd _RV_pmd_D_106139917281824 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_106139917281824, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  int i, j;

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++) {
      _RV_fprintf_106139917283840 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.2lf "), "%0.2lf "+8), stderr/*stderr*/
#line 54
                     , "%0.2lf ", D[__RV_check_dpv_ss(&_RV_pmd_D_106139917281824, D, i, sizeof(double [nl]), "examples/2mm.c", "print_array", 54, 37, "D[i]")][__RV_check_dpv_ss(&_RV_pmd_D_106139917281824, D[i], j, sizeof(double), "examples/2mm.c", "print_array", 54, 40, "D[i][j]")]);
      if ((i * ni + j) % 20 == 0) {
_RV_fprintf_106139917284928 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 55
                                                 , "\n");
_RV_lbl_106139917284928:
if(_RV_ret_flag) goto _RV_lbl_106139917285080;
if(_RV_bc_flag_106139917285080 == 1 || _RV_bc_flag_106139917285080 == 2) goto _RV_lbl_106139917285080;
}

    
_RV_lbl_106139917285080:
if(_RV_ret_flag) goto _RV_lbl_106139917285112;
if(_RV_bc_flag_106139917285080 == 1) {
_RV_bc_flag_106139917285080 = 0;
break;
}
if(_RV_bc_flag_106139917285080 == 2) _RV_bc_flag_106139917285080 = 0;
}
_RV_lbl_106139917285112:
if(_RV_ret_flag) goto _RV_lbl_106139917285512;
if(_RV_bc_flag_106139917285112 == 1) {
_RV_bc_flag_106139917285112 = 0;
break;
}
if(_RV_bc_flag_106139917285112 == 2) _RV_bc_flag_106139917285112 = 0;
}

  _RV_fprintf_106139917285392 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 57
                 , "\n");

_RV_lbl_106139917285512:
__RV_pmd_set_null(&_RV_pmd_D_106139917281824);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double p3[p1][p2])
{
  __RV_fmd_tbl_create((__RV_func_addr)print_array, 1);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)print_array, 0, p3_pmd);
  print_array(p1, p2, p3);
  __RV_fmd_tbl_remove((__RV_func_addr)print_array);
  __RV_pmd_free_null_ptr(p3_pmd);
}




  static void _RV_kernel_2mm(__RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, int p1, int p2, int p3, int p4, double p5, double p6, double p7[p1][p2], double p8[p1][p3], double p9[p3][p2], double p10[p4][p2], double p11[p1][p4]);

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
unsigned char _RV_bc_flag_106139917296072 = 0;
unsigned char _RV_bc_flag_106139917296040 = 0;
unsigned char _RV_bc_flag_106139917295936 = 0;
unsigned char _RV_bc_flag_106139917298416 = 0;
unsigned char _RV_bc_flag_106139917298384 = 0;
unsigned char _RV_bc_flag_106139917298280 = 0;
__RV_pmd _RV_pmd_tmp_106139917286752 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_106139917287296 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_106139917287840 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_106139917288384 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_106139917288928 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_tmp_106139917286752, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_106139917287296, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_106139917287840, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_106139917288384, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_106139917288928, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_2mm, 4))
  );

  int i, j, k;

/*#pragma scop*/

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nj; j++)
    {
      tmp[__RV_check_dpv_ss(&_RV_pmd_tmp_106139917286752, tmp, i, sizeof(double [nj]), "examples/2mm.c", "kernel_2mm", 80, 11, "tmp[i]")][__RV_check_dpv_ss(&_RV_pmd_tmp_106139917286752, tmp[i], j, sizeof(double), "examples/2mm.c", "kernel_2mm", 80, 14, "tmp[i][j]")] = 0;
      for (k = 0; k < nk; ++k)
        {
tmp[__RV_check_dpv_ss(&_RV_pmd_tmp_106139917286752, tmp, i, sizeof(double [nj]), "examples/2mm.c", "kernel_2mm", 82, 13, "tmp[i]")][__RV_check_dpv_ss(&_RV_pmd_tmp_106139917286752, tmp[i], j, sizeof(double), "examples/2mm.c", "kernel_2mm", 82, 16, "tmp[i][j]")] += alpha * A[__RV_check_dpv_ss(&_RV_pmd_A_106139917287296, A, i, sizeof(double [nk]), "examples/2mm.c", "kernel_2mm", 82, 32, "A[i]")][__RV_check_dpv_ss(&_RV_pmd_A_106139917287296, A[i], k, sizeof(double), "examples/2mm.c", "kernel_2mm", 82, 35, "A[i][k]")] * B[__RV_check_dpv_ss(&_RV_pmd_B_106139917287840, B, k, sizeof(double [nj]), "examples/2mm.c", "kernel_2mm", 82, 42, "B[k]")][__RV_check_dpv_ss(&_RV_pmd_B_106139917287840, B[k], j, sizeof(double), "examples/2mm.c", "kernel_2mm", 82, 45, "B[k][j]")];
_RV_lbl_106139917295936:
if(_RV_ret_flag) goto _RV_lbl_106139917296040;
if(_RV_bc_flag_106139917295936 == 1) {
_RV_bc_flag_106139917295936 = 0;
break;
}
if(_RV_bc_flag_106139917295936 == 2) _RV_bc_flag_106139917295936 = 0;
}

    
_RV_lbl_106139917296040:
if(_RV_ret_flag) goto _RV_lbl_106139917296072;
if(_RV_bc_flag_106139917296040 == 1) {
_RV_bc_flag_106139917296040 = 0;
break;
}
if(_RV_bc_flag_106139917296040 == 2) _RV_bc_flag_106139917296040 = 0;
}
_RV_lbl_106139917296072:
if(_RV_ret_flag) goto _RV_lbl_106139917298528;
if(_RV_bc_flag_106139917296072 == 1) {
_RV_bc_flag_106139917296072 = 0;
break;
}
if(_RV_bc_flag_106139917296072 == 2) _RV_bc_flag_106139917296072 = 0;
}

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++)
    {
      D[__RV_check_dpv_ss(&_RV_pmd_D_106139917288928, D, i, sizeof(double [nl]), "examples/2mm.c", "kernel_2mm", 87, 9, "D[i]")][__RV_check_dpv_ss(&_RV_pmd_D_106139917288928, D[i], j, sizeof(double), "examples/2mm.c", "kernel_2mm", 87, 12, "D[i][j]")] *= beta;
      for (k = 0; k < nj; ++k)
        {
D[__RV_check_dpv_ss(&_RV_pmd_D_106139917288928, D, i, sizeof(double [nl]), "examples/2mm.c", "kernel_2mm", 89, 11, "D[i]")][__RV_check_dpv_ss(&_RV_pmd_D_106139917288928, D[i], j, sizeof(double), "examples/2mm.c", "kernel_2mm", 89, 14, "D[i][j]")] += tmp[__RV_check_dpv_ss(&_RV_pmd_tmp_106139917286752, tmp, i, sizeof(double [nj]), "examples/2mm.c", "kernel_2mm", 89, 24, "tmp[i]")][__RV_check_dpv_ss(&_RV_pmd_tmp_106139917286752, tmp[i], k, sizeof(double), "examples/2mm.c", "kernel_2mm", 89, 27, "tmp[i][k]")] * C[__RV_check_dpv_ss(&_RV_pmd_C_106139917288384, C, k, sizeof(double [nj]), "examples/2mm.c", "kernel_2mm", 89, 34, "C[k]")][__RV_check_dpv_ss(&_RV_pmd_C_106139917288384, C[k], j, sizeof(double), "examples/2mm.c", "kernel_2mm", 89, 37, "C[k][j]")];
_RV_lbl_106139917298280:
if(_RV_ret_flag) goto _RV_lbl_106139917298384;
if(_RV_bc_flag_106139917298280 == 1) {
_RV_bc_flag_106139917298280 = 0;
break;
}
if(_RV_bc_flag_106139917298280 == 2) _RV_bc_flag_106139917298280 = 0;
}

    
_RV_lbl_106139917298384:
if(_RV_ret_flag) goto _RV_lbl_106139917298416;
if(_RV_bc_flag_106139917298384 == 1) {
_RV_bc_flag_106139917298384 = 0;
break;
}
if(_RV_bc_flag_106139917298384 == 2) _RV_bc_flag_106139917298384 = 0;
}
_RV_lbl_106139917298416:
if(_RV_ret_flag) goto _RV_lbl_106139917298528;
if(_RV_bc_flag_106139917298416 == 1) {
_RV_bc_flag_106139917298416 = 0;
break;
}
if(_RV_bc_flag_106139917298416 == 2) _RV_bc_flag_106139917298416 = 0;
}

/*#pragma endscop*/


_RV_lbl_106139917298528:
__RV_pmd_set_null(&_RV_pmd_tmp_106139917286752);
__RV_pmd_set_null(&_RV_pmd_A_106139917287296);
__RV_pmd_set_null(&_RV_pmd_B_106139917287840);
__RV_pmd_set_null(&_RV_pmd_C_106139917288384);
__RV_pmd_set_null(&_RV_pmd_D_106139917288928);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_2mm(__RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, int p1, int p2, int p3, int p4, double p5, double p6, double p7[p1][p2], double p8[p1][p3], double p9[p3][p2], double p10[p4][p2], double p11[p1][p4])
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
__RV_pmd _RV_pmd_argv_106139917298720 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_tmp_106139917302048 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_106139917303792 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_106139917305472 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_106139917307152 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_106139917308832 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_106139917298720, argv)
  );

  int dump_code = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[1]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_106139917298720, argv, 1, sizeof(char *), "examples/2mm.c", "main", 98, 29, "argv[1]")], "examples/2mm.c", "atoi", 98, 24, "argv[1]");
  int ni = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[2]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_106139917298720, argv, 2, sizeof(char *), "examples/2mm.c", "main", 99, 22, "argv[2]")], "examples/2mm.c", "atoi", 99, 17, "argv[2]");
  int nj = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[3]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_106139917298720, argv, 3, sizeof(char *), "examples/2mm.c", "main", 100, 22, "argv[3]")], "examples/2mm.c", "atoi", 100, 17, "argv[3]");
  int nk = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[4]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_106139917298720, argv, 4, sizeof(char *), "examples/2mm.c", "main", 101, 22, "argv[4]")], "examples/2mm.c", "atoi", 101, 17, "argv[4]");
  int nl = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[5]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_106139917298720, argv, 5, sizeof(char *), "examples/2mm.c", "main", 102, 22, "argv[5]")], "examples/2mm.c", "atoi", 102, 17, "argv[5]");


  double alpha;
  double beta;
  double (*tmp)[ni][nj]; tmp = (double(*)[ni][nj])_RV_malloc(&_RV_pmd_tmp_106139917302048, (ni) * (nj) * sizeof(double));;
  double (*A)[ni][nk]; A = (double(*)[ni][nk])_RV_malloc(&_RV_pmd_A_106139917303792, (ni) * (nk) * sizeof(double));;
  double (*B)[nk][nj]; B = (double(*)[nk][nj])_RV_malloc(&_RV_pmd_B_106139917305472, (nk) * (nj) * sizeof(double));;
  double (*C)[nl][nj]; C = (double(*)[nl][nj])_RV_malloc(&_RV_pmd_C_106139917307152, (nl) * (nj) * sizeof(double));;
  double (*D)[ni][nl]; D = (double(*)[ni][nl])_RV_malloc(&_RV_pmd_D_106139917308832, (ni) * (nl) * sizeof(double));;


  _RV_init_array (__RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&alpha), &alpha+1), __RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&beta), &beta+1), &_RV_pmd_A_106139917303792, &_RV_pmd_B_106139917305472, &_RV_pmd_C_106139917307152, &_RV_pmd_D_106139917308832, ni, nj, nk, nl, &alpha, &beta,
      *(double (*)[ni][nk])__RV_check_dpv(&_RV_pmd_A_106139917303792, A, sizeof(double [ni][nk]), "examples/2mm.c", "main", 115, 8, "A"),
      *(double (*)[nk][nj])__RV_check_dpv(&_RV_pmd_B_106139917305472, B, sizeof(double [nk][nj]), "examples/2mm.c", "main", 116, 8, "B"),
      *(double (*)[nl][nj])__RV_check_dpv(&_RV_pmd_C_106139917307152, C, sizeof(double [nl][nj]), "examples/2mm.c", "main", 117, 8, "C"),
      *(double (*)[ni][nl])__RV_check_dpv(&_RV_pmd_D_106139917308832, D, sizeof(double [ni][nl]), "examples/2mm.c", "main", 118, 8, "D"));




  _RV_kernel_2mm (&_RV_pmd_tmp_106139917302048, &_RV_pmd_A_106139917303792, &_RV_pmd_B_106139917305472, &_RV_pmd_C_106139917307152, &_RV_pmd_D_106139917308832, ni, nj, nk, nl,
      alpha, beta,
      *(double (*)[ni][nj])__RV_check_dpv(&_RV_pmd_tmp_106139917302048, tmp, sizeof(double [ni][nj]), "examples/2mm.c", "main", 125, 8, "tmp"),
      *(double (*)[ni][nk])__RV_check_dpv(&_RV_pmd_A_106139917303792, A, sizeof(double [ni][nk]), "examples/2mm.c", "main", 126, 8, "A"),
      *(double (*)[nk][nj])__RV_check_dpv(&_RV_pmd_B_106139917305472, B, sizeof(double [nk][nj]), "examples/2mm.c", "main", 127, 8, "B"),
      *(double (*)[nl][nj])__RV_check_dpv(&_RV_pmd_C_106139917307152, C, sizeof(double [nl][nj]), "examples/2mm.c", "main", 128, 8, "C"),
      *(double (*)[ni][nl])__RV_check_dpv(&_RV_pmd_D_106139917308832, D, sizeof(double [ni][nl]), "examples/2mm.c", "main", 129, 8, "D"));





  if (dump_code == 1) {
_RV_print_array(&_RV_pmd_D_106139917308832, ni, nl, *(double (*)[ni][nl])__RV_check_dpv(&_RV_pmd_D_106139917308832, D, sizeof(double [ni][nl]), "examples/2mm.c", "main", 135, 44, "D"));
_RV_lbl_106139917314048:
if(_RV_ret_flag) goto _RV_lbl_106139917315552;
}



  _RV_free(&_RV_pmd_tmp_106139917302048, (void*)tmp, "examples/2mm.c", "free", 138, 8, "(void *)tmp");;
  _RV_free(&_RV_pmd_A_106139917303792, (void*)A, "examples/2mm.c", "free", 139, 8, "(void *)A");;
  _RV_free(&_RV_pmd_B_106139917305472, (void*)B, "examples/2mm.c", "free", 140, 8, "(void *)B");;
  _RV_free(&_RV_pmd_C_106139917307152, (void*)C, "examples/2mm.c", "free", 141, 8, "(void *)C");;
  _RV_free(&_RV_pmd_D_106139917308832, (void*)D, "examples/2mm.c", "free", 142, 8, "(void *)D");;

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_106139917315552;
  }

_RV_lbl_106139917315552:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_106139917298720, argv);
__RV_pmd_set_null(&_RV_pmd_tmp_106139917302048);
__RV_pmd_set_null(&_RV_pmd_A_106139917303792);
__RV_pmd_set_null(&_RV_pmd_B_106139917305472);
__RV_pmd_set_null(&_RV_pmd_C_106139917307152);
__RV_pmd_set_null(&_RV_pmd_D_106139917308832);
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

