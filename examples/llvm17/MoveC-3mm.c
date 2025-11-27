#include "_RV_memsafe.c"
#line 1 "/workspace/examples/llvm17/3mm-base.c"
/**
 * 3mm.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include <polybench.h>

/* Include benchmark-specific header. */
/* Default data type is double, default size is 4000. */
#include "3mm.h"


/* Array initialization. */
static void _RV_init_array(__RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, int p1, int p2, int p3, int p4, int p5, double p6[1024][1024], double p7[1024][1024], double p8[1024][1024], double p9[1024][1024]);

static
void init_array(int ni, int nj, int nk, int nl, int nm,
		double/*DATA_TYPE*/
#line 24
            A [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 24
                        /*(A,NI,NK,ni,nk)*/
#line 24
                                       ,
		double/*DATA_TYPE*/
#line 25
            B [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 25
                        /*(B,NK,NJ,nk,nj)*/
#line 25
                                       ,
		double/*DATA_TYPE*/
#line 26
            C [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 26
                        /*(C,NJ,NM,nj,nm)*/
#line 26
                                       ,
		double/*DATA_TYPE*/
#line 27
            D [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 27
                        /*(D,NM,NL,nm,nl)*/
#line 27
                                       )
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_105309783223928 = 0;
unsigned char _RV_bc_flag_105309783223896 = 0;
unsigned char _RV_bc_flag_105309783225392 = 0;
unsigned char _RV_bc_flag_105309783225360 = 0;
unsigned char _RV_bc_flag_105309783226856 = 0;
unsigned char _RV_bc_flag_105309783226824 = 0;
unsigned char _RV_bc_flag_105309783228320 = 0;
unsigned char _RV_bc_flag_105309783228288 = 0;
__RV_pmd _RV_pmd_A_105309783176048 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_105309783176464 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_105309783176880 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_105309783177296 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_105309783176048, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_105309783176464, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_105309783176880, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_105309783177296, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)init_array, 3))
  );

  int i, j;

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nk; j++)
      {
A[__RV_check_dpv_ss(&_RV_pmd_A_105309783176048, A, i, sizeof(double [1024]), "3mm-base.c", "init_array", 33, 9, "A[i]")][__RV_check_dpv_ss(&_RV_pmd_A_105309783176048, A[i], j, sizeof(double), "3mm-base.c", "init_array", 33, 12, "A[i][j]")] = ((double/*DATA_TYPE*/
#line 33
                           ) i*j) / ni;
_RV_lbl_105309783223896:
if(_RV_ret_flag) goto _RV_lbl_105309783223928;
if(_RV_bc_flag_105309783223896 == 1) {
_RV_bc_flag_105309783223896 = 0;
break;
}
if(_RV_bc_flag_105309783223896 == 2) _RV_bc_flag_105309783223896 = 0;
}

