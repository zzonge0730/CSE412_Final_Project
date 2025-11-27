#include "_RV_memsafe.c"
#line 1 "/workspace/examples/atax.c"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

static void _RV_init_array(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, int p1, int p2, double *p3, double *p4);

static void init_array(int nx, int ny, double *A, double *x) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_102478363978520 = 0;
unsigned char _RV_bc_flag_102478363980272 = 0;
unsigned char _RV_bc_flag_102478363980192 = 0;
__RV_pmd _RV_pmd_A_102478363977248 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x_102478363977376 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_102478363977248, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_x_102478363977376, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1))
  );

  for (int i = 0; i < ny; ++i) {
    x[__RV_check_dpv_ss(&_RV_pmd_x_102478363977376, x, i, sizeof(double), "../atax.c", "init_array", 7, 7, "x[i]")] = i * 3.14159265358979323846/*M_PI*/
#line 7
                   ;
  
_RV_lbl_102478363978520:
if(_RV_ret_flag) goto _RV_lbl_102478363980352;
if(_RV_bc_flag_102478363978520 == 1) {
_RV_bc_flag_102478363978520 = 0;
break;
}
if(_RV_bc_flag_102478363978520 == 2) _RV_bc_flag_102478363978520 = 0;
}
  for (int i = 0; i < nx; ++i) {
    for (int j = 0; j < ny; ++j) {
      A[__RV_check_dpv_ss(&_RV_pmd_A_102478363977248, A, i * ny + j, sizeof(double), "../atax.c", "init_array", 11, 9, "A[i * ny + j]")] = ((double)i * (j + 1)) / nx;
    
_RV_lbl_102478363980192:
if(_RV_ret_flag) goto _RV_lbl_102478363980272;
if(_RV_bc_flag_102478363980192 == 1) {
_RV_bc_flag_102478363980192 = 0;
break;
}
if(_RV_bc_flag_102478363980192 == 2) _RV_bc_flag_102478363980192 = 0;
}
  
_RV_lbl_102478363980272:
if(_RV_ret_flag) goto _RV_lbl_102478363980352;
if(_RV_bc_flag_102478363980272 == 1) {
_RV_bc_flag_102478363980272 = 0;
break;
}
if(_RV_bc_flag_102478363980272 == 2) _RV_bc_flag_102478363980272 = 0;
}

_RV_lbl_102478363980352:
__RV_pmd_set_null(&_RV_pmd_A_102478363977248);
__RV_pmd_set_null(&_RV_pmd_x_102478363977376);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, int p1, int p2, double *p3, double *p4)
{
  __RV_fmd_tbl_create((__RV_func_addr)init_array, 2);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 0, p3_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 1, p4_pmd);
  init_array(p1, p2, p3, p4);
  __RV_fmd_tbl_remove((__RV_func_addr)init_array);
  __RV_pmd_free_null_ptr(p3_pmd);
  __RV_pmd_free_null_ptr(p4_pmd);
}

static void _RV_print_array(__RV_pmd *p2_pmd, int p1, double *p2);

static int _RV_fprintf_102478363981824(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "../atax.c: In function 'fprintf':\n");
  fprintf(stderr, "../atax.c:18:21: error: the format string \"%%0.6lf \" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../atax.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../atax.c", "fprintf", 18, 21, "\"%0.6lf \"");
