#include "_RV_memsafe.c"
#line 1 "/workspace/examples/gemver.c"
#include <stdio.h>
#include <stdlib.h>

static void _RV_init_array(__RV_pmd *p2_pmd, __RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, __RV_pmd *p12_pmd, int p1, double *p2, double *p3, double *p4, double *p5, double *p6, double *p7, double *p8, double *p9, double *p10, double *p11, double *p12);

static void init_array(int n,
                       double *alpha,
                       double *beta,
                       double *A,
                       double *u1,
                       double *u2,
                       double *v1,
                       double *v2,
                       double *w,
                       double *x,
                       double *y,
                       double *z) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_105103839026816 = 0;
unsigned char _RV_bc_flag_105103839026736 = 0;
__RV_pmd _RV_pmd_alpha_105103839019872 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_beta_105103839020000 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_105103839020128 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_u1_105103839020256 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_u2_105103839020384 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_v1_105103839020512 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_v2_105103839020640 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_w_105103839020768 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x_105103839020944 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y_105103839021072 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_z_105103839021200 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_alpha_105103839019872, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_beta_105103839020000, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_105103839020128, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_u1_105103839020256, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_u2_105103839020384, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 4)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_v1_105103839020512, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 5)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_v2_105103839020640, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 6)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_w_105103839020768, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 7)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_x_105103839020944, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 8)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_y_105103839021072, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 9)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_z_105103839021200, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 10))
  );

  *(double *)__RV_check_dpv(&_RV_pmd_alpha_105103839019872, alpha, sizeof(double), "../gemver.c", "init_array", 16, 4, "alpha") = 43532.0;
  *(double *)__RV_check_dpv(&_RV_pmd_beta_105103839020000, beta, sizeof(double), "../gemver.c", "init_array", 17, 4, "beta") = 12313.0;
  for (int i = 0; i < n; ++i) {
    u1[__RV_check_dpv_ss(&_RV_pmd_u1_105103839020256, u1, i, sizeof(double), "../gemver.c", "init_array", 19, 8, "u1[i]")] = i;
    u2[__RV_check_dpv_ss(&_RV_pmd_u2_105103839020384, u2, i, sizeof(double), "../gemver.c", "init_array", 20, 8, "u2[i]")] = (i + 1) / n;
    v1[__RV_check_dpv_ss(&_RV_pmd_v1_105103839020512, v1, i, sizeof(double), "../gemver.c", "init_array", 21, 8, "v1[i]")] = (i + 1) / (double)n;
    v2[__RV_check_dpv_ss(&_RV_pmd_v2_105103839020640, v2, i, sizeof(double), "../gemver.c", "init_array", 22, 8, "v2[i]")] = (i + 1) / (double)n;
    y[__RV_check_dpv_ss(&_RV_pmd_y_105103839021072, y, i, sizeof(double), "../gemver.c", "init_array", 23, 7, "y[i]")] = (i + 3) / (double)n;
    z[__RV_check_dpv_ss(&_RV_pmd_z_105103839021200, z, i, sizeof(double), "../gemver.c", "init_array", 24, 7, "z[i]")] = (i + 4) / (double)n;
    x[__RV_check_dpv_ss(&_RV_pmd_x_105103839020944, x, i, sizeof(double), "../gemver.c", "init_array", 25, 7, "x[i]")] = 0.0;
    w[__RV_check_dpv_ss(&_RV_pmd_w_105103839020768, w, i, sizeof(double), "../gemver.c", "init_array", 26, 7, "w[i]")] = 0.0;
    for (int j = 0; j < n; ++j) {
      A[__RV_check_dpv_ss(&_RV_pmd_A_105103839020128, A, i * n + j, sizeof(double), "../gemver.c", "init_array", 28, 9, "A[i * n + j]")] = (i * j) / (double)n;
    
_RV_lbl_105103839026736:
if(_RV_ret_flag) goto _RV_lbl_105103839026816;
if(_RV_bc_flag_105103839026736 == 1) {
_RV_bc_flag_105103839026736 = 0;
break;
}
if(_RV_bc_flag_105103839026736 == 2) _RV_bc_flag_105103839026736 = 0;
}
  
_RV_lbl_105103839026816:
if(_RV_ret_flag) goto _RV_lbl_105103839026960;
if(_RV_bc_flag_105103839026816 == 1) {
_RV_bc_flag_105103839026816 = 0;
break;
}
if(_RV_bc_flag_105103839026816 == 2) _RV_bc_flag_105103839026816 = 0;
}