_RV_lbl_105309783223928:
if(_RV_ret_flag) goto _RV_lbl_105309783228432;
if(_RV_bc_flag_105309783223928 == 1) {
_RV_bc_flag_105309783223928 = 0;
break;
}
if(_RV_bc_flag_105309783223928 == 2) _RV_bc_flag_105309783223928 = 0;
}

  for (i = 0; i < nk; i++)
    {
for (j = 0; j < nj; j++)
      {
B[__RV_check_dpv_ss(&_RV_pmd_B_105309783176464, B, i, sizeof(double [1024]), "3mm-base.c", "init_array", 36, 9, "B[i]")][__RV_check_dpv_ss(&_RV_pmd_B_105309783176464, B[i], j, sizeof(double), "3mm-base.c", "init_array", 36, 12, "B[i][j]")] = ((double/*DATA_TYPE*/
#line 36
                           ) i*(j+1)) / nj;
_RV_lbl_105309783225360:
if(_RV_ret_flag) goto _RV_lbl_105309783225392;
if(_RV_bc_flag_105309783225360 == 1) {
_RV_bc_flag_105309783225360 = 0;
break;
}
if(_RV_bc_flag_105309783225360 == 2) _RV_bc_flag_105309783225360 = 0;
}

_RV_lbl_105309783225392:
if(_RV_ret_flag) goto _RV_lbl_105309783228432;
if(_RV_bc_flag_105309783225392 == 1) {
_RV_bc_flag_105309783225392 = 0;
break;
}
if(_RV_bc_flag_105309783225392 == 2) _RV_bc_flag_105309783225392 = 0;
}

  for (i = 0; i < nj; i++)
    {
for (j = 0; j < nm; j++)
      {
C[__RV_check_dpv_ss(&_RV_pmd_C_105309783176880, C, i, sizeof(double [1024]), "3mm-base.c", "init_array", 39, 9, "C[i]")][__RV_check_dpv_ss(&_RV_pmd_C_105309783176880, C[i], j, sizeof(double), "3mm-base.c", "init_array", 39, 12, "C[i][j]")] = ((double/*DATA_TYPE*/
#line 39
                           ) i*(j+3)) / nl;
_RV_lbl_105309783226824:
if(_RV_ret_flag) goto _RV_lbl_105309783226856;
if(_RV_bc_flag_105309783226824 == 1) {
_RV_bc_flag_105309783226824 = 0;
break;
}
if(_RV_bc_flag_105309783226824 == 2) _RV_bc_flag_105309783226824 = 0;
}

_RV_lbl_105309783226856:
if(_RV_ret_flag) goto _RV_lbl_105309783228432;
if(_RV_bc_flag_105309783226856 == 1) {
_RV_bc_flag_105309783226856 = 0;
break;
}
if(_RV_bc_flag_105309783226856 == 2) _RV_bc_flag_105309783226856 = 0;
}

  for (i = 0; i < nm; i++)
    {
for (j = 0; j < nl; j++)
      {
D[__RV_check_dpv_ss(&_RV_pmd_D_105309783177296, D, i, sizeof(double [1024]), "3mm-base.c", "init_array", 42, 9, "D[i]")][__RV_check_dpv_ss(&_RV_pmd_D_105309783177296, D[i], j, sizeof(double), "3mm-base.c", "init_array", 42, 12, "D[i][j]")] = ((double/*DATA_TYPE*/
#line 42
                           ) i*(j+2)) / nk;
_RV_lbl_105309783228288:
if(_RV_ret_flag) goto _RV_lbl_105309783228320;
if(_RV_bc_flag_105309783228288 == 1) {
_RV_bc_flag_105309783228288 = 0;
break;
}
if(_RV_bc_flag_105309783228288 == 2) _RV_bc_flag_105309783228288 = 0;
}

_RV_lbl_105309783228320:
if(_RV_ret_flag) goto _RV_lbl_105309783228432;
if(_RV_bc_flag_105309783228320 == 1) {
_RV_bc_flag_105309783228320 = 0;
break;
}
if(_RV_bc_flag_105309783228320 == 2) _RV_bc_flag_105309783228320 = 0;
}


_RV_lbl_105309783228432:
__RV_pmd_set_null(&_RV_pmd_A_105309783176048);
__RV_pmd_set_null(&_RV_pmd_B_105309783176464);
__RV_pmd_set_null(&_RV_pmd_C_105309783176880);
__RV_pmd_set_null(&_RV_pmd_D_105309783177296);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_init_array(__RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, int p1, int p2, int p3, int p4, int p5, double p6[1024][1024], double p7[1024][1024], double p8[1024][1024], double p9[1024][1024])
{
  __RV_fmd_tbl_create((__RV_func_addr)init_array, 4);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 0, p6_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 1, p7_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 2, p8_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)init_array, 3, p9_pmd);
  init_array(p1, p2, p3, p4, p5, p6, p7, p8, p9);
  __RV_fmd_tbl_remove((__RV_func_addr)init_array);
  __RV_pmd_free_null_ptr(p6_pmd);
  __RV_pmd_free_null_ptr(p7_pmd);
  __RV_pmd_free_null_ptr(p8_pmd);
  __RV_pmd_free_null_ptr(p9_pmd);
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double p3[1024][1024]);

static int _RV_fprintf_105309783230944(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt, double vp2)
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
  fprintf(stderr, "3mm-base.c: In function 'fprintf':\n");
  fprintf(stderr, "3mm-base.c:56:19: error: the format string \"%%0.2lf \" takes %d format specifiers but fprintf has only 1 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "3mm-base.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "3mm-base.c", "fprintf", 56, 19, "\"%0.2lf \"");
ret = fprintf(stream, "%0.2lf ", vp2);
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_105309783235808(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "3mm-base.c: In function 'fprintf':\n");
  fprintf(stderr, "3mm-base.c:57:47: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "3mm-base.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "3mm-base.c", "fprintf", 57, 47, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static int _RV_fprintf_105309783236272(__RV_pmd *stm_pmd, __RV_pmd *fmt_pmd, FILE *stream, const char *fmt)
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
  fprintf(stderr, "3mm-base.c: In function 'fprintf':\n");
  fprintf(stderr, "3mm-base.c:59:20: error: the format string \"\\n\" takes %d format specifiers but fprintf has only 0 data arguments. [spatial error]\n", fmt_cnt);
}
__RV_check_dpv(stm_pmd, stream, sizeof(FILE), "3mm-base.c", "fprintf", 149, 16, "stderr");
__RV_check_dpv(fmt_pmd, fmt, p-fmt+1, "3mm-base.c", "fprintf", 59, 20, "\"\\n\"");
ret = fprintf(stream, "\n");
__RV_pmd_free_null_ptr(stm_pmd);
__RV_pmd_free_null_ptr(fmt_pmd);
return ret;
}