ret = fprintf(stream, "%0.6lf ", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_102478363982704(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../atax.c: In function 'fprintf':\n");
  fprintf(stderr, "../atax.c:20:23: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../atax.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../atax.c", "fprintf", 20, 23, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_102478363983136(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../atax.c: In function 'fprintf':\n");
  fprintf(stderr, "../atax.c:23:19: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../atax.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../atax.c", "fprintf", 23, 19, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static void print_array(int ny, double *y) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_102478363982880 = 0;
__RV_pmd _RV_pmd_y_102478363980640 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_y_102478363980640, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  for (int i = 0; i < ny; ++i) {
    _RV_fprintf_102478363981824(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.6lf "), "%0.6lf "+8), stderr/*stderr*/
#line 18
                  , "%0.6lf ", y[__RV_check_dpv_ss(&_RV_pmd_y_102478363980640, y, i, sizeof(double), "../atax.c", "print_array", 18, 34, "y[i]")]);
    if (i % 20 == 0) {
      _RV_fprintf_102478363982704(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 20
                    , "\n");
    
_RV_lbl_102478363982824:
if(_RV_ret_flag) goto _RV_lbl_102478363982880;
if(_RV_bc_flag_102478363982880 == 1 || _RV_bc_flag_102478363982880 == 2) goto _RV_lbl_102478363982880;
}
  
_RV_lbl_102478363982880:
if(_RV_ret_flag) goto _RV_lbl_102478363983256;
if(_RV_bc_flag_102478363982880 == 1) {
_RV_bc_flag_102478363982880 = 0;
break;
}
if(_RV_bc_flag_102478363982880 == 2) _RV_bc_flag_102478363982880 = 0;
}
  _RV_fprintf_102478363983136(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 23
                , "\n");

_RV_lbl_102478363983256:
__RV_pmd_set_null(&_RV_pmd_y_102478363980640);
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

static void _RV_kernel_atax(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, int p1, int p2, double *p3, double *p4, double *p5, double *p6);

static void kernel_atax(int nx,
                        int ny,
                        double *A,
                        double *x,
                        double *y,
                        double *tmp) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_102478363985032 = 0;
unsigned char _RV_bc_flag_102478363988104 = 0;
unsigned char _RV_bc_flag_102478363986824 = 0;
unsigned char _RV_bc_flag_102478363988024 = 0;
__RV_pmd _RV_pmd_A_102478363983568 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x_102478363983696 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y_102478363983824 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_tmp_102478363983952 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_102478363983568, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_atax, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_x_102478363983696, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_atax, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_y_102478363983824, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_atax, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_tmp_102478363983952, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_atax, 3))
  );

  for (int i = 0; i < ny; ++i) {
    y[__RV_check_dpv_ss(&_RV_pmd_y_102478363983824, y, i, sizeof(double), "../atax.c", "kernel_atax", 33, 7, "y[i]")] = 0.0;
  
_RV_lbl_102478363985032:
if(_RV_ret_flag) goto _RV_lbl_102478363988200;
if(_RV_bc_flag_102478363985032 == 1) {
_RV_bc_flag_102478363985032 = 0;
break;
}
if(_RV_bc_flag_102478363985032 == 2) _RV_bc_flag_102478363985032 = 0;
}

  for (int i = 0; i < nx; ++i) {
    tmp[__RV_check_dpv_ss(&_RV_pmd_tmp_102478363983952, tmp, i, sizeof(double), "../atax.c", "kernel_atax", 37, 9, "tmp[i]")] = 0.0;
    for (int j = 0; j < ny; ++j) {
      tmp[__RV_check_dpv_ss(&_RV_pmd_tmp_102478363983952, tmp, i, sizeof(double), "../atax.c", "kernel_atax", 39, 11, "tmp[i]")] += A[__RV_check_dpv_ss(&_RV_pmd_A_102478363983568, A, i * ny + j, sizeof(double), "../atax.c", "kernel_atax", 39, 19, "A[i * ny + j]")] * x[__RV_check_dpv_ss(&_RV_pmd_x_102478363983696, x, j, sizeof(double), "../atax.c", "kernel_atax", 39, 35, "x[j]")];
    
_RV_lbl_102478363986824:
if(_RV_ret_flag) goto _RV_lbl_102478363988104;
if(_RV_bc_flag_102478363986824 == 1) {
_RV_bc_flag_102478363986824 = 0;
break;
}
if(_RV_bc_flag_102478363986824 == 2) _RV_bc_flag_102478363986824 = 0;
}
    for (int j = 0; j < ny; ++j) {
      y[__RV_check_dpv_ss(&_RV_pmd_y_102478363983824, y, j, sizeof(double), "../atax.c", "kernel_atax", 42, 9, "y[j]")] += A[__RV_check_dpv_ss(&_RV_pmd_A_102478363983568, A, i * ny + j, sizeof(double), "../atax.c", "kernel_atax", 42, 17, "A[i * ny + j]")] * tmp[__RV_check_dpv_ss(&_RV_pmd_tmp_102478363983952, tmp, i, sizeof(double), "../atax.c", "kernel_atax", 42, 35, "tmp[i]")];
    
_RV_lbl_102478363988024:
if(_RV_ret_flag) goto _RV_lbl_102478363988104;
if(_RV_bc_flag_102478363988024 == 1) {
_RV_bc_flag_102478363988024 = 0;
break;
}
if(_RV_bc_flag_102478363988024 == 2) _RV_bc_flag_102478363988024 = 0;
}
  
_RV_lbl_102478363988104:
if(_RV_ret_flag) goto _RV_lbl_102478363988200;
if(_RV_bc_flag_102478363988104 == 1) {
_RV_bc_flag_102478363988104 = 0;
break;
}
if(_RV_bc_flag_102478363988104 == 2) _RV_bc_flag_102478363988104 = 0;
}

_RV_lbl_102478363988200:
__RV_pmd_set_null(&_RV_pmd_A_102478363983568);
__RV_pmd_set_null(&_RV_pmd_x_102478363983696);
__RV_pmd_set_null(&_RV_pmd_y_102478363983824);
__RV_pmd_set_null(&_RV_pmd_tmp_102478363983952);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_atax(__RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, int p1, int p2, double *p3, double *p4, double *p5, double *p6)
{
  __RV_fmd_tbl_create((__RV_func_addr)kernel_atax, 4);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_atax, 0, p3_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_atax, 1, p4_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_atax, 2, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_atax, 3, p6_pmd);
  kernel_atax(p1, p2, p3, p4, p5, p6);
  __RV_fmd_tbl_remove((__RV_func_addr)kernel_atax);
  __RV_pmd_free_null_ptr(p3_pmd);
  __RV_pmd_free_null_ptr(p4_pmd);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
}

static int _RV_fprintf_102478363989312(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, __RV_pmd *vp2_pmd, FILE *stream, const char *fmt, char *vp2)
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
  fprintf(stderr, "../atax.c: In function 'fprintf':\n");
  fprintf(stderr, "../atax.c:49:21: error: the format string \"Usage: %%s dump_code nx ny\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../atax.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../atax.c", "fprintf", 49, 21, "\"Usage: %s dump_code nx ny\\n\"");
if(is_string[2] == 1 && vp2)
__RV_check_dpv(vp2_pmd, vp2, __RV_sstrlen(vp2)+1, "../atax.c", "fprintf", 49, 52, "argv[0]");
ret = fprintf(stream, "Usage: %s dump_code nx ny\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
__RV_pmd_free_null_ptr(vp2_pmd);
return ret;
}

static int _RV_fprintf_102478363993600(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../atax.c: In function 'fprintf':\n");
  fprintf(stderr, "../atax.c:63:21: error: the format string \"Allocation failed\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../atax.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../atax.c", "fprintf", 63, 21, "\"Allocation failed\\n\"");
ret = fprintf(stream, "Allocation failed\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_102478363996568(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "../atax.c: In function 'fprintf':\n");
  fprintf(stderr, "../atax.c:78:21: error: the format string \"Check: %%f\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../atax.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../atax.c", "fprintf", 78, 21, "\"Check: %f\\n\"");
ret = fprintf(stream, "Check: %f\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

int _RV_main(int argc, char **argv) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_102478363988384 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_102478363990888 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x_102478363991528 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y_102478363992008 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_tmp_102478363992488 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_102478363988384, argv)
  );

  if (argc < 4) {
    _RV_fprintf_102478363989312(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Usage: %s dump_code nx ny\n"), "Usage: %s dump_code nx ny\n"+27), __RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[0]), stderr/*stderr*/
#line 49
                  , "Usage: %s dump_code nx ny\n", argv[__RV_check_dpv_ss(&_RV_pmd_argv_102478363988384, argv, 0, sizeof(char *), "../atax.c", "main", 49, 57, "argv[0]")]);
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_102478363989512;
  }
  
_RV_lbl_102478363989512:
if(_RV_ret_flag) goto _RV_lbl_102478363997704;
}

  int dump_code = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[1]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_102478363988384, argv, 1, sizeof(char *), "../atax.c", "main", 53, 29, "argv[1]")], "../atax.c", "atoi", 53, 24, "argv[1]");
  int nx = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[2]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_102478363988384, argv, 2, sizeof(char *), "../atax.c", "main", 54, 22, "argv[2]")], "../atax.c", "atoi", 54, 17, "argv[2]");
  int ny = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[3]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_102478363988384, argv, 3, sizeof(char *), "../atax.c", "main", 55, 22, "argv[3]")], "../atax.c", "atoi", 55, 17, "argv[3]");

  double *A = (double *)_RV_malloc(&_RV_pmd_A_102478363990888, sizeof(double) * nx * ny);
  double *x = (double *)_RV_malloc(&_RV_pmd_x_102478363991528, sizeof(double) * ny);
  double *y = (double *)_RV_malloc(&_RV_pmd_y_102478363992008, sizeof(double) * ny);
  double *tmp = (double *)_RV_malloc(&_RV_pmd_tmp_102478363992488, sizeof(double) * nx);

  if (!A || !x || !y || !tmp) {
    _RV_fprintf_102478363993600(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Allocation failed\n"), "Allocation failed\n"+19), stderr/*stderr*/
#line 63
                  , "Allocation failed\n");
    _RV_free(&_RV_pmd_A_102478363990888, A, "../atax.c", "free", 64, 10, "A");
    _RV_free(&_RV_pmd_x_102478363991528, x, "../atax.c", "free", 65, 10, "x");
    _RV_free(&_RV_pmd_y_102478363992008, y, "../atax.c", "free", 66, 10, "y");
    _RV_free(&_RV_pmd_tmp_102478363992488, tmp, "../atax.c", "free", 67, 10, "tmp");
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_102478363994608;
  }
  
