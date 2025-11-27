#include "_RV_memsafe.c"
#line 1 "/workspace/examples/mvt.c"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

static void _RV_init_array(__RV_pmd *p2_pmd, __RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, int p1, double *p2, double *p3, double *p4, double *p5, double *p6);

static void init_array(int n,
                       double *x1,
                       double *x2,
                       double *y1,
                       double *y2,
                       double *A) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_106431340831200 = 0;
unsigned char _RV_bc_flag_106431340831120 = 0;
__RV_pmd _RV_pmd_x1_106431340826512 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x2_106431340826640 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y1_106431340826768 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y2_106431340826896 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_106431340827024 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_x1_106431340826512, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_x2_106431340826640, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_y1_106431340826768, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_y2_106431340826896, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_106431340827024, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 4))
  );

  for (int i = 0; i < n; ++i) {
    x1[__RV_check_dpv_ss(&_RV_pmd_x1_106431340826512, x1, i, sizeof(double), "../mvt.c", "init_array", 12, 8, "x1[i]")] = ((double)i) / n;
    x2[__RV_check_dpv_ss(&_RV_pmd_x2_106431340826640, x2, i, sizeof(double), "../mvt.c", "init_array", 13, 8, "x2[i]")] = ((double)i + 1) / n;
    y1[__RV_check_dpv_ss(&_RV_pmd_y1_106431340826768, y1, i, sizeof(double), "../mvt.c", "init_array", 14, 8, "y1[i]")] = ((double)i + 3) / n;
    y2[__RV_check_dpv_ss(&_RV_pmd_y2_106431340826896, y2, i, sizeof(double), "../mvt.c", "init_array", 15, 8, "y2[i]")] = ((double)i + 4) / n;
    for (int j = 0; j < n; ++j) {
      A[__RV_check_dpv_ss(&_RV_pmd_A_106431340827024, A, i * n + j, sizeof(double), "../mvt.c", "init_array", 17, 9, "A[i * n + j]")] = ((double)i * j) / n;
    
_RV_lbl_106431340831120:
if(_RV_ret_flag) goto _RV_lbl_106431340831200;
if(_RV_bc_flag_106431340831120 == 1) {
_RV_bc_flag_106431340831120 = 0;
break;
}
if(_RV_bc_flag_106431340831120 == 2) _RV_bc_flag_106431340831120 = 0;
}
  
_RV_lbl_106431340831200:
if(_RV_ret_flag) goto _RV_lbl_106431340831312;
if(_RV_bc_flag_106431340831200 == 1) {
_RV_bc_flag_106431340831200 = 0;
break;
}
if(_RV_bc_flag_106431340831200 == 2) _RV_bc_flag_106431340831200 = 0;
}

_RV_lbl_106431340831312:
__RV_pmd_set_null(&_RV_pmd_x1_106431340826512);
__RV_pmd_set_null(&_RV_pmd_x2_106431340826640);
__RV_pmd_set_null(&_RV_pmd_y1_106431340826768);
__RV_pmd_set_null(&_RV_pmd_y2_106431340826896);
__RV_pmd_set_null(&_RV_pmd_A_106431340827024);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p2_pmd, __RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, int p1, double *p2, double *p3, double *p4, double *p5, double *p6)
{
  __RV_fmd_tbl_create((__RV_func_addr)init_array, 5);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 0, p2_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 1, p3_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 2, p4_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 3, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 4, p6_pmd);
  init_array(p1, p2, p3, p4, p5, p6);
  __RV_fmd_tbl_remove((__RV_func_addr)init_array);
  __RV_pmd_free_null_ptr(p2_pmd);
  __RV_pmd_free_null_ptr(p3_pmd);
  __RV_pmd_free_null_ptr(p4_pmd);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
}

static void _RV_print_array(__RV_pmd *p2_pmd, __RV_pmd *p3_pmd, int p1, double *p2, double *p3);