static
void print_array(int ni, int nl,
		 double/*DATA_TYPE*/
#line 50
             G [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 50
                         /*(G,NI,NL,ni,nl)*/
#line 50
                                        )
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_105309783235992 = 0;
unsigned char _RV_bc_flag_105309783235960 = 0;
__RV_pmd _RV_pmd_G_105309783229056 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_G_105309783229056, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)print_array, 0))
  );

  int i, j;

  for (i = 0; i < ni; i++)
    {
for (j = 0; j < nl; j++) {
	_RV_fprintf_105309783230944 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("%0.2lf "), "%0.2lf "+8), stderr/*stderr*/
#line 56
                , "%0.2lf "/*DATA_PRINTF_MODIFIER*/
#line 56
                                      , G[__RV_check_dpv_ss(&_RV_pmd_G_105309783229056, G, i, sizeof(double [1024]), "3mm-base.c", "print_array", 56, 43, "G[i]")][__RV_check_dpv_ss(&_RV_pmd_G_105309783229056, G[i], j, sizeof(double), "3mm-base.c", "print_array", 56, 46, "G[i][j]")]);
	if ((i * ni + j) % 20 == 0) {
_RV_fprintf_105309783235808 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 57
                                            , "\n");
_RV_lbl_105309783235808:
if(_RV_ret_flag) goto _RV_lbl_105309783235960;
if(_RV_bc_flag_105309783235960 == 1 || _RV_bc_flag_105309783235960 == 2) goto _RV_lbl_105309783235960;
}

    
_RV_lbl_105309783235960:
if(_RV_ret_flag) goto _RV_lbl_105309783235992;
if(_RV_bc_flag_105309783235960 == 1) {
_RV_bc_flag_105309783235960 = 0;
break;
}
if(_RV_bc_flag_105309783235960 == 2) _RV_bc_flag_105309783235960 = 0;
}
_RV_lbl_105309783235992:
if(_RV_ret_flag) goto _RV_lbl_105309783236392;
if(_RV_bc_flag_105309783235992 == 1) {
_RV_bc_flag_105309783235992 = 0;
break;
}
if(_RV_bc_flag_105309783235992 == 2) _RV_bc_flag_105309783235992 = 0;
}

  _RV_fprintf_105309783236272 (__RV_pmd_tbl_lookup((__RV_ptr_addr)&stderr), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)("\n"), "\n"+2), stderr/*stderr*/
#line 59
                 , "\n");

_RV_lbl_105309783236392:
__RV_pmd_set_null(&_RV_pmd_G_105309783229056);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_print_array(__RV_pmd *p3_pmd, int p1, int p2, double p3[1024][1024])
{
  __RV_fmd_tbl_create((__RV_func_addr)print_array, 1);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)print_array, 0, p3_pmd);
  print_array(p1, p2, p3);
  __RV_fmd_tbl_remove((__RV_func_addr)print_array);
  __RV_pmd_free_null_ptr(p3_pmd);
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static void _RV_kernel_3mm(__RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, __RV_pmd *p12_pmd, int p1, int p2, int p3, int p4, int p5, double p6[1024][1024], double p7[1024][1024], double p8[1024][1024], double p9[1024][1024], double p10[1024][1024], double p11[1024][1024], double p12[1024][1024]);

