#include "_RV_memsafe.c"
#line 1 "/workspace/examples/syrk.c"
/**
 * syrk.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

static void _RV_init_array(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, int p1, int p2, double *p3, double *p4, double *p5, double *p6);

static void init_array(int ni,
                       int nj,
                       double *alpha,
                       double *beta,
                       double *C,
                       double *A) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_103197516906496 = 0;
unsigned char _RV_bc_flag_103197516906416 = 0;
unsigned char _RV_bc_flag_103197516908184 = 0;
unsigned char _RV_bc_flag_103197516908104 = 0;
__RV_pmd _RV_pmd_alpha_103197516903760 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_beta_103197516903888 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_103197516904016 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_103197516904144 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_alpha_103197516903760, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_beta_103197516903888, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_103197516904016, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_103197516904144, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 3))
  );

  *(double *)__RV_check_dpv(&_RV_pmd_alpha_103197516903760, alpha, sizeof(double), "../syrk.c", "init_array", 18, 4, "alpha") = 32412.0;
  *(double *)__RV_check_dpv(&_RV_pmd_beta_103197516903888, beta, sizeof(double), "../syrk.c", "init_array", 19, 4, "beta") = 2123.0;
  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < nj; ++j) {
      A[__RV_check_dpv_ss(&_RV_pmd_A_103197516904144, A, i * nj + j, sizeof(double), "../syrk.c", "init_array", 22, 9, "A[i * nj + j]")] = ((double)i * j) / ni;
    
_RV_lbl_103197516906416:
if(_RV_ret_flag) goto _RV_lbl_103197516906496;
if(_RV_bc_flag_103197516906416 == 1) {
_RV_bc_flag_103197516906416 = 0;
break;
}
if(_RV_bc_flag_103197516906416 == 2) _RV_bc_flag_103197516906416 = 0;
}
  
_RV_lbl_103197516906496:
if(_RV_ret_flag) goto _RV_lbl_103197516908264;
if(_RV_bc_flag_103197516906496 == 1) {
_RV_bc_flag_103197516906496 = 0;
break;
}
if(_RV_bc_flag_103197516906496 == 2) _RV_bc_flag_103197516906496 = 0;
}
  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < ni; ++j) {
      C[__RV_check_dpv_ss(&_RV_pmd_C_103197516904016, C, i * ni + j, sizeof(double), "../syrk.c", "init_array", 27, 9, "C[i * ni + j]")] = ((double)i * j) / ni;
    
_RV_lbl_103197516908104:
if(_RV_ret_flag) goto _RV_lbl_103197516908184;
if(_RV_bc_flag_103197516908104 == 1) {
_RV_bc_flag_103197516908104 = 0;
break;
}
if(_RV_bc_flag_103197516908104 == 2) _RV_bc_flag_103197516908104 = 0;
}
  
_RV_lbl_103197516908184:
if(_RV_ret_flag) goto _RV_lbl_103197516908264;
if(_RV_bc_flag_103197516908184 == 1) {
_RV_bc_flag_103197516908184 = 0;
break;
}
if(_RV_bc_flag_103197516908184 == 2) _RV_bc_flag_103197516908184 = 0;
}

_RV_lbl_103197516908264:
__RV_pmd_set_null(&_RV_pmd_alpha_103197516903760);
__RV_pmd_set_null(&_RV_pmd_beta_103197516903888);
__RV_pmd_set_null(&_RV_pmd_C_103197516904016);
__RV_pmd_set_null(&_RV_pmd_A_103197516904144);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, int p1, int p2, double *p3, double *p4, double *p5, double *p6)
{
  __RV_fmd_tbl_create((__RV_func_addr)init_array, 4);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 0, p3_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 1, p4_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 2, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 3, p6_pmd);
  init_array(p1, p2, p3, p4, p5, p6);
  __RV_fmd_tbl_remove((__RV_func_addr)init_array);
  __RV_pmd_free_null_ptr(p3_pmd);
  __RV_pmd_free_null_ptr(p4_pmd);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
}

static void _RV_print_array(__RV_pmd *p2_pmd, int p1, double *p2);

static int _RV_fprintf_103197516910208(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "../syrk.c: In function 'fprintf':\n");
  fprintf(stderr, "../syrk.c:35:23: error: the format string \"%%0.6lf \" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syrk.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syrk.c", "fprintf", 35, 23, "\"%0.6lf \"");
ret = fprintf(stream, "%0.6lf ", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_103197516911328(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../syrk.c: In function 'fprintf':\n");
  fprintf(stderr, "../syrk.c:37:25: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syrk.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syrk.c", "fprintf", 37, 25, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_103197516911840(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../syrk.c: In function 'fprintf':\n");
  fprintf(stderr, "../syrk.c:41:19: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syrk.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syrk.c", "fprintf", 41, 19, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static void print_array(int ni, double *C) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_103197516911592 = 0;
unsigned char _RV_bc_flag_103197516911504 = 0;
__RV_pmd _RV_pmd_C_103197516908464 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_103197516908464, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < ni; ++j) {
      _RV_fprintf_103197516910208(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.6lf "), "%0.6lf "+8), stderr/*stderr*/