static int _RV_fprintf_106431340832976(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2, double vp3)
{
int ret;
const char *p = fmt;
unsigned char is_string[4] = {0};
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
if(fmt_cnt > 2)
{
  fprintf(stderr, "../mvt.c: In function 'fprintf':\n");
  fprintf(stderr, "../mvt.c:24:21: error: the format string \"%%0.6lf %%0.6lf \" takes %d format specifiers but fprintf has only 2 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../mvt.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../mvt.c", "fprintf", 24, 21, "\"%0.6lf %0.6lf \"");
ret = fprintf(stream, "%0.6lf %0.6lf ", vp2, vp3);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_106431340833888(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../mvt.c: In function 'fprintf':\n");
  fprintf(stderr, "../mvt.c:26:23: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../mvt.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../mvt.c", "fprintf", 26, 23, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_106431340834320(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../mvt.c: In function 'fprintf':\n");
  fprintf(stderr, "../mvt.c:29:19: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../mvt.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../mvt.c", "fprintf", 29, 19, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static void print_array(int n, double *x1, double *x2) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_106431340834064 = 0;
__RV_pmd _RV_pmd_x1_106431340831488 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x2_106431340831616 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_x1_106431340831488, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_x2_106431340831616, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 1))
  );

  for (int i = 0; i < n; ++i) {
    _RV_fprintf_106431340832976(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.6lf %0.6lf "), "%0.6lf %0.6lf "+15), stderr/*stderr*/
#line 24
                  , "%0.6lf %0.6lf ", x1[__RV_check_dpv_ss(&_RV_pmd_x1_106431340831488, x1, i, sizeof(double), "../mvt.c", "print_array", 24, 42, "x1[i]")], x2[__RV_check_dpv_ss(&_RV_pmd_x2_106431340831616, x2, i, sizeof(double), "../mvt.c", "print_array", 24, 49, "x2[i]")]);
    if (i % 20 == 0) {
      _RV_fprintf_106431340833888(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 26
                    , "\n");
    
_RV_lbl_106431340834008:
if(_RV_ret_flag) goto _RV_lbl_106431340834064;
if(_RV_bc_flag_106431340834064 == 1 || _RV_bc_flag_106431340834064 == 2) goto _RV_lbl_106431340834064;
}
  
_RV_lbl_106431340834064:
if(_RV_ret_flag) goto _RV_lbl_106431340834440;
if(_RV_bc_flag_106431340834064 == 1) {
_RV_bc_flag_106431340834064 = 0;
break;
}
if(_RV_bc_flag_106431340834064 == 2) _RV_bc_flag_106431340834064 = 0;
}
  _RV_fprintf_106431340834320(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 29
                , "\n");

_RV_lbl_106431340834440:
__RV_pmd_set_null(&_RV_pmd_x1_106431340831488);
__RV_pmd_set_null(&_RV_pmd_x2_106431340831616);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_print_array(__RV_pmd *p2_pmd, __RV_pmd *p3_pmd, int p1, double *p2, double *p3)
{
  __RV_fmd_tbl_create((__RV_func_addr)print_array, 2);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)print_array, 0, p2_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)print_array, 1, p3_pmd);
  print_array(p1, p2, p3);
  __RV_fmd_tbl_remove((__RV_func_addr)print_array);
  __RV_pmd_free_null_ptr(p2_pmd);
  __RV_pmd_free_null_ptr(p3_pmd);
}

static void _RV_kernel_mvt(__RV_pmd *p2_pmd, __RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, int p1, double *p2, double *p3, double *p4, double *p5, double *p6);

static void kernel_mvt(int n,
                       double *x1,
                       double *x2,
                       double *y1,
                       double *y2,
                       double *A) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_106431340837112 = 0;
