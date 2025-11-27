#include "_RV_memsafe.c"
#line 1 "/workspace/examples/jacobi-2d.c"
/**
 * jacobi-2d-imper.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <stdlib.h>

static void _RV_init_array(__RV_pmd *p2_pmd, __RV_pmd *p3_pmd, int p1, double *p2, double *p3);

static void init_array(int n, double *A, double *B) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_103147866639160 = 0;
unsigned char _RV_bc_flag_103147866639072 = 0;
__RV_pmd _RV_pmd_A_103147866635968 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_103147866636096 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_103147866635968, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_103147866636096, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1))
  );

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      A[__RV_check_dpv_ss(&_RV_pmd_A_103147866635968, A, i * n + j, sizeof(double), "../jacobi-2d.c", "init_array", 14, 9, "A[i * n + j]")] = ((double)i * (j + 2) + 2.0) / n;
      B[__RV_check_dpv_ss(&_RV_pmd_B_103147866636096, B, i * n + j, sizeof(double), "../jacobi-2d.c", "init_array", 15, 9, "B[i * n + j]")] = ((double)i * (j + 3) + 3.0) / n;
    
_RV_lbl_103147866639072:
if(_RV_ret_flag) goto _RV_lbl_103147866639160;
if(_RV_bc_flag_103147866639072 == 1) {
_RV_bc_flag_103147866639072 = 0;
break;
}
if(_RV_bc_flag_103147866639072 == 2) _RV_bc_flag_103147866639072 = 0;
}
  
_RV_lbl_103147866639160:
if(_RV_ret_flag) goto _RV_lbl_103147866639240;
if(_RV_bc_flag_103147866639160 == 1) {
_RV_bc_flag_103147866639160 = 0;
break;
}
if(_RV_bc_flag_103147866639160 == 2) _RV_bc_flag_103147866639160 = 0;
}

_RV_lbl_103147866639240:
__RV_pmd_set_null(&_RV_pmd_A_103147866635968);
__RV_pmd_set_null(&_RV_pmd_B_103147866636096);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p2_pmd, __RV_pmd *p3_pmd, int p1, double *p2, double *p3)
{
  __RV_fmd_tbl_create((__RV_func_addr)init_array, 2);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 0, p2_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 1, p3_pmd);
  init_array(p1, p2, p3);
  __RV_fmd_tbl_remove((__RV_func_addr)init_array);
  __RV_pmd_free_null_ptr(p2_pmd);
  __RV_pmd_free_null_ptr(p3_pmd);
}

static void _RV_print_array(__RV_pmd *p2_pmd, int p1, double *p2);

static int _RV_fprintf_103147866641176(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "../jacobi-2d.c: In function 'fprintf':\n");
  fprintf(stderr, "../jacobi-2d.c:23:23: error: the format string \"%%0.6lf \" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../jacobi-2d.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../jacobi-2d.c", "fprintf", 23, 23, "\"%0.6lf \"");
ret = fprintf(stream, "%0.6lf ", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_103147866642288(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../jacobi-2d.c: In function 'fprintf':\n");
  fprintf(stderr, "../jacobi-2d.c:25:25: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../jacobi-2d.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../jacobi-2d.c", "fprintf", 25, 25, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_103147866642800(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../jacobi-2d.c: In function 'fprintf':\n");
  fprintf(stderr, "../jacobi-2d.c:29:19: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../jacobi-2d.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../jacobi-2d.c", "fprintf", 29, 19, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static void print_array(int n, double *A) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_103147866642552 = 0;
unsigned char _RV_bc_flag_103147866642464 = 0;
__RV_pmd _RV_pmd_A_103147866639416 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_103147866639416, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      _RV_fprintf_103147866641176(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.6lf "), "%0.6lf "+8), stderr/*stderr*/
#line 23
                    , "%0.6lf ", A[__RV_check_dpv_ss(&_RV_pmd_A_103147866639416, A, i * n + j, sizeof(double), "../jacobi-2d.c", "print_array", 23, 36, "A[i * n + j]")]);
      if (((i * n + j) % 20) == 0) {
        _RV_fprintf_103147866642288(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 25
                      , "\n");
      
_RV_lbl_103147866642408:
if(_RV_ret_flag) goto _RV_lbl_103147866642464;
if(_RV_bc_flag_103147866642464 == 1 || _RV_bc_flag_103147866642464 == 2) goto _RV_lbl_103147866642464;
}
    
