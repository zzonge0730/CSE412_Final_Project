#include "_RV_memsafe.c"
#line 1 "/home/rkddngpr/Catamaran_artifact_issta23/examples/llvm17/gemm_cli.c"
#include <stdio.h>
#include <stdlib.h>

static void _RV_init_array(__RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, int p1, int p2, int p3, double *p4, double *p5, double *p6, double *p7, double *p8);

static void init_array(int ni, int nj, int nk,
                       double *alpha,
                       double *beta,
                       double *C,
                       double *A,
                       double *B) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_102877793331728 = 0;
unsigned char _RV_bc_flag_102877793331648 = 0;
unsigned char _RV_bc_flag_102877793333424 = 0;
unsigned char _RV_bc_flag_102877793333328 = 0;
unsigned char _RV_bc_flag_102877793335136 = 0;
unsigned char _RV_bc_flag_102877793335056 = 0;
__RV_pmd _RV_pmd_alpha_102877794691152 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_beta_102877794691280 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_102877794691408 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_102877794691536 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_102877794691664 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_alpha_102877794691152, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_beta_102877794691280, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_102877794691408, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_102877794691536, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_102877794691664, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 4))
  );

  int i, j;
  *(double *)__RV_check_dpv(&_RV_pmd_alpha_102877794691152, alpha, sizeof(double), "examples/llvm17/gemm_cli.c", "init_array", 11, 4, "alpha") = 32412.0;
  *(double *)__RV_check_dpv(&_RV_pmd_beta_102877794691280, beta, sizeof(double), "examples/llvm17/gemm_cli.c", "init_array", 12, 4, "beta") = 2123.0;
  for (i = 0; i < ni; i++) {
    for (j = 0; j < nj; j++) {
      C[__RV_check_dpv_ss(&_RV_pmd_C_102877794691408, C, (size_t)i * nj + j, sizeof(double), "examples/llvm17/gemm_cli.c", "init_array", 15, 9, "C[(size_t)i * nj + j]")] = ((double)i * j) / ni;
    
_RV_lbl_102877793331648:
if(_RV_ret_flag) goto _RV_lbl_102877793331728;
if(_RV_bc_flag_102877793331648 == 1) {
_RV_bc_flag_102877793331648 = 0;
break;
}
if(_RV_bc_flag_102877793331648 == 2) _RV_bc_flag_102877793331648 = 0;
}
  
_RV_lbl_102877793331728:
if(_RV_ret_flag) goto _RV_lbl_102877793335216;
if(_RV_bc_flag_102877793331728 == 1) {
_RV_bc_flag_102877793331728 = 0;
break;
}
if(_RV_bc_flag_102877793331728 == 2) _RV_bc_flag_102877793331728 = 0;
}
  for (i = 0; i < ni; i++) {
    for (j = 0; j < nk; j++) {
      A[__RV_check_dpv_ss(&_RV_pmd_A_102877794691536, A, (size_t)i * nk + j, sizeof(double), "examples/llvm17/gemm_cli.c", "init_array", 20, 9, "A[(size_t)i * nk + j]")] = ((double)i * (j + 1)) / nk;
    
_RV_lbl_102877793333328:
if(_RV_ret_flag) goto _RV_lbl_102877793333424;
if(_RV_bc_flag_102877793333328 == 1) {
_RV_bc_flag_102877793333328 = 0;
break;
}
if(_RV_bc_flag_102877793333328 == 2) _RV_bc_flag_102877793333328 = 0;
}
  
_RV_lbl_102877793333424:
if(_RV_ret_flag) goto _RV_lbl_102877793335216;
if(_RV_bc_flag_102877793333424 == 1) {
_RV_bc_flag_102877793333424 = 0;
break;
}
if(_RV_bc_flag_102877793333424 == 2) _RV_bc_flag_102877793333424 = 0;
}
  for (i = 0; i < nk; i++) {
    for (j = 0; j < nj; j++) {
      B[__RV_check_dpv_ss(&_RV_pmd_B_102877794691664, B, (size_t)i * nj + j, sizeof(double), "examples/llvm17/gemm_cli.c", "init_array", 25, 9, "B[(size_t)i * nj + j]")] = ((double)(i + 1) * j) / nj;
    
_RV_lbl_102877793335056:
if(_RV_ret_flag) goto _RV_lbl_102877793335136;
if(_RV_bc_flag_102877793335056 == 1) {
_RV_bc_flag_102877793335056 = 0;
break;
}
if(_RV_bc_flag_102877793335056 == 2) _RV_bc_flag_102877793335056 = 0;
}
  
_RV_lbl_102877793335136:
if(_RV_ret_flag) goto _RV_lbl_102877793335216;
if(_RV_bc_flag_102877793335136 == 1) {
_RV_bc_flag_102877793335136 = 0;
break;
}
if(_RV_bc_flag_102877793335136 == 2) _RV_bc_flag_102877793335136 = 0;
}