static
void kernel_3mm(int ni, int nj, int nk, int nl, int nm,
		double/*DATA_TYPE*/
#line 67
            E [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 67
                        /*(E,NI,NJ,ni,nj)*/
#line 67
                                       ,
		double/*DATA_TYPE*/
#line 68
            A [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 68
                        /*(A,NI,NK,ni,nk)*/
#line 68
                                       ,
		double/*DATA_TYPE*/
#line 69
            B [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 69
                        /*(B,NK,NJ,nk,nj)*/
#line 69
                                       ,
		double/*DATA_TYPE*/
#line 70
            F [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 70
                        /*(F,NJ,NL,nj,nl)*/
#line 70
                                       ,
		double/*DATA_TYPE*/
#line 71
            C [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 71
                        /*(C,NJ,NM,nj,nm)*/
#line 71
                                       ,
		double/*DATA_TYPE*/
#line 72
            D [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 72
                        /*(D,NM,NL,nm,nl)*/
#line 72
                                       ,
		double/*DATA_TYPE*/
#line 73
            G [ 1024 + 0 ] [ 1024 + 0 ]/*POLYBENCH_2D*/
#line 73
                        /*(G,NI,NL,ni,nl)*/
#line 73
                                       )
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
unsigned char _RV_bc_flag_105309783243304 = 0;
unsigned char _RV_bc_flag_105309783243272 = 0;
unsigned char _RV_bc_flag_105309783243168 = 0;
unsigned char _RV_bc_flag_105309783246992 = 0;
unsigned char _RV_bc_flag_105309783246960 = 0;
unsigned char _RV_bc_flag_105309783246856 = 0;
unsigned char _RV_bc_flag_105309783249320 = 0;
unsigned char _RV_bc_flag_105309783249288 = 0;
unsigned char _RV_bc_flag_105309783249184 = 0;
__RV_pmd _RV_pmd_E_105309783237384 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_105309783237800 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_105309783238216 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_F_105309783238632 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_105309783239048 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_105309783239464 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_G_105309783239880 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_E_105309783237384, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_3mm, 0)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_A_105309783237800, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_3mm, 1)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_B_105309783238216, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_3mm, 2)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_F_105309783238632, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_3mm, 3)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_C_105309783239048, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_3mm, 4)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_D_105309783239464, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_3mm, 5)),
  __RV_pmd_cp_fmd_pmd(&_RV_pmd_G_105309783239880, __RV_fmd_tbl_lookup_fpmd((__RV_func_addr)kernel_3mm, 6))
  );

  int i, j, k;