unsigned char _RV_bc_flag_106431340837032 = 0;
unsigned char _RV_bc_flag_106431340838792 = 0;
unsigned char _RV_bc_flag_106431340838712 = 0;
__RV_pmd _RV_pmd_x1_106431340834624 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x2_106431340834752 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y1_106431340834880 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y2_106431340835008 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_106431340835136 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_x1_106431340834624, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_mvt, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_x2_106431340834752, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_mvt, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_y1_106431340834880, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_mvt, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_y2_106431340835008, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_mvt, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_106431340835136, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_mvt, 4))
  );

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      x1[__RV_check_dpv_ss(&_RV_pmd_x1_106431340834624, x1, i, sizeof(double), "../mvt.c", "kernel_mvt", 40, 10, "x1[i]")] += A[__RV_check_dpv_ss(&_RV_pmd_A_106431340835136, A, i * n + j, sizeof(double), "../mvt.c", "kernel_mvt", 40, 18, "A[i * n + j]")] * y1[__RV_check_dpv_ss(&_RV_pmd_y1_106431340834880, y1, j, sizeof(double), "../mvt.c", "kernel_mvt", 40, 34, "y1[j]")];
    
_RV_lbl_106431340837032:
if(_RV_ret_flag) goto _RV_lbl_106431340837112;
if(_RV_bc_flag_106431340837032 == 1) {
_RV_bc_flag_106431340837032 = 0;
break;
}
if(_RV_bc_flag_106431340837032 == 2) _RV_bc_flag_106431340837032 = 0;
}
  
_RV_lbl_106431340837112:
if(_RV_ret_flag) goto _RV_lbl_106431340838872;
if(_RV_bc_flag_106431340837112 == 1) {
_RV_bc_flag_106431340837112 = 0;
break;
}
if(_RV_bc_flag_106431340837112 == 2) _RV_bc_flag_106431340837112 = 0;
}

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      x2[__RV_check_dpv_ss(&_RV_pmd_x2_106431340834752, x2, i, sizeof(double), "../mvt.c", "kernel_mvt", 46, 10, "x2[i]")] += A[__RV_check_dpv_ss(&_RV_pmd_A_106431340835136, A, j * n + i, sizeof(double), "../mvt.c", "kernel_mvt", 46, 18, "A[j * n + i]")] * y2[__RV_check_dpv_ss(&_RV_pmd_y2_106431340835008, y2, j, sizeof(double), "../mvt.c", "kernel_mvt", 46, 34, "y2[j]")];
    
_RV_lbl_106431340838712:
if(_RV_ret_flag) goto _RV_lbl_106431340838792;
if(_RV_bc_flag_106431340838712 == 1) {
_RV_bc_flag_106431340838712 = 0;
break;
}
if(_RV_bc_flag_106431340838712 == 2) _RV_bc_flag_106431340838712 = 0;
}
  
_RV_lbl_106431340838792:
if(_RV_ret_flag) goto _RV_lbl_106431340838872;
if(_RV_bc_flag_106431340838792 == 1) {
_RV_bc_flag_106431340838792 = 0;
break;
}
if(_RV_bc_flag_106431340838792 == 2) _RV_bc_flag_106431340838792 = 0;
}

_RV_lbl_106431340838872:
__RV_pmd_set_null(&_RV_pmd_x1_106431340834624);
__RV_pmd_set_null(&_RV_pmd_x2_106431340834752);
__RV_pmd_set_null(&_RV_pmd_y1_106431340834880);
__RV_pmd_set_null(&_RV_pmd_y2_106431340835008);
__RV_pmd_set_null(&_RV_pmd_A_106431340835136);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_mvt(__RV_pmd *p2_pmd, __RV_pmd *p3_pmd, __RV_pmd *p4_pmd, __RV_pmd *p5_pmd, __RV_pmd *p6_pmd, int p1, double *p2, double *p3, double *p4, double *p5, double *p6)
{
  __RV_fmd_tbl_create((__RV_func_addr)kernel_mvt, 5);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_mvt, 0, p2_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_mvt, 1, p3_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_mvt, 2, p4_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_mvt, 3, p5_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_mvt, 4, p6_pmd);
  kernel_mvt(p1, p2, p3, p4, p5, p6);
  __RV_fmd_tbl_remove((__RV_func_addr)kernel_mvt);
  __RV_pmd_free_null_ptr(p2_pmd);
  __RV_pmd_free_null_ptr(p3_pmd);
  __RV_pmd_free_null_ptr(p4_pmd);
  __RV_pmd_free_null_ptr(p5_pmd);
  __RV_pmd_free_null_ptr(p6_pmd);
}