#line 35
                    , "%0.6lf ", C[__RV_check_dpv_ss(&_RV_pmd_C_103197516908464, C, i * ni + j, sizeof(double), "../syrk.c", "print_array", 35, 36, "C[i * ni + j]")]);
      if (((i * ni + j) % 20) == 0) {
        _RV_fprintf_103197516911328(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 37
                      , "\n");
      
_RV_lbl_103197516911448:
if(_RV_ret_flag) goto _RV_lbl_103197516911504;
if(_RV_bc_flag_103197516911504 == 1 || _RV_bc_flag_103197516911504 == 2) goto _RV_lbl_103197516911504;
}
    
_RV_lbl_103197516911504:
if(_RV_ret_flag) goto _RV_lbl_103197516911592;
if(_RV_bc_flag_103197516911504 == 1) {
_RV_bc_flag_103197516911504 = 0;
break;
}
if(_RV_bc_flag_103197516911504 == 2) _RV_bc_flag_103197516911504 = 0;
}
  
_RV_lbl_103197516911592:
if(_RV_ret_flag) goto _RV_lbl_103197516911960;
if(_RV_bc_flag_103197516911592 == 1) {
_RV_bc_flag_103197516911592 = 0;
break;
}
if(_RV_bc_flag_103197516911592 == 2) _RV_bc_flag_103197516911592 = 0;
}
  _RV_fprintf_103197516911840(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 41
                , "\n");

_RV_lbl_103197516911960:
__RV_pmd_set_null(&_RV_pmd_C_103197516908464);
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

static void _RV_kernel_syrk(__RV_pmd *p5_pmd, __RV_pmd *p6_pmd, int p1, int p2, double p3, double p4, double *p5, double *p6);

static void kernel_syrk(int ni,
                        int nj,
                        double alpha,
                        double beta,
                        double *C,
                        double *A) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_103197516914416 = 0;
unsigned char _RV_bc_flag_103197516914336 = 0;
unsigned char _RV_bc_flag_103197516917056 = 0;
unsigned char _RV_bc_flag_103197516916976 = 0;
unsigned char _RV_bc_flag_103197516916896 = 0;
__RV_pmd _RV_pmd_C_103197516912528 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_103197516912656 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_103197516912528, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_syrk, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_103197516912656, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_syrk, 1))
  );

  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < ni; ++j) {
      C[__RV_check_dpv_ss(&_RV_pmd_C_103197516912528, C, i * ni + j, sizeof(double), "../syrk.c", "kernel_syrk", 52, 9, "C[i * ni + j]")] *= beta;
    
_RV_lbl_103197516914336:
if(_RV_ret_flag) goto _RV_lbl_103197516914416;
if(_RV_bc_flag_103197516914336 == 1) {
_RV_bc_flag_103197516914336 = 0;
break;
}
if(_RV_bc_flag_103197516914336 == 2) _RV_bc_flag_103197516914336 = 0;
}
  