/*#pragma scop*/
  /* E := A*B */
  for (i = 0; i < ni/*_PB_NI*/
#line 79
                        ; i++)
    {
for (j = 0; j < nj/*_PB_NJ*/
#line 80
                          ; j++)
      {
	E[__RV_check_dpv_ss(&_RV_pmd_E_105309783237384, E, i, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 82, 4, "E[i]")][__RV_check_dpv_ss(&_RV_pmd_E_105309783237384, E[i], j, sizeof(double), "3mm-base.c", "kernel_3mm", 82, 7, "E[i][j]")] = 0;
	for (k = 0; k < nk/*_PB_NK*/
#line 83
                       ; ++k)
	  {
E[__RV_check_dpv_ss(&_RV_pmd_E_105309783237384, E, i, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 84, 6, "E[i]")][__RV_check_dpv_ss(&_RV_pmd_E_105309783237384, E[i], j, sizeof(double), "3mm-base.c", "kernel_3mm", 84, 9, "E[i][j]")] += A[__RV_check_dpv_ss(&_RV_pmd_A_105309783237800, A, i, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 84, 17, "A[i]")][__RV_check_dpv_ss(&_RV_pmd_A_105309783237800, A[i], k, sizeof(double), "3mm-base.c", "kernel_3mm", 84, 20, "A[i][k]")] * B[__RV_check_dpv_ss(&_RV_pmd_B_105309783238216, B, k, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 84, 27, "B[k]")][__RV_check_dpv_ss(&_RV_pmd_B_105309783238216, B[k], j, sizeof(double), "3mm-base.c", "kernel_3mm", 84, 30, "B[k][j]")];
_RV_lbl_105309783243168:
if(_RV_ret_flag) goto _RV_lbl_105309783243272;
if(_RV_bc_flag_105309783243168 == 1) {
_RV_bc_flag_105309783243168 = 0;
break;
}
if(_RV_bc_flag_105309783243168 == 2) _RV_bc_flag_105309783243168 = 0;
}

      
_RV_lbl_105309783243272:
if(_RV_ret_flag) goto _RV_lbl_105309783243304;
if(_RV_bc_flag_105309783243272 == 1) {
_RV_bc_flag_105309783243272 = 0;
break;
}
if(_RV_bc_flag_105309783243272 == 2) _RV_bc_flag_105309783243272 = 0;
}
_RV_lbl_105309783243304:
if(_RV_ret_flag) goto _RV_lbl_105309783249432;
if(_RV_bc_flag_105309783243304 == 1) {
_RV_bc_flag_105309783243304 = 0;
break;
}
if(_RV_bc_flag_105309783243304 == 2) _RV_bc_flag_105309783243304 = 0;
}

  /* F := C*D */
  for (i = 0; i < nj/*_PB_NJ*/
#line 87
                        ; i++)
    {
for (j = 0; j < nl/*_PB_NL*/
#line 88
                          ; j++)
      {
	F[__RV_check_dpv_ss(&_RV_pmd_F_105309783238632, F, i, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 90, 4, "F[i]")][__RV_check_dpv_ss(&_RV_pmd_F_105309783238632, F[i], j, sizeof(double), "3mm-base.c", "kernel_3mm", 90, 7, "F[i][j]")] = 0;
	for (k = 0; k < nm/*_PB_NM*/
#line 91
                       ; ++k)
	  {
F[__RV_check_dpv_ss(&_RV_pmd_F_105309783238632, F, i, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 92, 6, "F[i]")][__RV_check_dpv_ss(&_RV_pmd_F_105309783238632, F[i], j, sizeof(double), "3mm-base.c", "kernel_3mm", 92, 9, "F[i][j]")] += C[__RV_check_dpv_ss(&_RV_pmd_C_105309783239048, C, i, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 92, 17, "C[i]")][__RV_check_dpv_ss(&_RV_pmd_C_105309783239048, C[i], k, sizeof(double), "3mm-base.c", "kernel_3mm", 92, 20, "C[i][k]")] * D[__RV_check_dpv_ss(&_RV_pmd_D_105309783239464, D, k, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 92, 27, "D[k]")][__RV_check_dpv_ss(&_RV_pmd_D_105309783239464, D[k], j, sizeof(double), "3mm-base.c", "kernel_3mm", 92, 30, "D[k][j]")];
_RV_lbl_105309783246856:
if(_RV_ret_flag) goto _RV_lbl_105309783246960;
if(_RV_bc_flag_105309783246856 == 1) {
_RV_bc_flag_105309783246856 = 0;
break;
}
if(_RV_bc_flag_105309783246856 == 2) _RV_bc_flag_105309783246856 = 0;
}

      
_RV_lbl_105309783246960:
if(_RV_ret_flag) goto _RV_lbl_105309783246992;
if(_RV_bc_flag_105309783246960 == 1) {
_RV_bc_flag_105309783246960 = 0;
break;
}
if(_RV_bc_flag_105309783246960 == 2) _RV_bc_flag_105309783246960 = 0;
}
_RV_lbl_105309783246992:
if(_RV_ret_flag) goto _RV_lbl_105309783249432;
if(_RV_bc_flag_105309783246992 == 1) {
_RV_bc_flag_105309783246992 = 0;
break;
}
if(_RV_bc_flag_105309783246992 == 2) _RV_bc_flag_105309783246992 = 0;
}

  /* G := E*F */
  for (i = 0; i < ni/*_PB_NI*/
#line 95
                        ; i++)
    {
for (j = 0; j < nl/*_PB_NL*/
#line 96
                          ; j++)
      {
	G[__RV_check_dpv_ss(&_RV_pmd_G_105309783239880, G, i, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 98, 4, "G[i]")][__RV_check_dpv_ss(&_RV_pmd_G_105309783239880, G[i], j, sizeof(double), "3mm-base.c", "kernel_3mm", 98, 7, "G[i][j]")] = 0;
	for (k = 0; k < nj/*_PB_NJ*/
#line 99
                       ; ++k)
	  {
G[__RV_check_dpv_ss(&_RV_pmd_G_105309783239880, G, i, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 100, 6, "G[i]")][__RV_check_dpv_ss(&_RV_pmd_G_105309783239880, G[i], j, sizeof(double), "3mm-base.c", "kernel_3mm", 100, 9, "G[i][j]")] += E[__RV_check_dpv_ss(&_RV_pmd_E_105309783237384, E, i, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 100, 17, "E[i]")][__RV_check_dpv_ss(&_RV_pmd_E_105309783237384, E[i], k, sizeof(double), "3mm-base.c", "kernel_3mm", 100, 20, "E[i][k]")] * F[__RV_check_dpv_ss(&_RV_pmd_F_105309783238632, F, k, sizeof(double [1024]), "3mm-base.c", "kernel_3mm", 100, 27, "F[k]")][__RV_check_dpv_ss(&_RV_pmd_F_105309783238632, F[k], j, sizeof(double), "3mm-base.c", "kernel_3mm", 100, 30, "F[k][j]")];
_RV_lbl_105309783249184:
if(_RV_ret_flag) goto _RV_lbl_105309783249288;
if(_RV_bc_flag_105309783249184 == 1) {
_RV_bc_flag_105309783249184 = 0;
break;
}
if(_RV_bc_flag_105309783249184 == 2) _RV_bc_flag_105309783249184 = 0;
}

      
_RV_lbl_105309783249288:
if(_RV_ret_flag) goto _RV_lbl_105309783249320;
if(_RV_bc_flag_105309783249288 == 1) {
_RV_bc_flag_105309783249288 = 0;
break;
}
if(_RV_bc_flag_105309783249288 == 2) _RV_bc_flag_105309783249288 = 0;
}
_RV_lbl_105309783249320:
if(_RV_ret_flag) goto _RV_lbl_105309783249432;
if(_RV_bc_flag_105309783249320 == 1) {
_RV_bc_flag_105309783249320 = 0;
break;
}
if(_RV_bc_flag_105309783249320 == 2) _RV_bc_flag_105309783249320 = 0;
}