_RV_lbl_105103839026960:
__RV_pmd_set_null(&_RV_pmd_alpha_105103839019872);
__RV_pmd_set_null(&_RV_pmd_beta_105103839020000);
__RV_pmd_set_null(&_RV_pmd_A_105103839020128);
__RV_pmd_set_null(&_RV_pmd_u1_105103839020256);
__RV_pmd_set_null(&_RV_pmd_u2_105103839020384);
__RV_pmd_set_null(&_RV_pmd_v1_105103839020512);
__RV_pmd_set_null(&_RV_pmd_v2_105103839020640);
__RV_pmd_set_null(&_RV_pmd_w_105103839020768);
__RV_pmd_set_null(&_RV_pmd_x_105103839020944);
__RV_pmd_set_null(&_RV_pmd_y_105103839021072);
__RV_pmd_set_null(&_RV_pmd_z_105103839021200);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p2_pmd, __RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, __RV_pmd *p12_pmd, int p1, double *p2, double *p3, double *p4, double *p5, double *p6, double *p7, double *p8, double *p9, double *p10, double *p11, double *p12)
{
  __RV_fmd_tbl_create((__RV_func_addr)init_array, 11);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 0, p2_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 1, p3_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 2, p4_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 3, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 4, p6_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 5, p7_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 6, p8_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 7, p9_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 8, p10_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 9, p11_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 10, p12_pmd);
  init_array(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);
  __RV_fmd_tbl_remove((__RV_func_addr)init_array);
  __RV_pmd_free_null_ptr(p2_pmd);
  __RV_pmd_free_null_ptr(p3_pmd);
  __RV_pmd_free_null_ptr(p4_pmd);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
  __RV_pmd_free_null_ptr(p7_pmd);
  __RV_pmd_free_null_ptr(p8_pmd);
  __RV_pmd_free_null_ptr(p9_pmd);
  __RV_pmd_free_null_ptr(p10_pmd);
  __RV_pmd_free_null_ptr(p11_pmd);
  __RV_pmd_free_null_ptr(p12_pmd);
}

static void _RV_print_array(__RV_pmd *p2_pmd, int p1, double *p2);

static int _RV_fprintf_105103839028336(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "../gemver.c: In function 'fprintf':\n");
  fprintf(stderr, "../gemver.c:35:21: error: the format string \"%%0.6lf \" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../gemver.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../gemver.c", "fprintf", 35, 21, "\"%0.6lf \"");