_RV_lbl_103197516914416:
if(_RV_ret_flag) goto _RV_lbl_103197516917136;
if(_RV_bc_flag_103197516914416 == 1) {
_RV_bc_flag_103197516914416 = 0;
break;
}
if(_RV_bc_flag_103197516914416 == 2) _RV_bc_flag_103197516914416 = 0;
}

  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < ni; ++j) {
      for (int k = 0; k < nj; ++k) {
        C[__RV_check_dpv_ss(&_RV_pmd_C_103197516912528, C, i * ni + j, sizeof(double), "../syrk.c", "kernel_syrk", 59, 11, "C[i * ni + j]")] += alpha * A[__RV_check_dpv_ss(&_RV_pmd_A_103197516912656, A, i * nj + k, sizeof(double), "../syrk.c", "kernel_syrk", 59, 36, "A[i * nj + k]")] * A[__RV_check_dpv_ss(&_RV_pmd_A_103197516912656, A, j * nj + k, sizeof(double), "../syrk.c", "kernel_syrk", 59, 52, "A[j * nj + k]")];
      
_RV_lbl_103197516916896:
if(_RV_ret_flag) goto _RV_lbl_103197516916976;
if(_RV_bc_flag_103197516916896 == 1) {
_RV_bc_flag_103197516916896 = 0;
break;
}
if(_RV_bc_flag_103197516916896 == 2) _RV_bc_flag_103197516916896 = 0;
}
    
_RV_lbl_103197516916976:
if(_RV_ret_flag) goto _RV_lbl_103197516917056;
if(_RV_bc_flag_103197516916976 == 1) {
_RV_bc_flag_103197516916976 = 0;
break;
}
if(_RV_bc_flag_103197516916976 == 2) _RV_bc_flag_103197516916976 = 0;
}
  
_RV_lbl_103197516917056:
if(_RV_ret_flag) goto _RV_lbl_103197516917136;
if(_RV_bc_flag_103197516917056 == 1) {
_RV_bc_flag_103197516917056 = 0;
break;
}
if(_RV_bc_flag_103197516917056 == 2) _RV_bc_flag_103197516917056 = 0;
}

_RV_lbl_103197516917136:
__RV_pmd_set_null(&_RV_pmd_C_103197516912528);
__RV_pmd_set_null(&_RV_pmd_A_103197516912656);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_syrk(__RV_pmd *p5_pmd, __RV_pmd *p6_pmd, int p1, int p2, double p3, double p4, double *p5, double *p6)
{
  __RV_fmd_tbl_create((__RV_func_addr)kernel_syrk, 2);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_syrk, 0, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_syrk, 1, p6_pmd);
  kernel_syrk(p1, p2, p3, p4, p5, p6);
  __RV_fmd_tbl_remove((__RV_func_addr)kernel_syrk);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
}

static int _RV_fprintf_103197516918208(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, __RV_pmd *vp2_pmd, FILE *stream, const char *fmt, char *vp2)
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
  fprintf(stderr, "../syrk.c: In function 'fprintf':\n");
  fprintf(stderr, "../syrk.c:67:21: error: the format string \"Usage: %%s dump_code ni nj\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syrk.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syrk.c", "fprintf", 67, 21, "\"Usage: %s dump_code ni nj\\n\"");
if(is_string[2] == 1 && vp2)
__RV_check_dpv(vp2_pmd, vp2, __RV_sstrlen(vp2)+1, "../syrk.c", "fprintf", 67, 52, "argv[0]");
ret = fprintf(stream, "Usage: %s dump_code ni nj\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
__RV_pmd_free_null_ptr(vp2_pmd);
return ret;
}

