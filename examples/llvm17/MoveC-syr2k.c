#include "_RV_memsafe.c"
#line 1 "/workspace/examples/syr2k.c"
#include <stdio.h>
#include <stdlib.h>

static void _RV_init_array(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, int p1, int p2, double *p3, double *p4, double *p5, double *p6, double *p7);

static void init_array(int ni,
                       int nj,
                       double *alpha,
                       double *beta,
                       double *C,
                       double *A,
                       double *B) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_108247283580416 = 0;
unsigned char _RV_bc_flag_108247283579128 = 0;
unsigned char _RV_bc_flag_108247283580336 = 0;
__RV_pmd _RV_pmd_alpha_108247283575568 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_beta_108247283575696 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_108247283575824 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_108247283575952 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_108247283576080 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_alpha_108247283575568, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_beta_108247283575696, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_108247283575824, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_108247283575952, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_108247283576080, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 4))
  );

  *(double *)__RV_check_dpv(&_RV_pmd_alpha_108247283575568, alpha, sizeof(double), "../syr2k.c", "init_array", 11, 4, "alpha") = 32412.0;
  *(double *)__RV_check_dpv(&_RV_pmd_beta_108247283575696, beta, sizeof(double), "../syr2k.c", "init_array", 12, 4, "beta") = 2123.0;
  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < nj; ++j) {
      double val = ((double)i * j) / ni;
      A[__RV_check_dpv_ss(&_RV_pmd_A_108247283575952, A, i * nj + j, sizeof(double), "../syr2k.c", "init_array", 16, 9, "A[i * nj + j]")] = val;
      B[__RV_check_dpv_ss(&_RV_pmd_B_108247283576080, B, i * nj + j, sizeof(double), "../syr2k.c", "init_array", 17, 9, "B[i * nj + j]")] = val;
    
_RV_lbl_108247283579128:
if(_RV_ret_flag) goto _RV_lbl_108247283580416;
if(_RV_bc_flag_108247283579128 == 1) {
_RV_bc_flag_108247283579128 = 0;
break;
}
if(_RV_bc_flag_108247283579128 == 2) _RV_bc_flag_108247283579128 = 0;
}
    for (int j = 0; j < ni; ++j) {
      C[__RV_check_dpv_ss(&_RV_pmd_C_108247283575824, C, i * ni + j, sizeof(double), "../syr2k.c", "init_array", 20, 9, "C[i * ni + j]")] = ((double)i * j) / ni;
    
_RV_lbl_108247283580336:
if(_RV_ret_flag) goto _RV_lbl_108247283580416;
if(_RV_bc_flag_108247283580336 == 1) {
_RV_bc_flag_108247283580336 = 0;
break;
}
if(_RV_bc_flag_108247283580336 == 2) _RV_bc_flag_108247283580336 = 0;
}
  
_RV_lbl_108247283580416:
if(_RV_ret_flag) goto _RV_lbl_108247283580504;
if(_RV_bc_flag_108247283580416 == 1) {
_RV_bc_flag_108247283580416 = 0;
break;
}
if(_RV_bc_flag_108247283580416 == 2) _RV_bc_flag_108247283580416 = 0;
}

_RV_lbl_108247283580504:
__RV_pmd_set_null(&_RV_pmd_alpha_108247283575568);
__RV_pmd_set_null(&_RV_pmd_beta_108247283575696);
__RV_pmd_set_null(&_RV_pmd_C_108247283575824);
__RV_pmd_set_null(&_RV_pmd_A_108247283575952);
__RV_pmd_set_null(&_RV_pmd_B_108247283576080);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, int p1, int p2, double *p3, double *p4, double *p5, double *p6, double *p7)
{
  __RV_fmd_tbl_create((__RV_func_addr)init_array, 5);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 0, p3_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 1, p4_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 2, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 3, p6_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 4, p7_pmd);
  init_array(p1, p2, p3, p4, p5, p6, p7);
  __RV_fmd_tbl_remove((__RV_func_addr)init_array);
  __RV_pmd_free_null_ptr(p3_pmd);
  __RV_pmd_free_null_ptr(p4_pmd);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
  __RV_pmd_free_null_ptr(p7_pmd);
}

static void _RV_print_array(__RV_pmd *p2_pmd, int p1, double *p2);

static int _RV_fprintf_108247283582496(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "../syr2k.c: In function 'fprintf':\n");
  fprintf(stderr, "../syr2k.c:28:23: error: the format string \"%%0.6lf \" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syr2k.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syr2k.c", "fprintf", 28, 23, "\"%0.6lf \"");