/*#pragma endscop*/


_RV_lbl_105309783249432:
__RV_pmd_set_null(&_RV_pmd_E_105309783237384);
__RV_pmd_set_null(&_RV_pmd_A_105309783237800);
__RV_pmd_set_null(&_RV_pmd_B_105309783238216);
__RV_pmd_set_null(&_RV_pmd_F_105309783238632);
__RV_pmd_set_null(&_RV_pmd_C_105309783239048);
__RV_pmd_set_null(&_RV_pmd_D_105309783239464);
__RV_pmd_set_null(&_RV_pmd_G_105309783239880);
__RV_stack_sa->stat = __RV_invalid;
__RV_stat_node_dec(__RV_stack_sa);
return;
}

static void _RV_kernel_3mm(__RV_pmd *p6_pmd, __RV_pmd *p7_pmd, __RV_pmd *p8_pmd, __RV_pmd *p9_pmd, __RV_pmd *p10_pmd, __RV_pmd *p11_pmd, __RV_pmd *p12_pmd, int p1, int p2, int p3, int p4, int p5, double p6[1024][1024], double p7[1024][1024], double p8[1024][1024], double p9[1024][1024], double p10[1024][1024], double p11[1024][1024], double p12[1024][1024])
{
  __RV_fmd_tbl_create((__RV_func_addr)kernel_3mm, 7);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_3mm, 0, p6_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_3mm, 1, p7_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_3mm, 2, p8_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_3mm, 3, p9_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_3mm, 4, p10_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_3mm, 5, p11_pmd);
  __RV_fmd_tbl_update_pmd((__RV_func_addr)kernel_3mm, 6, p12_pmd);
  kernel_3mm(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);
  __RV_fmd_tbl_remove((__RV_func_addr)kernel_3mm);
  __RV_pmd_free_null_ptr(p6_pmd);
  __RV_pmd_free_null_ptr(p7_pmd);
  __RV_pmd_free_null_ptr(p8_pmd);
  __RV_pmd_free_null_ptr(p9_pmd);
  __RV_pmd_free_null_ptr(p10_pmd);
  __RV_pmd_free_null_ptr(p11_pmd);
  __RV_pmd_free_null_ptr(p12_pmd);
}