ret = fprintf(stream, "%0.6lf ", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_105103839029272(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../gemver.c: In function 'fprintf':\n");
  fprintf(stderr, "../gemver.c:37:23: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../gemver.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../gemver.c", "fprintf", 37, 23, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_105103839029704(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../gemver.c: In function 'fprintf':\n");
  fprintf(stderr, "../gemver.c:40:19: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../gemver.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../gemver.c", "fprintf", 40, 19, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static void print_array(int n, double *w) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_105103839029448 = 0;
__RV_pmd _RV_pmd_w_105103839027152 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_w_105103839027152, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  for (int i = 0; i < n; ++i) {
    _RV_fprintf_105103839028336(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.6lf "), "%0.6lf "+8), stderr/*stderr*/
#line 35
                  , "%0.6lf ", w[__RV_check_dpv_ss(&_RV_pmd_w_105103839027152, w, i, sizeof(double), "../gemver.c", "print_array", 35, 34, "w[i]")]);
    if ((i % 20) == 0) {
      _RV_fprintf_105103839029272(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 37
                    , "\n");
    
_RV_lbl_105103839029392:
if(_RV_ret_flag) goto _RV_lbl_105103839029448;
if(_RV_bc_flag_105103839029448 == 1 || _RV_bc_flag_105103839029448 == 2) goto _RV_lbl_105103839029448;
}
  
_RV_lbl_105103839029448:
if(_RV_ret_flag) goto _RV_lbl_105103839029824;
if(_RV_bc_flag_105103839029448 == 1) {
_RV_bc_flag_105103839029448 = 0;
break;
}
if(_RV_bc_flag_105103839029448 == 2) _RV_bc_flag_105103839029448 = 0;
}
  _RV_fprintf_105103839029704(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 40
                , "\n");

_RV_lbl_105103839029824:
__RV_pmd_set_null(&_RV_pmd_w_105103839027152);
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

static void _RV_kernel_gemver(__RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, __RV_pmd *p12_pmd, int p1, double p2, double p3, double *p4, double *p5, double *p6, double *p7, double *p8, double *p9, double *p10, double *p11, double *p12);

static void kernel_gemver(int n,
                          double alpha,
                          double beta,
                          double *A,
                          double *u1,
                          double *u2,
                          double *v1,
                          double *v2,
                          double *w,
                          double *x,
                          double *y,
                          double *z) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_105103839033920 = 0;
unsigned char _RV_bc_flag_105103839033840 = 0;
unsigned char _RV_bc_flag_105103839035672 = 0;
unsigned char _RV_bc_flag_105103839035592 = 0;
unsigned char _RV_bc_flag_105103839036496 = 0;
unsigned char _RV_bc_flag_105103839038264 = 0;
unsigned char _RV_bc_flag_105103839038184 = 0;
__RV_pmd _RV_pmd_A_105103839030264 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_u1_105103839030392 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_u2_105103839030520 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_v1_105103839030648 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_v2_105103839030776 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_w_105103839030904 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x_105103839031032 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y_105103839031160 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_z_105103839031288 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_105103839030264, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemver, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_u1_105103839030392, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemver, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_u2_105103839030520, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemver, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_v1_105103839030648, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemver, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_v2_105103839030776, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemver, 4)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_w_105103839030904, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemver, 5)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_x_105103839031032, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemver, 6)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_y_105103839031160, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemver, 7)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_z_105103839031288, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_gemver, 8))
  );

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      A[__RV_check_dpv_ss(&_RV_pmd_A_105103839030264, A, i * n + j, sizeof(double), "../gemver.c", "kernel_gemver", 57, 9, "A[i * n + j]")] += u1[__RV_check_dpv_ss(&_RV_pmd_u1_105103839030392, u1, i, sizeof(double), "../gemver.c", "kernel_gemver", 57, 26, "u1[i]")] * v1[__RV_check_dpv_ss(&_RV_pmd_v1_105103839030648, v1, j, sizeof(double), "../gemver.c", "kernel_gemver", 57, 34, "v1[j]")] + u2[__RV_check_dpv_ss(&_RV_pmd_u2_105103839030520, u2, i, sizeof(double), "../gemver.c", "kernel_gemver", 57, 42, "u2[i]")] * v2[__RV_check_dpv_ss(&_RV_pmd_v2_105103839030776, v2, j, sizeof(double), "../gemver.c", "kernel_gemver", 57, 50, "v2[j]")];
    
_RV_lbl_105103839033840:
if(_RV_ret_flag) goto _RV_lbl_105103839033920;
if(_RV_bc_flag_105103839033840 == 1) {
_RV_bc_flag_105103839033840 = 0;
break;
}
if(_RV_bc_flag_105103839033840 == 2) _RV_bc_flag_105103839033840 = 0;
}
  
_RV_lbl_105103839033920:
if(_RV_ret_flag) goto _RV_lbl_105103839038344;
if(_RV_bc_flag_105103839033920 == 1) {
_RV_bc_flag_105103839033920 = 0;
break;
}
if(_RV_bc_flag_105103839033920 == 2) _RV_bc_flag_105103839033920 = 0;
}

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      x[__RV_check_dpv_ss(&_RV_pmd_x_105103839031032, x, i, sizeof(double), "../gemver.c", "kernel_gemver", 63, 9, "x[i]")] += beta * A[__RV_check_dpv_ss(&_RV_pmd_A_105103839030264, A, j * n + i, sizeof(double), "../gemver.c", "kernel_gemver", 63, 24, "A[j * n + i]")] * y[__RV_check_dpv_ss(&_RV_pmd_y_105103839031160, y, j, sizeof(double), "../gemver.c", "kernel_gemver", 63, 39, "y[j]")];
    
_RV_lbl_105103839035592:
if(_RV_ret_flag) goto _RV_lbl_105103839035672;
if(_RV_bc_flag_105103839035592 == 1) {
_RV_bc_flag_105103839035592 = 0;
break;
}
if(_RV_bc_flag_105103839035592 == 2) _RV_bc_flag_105103839035592 = 0;
}
  