_RV_lbl_102877793335216:
__RV_pmd_set_null(&_RV_pmd_alpha_102877794691152);
__RV_pmd_set_null(&_RV_pmd_beta_102877794691280);
__RV_pmd_set_null(&_RV_pmd_C_102877794691408);
__RV_pmd_set_null(&_RV_pmd_A_102877794691536);
__RV_pmd_set_null(&_RV_pmd_B_102877794691664);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, int p1, int p2, int p3, double *p4, double *p5, double *p6, double *p7, double *p8)
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

static void _RV_kernel_gemm(__RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, int p1, int p2, int p3, double p4, double p5, double *p6, double *p7, double *p8);

static void kernel_gemm(int ni, int nj, int nk,
                        double alpha,
                        double beta,
                        double *C,
                        double *A,
                        double *B) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_102877793340568 = 0;
unsigned char _RV_bc_flag_102877793340472 = 0;
unsigned char _RV_bc_flag_102877793339880 = 0;
__RV_pmd _RV_pmd_C_102877793335944 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_102877793336072 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_102877793336200 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_102877793335944, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemm, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_102877793336072, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemm, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_102877793336200, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemm, 2))
  );

  int i, j, k;
  for (i = 0; i < ni; i++) {
    for (j = 0; j < nj; j++) {
      double sum = beta * C[__RV_check_dpv_ss(&_RV_pmd_C_102877793335944, C, (size_t)i * nj + j, sizeof(double), "examples/llvm17/gemm_cli.c", "kernel_gemm", 39, 29, "C[(size_t)i * nj + j]")];
      for (k = 0; k < nk; k++) {
        sum += alpha * A[__RV_check_dpv_ss(&_RV_pmd_A_102877793336072, A, (size_t)i * nk + k, sizeof(double), "examples/llvm17/gemm_cli.c", "kernel_gemm", 41, 26, "A[(size_t)i * nk + k]")] * B[__RV_check_dpv_ss(&_RV_pmd_B_102877793336200, B, (size_t)k * nj + j, sizeof(double), "examples/llvm17/gemm_cli.c", "kernel_gemm", 41, 50, "B[(size_t)k * nj + j]")];
      
_RV_lbl_102877793339880:
if(_RV_ret_flag) goto _RV_lbl_102877793340472;
if(_RV_bc_flag_102877793339880 == 1) {
_RV_bc_flag_102877793339880 = 0;
break;
}
if(_RV_bc_flag_102877793339880 == 2) _RV_bc_flag_102877793339880 = 0;
}
      C[__RV_check_dpv_ss(&_RV_pmd_C_102877793335944, C, (size_t)i * nj + j, sizeof(double), "examples/llvm17/gemm_cli.c", "kernel_gemm", 43, 9, "C[(size_t)i * nj + j]")] = sum;
    
_RV_lbl_102877793340472:
if(_RV_ret_flag) goto _RV_lbl_102877793340568;
if(_RV_bc_flag_102877793340472 == 1) {
_RV_bc_flag_102877793340472 = 0;
break;
}
if(_RV_bc_flag_102877793340472 == 2) _RV_bc_flag_102877793340472 = 0;
}
  
_RV_lbl_102877793340568:
if(_RV_ret_flag) goto _RV_lbl_102877793340648;
if(_RV_bc_flag_102877793340568 == 1) {
_RV_bc_flag_102877793340568 = 0;
break;
}
if(_RV_bc_flag_102877793340568 == 2) _RV_bc_flag_102877793340568 = 0;
}

_RV_lbl_102877793340648:
__RV_pmd_set_null(&_RV_pmd_C_102877793335944);
__RV_pmd_set_null(&_RV_pmd_A_102877793336072);
__RV_pmd_set_null(&_RV_pmd_B_102877793336200);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_gemm(__RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, int p1, int p2, int p3, double p4, double p5, double *p6, double *p7, double *p8)
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

static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double *p3);

static int _RV_fprintf_102877793342976(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "examples/llvm17/gemm_cli.c: In function 'fprintf':\n");
  fprintf(stderr, "examples/llvm17/gemm_cli.c:52:23: error: the format string \"%%0.2lf \" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "examples/llvm17/gemm_cli.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "examples/llvm17/gemm_cli.c", "fprintf", 52, 23, "\"%0.2lf \"");