static int _RV_fprintf_103197516921728(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../syrk.c: In function 'fprintf':\n");
  fprintf(stderr, "../syrk.c:80:21: error: the format string \"Allocation failed\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syrk.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syrk.c", "fprintf", 80, 21, "\"Allocation failed\\n\"");
ret = fprintf(stream, "Allocation failed\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_103197516924744(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "../syrk.c: In function 'fprintf':\n");
  fprintf(stderr, "../syrk.c:93:21: error: the format string \"Check: %%f\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syrk.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syrk.c", "fprintf", 93, 21, "\"Check: %f\\n\"");
ret = fprintf(stream, "Check: %f\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

int _RV_main(int argc, char **argv) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_103197516917320 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_103197516920088 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_103197516920728 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_103197516917320, argv)
  );

  if (argc < 4) {
    _RV_fprintf_103197516918208(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Usage: %s dump_code ni nj\n"), "Usage: %s dump_code ni nj\n"+27), __RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[0]), stderr/*stderr*/
#line 67
                  , "Usage: %s dump_code ni nj\n", argv[__RV_check_dpv_ss(&_RV_pmd_argv_103197516917320, argv, 0, sizeof(char *), "../syrk.c", "main", 67, 57, "argv[0]")]);
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_103197516918408;
  }
  
_RV_lbl_103197516918408:
if(_RV_ret_flag) goto _RV_lbl_103197516925448;
}

  int dump_code = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[1]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_103197516917320, argv, 1, sizeof(char *), "../syrk.c", "main", 71, 29, "argv[1]")], "../syrk.c", "atoi", 71, 24, "argv[1]");
  int ni = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[2]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_103197516917320, argv, 2, sizeof(char *), "../syrk.c", "main", 72, 22, "argv[2]")], "../syrk.c", "atoi", 72, 17, "argv[2]");
  int nj = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[3]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_103197516917320, argv, 3, sizeof(char *), "../syrk.c", "main", 73, 22, "argv[3]")], "../syrk.c", "atoi", 73, 17, "argv[3]");

  double alpha, beta;
  double *C = (double *)_RV_malloc(&_RV_pmd_C_103197516920088, sizeof(double) * ni * ni);
  double *A = (double *)_RV_malloc(&_RV_pmd_A_103197516920728, sizeof(double) * ni * nj);

  if (!C || !A) {
    _RV_fprintf_103197516921728(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Allocation failed\n"), "Allocation failed\n"+19), stderr/*stderr*/
#line 80
                  , "Allocation failed\n");
    _RV_free(&_RV_pmd_C_103197516920088, C, "../syrk.c", "free", 81, 10, "C");
    _RV_free(&_RV_pmd_A_103197516920728, A, "../syrk.c", "free", 82, 10, "A");
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_103197516922336;
  }
  
_RV_lbl_103197516922336:
if(_RV_ret_flag) goto _RV_lbl_103197516925448;
}

  _RV_init_array(__RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&alpha), &alpha+1), __RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&beta), &beta+1), &_RV_pmd_C_103197516920088, &_RV_pmd_A_103197516920728, ni, nj, &alpha, &beta, C, A);

  _RV_kernel_syrk(&_RV_pmd_C_103197516920088, &_RV_pmd_A_103197516920728, ni, nj, alpha, beta, C, A);

  if (dump_code == 1) {
    _RV_print_array(&_RV_pmd_C_103197516920088, ni, C);
  
_RV_lbl_103197516923856:
if(_RV_ret_flag) goto _RV_lbl_103197516925448;
} else {
if (ni > 0) {
    _RV_fprintf_103197516924744(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Check: %f\n"), "Check: %f\n"+11), stderr/*stderr*/
#line 93
                  , "Check: %f\n", C[__RV_check_dpv_ss(&_RV_pmd_C_103197516920088, C, (ni / 2) * ni + (ni / 2), sizeof(double), "../syrk.c", "main", 93, 38, "C[(ni / 2) * ni + (ni / 2)]")]);
  
_RV_lbl_103197516924896:
if(_RV_ret_flag) goto _RV_lbl_103197516924920;
}
_RV_lbl_103197516924920:
if(_RV_ret_flag) goto _RV_lbl_103197516925448;
}


  _RV_free(&_RV_pmd_C_103197516920088, C, "../syrk.c", "free", 96, 8, "C");
  _RV_free(&_RV_pmd_A_103197516920728, A, "../syrk.c", "free", 97, 8, "A");

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_103197516925448;
  }

_RV_lbl_103197516925448:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_103197516917320, argv);
__RV_pmd_set_null(&_RV_pmd_C_103197516920088);
__RV_pmd_set_null(&_RV_pmd_A_103197516920728);
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