_RV_lbl_105103839035672:
if(_RV_ret_flag) goto _RV_lbl_105103839038344;
if(_RV_bc_flag_105103839035672 == 1) {
_RV_bc_flag_105103839035672 = 0;
break;
}
if(_RV_bc_flag_105103839035672 == 2) _RV_bc_flag_105103839035672 = 0;
}

  for (int i = 0; i < n; ++i) {
    x[__RV_check_dpv_ss(&_RV_pmd_x_105103839031032, x, i, sizeof(double), "../gemver.c", "kernel_gemver", 68, 7, "x[i]")] += z[__RV_check_dpv_ss(&_RV_pmd_z_105103839031288, z, i, sizeof(double), "../gemver.c", "kernel_gemver", 68, 15, "z[i]")];
  
_RV_lbl_105103839036496:
if(_RV_ret_flag) goto _RV_lbl_105103839038344;
if(_RV_bc_flag_105103839036496 == 1) {
_RV_bc_flag_105103839036496 = 0;
break;
}
if(_RV_bc_flag_105103839036496 == 2) _RV_bc_flag_105103839036496 = 0;
}

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      w[__RV_check_dpv_ss(&_RV_pmd_w_105103839030904, w, i, sizeof(double), "../gemver.c", "kernel_gemver", 73, 9, "w[i]")] += alpha * A[__RV_check_dpv_ss(&_RV_pmd_A_105103839030264, A, i * n + j, sizeof(double), "../gemver.c", "kernel_gemver", 73, 25, "A[i * n + j]")] * x[__RV_check_dpv_ss(&_RV_pmd_x_105103839031032, x, j, sizeof(double), "../gemver.c", "kernel_gemver", 73, 40, "x[j]")];
    
_RV_lbl_105103839038184:
if(_RV_ret_flag) goto _RV_lbl_105103839038264;
if(_RV_bc_flag_105103839038184 == 1) {
_RV_bc_flag_105103839038184 = 0;
break;
}
if(_RV_bc_flag_105103839038184 == 2) _RV_bc_flag_105103839038184 = 0;
}
  
_RV_lbl_105103839038264:
if(_RV_ret_flag) goto _RV_lbl_105103839038344;
if(_RV_bc_flag_105103839038264 == 1) {
_RV_bc_flag_105103839038264 = 0;
break;
}
if(_RV_bc_flag_105103839038264 == 2) _RV_bc_flag_105103839038264 = 0;
}

_RV_lbl_105103839038344:
__RV_pmd_set_null(&_RV_pmd_A_105103839030264);
__RV_pmd_set_null(&_RV_pmd_u1_105103839030392);
__RV_pmd_set_null(&_RV_pmd_u2_105103839030520);
__RV_pmd_set_null(&_RV_pmd_v1_105103839030648);
__RV_pmd_set_null(&_RV_pmd_v2_105103839030776);
__RV_pmd_set_null(&_RV_pmd_w_105103839030904);
__RV_pmd_set_null(&_RV_pmd_x_105103839031032);
__RV_pmd_set_null(&_RV_pmd_y_105103839031160);
__RV_pmd_set_null(&_RV_pmd_z_105103839031288);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_gemver(__RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, __RV_pmd *p12_pmd, int p1, double p2, double p3, double *p4, double *p5, double *p6, double *p7, double *p8, double *p9, double *p10, double *p11, double *p12)
{
  __RV_fmd_tbl_create((__RV_func_addr)kernel_gemver, 9);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemver, 0, p4_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemver, 1, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemver, 2, p6_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemver, 3, p7_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemver, 4, p8_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemver, 5, p9_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemver, 6, p10_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemver, 7, p11_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_gemver, 8, p12_pmd);
  kernel_gemver(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);
  __RV_fmd_tbl_remove((__RV_func_addr)kernel_gemver);
  __RV_pmd_free_null_ptr(p4_pmd);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
  __RV_pmd_free_null_ptr(p7_pmd);
  __RV_pmd_free_null_ptr(p8_pmd);
  __RV_pmd_free_null_ptr(p9_pmd);
  __RV_pmd_free_null_ptr(p10_pmd);
  __RV_pmd_free_null_ptr(p11_pmd);
  __RV_pmd_free_null_ptr(p12_pmd);
}

static int _RV_fprintf_105103839039432(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, __RV_pmd *vp2_pmd, FILE *stream, const char *fmt, char *vp2)
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
  fprintf(stderr, "../gemver.c: In function 'fprintf':\n");
  fprintf(stderr, "../gemver.c:80:21: error: the format string \"Usage: %%s dump_code n\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../gemver.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../gemver.c", "fprintf", 80, 21, "\"Usage: %s dump_code n\\n\"");