_RV_lbl_103147866642464:
if(_RV_ret_flag) goto _RV_lbl_103147866642552;
if(_RV_bc_flag_103147866642464 == 1) {
_RV_bc_flag_103147866642464 = 0;
break;
}
if(_RV_bc_flag_103147866642464 == 2) _RV_bc_flag_103147866642464 = 0;
}
  
_RV_lbl_103147866642552:
if(_RV_ret_flag) goto _RV_lbl_103147866642920;
if(_RV_bc_flag_103147866642552 == 1) {
_RV_bc_flag_103147866642552 = 0;
break;
}
if(_RV_bc_flag_103147866642552 == 2) _RV_bc_flag_103147866642552 = 0;
}
  _RV_fprintf_103147866642800(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 29
                , "\n");

_RV_lbl_103147866642920:
__RV_pmd_set_null(&_RV_pmd_A_103147866639416);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_print_array(__RV_pmd *p2_pmd, int p1, double *p2)
{
  __RV_fmd_tbl_create((__RV_func_addr)print_array, 1);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)print_array, 0, p2_pmd);
  print_array(p1, p2);
  __RV_fmd_tbl_remove((__RV_func_addr)print_array);
  __RV_pmd_free_null_ptr(p2_pmd);
}

static void _RV_kernel_jacobi_2d_imper(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, int p1, int p2, double *p3, double *p4);

static void kernel_jacobi_2d_imper(int tsteps, int n, double *A, double *B) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_103147866649736 = 0;
unsigned char _RV_bc_flag_103147866647880 = 0;
unsigned char _RV_bc_flag_103147866647800 = 0;
unsigned char _RV_bc_flag_103147866649656 = 0;
unsigned char _RV_bc_flag_103147866649576 = 0;
__RV_pmd _RV_pmd_A_103147866643232 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_103147866643360 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_103147866643232, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_jacobi_2d_imper, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_103147866643360, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_jacobi_2d_imper, 1))
  );

  for (int t = 0; t < tsteps; ++t) {
    for (int i = 1; i < n - 1; ++i) {
      for (int j = 1; j < n - 1; ++j) {
        B[__RV_check_dpv_ss(&_RV_pmd_B_103147866643360, B, i * n + j, sizeof(double), "../jacobi-2d.c", "kernel_jacobi_2d_imper", 36, 11, "B[i * n + j]")] = 0.2 *
                       (A[__RV_check_dpv_ss(&_RV_pmd_A_103147866643232, A, i * n + j, sizeof(double), "../jacobi-2d.c", "kernel_jacobi_2d_imper", 37, 27, "A[i * n + j]")] +
                        A[__RV_check_dpv_ss(&_RV_pmd_A_103147866643232, A, i * n + (j - 1), sizeof(double), "../jacobi-2d.c", "kernel_jacobi_2d_imper", 38, 27, "A[i * n + (j - 1)]")] +
                        A[__RV_check_dpv_ss(&_RV_pmd_A_103147866643232, A, i * n + (j + 1), sizeof(double), "../jacobi-2d.c", "kernel_jacobi_2d_imper", 39, 27, "A[i * n + (j + 1)]")] +
                        A[__RV_check_dpv_ss(&_RV_pmd_A_103147866643232, A, (i + 1) * n + j, sizeof(double), "../jacobi-2d.c", "kernel_jacobi_2d_imper", 40, 27, "A[(i + 1) * n + j]")] +
                        A[__RV_check_dpv_ss(&_RV_pmd_A_103147866643232, A, (i - 1) * n + j, sizeof(double), "../jacobi-2d.c", "kernel_jacobi_2d_imper", 41, 27, "A[(i - 1) * n + j]")]);
      
_RV_lbl_103147866647800:
if(_RV_ret_flag) goto _RV_lbl_103147866647880;
if(_RV_bc_flag_103147866647800 == 1) {
_RV_bc_flag_103147866647800 = 0;
break;
}
if(_RV_bc_flag_103147866647800 == 2) _RV_bc_flag_103147866647800 = 0;
}
    
_RV_lbl_103147866647880:
if(_RV_ret_flag) goto _RV_lbl_103147866649736;
if(_RV_bc_flag_103147866647880 == 1) {
_RV_bc_flag_103147866647880 = 0;
break;
}
if(_RV_bc_flag_103147866647880 == 2) _RV_bc_flag_103147866647880 = 0;
}

    for (int i = 1; i < n - 1; ++i) {
      for (int j = 1; j < n - 1; ++j) {
        A[__RV_check_dpv_ss(&_RV_pmd_A_103147866643232, A, i * n + j, sizeof(double), "../jacobi-2d.c", "kernel_jacobi_2d_imper", 47, 11, "A[i * n + j]")] = B[__RV_check_dpv_ss(&_RV_pmd_B_103147866643360, B, i * n + j, sizeof(double), "../jacobi-2d.c", "kernel_jacobi_2d_imper", 47, 26, "B[i * n + j]")];
      
_RV_lbl_103147866649576:
if(_RV_ret_flag) goto _RV_lbl_103147866649656;
if(_RV_bc_flag_103147866649576 == 1) {
_RV_bc_flag_103147866649576 = 0;
break;
}
if(_RV_bc_flag_103147866649576 == 2) _RV_bc_flag_103147866649576 = 0;
}
    
_RV_lbl_103147866649656:
if(_RV_ret_flag) goto _RV_lbl_103147866649736;
if(_RV_bc_flag_103147866649656 == 1) {
_RV_bc_flag_103147866649656 = 0;
break;
}
if(_RV_bc_flag_103147866649656 == 2) _RV_bc_flag_103147866649656 = 0;
}
  
_RV_lbl_103147866649736:
if(_RV_ret_flag) goto _RV_lbl_103147866649824;
if(_RV_bc_flag_103147866649736 == 1) {
_RV_bc_flag_103147866649736 = 0;
break;
}
if(_RV_bc_flag_103147866649736 == 2) _RV_bc_flag_103147866649736 = 0;
}