static void *_RV_polybench_alloc_data_105309783252224(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

static void *_RV_polybench_alloc_data_105309783253680(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

static void *_RV_polybench_alloc_data_105309783255072(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

static void *_RV_polybench_alloc_data_105309783256464(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

static void *_RV_polybench_alloc_data_105309783257856(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

static void *_RV_polybench_alloc_data_105309783259248(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

static void *_RV_polybench_alloc_data_105309783260640(__RV_pmd *ret_pmd, unsigned long long p1, int p2)
{
  void *ret_val;
  ret_val = (polybench_alloc_data)(p1, p2);
  __RV_pmd_set(ret_pmd, __RV_library_sa, __RV_invalid, (char*)1, (char*)-1);
  return ret_val;
}

int _RV_main(int argc, char** argv)
{
__RV_stat_node *__RV_stack_sa = __RV_stat_node_create(__RV_stack, 1);
unsigned char _RV_ret_flag = 0;
int _RV_ret_val;
__RV_pmd _RV_pmd_argv_105309783249632 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_E_105309783251424 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_A_105309783252928 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_B_105309783254320 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_F_105309783255712 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_C_105309783257104 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_D_105309783258496 = __RV_pmd_init_val;
__RV_pmd _RV_pmd_G_105309783259888 = __RV_pmd_init_val;
__RV_pmd *_RV_param_pmds = (
__RV_pmd_var_update_argv(argc, &_RV_pmd_argv_105309783249632, argv)
  );

  /* Retrieve problem size. */
  int ni = 1024/*NI*/
#line 110
             ;
  int nj = 1024/*NJ*/
#line 111
             ;
  int nk = 1024/*NK*/
#line 112
             ;
  int nl = 1024/*NL*/
#line 113
             ;
  int nm = 1024/*NM*/
#line 114
             ;

  /* Variable declaration/allocation. */
  double ( * E ) [ 1024 + 0 ] [ 1024 + 0 ] ; E = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) _RV_polybench_alloc_data_105309783252224 ( &_RV_pmd_E_105309783251424, ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 117
                         /*(E, DATA_TYPE, NI, NJ, ni, nj)*/
#line 117
                                                       ;
  double ( * A ) [ 1024 + 0 ] [ 1024 + 0 ] ; A = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) _RV_polybench_alloc_data_105309783253680 ( &_RV_pmd_A_105309783252928, ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 118
                         /*(A, DATA_TYPE, NI, NK, ni, nk)*/
#line 118
                                                       ;
  double ( * B ) [ 1024 + 0 ] [ 1024 + 0 ] ; B = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) _RV_polybench_alloc_data_105309783255072 ( &_RV_pmd_B_105309783254320, ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 119
                         /*(B, DATA_TYPE, NK, NJ, nk, nj)*/
#line 119
                                                       ;
  double ( * F ) [ 1024 + 0 ] [ 1024 + 0 ] ; F = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) _RV_polybench_alloc_data_105309783256464 ( &_RV_pmd_F_105309783255712, ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 120
                         /*(F, DATA_TYPE, NJ, NL, nj, nl)*/
#line 120
                                                       ;
  double ( * C ) [ 1024 + 0 ] [ 1024 + 0 ] ; C = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) _RV_polybench_alloc_data_105309783257856 ( &_RV_pmd_C_105309783257104, ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 121
                         /*(C, DATA_TYPE, NJ, NM, nj, nm)*/
#line 121
                                                       ;
  double ( * D ) [ 1024 + 0 ] [ 1024 + 0 ] ; D = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) _RV_polybench_alloc_data_105309783259248 ( &_RV_pmd_D_105309783258496, ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 122
                         /*(D, DATA_TYPE, NM, NL, nm, nl)*/
#line 122
                                                       ;
  double ( * G ) [ 1024 + 0 ] [ 1024 + 0 ] ; G = ( double ( * ) [ 1024 + 0 ] [ 1024 + 0 ] ) _RV_polybench_alloc_data_105309783260640 ( &_RV_pmd_G_105309783259888, ( 1024 + 0 ) * ( 1024 + 0 ) , sizeof ( double ) ) ;/*POLYBENCH_2D_ARRAY_DECL*/
#line 123
                         /*(G, DATA_TYPE, NI, NL, ni, nl)*/
#line 123
                                                       ;

  /* Initialize array(s). */
  _RV_init_array (&_RV_pmd_A_105309783252928, &_RV_pmd_B_105309783254320, &_RV_pmd_C_105309783257104, &_RV_pmd_D_105309783258496, ni, nj, nk, nl, nm,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_A_105309783252928, A, sizeof(double [1024][1024]), "3mm-base.c", "main", 127, 10, "A")/*POLYBENCH_ARRAY*/
#line 127
                      /*(A)*/
#line 127
                         ,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_B_105309783254320, B, sizeof(double [1024][1024]), "3mm-base.c", "main", 128, 10, "B")/*POLYBENCH_ARRAY*/
#line 128
                      /*(B)*/
#line 128
                         ,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_C_105309783257104, C, sizeof(double [1024][1024]), "3mm-base.c", "main", 129, 10, "C")/*POLYBENCH_ARRAY*/
#line 129
                      /*(C)*/
#line 129
                         ,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_D_105309783258496, D, sizeof(double [1024][1024]), "3mm-base.c", "main", 130, 10, "D")/*POLYBENCH_ARRAY*/
#line 130
                      /*(D)*/
#line 130
                         );

  /* Start timer. */
  /*polybench_start_instruments*/
#line 133
                             ;

  /* Run kernel. */
  _RV_kernel_3mm (&_RV_pmd_E_105309783251424, &_RV_pmd_A_105309783252928, &_RV_pmd_B_105309783254320, &_RV_pmd_F_105309783255712, &_RV_pmd_C_105309783257104, &_RV_pmd_D_105309783258496, &_RV_pmd_G_105309783259888, ni, nj, nk, nl, nm,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_E_105309783251424, E, sizeof(double [1024][1024]), "3mm-base.c", "main", 137, 10, "E")/*POLYBENCH_ARRAY*/
#line 137
                      /*(E)*/
#line 137
                         ,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_A_105309783252928, A, sizeof(double [1024][1024]), "3mm-base.c", "main", 138, 10, "A")/*POLYBENCH_ARRAY*/
#line 138
                      /*(A)*/
#line 138
                         ,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_B_105309783254320, B, sizeof(double [1024][1024]), "3mm-base.c", "main", 139, 10, "B")/*POLYBENCH_ARRAY*/
#line 139
                      /*(B)*/
#line 139
                         ,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_F_105309783255712, F, sizeof(double [1024][1024]), "3mm-base.c", "main", 140, 10, "F")/*POLYBENCH_ARRAY*/
#line 140
                      /*(F)*/