if(is_string[2] == 1 && vp2)
__RV_check_dpv(vp2_pmd, vp2, __RV_sstrlen(vp2)+1, "../gemver.c", "fprintf", 80, 48, "argv[0]");
ret = fprintf(stream, "Usage: %s dump_code n\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
__RV_pmd_free_null_ptr(vp2_pmd);
return ret;
}

static int _RV_fprintf_105103839046640(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../gemver.c: In function 'fprintf':\n");
  fprintf(stderr, "../gemver.c:99:21: error: the format string \"Allocation failed\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../gemver.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../gemver.c", "fprintf", 99, 21, "\"Allocation failed\\n\"");
ret = fprintf(stream, "Allocation failed\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_105103839051560(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "../gemver.c: In function 'fprintf':\n");
  fprintf(stderr, "../gemver.c:111:21: error: the format string \"Check: %%f\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../gemver.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../gemver.c", "fprintf", 111, 21, "\"Check: %f\\n\"");
ret = fprintf(stream, "Check: %f\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

int _RV_main(int argc, char **argv) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_105103839038544 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_105103839040904 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_u1_105103839041592 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_u2_105103839042072 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_v1_105103839042552 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_v2_105103839043032 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_w_105103839043512 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x_105103839043992 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y_105103839044472 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_z_105103839044952 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_105103839038544, argv)
  );

  if (argc < 3) {
    _RV_fprintf_105103839039432(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Usage: %s dump_code n\n"), "Usage: %s dump_code n\n"+23), __RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[0]), stderr/*stderr*/
#line 80
                  , "Usage: %s dump_code n\n", argv[__RV_check_dpv_ss(&_RV_pmd_argv_105103839038544, argv, 0, sizeof(char *), "../gemver.c", "main", 80, 53, "argv[0]")]);
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_105103839039632;
  }
  
_RV_lbl_105103839039632:
if(_RV_ret_flag) goto _RV_lbl_105103839053840;
}

  int dump_code = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[1]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_105103839038544, argv, 1, sizeof(char *), "../gemver.c", "main", 84, 29, "argv[1]")], "../gemver.c", "atoi", 84, 24, "argv[1]");
  int n = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[2]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_105103839038544, argv, 2, sizeof(char *), "../gemver.c", "main", 85, 21, "argv[2]")], "../gemver.c", "atoi", 85, 16, "argv[2]");

  double alpha, beta;
  double *A = (double *)_RV_malloc(&_RV_pmd_A_105103839040904, sizeof(double) * n * n);
  double *u1 = (double *)_RV_malloc(&_RV_pmd_u1_105103839041592, sizeof(double) * n);
  double *u2 = (double *)_RV_malloc(&_RV_pmd_u2_105103839042072, sizeof(double) * n);
  double *v1 = (double *)_RV_malloc(&_RV_pmd_v1_105103839042552, sizeof(double) * n);
  double *v2 = (double *)_RV_malloc(&_RV_pmd_v2_105103839043032, sizeof(double) * n);
  double *w = (double *)_RV_malloc(&_RV_pmd_w_105103839043512, sizeof(double) * n);
  double *x = (double *)_RV_malloc(&_RV_pmd_x_105103839043992, sizeof(double) * n);
  double *y = (double *)_RV_malloc(&_RV_pmd_y_105103839044472, sizeof(double) * n);
  double *z = (double *)_RV_malloc(&_RV_pmd_z_105103839044952, sizeof(double) * n);

  if (!A || !u1 || !u2 || !v1 || !v2 || !w || !x || !y || !z) {
    _RV_fprintf_105103839046640(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Allocation failed\n"), "Allocation failed\n"+19), stderr/*stderr*/
#line 99
                  , "Allocation failed\n");
    _RV_free(&_RV_pmd_A_105103839040904, A, "../gemver.c", "free", 100, 10, "A"); _RV_free(&_RV_pmd_u1_105103839041592, u1, "../gemver.c", "free", 100, 19, "u1"); _RV_free(&_RV_pmd_u2_105103839042072, u2, "../gemver.c", "free", 100, 29, "u2"); _RV_free(&_RV_pmd_v1_105103839042552, v1, "../gemver.c", "free", 100, 39, "v1"); _RV_free(&_RV_pmd_v2_105103839043032, v2, "../gemver.c", "free", 100, 49, "v2");
    _RV_free(&_RV_pmd_w_105103839043512, w, "../gemver.c", "free", 101, 10, "w"); _RV_free(&_RV_pmd_x_105103839043992, x, "../gemver.c", "free", 101, 19, "x"); _RV_free(&_RV_pmd_y_105103839044472, y, "../gemver.c", "free", 101, 28, "y"); _RV_free(&_RV_pmd_z_105103839044952, z, "../gemver.c", "free", 101, 37, "z");
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_105103839048648;
  }
  