ret = fprintf(stream, "%0.6lf ", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_108247283583616(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../syr2k.c: In function 'fprintf':\n");
  fprintf(stderr, "../syr2k.c:30:25: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syr2k.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syr2k.c", "fprintf", 30, 25, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_108247283584128(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../syr2k.c: In function 'fprintf':\n");
  fprintf(stderr, "../syr2k.c:34:19: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syr2k.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syr2k.c", "fprintf", 34, 19, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static void print_array(int ni, double *C) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_108247283583880 = 0;
unsigned char _RV_bc_flag_108247283583792 = 0;
__RV_pmd _RV_pmd_C_108247283580752 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_108247283580752, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < ni; ++j) {
      _RV_fprintf_108247283582496(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.6lf "), "%0.6lf "+8), stderr/*stderr*/
#line 28
                    , "%0.6lf ", C[__RV_check_dpv_ss(&_RV_pmd_C_108247283580752, C, i * ni + j, sizeof(double), "../syr2k.c", "print_array", 28, 36, "C[i * ni + j]")]);
      if (((i * ni + j) % 20) == 0) {
        _RV_fprintf_108247283583616(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 30
                      , "\n");
      
_RV_lbl_108247283583736:
if(_RV_ret_flag) goto _RV_lbl_108247283583792;
if(_RV_bc_flag_108247283583792 == 1 || _RV_bc_flag_108247283583792 == 2) goto _RV_lbl_108247283583792;
}
    
_RV_lbl_108247283583792:
if(_RV_ret_flag) goto _RV_lbl_108247283583880;
if(_RV_bc_flag_108247283583792 == 1) {
_RV_bc_flag_108247283583792 = 0;
break;
}
if(_RV_bc_flag_108247283583792 == 2) _RV_bc_flag_108247283583792 = 0;
}
  
_RV_lbl_108247283583880:
if(_RV_ret_flag) goto _RV_lbl_108247283584248;
if(_RV_bc_flag_108247283583880 == 1) {
_RV_bc_flag_108247283583880 = 0;
break;
}
if(_RV_bc_flag_108247283583880 == 2) _RV_bc_flag_108247283583880 = 0;
}
  _RV_fprintf_108247283584128(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 34
                , "\n");

_RV_lbl_108247283584248:
__RV_pmd_set_null(&_RV_pmd_C_108247283580752);
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

static void _RV_kernel_syr2k(__RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, int p1, int p2, double p3, double p4, double *p5, double *p6, double *p7);

static void kernel_syr2k(int ni,
                         int nj,
                         double alpha,
                         double beta,
                         double *C,
                         double *A,
                         double *B) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_108247283586904 = 0;
unsigned char _RV_bc_flag_108247283586824 = 0;
unsigned char _RV_bc_flag_108247283590328 = 0;
unsigned char _RV_bc_flag_108247283590248 = 0;
unsigned char _RV_bc_flag_108247283590168 = 0;
__RV_pmd _RV_pmd_C_108247283584864 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_108247283584992 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_108247283585120 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_108247283584864, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_syr2k, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_108247283584992, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_syr2k, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_108247283585120, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_syr2k, 2))
  );

  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < ni; ++j) {
      C[__RV_check_dpv_ss(&_RV_pmd_C_108247283584864, C, i * ni + j, sizeof(double), "../syr2k.c", "kernel_syr2k", 46, 9, "C[i * ni + j]")] *= beta;
    
_RV_lbl_108247283586824:
if(_RV_ret_flag) goto _RV_lbl_108247283586904;
if(_RV_bc_flag_108247283586824 == 1) {
_RV_bc_flag_108247283586824 = 0;
break;
}
if(_RV_bc_flag_108247283586824 == 2) _RV_bc_flag_108247283586824 = 0;
}
  