ret = fprintf(stream, "%0.2lf ", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_102877793344208(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "examples/llvm17/gemm_cli.c: In function 'fprintf':\n");
  fprintf(stderr, "examples/llvm17/gemm_cli.c:54:25: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "examples/llvm17/gemm_cli.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "examples/llvm17/gemm_cli.c", "fprintf", 54, 25, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_102877793344720(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "examples/llvm17/gemm_cli.c: In function 'fprintf':\n");
  fprintf(stderr, "examples/llvm17/gemm_cli.c:58:19: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "examples/llvm17/gemm_cli.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "examples/llvm17/gemm_cli.c", "fprintf", 58, 19, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static void print_array(int ni, int nj, double *C) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_102877793344472 = 0;
unsigned char _RV_bc_flag_102877793344384 = 0;
__RV_pmd _RV_pmd_C_102877793340960 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_102877793340960, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  int i, j;
  for (i = 0; i < ni; i++) {
    for (j = 0; j < nj; j++) {
      _RV_fprintf_102877793342976(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.2lf "), "%0.2lf "+8), stderr/*stderr*/
#line 52
                    , "%0.2lf ", C[__RV_check_dpv_ss(&_RV_pmd_C_102877793340960, C, (size_t)i * nj + j, sizeof(double), "examples/llvm17/gemm_cli.c", "print_array", 52, 36, "C[(size_t)i * nj + j]")]);
      if (((size_t)i * nj + j) % 20 == 0) {
        _RV_fprintf_102877793344208(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 54
                      , "\n");
      
_RV_lbl_102877793344328:
if(_RV_ret_flag) goto _RV_lbl_102877793344384;
if(_RV_bc_flag_102877793344384 == 1 || _RV_bc_flag_102877793344384 == 2) goto _RV_lbl_102877793344384;
}
    
_RV_lbl_102877793344384:
if(_RV_ret_flag) goto _RV_lbl_102877793344472;
if(_RV_bc_flag_102877793344384 == 1) {
_RV_bc_flag_102877793344384 = 0;
break;
}
if(_RV_bc_flag_102877793344384 == 2) _RV_bc_flag_102877793344384 = 0;
}
  
_RV_lbl_102877793344472:
if(_RV_ret_flag) goto _RV_lbl_102877793344840;
if(_RV_bc_flag_102877793344472 == 1) {
_RV_bc_flag_102877793344472 = 0;
break;
}
if(_RV_bc_flag_102877793344472 == 2) _RV_bc_flag_102877793344472 = 0;
}
  _RV_fprintf_102877793344720(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 58
                , "\n");

_RV_lbl_102877793344840:
__RV_pmd_set_null(&_RV_pmd_C_102877793340960);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double *p3)
{
  __RV_fmd_tbl_create((__RV_func_addr)print_array, 1);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)print_array, 0, p3_pmd);
  print_array(p1, p2, p3);
  __RV_fmd_tbl_remove((__RV_func_addr)print_array);
  __RV_pmd_free_null_ptr(p3_pmd);
}

static int _RV_fprintf_102877793345952(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, __RV_pmd *vp2_pmd, FILE *stream, const char *fmt, char *vp2)
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
  fprintf(stderr, "examples/llvm17/gemm_cli.c: In function 'fprintf':\n");
  fprintf(stderr, "examples/llvm17/gemm_cli.c:63:21: error: the format string \"usage: %%s ni nj nk print_flag\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "examples/llvm17/gemm_cli.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "examples/llvm17/gemm_cli.c", "fprintf", 63, 21, "\"usage: %s ni nj nk print_flag\\n\"");
if(is_string[2] == 1 && vp2)
__RV_check_dpv(vp2_pmd, vp2, __RV_sstrlen(vp2)+1, "examples/llvm17/gemm_cli.c", "fprintf", 63, 56, "argv[0]");
ret = fprintf(stream, "usage: %s ni nj nk print_flag\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
__RV_pmd_free_null_ptr(vp2_pmd);
return ret;
}

static int _RV_fprintf_102877793351328(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "examples/llvm17/gemm_cli.c: In function 'fprintf':\n");
  fprintf(stderr, "examples/llvm17/gemm_cli.c:82:21: error: the format string \"malloc failed\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "examples/llvm17/gemm_cli.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "examples/llvm17/gemm_cli.c", "fprintf", 82, 21, "\"malloc failed\\n\"");