_RV_lbl_103147866649824:
__RV_pmd_set_null(&_RV_pmd_A_103147866643232);
__RV_pmd_set_null(&_RV_pmd_B_103147866643360);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_jacobi_2d_imper(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, int p1, int p2, double *p3, double *p4)
{
  __RV_fmd_tbl_create((__RV_func_addr)kernel_jacobi_2d_imper, 2);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_jacobi_2d_imper, 0, p3_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_jacobi_2d_imper, 1, p4_pmd);
  kernel_jacobi_2d_imper(p1, p2, p3, p4);
  __RV_fmd_tbl_remove((__RV_func_addr)kernel_jacobi_2d_imper);
  __RV_pmd_free_null_ptr(p3_pmd);
  __RV_pmd_free_null_ptr(p4_pmd);
}

static int _RV_fprintf_103147866650896(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, __RV_pmd *vp2_pmd, FILE *stream, const char *fmt, char *vp2)
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
  fprintf(stderr, "../jacobi-2d.c: In function 'fprintf':\n");
  fprintf(stderr, "../jacobi-2d.c:55:21: error: the format string \"Usage: %%s dump_code tsteps n\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../jacobi-2d.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../jacobi-2d.c", "fprintf", 55, 21, "\"Usage: %s dump_code tsteps n\\n\"");
if(is_string[2] == 1 && vp2)
__RV_check_dpv(vp2_pmd, vp2, __RV_sstrlen(vp2)+1, "../jacobi-2d.c", "fprintf", 55, 55, "argv[0]");
ret = fprintf(stream, "Usage: %s dump_code tsteps n\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
__RV_pmd_free_null_ptr(vp2_pmd);
return ret;
}