static int _RV_fprintf_106431340839944(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, __RV_pmd *vp2_pmd, FILE *stream, const char *fmt, char *vp2)
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
  fprintf(stderr, "../mvt.c: In function 'fprintf':\n");
  fprintf(stderr, "../mvt.c:53:21: error: the format string \"Usage: %%s dump_code n\\n\" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../mvt.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../mvt.c", "fprintf", 53, 21, "\"Usage: %s dump_code n\\n\"");
if(is_string[2] == 1 && vp2)
__RV_check_dpv(vp2_pmd, vp2, __RV_sstrlen(vp2)+1, "../mvt.c", "fprintf", 53, 48, "argv[0]");
ret = fprintf(stream, "Usage: %s dump_code n\n", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
__RV_pmd_free_null_ptr(vp2_pmd);
return ret;
}

static int _RV_fprintf_106431340844416(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "../mvt.c: In function 'fprintf':\n");
  fprintf(stderr, "../mvt.c:67:21: error: the format string \"Allocation failed\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../mvt.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../mvt.c", "fprintf", 67, 21, "\"Allocation failed\\n\"");
ret = fprintf(stream, "Allocation failed\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_106431340847960(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2, double vp3)
{
int ret;
const char *p = fmt;
unsigned char is_string[4] = {0};
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
if(fmt_cnt > 2)
{
  fprintf(stderr, "../mvt.c: In function 'fprintf':\n");
  fprintf(stderr, "../mvt.c:83:21: error: the format string \"Check: %%f %%f\\n\" takes %d format specifiers but fprintf has only 2 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "../mvt.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "../mvt.c", "fprintf", 83, 21, "\"Check: %f %f\\n\"");
ret = fprintf(stream, "Check: %f %f\n", vp2, vp3);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

int _RV_main(int argc, char **argv) {
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_106431340839056 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_106431340841112 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x1_106431340841752 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_x2_106431340842232 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y1_106431340842712 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_y2_106431340843192 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_106431340839056, argv)
  );

  if (argc < 3) {
    _RV_fprintf_106431340839944(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Usage: %s dump_code n\n"), "Usage: %s dump_code n\n"+23), __RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[0]), stderr/*stderr*/
#line 53
                  , "Usage: %s dump_code n\n", argv[__RV_check_dpv_ss(&_RV_pmd_argv_106431340839056, argv, 0, sizeof(char *), "../mvt.c", "main", 53, 53, "argv[0]")]);
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_106431340840144;
  }
  
_RV_lbl_106431340840144:
if(_RV_ret_flag) goto _RV_lbl_106431340849296;
}

  int dump_code = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[1]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_106431340839056, argv, 1, sizeof(char *), "../mvt.c", "main", 57, 29, "argv[1]")], "../mvt.c", "atoi", 57, 24, "argv[1]");
  int n = _RV_atoi(__RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[2]), argv[__RV_check_dpv_ss(&_RV_pmd_argv_106431340839056, argv, 2, sizeof(char *), "../mvt.c", "main", 58, 21, "argv[2]")], "../mvt.c", "atoi", 58, 16, "argv[2]");

  double *A = (double *)_RV_malloc(&_RV_pmd_A_106431340841112, sizeof(double) * n * n);
  double *x1 = (double *)_RV_malloc(&_RV_pmd_x1_106431340841752, sizeof(double) * n);
  double *x2 = (double *)_RV_malloc(&_RV_pmd_x2_106431340842232, sizeof(double) * n);
  double *y1 = (double *)_RV_malloc(&_RV_pmd_y1_106431340842712, sizeof(double) * n);
  double *y2 = (double *)_RV_malloc(&_RV_pmd_y2_106431340843192, sizeof(double) * n);

  if (!A || !x1 || !x2 || !y1 || !y2) {
    _RV_fprintf_106431340844416(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Allocation failed\n"), "Allocation failed\n"+19), stderr/*stderr*/
#line 67
                  , "Allocation failed\n");
    _RV_free(&_RV_pmd_A_106431340841112, A, "../mvt.c", "free", 68, 10, "A");
    _RV_free(&_RV_pmd_x1_106431340841752, x1, "../mvt.c", "free", 69, 10, "x1");
    _RV_free(&_RV_pmd_x2_106431340842232, x2, "../mvt.c", "free", 70, 10, "x2");
    _RV_free(&_RV_pmd_y1_106431340842712, y1, "../mvt.c", "free", 71, 10, "y1");
    _RV_free(&_RV_pmd_y2_106431340843192, y2, "../mvt.c", "free", 72, 10, "y2");
    {
  _RV_ret_val = ( 1);
  _RV_ret_flag = 1;
  goto _RV_lbl_106431340845624;
  }
  
_RV_lbl_106431340845624:
if(_RV_ret_flag) goto _RV_lbl_106431340849296;
}

  _RV_init_array(&_RV_pmd_x1_106431340841752, &_RV_pmd_x2_106431340842232, &_RV_pmd_y1_106431340842712, &_RV_pmd_y2_106431340843192, &_RV_pmd_A_106431340841112, n, x1, x2, y1, y2, A);

  _RV_kernel_mvt(&_RV_pmd_x1_106431340841752, &_RV_pmd_x2_106431340842232, &_RV_pmd_y1_106431340842712, &_RV_pmd_y2_106431340843192, &_RV_pmd_A_106431340841112, n, x1, x2, y1, y2, A);

  if (dump_code == 1) {
    _RV_print_array(&_RV_pmd_x1_106431340841752, &_RV_pmd_x2_106431340842232, n, x1, x2);
  
_RV_lbl_106431340847168:
if(_RV_ret_flag) goto _RV_lbl_106431340849296;
} else {
if (n > 0) {
    _RV_fprintf_106431340847960(__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("Check: %f %f\n"), "Check: %f %f\n"+14), stderr/*stderr*/
#line 83
                  , "Check: %f %f\n", x1[__RV_check_dpv_ss(&_RV_pmd_x1_106431340841752, x1, n / 2, sizeof(double), "../mvt.c", "main", 83, 42, "x1[n / 2]")], x2[__RV_check_dpv_ss(&_RV_pmd_x2_106431340842232, x2, n / 2, sizeof(double), "../mvt.c", "main", 83, 53, "x2[n / 2]")]);
  
_RV_lbl_106431340848144:
if(_RV_ret_flag) goto _RV_lbl_106431340848168;
}
_RV_lbl_106431340848168:
if(_RV_ret_flag) goto _RV_lbl_106431340849296;
}


  _RV_free(&_RV_pmd_A_106431340841112, A, "../mvt.c", "free", 86, 8, "A");
  _RV_free(&_RV_pmd_x1_106431340841752, x1, "../mvt.c", "free", 87, 8, "x1");
  _RV_free(&_RV_pmd_x2_106431340842232, x2, "../mvt.c", "free", 88, 8, "x2");
  _RV_free(&_RV_pmd_y1_106431340842712, y1, "../mvt.c", "free", 89, 8, "y1");
  _RV_free(&_RV_pmd_y2_106431340843192, y2, "../mvt.c", "free", 90, 8, "y2");

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_106431340849296;
  }

_RV_lbl_106431340849296:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_106431340839056, argv);
__RV_pmd_set_null(&_RV_pmd_A_106431340841112);
__RV_pmd_set_null(&_RV_pmd_x1_106431340841752);
__RV_pmd_set_null(&_RV_pmd_x2_106431340842232);
__RV_pmd_set_null(&_RV_pmd_y1_106431340842712);
__RV_pmd_set_null(&_RV_pmd_y2_106431340843192);
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