ret = fprintf(stream, "malloc failed\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

int _RV_main(int argc, char **argv) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_102877793345032 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_102877793349416 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_102877793349960 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_102877793350416 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_102877793345032, argv)
  );

  if (argc < 5) {
    _RV_fprintf_102877793345952(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("usage: %s ni nj nk print_flag\n"), "usage: %s ni nj nk print_flag\n"+31), __RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[0]), stderr/*stderr*/
#line 63
                  , "usage: %s ni nj nk print_flag\n", argv[__RV_check_dpv_ss(&_RV_pmd_argv_102877793345032, argv, 0, sizeof(char *), "examples/llvm17/gemm_cli.c", "main", 63, 61, "argv[0]")]);
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_102877793346152;
  }
  
_RV_lbl_102877793346152:
if(_RV_ret_flag) goto _RV_lbl_102877793354632;
}

  int ni = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[1]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_102877793345032, argv, 1, sizeof(char *), "examples/llvm17/gemm_cli.c", "main", 67, 22, "argv[1]")], "examples/llvm17/gemm_cli.c", "atoi", 67, 17, "argv[1]");
  int nj = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[2]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_102877793345032, argv, 2, sizeof(char *), "examples/llvm17/gemm_cli.c", "main", 68, 22, "argv[2]")], "examples/llvm17/gemm_cli.c", "atoi", 68, 17, "argv[2]");
  int nk = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[3]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_102877793345032, argv, 3, sizeof(char *), "examples/llvm17/gemm_cli.c", "main", 69, 22, "argv[3]")], "examples/llvm17/gemm_cli.c", "atoi", 69, 17, "argv[3]");
  int print_flag = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[4]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_102877793345032, argv, 4, sizeof(char *), "examples/llvm17/gemm_cli.c", "main", 70, 30, "argv[4]")], "examples/llvm17/gemm_cli.c", "atoi", 70, 25, "argv[4]");

  double alpha = 0.0;
  double beta = 0.0;
  size_t sizeC = (size_t)ni * nj;
  size_t sizeA = (size_t)ni * nk;
  size_t sizeB = (size_t)nk * nj;

  double *C = (double *)_RV_malloc(&_RV_pmd_C_102877793349416, sizeC * sizeof(double));
  double *A = (double *)_RV_malloc(&_RV_pmd_A_102877793349960, sizeA * sizeof(double));
  double *B = (double *)_RV_malloc(&_RV_pmd_B_102877793350416, sizeB * sizeof(double));
  if (!C || !A || !B) {
    _RV_fprintf_102877793351328(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("malloc failed\n"), "malloc failed\n"+15), stderr/*stderr*/
#line 82
                  , "malloc failed\n");
    _RV_free(&_RV_pmd_C_102877793349416, C, "examples/llvm17/gemm_cli.c", "free", 83, 10, "C");
    _RV_free(&_RV_pmd_A_102877793349960, A, "examples/llvm17/gemm_cli.c", "free", 84, 10, "A");
    _RV_free(&_RV_pmd_B_102877793350416, B, "examples/llvm17/gemm_cli.c", "free", 85, 10, "B");
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_102877793352136;
  }
  
_RV_lbl_102877793352136:
if(_RV_ret_flag) goto _RV_lbl_102877793354632;
}

  _RV_init_array(__RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&alpha), &alpha+1), __RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&beta), &beta+1), &_RV_pmd_C_102877793349416, &_RV_pmd_A_102877793349960, &_RV_pmd_B_102877793350416, ni, nj, nk, &alpha, &beta, C, A, B);
  _RV_kernel_gemm(&_RV_pmd_C_102877793349416, &_RV_pmd_A_102877793349960, &_RV_pmd_B_102877793350416, ni, nj, nk, alpha, beta, C, A, B);

  if (print_flag) {
    _RV_print_array(&_RV_pmd_C_102877793349416, ni, nj, C);
  
_RV_lbl_102877793353888:
if(_RV_ret_flag) goto _RV_lbl_102877793354632;
}

  _RV_free(&_RV_pmd_C_102877793349416, C, "examples/llvm17/gemm_cli.c", "free", 96, 8, "C");
  _RV_free(&_RV_pmd_A_102877793349960, A, "examples/llvm17/gemm_cli.c", "free", 97, 8, "A");
  _RV_free(&_RV_pmd_B_102877793350416, B, "examples/llvm17/gemm_cli.c", "free", 98, 8, "B");
  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_102877793354632;
  }

_RV_lbl_102877793354632:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_102877793345032, argv);
__RV_pmd_set_null(&_RV_pmd_C_102877793349416);
__RV_pmd_set_null(&_RV_pmd_A_102877793349960);
__RV_pmd_set_null(&_RV_pmd_B_102877793350416);
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