static int _RV_fprintf_103147866654128(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../jacobi-2d.c: In function 'fprintf':\n");
  fprintf(stderr, "../jacobi-2d.c:67:21: error: the format string \"Allocation failed\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../jacobi-2d.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../jacobi-2d.c", "fprintf", 67, 21, "\"Allocation failed\\n\"");
ret = fprintf(stream, "Allocation failed\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_103147866656872(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "../jacobi-2d.c: In function 'fprintf':\n");
  fprintf(stderr, "../jacobi-2d.c:81:21: error: the format string \"Check: %%f\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../jacobi-2d.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../jacobi-2d.c", "fprintf", 81, 21, "\"Check: %f\\n\"");
ret = fprintf(stream, "Check: %f\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

int _RV_main(int argc, char **argv) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_103147866650000 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_103147866652472 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_103147866653112 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_103147866650000, argv)
  );

  if (argc < 4) {
    _RV_fprintf_103147866650896(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Usage: %s dump_code tsteps n\n"), "Usage: %s dump_code tsteps n\n"+30), __RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[0]), stderr/*stderr*/
#line 55
                  , "Usage: %s dump_code tsteps n\n", argv[__RV_check_dpv_ss(&_RV_pmd_argv_103147866650000, argv, 0, sizeof(char *), "../jacobi-2d.c", "main", 55, 60, "argv[0]")]);
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_103147866651096;
  }
  
_RV_lbl_103147866651096:
if(_RV_ret_flag) goto _RV_lbl_103147866657600;
}

  int dump_code = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[1]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_103147866650000, argv, 1, sizeof(char *), "../jacobi-2d.c", "main", 59, 29, "argv[1]")], "../jacobi-2d.c", "atoi", 59, 24, "argv[1]");
  int tsteps = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[2]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_103147866650000, argv, 2, sizeof(char *), "../jacobi-2d.c", "main", 60, 26, "argv[2]")], "../jacobi-2d.c", "atoi", 60, 21, "argv[2]");
  int n = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[3]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_103147866650000, argv, 3, sizeof(char *), "../jacobi-2d.c", "main", 61, 21, "argv[3]")], "../jacobi-2d.c", "atoi", 61, 16, "argv[3]");

  double *A = (double *)_RV_malloc(&_RV_pmd_A_103147866652472, sizeof(double) * n * n);
  double *B = (double *)_RV_malloc(&_RV_pmd_B_103147866653112, sizeof(double) * n * n);

  if (!A || !B) {
    _RV_fprintf_103147866654128(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Allocation failed\n"), "Allocation failed\n"+19), stderr/*stderr*/
#line 67
                  , "Allocation failed\n");
    _RV_free(&_RV_pmd_A_103147866652472, A, "../jacobi-2d.c", "free", 68, 10, "A");
    _RV_free(&_RV_pmd_B_103147866653112, B, "../jacobi-2d.c", "free", 69, 10, "B");
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_103147866654736;
  }
  
_RV_lbl_103147866654736:
if(_RV_ret_flag) goto _RV_lbl_103147866657600;
}

  _RV_init_array(&_RV_pmd_A_103147866652472, &_RV_pmd_B_103147866653112, n, A, B);

  _RV_kernel_jacobi_2d_imper(&_RV_pmd_A_103147866652472, &_RV_pmd_B_103147866653112, tsteps, n, A, B);

  if (dump_code == 1) {
    _RV_print_array(&_RV_pmd_A_103147866652472, n, A);
  
_RV_lbl_103147866655904:
if(_RV_ret_flag) goto _RV_lbl_103147866657600;
} else {
if (n > 1) {
    int mid = n / 2;
    _RV_fprintf_103147866656872(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Check: %f\n"), "Check: %f\n"+11), stderr/*stderr*/
#line 81
                  , "Check: %f\n", A[__RV_check_dpv_ss(&_RV_pmd_A_103147866652472, A, mid * n + mid, sizeof(double), "../jacobi-2d.c", "main", 81, 38, "A[mid * n + mid]")]);
  
_RV_lbl_103147866657024:
if(_RV_ret_flag) goto _RV_lbl_103147866657056;
}
_RV_lbl_103147866657056:
if(_RV_ret_flag) goto _RV_lbl_103147866657600;
}


  _RV_free(&_RV_pmd_A_103147866652472, A, "../jacobi-2d.c", "free", 84, 8, "A");
  _RV_free(&_RV_pmd_B_103147866653112, B, "../jacobi-2d.c", "free", 85, 8, "B");

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_103147866657600;
  }

_RV_lbl_103147866657600:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_103147866650000, argv);
__RV_pmd_set_null(&_RV_pmd_A_103147866652472);
__RV_pmd_set_null(&_RV_pmd_B_103147866653112);
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