#line 140
                         ,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_C_105309783257104, C, sizeof(double [1024][1024]), "3mm-base.c", "main", 141, 10, "C")/*POLYBENCH_ARRAY*/
#line 141
                      /*(C)*/
#line 141
                         ,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_D_105309783258496, D, sizeof(double [1024][1024]), "3mm-base.c", "main", 142, 10, "D")/*POLYBENCH_ARRAY*/
#line 142
                      /*(D)*/
#line 142
                         ,
	      * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_G_105309783259888, G, sizeof(double [1024][1024]), "3mm-base.c", "main", 143, 10, "G")/*POLYBENCH_ARRAY*/
#line 143
                      /*(G)*/
#line 143
                         );

  /* Stop and print timer. */
  /*polybench_stop_instruments*/
#line 146
                            ;
  /*polybench_print_instruments*/
#line 147
                             ;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if ( argc > 42 && ! _RV_strcmp ( __RV_pmd_tbl_lookup((__RV_ptr_addr)&argv[0]), __RV_pmd_create(NULL, __RV_global_sa, __RV_global, (void *)(""), ""+1), argv [ __RV_check_dpv_ss(&_RV_pmd_argv_105309783249632, argv, 0 , sizeof(char *), "3mm-base.c", "main", 151, 39, "argv[0]")] , "" , "3mm-base.c", "strcmp", 151, 32, "argv[0]", 151, 45, "\"\"") ) {
_RV_print_array ( &_RV_pmd_G_105309783259888, ni , nl , * (double (*)[1024][1024])__RV_check_dpv(&_RV_pmd_G_105309783259888, G, sizeof(double [1024][1024]), "3mm-base.c", "main", 151, 78, "G") )/*polybench_prevent_dce*/
#line 151
                       /*(print_array(ni, nl,  POLYBENCH_ARRAY(G)))*/
#line 151
                                                                 ;
_RV_lbl_105309783266720:
if(_RV_ret_flag) goto _RV_lbl_105309783268544;
}


  /* Be clean. */
  _RV_free ( &_RV_pmd_E_105309783251424, ( void * ) E , "3mm-base.c", "free", 154, 10, "(void *)E") ;/*POLYBENCH_FREE_ARRAY*/
#line 154
                      /*(E)*/
#line 154
                         ;
  _RV_free ( &_RV_pmd_A_105309783252928, ( void * ) A , "3mm-base.c", "free", 155, 10, "(void *)A") ;/*POLYBENCH_FREE_ARRAY*/
#line 155
                      /*(A)*/
#line 155
                         ;
  _RV_free ( &_RV_pmd_B_105309783254320, ( void * ) B , "3mm-base.c", "free", 156, 10, "(void *)B") ;/*POLYBENCH_FREE_ARRAY*/
#line 156
                      /*(B)*/
#line 156
                         ;
  _RV_free ( &_RV_pmd_F_105309783255712, ( void * ) F , "3mm-base.c", "free", 157, 10, "(void *)F") ;/*POLYBENCH_FREE_ARRAY*/
#line 157
                      /*(F)*/
#line 157
                         ;
  _RV_free ( &_RV_pmd_C_105309783257104, ( void * ) C , "3mm-base.c", "free", 158, 10, "(void *)C") ;/*POLYBENCH_FREE_ARRAY*/
#line 158
                      /*(C)*/
#line 158
                         ;
  _RV_free ( &_RV_pmd_D_105309783258496, ( void * ) D , "3mm-base.c", "free", 159, 10, "(void *)D") ;/*POLYBENCH_FREE_ARRAY*/
#line 159
                      /*(D)*/
#line 159
                         ;
  _RV_free ( &_RV_pmd_G_105309783259888, ( void * ) G , "3mm-base.c", "free", 160, 10, "(void *)G") ;/*POLYBENCH_FREE_ARRAY*/
#line 160
                      /*(G)*/
#line 160
                         ;

  {
  _RV_ret_val = ( 0);
  _RV_ret_flag = 1;
  goto _RV_lbl_105309783268544;
  }

_RV_lbl_105309783268544:
__RV_pmd_var_remove_argv(argc, &_RV_pmd_argv_105309783249632, argv);
__RV_pmd_set_null(&_RV_pmd_E_105309783251424);
__RV_pmd_set_null(&_RV_pmd_A_105309783252928);
__RV_pmd_set_null(&_RV_pmd_B_105309783254320);
__RV_pmd_set_null(&_RV_pmd_F_105309783255712);
__RV_pmd_set_null(&_RV_pmd_C_105309783257104);
__RV_pmd_set_null(&_RV_pmd_D_105309783258496);
__RV_pmd_set_null(&_RV_pmd_G_105309783259888);
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