_RV_lbl_102478363994608:
if(_RV_ret_flag) goto _RV_lbl_102478363997704;
}

  _RV_init_array(&_RV_pmd_A_102478363990888, &_RV_pmd_x_102478363991528, nx, ny, A, x);

  _RV_kernel_atax(&_RV_pmd_A_102478363990888, &_RV_pmd_x_102478363991528, &_RV_pmd_y_102478363992008, &_RV_pmd_tmp_102478363992488, nx, ny, A, x, y, tmp);

  if (dump_code == 1) {
    _RV_print_array(&_RV_pmd_y_102478363992008, ny, y);
  
_RV_lbl_102478363995984:
if(_RV_ret_flag) goto _RV_lbl_102478363997704;
} else {
if (ny > 0) {
    _RV_fprintf_102478363996568(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Check: %f\n"), "Check: %f\n"+11), stderr/*stderr*/
#line 78
                  , "Check: %f\n", y[__RV_check_dpv_ss(&_RV_pmd_y_102478363992008, y, ny / 2, sizeof(double), "../atax.c", "main", 78, 38, "y[ny / 2]")]);
  
_RV_lbl_102478363996720:
if(_RV_ret_flag) goto _RV_lbl_102478363996744;
}
_RV_lbl_102478363996744:
if(_RV_ret_flag) goto _RV_lbl_102478363997704;
}


  _RV_free(&_RV_pmd_A_102478363990888, A, "../atax.c", "free", 81, 8, "A");
  _RV_free(&_RV_pmd_x_102478363991528, x, "../atax.c", "free", 82, 8, "x");
  _RV_free(&_RV_pmd_y_102478363992008, y, "../atax.c", "free", 83, 8, "y");
  _RV_free(&_RV_pmd_tmp_102478363992488, tmp, "../atax.c", "free", 84, 8, "tmp");

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_102478363997704;
  }

_RV_lbl_102478363997704:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_102478363988384, argv);
__RV_pmd_set_null(&_RV_pmd_A_102478363990888);
__RV_pmd_set_null(&_RV_pmd_x_102478363991528);
__RV_pmd_set_null(&_RV_pmd_y_102478363992008);
__RV_pmd_set_null(&_RV_pmd_tmp_102478363992488);
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