_RV_lbl_105103839048648:
if(_RV_ret_flag) goto _RV_lbl_105103839053840;
}

  _RV_init_array(__RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&alpha), &alpha+1), __RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&beta), &beta+1), &_RV_pmd_A_105103839040904, &_RV_pmd_u1_105103839041592, &_RV_pmd_u2_105103839042072, &_RV_pmd_v1_105103839042552, &_RV_pmd_v2_105103839043032, &_RV_pmd_w_105103839043512, &_RV_pmd_x_105103839043992, &_RV_pmd_y_105103839044472, &_RV_pmd_z_105103839044952, n, &alpha, &beta, A, u1, u2, v1, v2, w, x, y, z);
  _RV_kernel_gemver(&_RV_pmd_A_105103839040904, &_RV_pmd_u1_105103839041592, &_RV_pmd_u2_105103839042072, &_RV_pmd_v1_105103839042552, &_RV_pmd_v2_105103839043032, &_RV_pmd_w_105103839043512, &_RV_pmd_x_105103839043992, &_RV_pmd_y_105103839044472, &_RV_pmd_z_105103839044952, n, alpha, beta, A, u1, u2, v1, v2, w, x, y, z);

  if (dump_code == 1) {
    _RV_print_array(&_RV_pmd_w_105103839043512, n, w);
  
_RV_lbl_105103839050976:
if(_RV_ret_flag) goto _RV_lbl_105103839053840;
} else {
if (n > 0) {
    _RV_fprintf_105103839051560(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Check: %f\n"), "Check: %f\n"+11), stderr/*stderr*/
#line 111
                  , "Check: %f\n", w[__RV_check_dpv_ss(&_RV_pmd_w_105103839043512, w, n / 2, sizeof(double), "../gemver.c", "main", 111, 38, "w[n / 2]")]);
  
_RV_lbl_105103839051712:
if(_RV_ret_flag) goto _RV_lbl_105103839051736;
}
_RV_lbl_105103839051736:
if(_RV_ret_flag) goto _RV_lbl_105103839053840;
}


  _RV_free(&_RV_pmd_A_105103839040904, A, "../gemver.c", "free", 114, 8, "A"); _RV_free(&_RV_pmd_u1_105103839041592, u1, "../gemver.c", "free", 114, 17, "u1"); _RV_free(&_RV_pmd_u2_105103839042072, u2, "../gemver.c", "free", 114, 27, "u2"); _RV_free(&_RV_pmd_v1_105103839042552, v1, "../gemver.c", "free", 114, 37, "v1"); _RV_free(&_RV_pmd_v2_105103839043032, v2, "../gemver.c", "free", 114, 47, "v2");
  _RV_free(&_RV_pmd_w_105103839043512, w, "../gemver.c", "free", 115, 8, "w"); _RV_free(&_RV_pmd_x_105103839043992, x, "../gemver.c", "free", 115, 17, "x"); _RV_free(&_RV_pmd_y_105103839044472, y, "../gemver.c", "free", 115, 26, "y"); _RV_free(&_RV_pmd_z_105103839044952, z, "../gemver.c", "free", 115, 35, "z");

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_105103839053840;
  }

_RV_lbl_105103839053840:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_105103839038544, argv);
__RV_pmd_set_null(&_RV_pmd_A_105103839040904);
__RV_pmd_set_null(&_RV_pmd_u1_105103839041592);
__RV_pmd_set_null(&_RV_pmd_u2_105103839042072);
__RV_pmd_set_null(&_RV_pmd_v1_105103839042552);
__RV_pmd_set_null(&_RV_pmd_v2_105103839043032);
__RV_pmd_set_null(&_RV_pmd_w_105103839043512);
__RV_pmd_set_null(&_RV_pmd_x_105103839043992);
__RV_pmd_set_null(&_RV_pmd_y_105103839044472);
__RV_pmd_set_null(&_RV_pmd_z_105103839044952);
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