_RV_lbl_108247283586904:
if(_RV_ret_flag) goto _RV_lbl_108247283590408;
if(_RV_bc_flag_108247283586904 == 1) {
_RV_bc_flag_108247283586904 = 0;
break;
}
if(_RV_bc_flag_108247283586904 == 2) _RV_bc_flag_108247283586904 = 0;
}

  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < ni; ++j) {
      for (int k = 0; k < nj; ++k) {
        C[__RV_check_dpv_ss(&_RV_pmd_C_108247283584864, C, i * ni + j, sizeof(double), "../syr2k.c", "kernel_syr2k", 53, 11, "C[i * ni + j]")] += alpha * A[__RV_check_dpv_ss(&_RV_pmd_A_108247283584992, A, i * nj + k, sizeof(double), "../syr2k.c", "kernel_syr2k", 53, 36, "A[i * nj + k]")] * B[__RV_check_dpv_ss(&_RV_pmd_B_108247283585120, B, j * nj + k, sizeof(double), "../syr2k.c", "kernel_syr2k", 53, 52, "B[j * nj + k]")] +
                         alpha * B[__RV_check_dpv_ss(&_RV_pmd_B_108247283585120, B, i * nj + k, sizeof(double), "../syr2k.c", "kernel_syr2k", 54, 36, "B[i * nj + k]")] * A[__RV_check_dpv_ss(&_RV_pmd_A_108247283584992, A, j * nj + k, sizeof(double), "../syr2k.c", "kernel_syr2k", 54, 52, "A[j * nj + k]")];
      
_RV_lbl_108247283590168:
if(_RV_ret_flag) goto _RV_lbl_108247283590248;
if(_RV_bc_flag_108247283590168 == 1) {
_RV_bc_flag_108247283590168 = 0;
break;
}
if(_RV_bc_flag_108247283590168 == 2) _RV_bc_flag_108247283590168 = 0;
}
    
_RV_lbl_108247283590248:
if(_RV_ret_flag) goto _RV_lbl_108247283590328;
if(_RV_bc_flag_108247283590248 == 1) {
_RV_bc_flag_108247283590248 = 0;
break;
}
if(_RV_bc_flag_108247283590248 == 2) _RV_bc_flag_108247283590248 = 0;
}
  
_RV_lbl_108247283590328:
if(_RV_ret_flag) goto _RV_lbl_108247283590408;
if(_RV_bc_flag_108247283590328 == 1) {
_RV_bc_flag_108247283590328 = 0;
break;
}
if(_RV_bc_flag_108247283590328 == 2) _RV_bc_flag_108247283590328 = 0;
}

_RV_lbl_108247283590408:
__RV_pmd_set_null(&_RV_pmd_C_108247283584864);
__RV_pmd_set_null(&_RV_pmd_A_108247283584992);
__RV_pmd_set_null(&_RV_pmd_B_108247283585120);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_syr2k(__RV_pmd *p5_pmd, __RV_pmd *p6_pmd, __RV_pmd *p7_pmd, int p1, int p2, double p3, double p4, double *p5, double *p6, double *p7)
{
  __RV_fmd_tbl_create((__RV_func_addr)kernel_syr2k, 3);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_syr2k, 0, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_syr2k, 1, p6_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_syr2k, 2, p7_pmd);
  kernel_syr2k(p1, p2, p3, p4, p5, p6, p7);
  __RV_fmd_tbl_remove((__RV_func_addr)kernel_syr2k);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
  __RV_pmd_free_null_ptr(p7_pmd);
}

static int _RV_fprintf_108247283591488(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, __RV_pmd *vp2_pmd, FILE *stream, const char *fmt, char *vp2)
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
  fprintf(stderr, "../syr2k.c: In function 'fprintf':\n");
  fprintf(stderr, "../syr2k.c:62:21: error: the format string \"Usage: %%s dump_code ni nj\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syr2k.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syr2k.c", "fprintf", 62, 21, "\"Usage: %s dump_code ni nj\\n\"");
if(is_string[2] == 1 && vp2)
__RV_check_dpv(vp2_pmd, vp2, __RV_sstrlen(vp2)+1, "../syr2k.c", "fprintf", 62, 52, "argv[0]");
ret = fprintf(stream, "Usage: %s dump_code ni nj\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
__RV_pmd_free_null_ptr(vp2_pmd);
return ret;
}

static int _RV_fprintf_108247283595744(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../syr2k.c: In function 'fprintf':\n");
  fprintf(stderr, "../syr2k.c:76:21: error: the format string \"Allocation failed\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syr2k.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syr2k.c", "fprintf", 76, 21, "\"Allocation failed\\n\"");
ret = fprintf(stream, "Allocation failed\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_108247283599128(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "../syr2k.c: In function 'fprintf':\n");
  fprintf(stderr, "../syr2k.c:90:21: error: the format string \"Check: %%f\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../syr2k.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../syr2k.c", "fprintf", 90, 21, "\"Check: %f\\n\"");
ret = fprintf(stream, "Check: %f\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

int _RV_main(int argc, char **argv) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_108247283590592 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_108247283593400 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_108247283594040 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_108247283594632 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_108247283590592, argv)
  );

  if (argc < 4) {
    _RV_fprintf_108247283591488(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Usage: %s dump_code ni nj\n"), "Usage: %s dump_code ni nj\n"+27), __RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[0]), stderr/*stderr*/
#line 62
                  , "Usage: %s dump_code ni nj\n", argv[__RV_check_dpv_ss(&_RV_pmd_argv_108247283590592, argv, 0, sizeof(char *), "../syr2k.c", "main", 62, 57, "argv[0]")]);
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_108247283591688;
  }
  
_RV_lbl_108247283591688:
if(_RV_ret_flag) goto _RV_lbl_108247283600032;
}

  int dump_code = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[1]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_108247283590592, argv, 1, sizeof(char *), "../syr2k.c", "main", 66, 29, "argv[1]")], "../syr2k.c", "atoi", 66, 24, "argv[1]");
  int ni = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[2]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_108247283590592, argv, 2, sizeof(char *), "../syr2k.c", "main", 67, 22, "argv[2]")], "../syr2k.c", "atoi", 67, 17, "argv[2]");
  int nj = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[3]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_108247283590592, argv, 3, sizeof(char *), "../syr2k.c", "main", 68, 22, "argv[3]")], "../syr2k.c", "atoi", 68, 17, "argv[3]");

  double alpha, beta;
  double *C = (double *)_RV_malloc(&_RV_pmd_C_108247283593400, sizeof(double) * ni * ni);
  double *A = (double *)_RV_malloc(&_RV_pmd_A_108247283594040, sizeof(double) * ni * nj);
  double *B = (double *)_RV_malloc(&_RV_pmd_B_108247283594632, sizeof(double) * ni * nj);

  if (!C || !A || !B) {
    _RV_fprintf_108247283595744(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Allocation failed\n"), "Allocation failed\n"+19), stderr/*stderr*/
#line 76
                  , "Allocation failed\n");
    _RV_free(&_RV_pmd_C_108247283593400, C, "../syr2k.c", "free", 77, 10, "C");
    _RV_free(&_RV_pmd_A_108247283594040, A, "../syr2k.c", "free", 78, 10, "A");
    _RV_free(&_RV_pmd_B_108247283594632, B, "../syr2k.c", "free", 79, 10, "B");
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_108247283596552;
  }
  
_RV_lbl_108247283596552:
if(_RV_ret_flag) goto _RV_lbl_108247283600032;
}

  _RV_init_array(__RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&alpha), &alpha+1), __RV_pmd_create(NULL, __RV_stack_sa, __RV_stack, (void *)(&beta), &beta+1), &_RV_pmd_C_108247283593400, &_RV_pmd_A_108247283594040, &_RV_pmd_B_108247283594632, ni, nj, &alpha, &beta, C, A, B);

  _RV_kernel_syr2k(&_RV_pmd_C_108247283593400, &_RV_pmd_A_108247283594040, &_RV_pmd_B_108247283594632, ni, nj, alpha, beta, C, A, B);

  if (dump_code == 1) {
    _RV_print_array(&_RV_pmd_C_108247283593400, ni, C);
  
_RV_lbl_108247283598240:
if(_RV_ret_flag) goto _RV_lbl_108247283600032;
} else {
if (ni > 0) {
    _RV_fprintf_108247283599128(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Check: %f\n"), "Check: %f\n"+11), stderr/*stderr*/
#line 90
                  , "Check: %f\n", C[__RV_check_dpv_ss(&_RV_pmd_C_108247283593400, C, (ni / 2) * ni + (ni / 2), sizeof(double), "../syr2k.c", "main", 90, 38, "C[(ni / 2) * ni + (ni / 2)]")]);
  
_RV_lbl_108247283599280:
if(_RV_ret_flag) goto _RV_lbl_108247283599304;
}
_RV_lbl_108247283599304:
if(_RV_ret_flag) goto _RV_lbl_108247283600032;
}


  _RV_free(&_RV_pmd_C_108247283593400, C, "../syr2k.c", "free", 93, 8, "C");
  _RV_free(&_RV_pmd_A_108247283594040, A, "../syr2k.c", "free", 94, 8, "A");
  _RV_free(&_RV_pmd_B_108247283594632, B, "../syr2k.c", "free", 95, 8, "B");

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_108247283600032;
  }

_RV_lbl_108247283600032:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_108247283590592, argv);
__RV_pmd_set_null(&_RV_pmd_C_108247283593400);
__RV_pmd_set_null(&_RV_pmd_A_108247283594040);
__RV_pmd_set_null(&_RV_pmd_B_108247283594632);
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

