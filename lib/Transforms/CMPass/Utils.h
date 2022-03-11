// This file used to provide some useful helper functions
#ifndef UTILS_H
#define UTILS_H

//#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"


#include <memory>
#include <utility>
#include <string>
#include <set>
#include <unordered_set>

using namespace llvm;

bool IsSafeCheckCall(CallInst *CI);
bool IsSafeCheckCallStore(CallInst *CI);
bool IsSafeCheckCallForMovec(CallInst *CI);
bool IsSafeCheckFun(StringRef funcName);

bool IsEmittingInst(Instruction &I);
bool IsMemAccessInst(Instruction &I);

bool isAllocator(CallInst * callInst);
bool isDeallocator(CallInst * callInst);

bool isReallocator (CallInst * callInst);

Value * getAllocatedObject (CallInst * callInst);

Value * getFreedObject (CallInst * callInst);

uint32_t getSafeCheckCost(Instruction * callInst);
uint32_t getSpawnableCost();
uint32_t getOriginalCost(Instruction * start, Instruction * end);
bool IsSafeCheckCallForLoopFree(CallInst *CI);
bool instHappensBefore(Instruction * inst, Instruction * final);
Instruction * getNextInstruction(Instruction * I, BasicBlock *BB);

// template<typename T, typename... Args>
// std::unique_ptr<T> make_unique(Args&&... args) {
//     return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
// }

const std::unordered_set<std::string> movecLibFunction {
    /*Print the runtime error count.*/
    "_RV_print_error_count",
    /*===----------------------------- stat_node ------------------------------===*/
    "_RV_stat_node_create",
    "_RV_stat_node_dec",
    /*===----------------------------- pmd ------------------------------------===*/
    "_RV_pmd_create",
    "_RV_pmd_free_null_ptr",
    "_RV_pmd_get_base",
    "_RV_pmd_get_bound",
    "_RV_pmd_get_snda",
    "_RV_pmd_get_stat",
    "_RV_pmd_print",
    "_RV_pmd_set",
    "_RV_pmd_set_ret",
    "_RV_pmd_set_null",
    "_RV_pmd_cp_pmd",
    "_RV_pmd_cp_pmd_ret",
    "_RV_pmd_cp_fmd_pmd",
    /*===----------------------------- fmd_pmd --------------------------------===*/
    "_RV_fmd_pmd_get_base",
    "_RV_fmd_pmd_get_bound",
    /*===----------------------------- utilities ------------------------------===*/
    "_RV_sstrlen",
    /*===----------------------------- pmd_tbl --------------------------------===*/
    "_RV_pmd_tbl_create",
    "_RV_pmd_tbl_lookup",
    "_RV_pmd_tbl_print",
    "_RV_pmd_tbl_update_sa",
    "_RV_pmd_tbl_update_sa_ret",
    "_RV_pmd_tbl_update_pmd",
    "_RV_pmd_tbl_update_pmd_ret",
    "_RV_pmd_tbl_update_fpmd",
    "_RV_pmd_tbl_update_ptr",
    "_RV_pmd_tbl_update_ptr_ret",
    "_RV_pmd_tbl_remove",
    "_RV_pmd_tbl_remove_pa",
    "_RV_pmd_var_remove_pa",
    "_RV_pmd_tbl_update_argv",
    "_RV_pmd_var_update_argv",
    "_RV_pmd_tbl_remove_argv",
    "_RV_pmd_var_remove_argv",
    "_RV_pmd_tbl_update_envp",
    "_RV_pmd_var_update_envp",
    "_RV_pmd_tbl_remove_envp",
    "_RV_pmd_var_remove_envp",
    /*===----------------------------- fmd_tbl --------------------------------===*/
    "_RV_fmd_tbl_create",
    "_RV_fmd_tbl_lookup_fpmd",
    "_RV_fmd_tbl_print",
    "_RV_fmd_tbl_update_pmd",
    "_RV_fmd_tbl_remove",
    /*===----------------------------- check ----------------------------------===*/
    "_RV_check_dpv",
    "_RV_check_dpv_ss",
    "_RV_check_dpfv",
    "_RV_check_dpc",
    "_RV_check_dpc_ss",
    "_RV_check_dpfc",
    /*********************************** ctype.h **********************************/
    "_RV___ctype_b_loc",
    /***************************** getopt.h ********************************/
    "_RV_getopt_long",
    /******************************* locale.h *************************************/
    "_RV_setlocale",
    "_RV_localeconv",
    /******************************* math.h ***************************************/
    "_RV_frexp",
    "_RV_modf",
    /***************************** pwd.h ********************************/
    "_RV_getpwnam",
    "_RV_getpwuid",
    "_RV_getpwent",
    /******************************* setjmp.h *************************************/
    "_RV_setjmp",
    "_RV_longjmp",
    /******************************* signal.h *************************************/
    "_RV_signal",
    /****************************** sys/stat.h ************************************/
    "_RV_fstat",
    /******************************* stdio.h **************************************/
    "_RV_fclose",
    "_RV_clearerr",
    "_RV_feof",
    "_RV_ferror",
    "_RV_fflush",
    "_RV_fgetpos",
    "_RV_fopen",
    "_RV_fdopen",
    "_RV_freopen",
    "_RV_fileno",
    "_RV_fread",
    "_RV_fseek",
    "_RV_fsetpos",
    "_RV_ftell",
    "_RV_fwrite",
    "_RV_remove",
    "_RV_rename",
    "_RV_rewind",
    "_RV_setbuf",
    "_RV_setvbuf",
    "_RV_tmpfile",
    "_RV_tmpnam",
    "_RV_vfprintf",
    "_RV_vprintf",
    "_RV_vsprintf",
    "_RV_fgetc",
    "_RV_fgets",
    "_RV_fputc",
    "_RV_fputs",
    "_RV__IO_getc",
    "_RV_gets",
    "_RV__IO_putc",
    "_RV_puts",
    "_RV_ungetc",
    "_RV_perror",
    /******************************* stdlib.h *************************************/
    "_RV_atof",
    "_RV_atoi",
    "_RV_atol",
    "_RV_strtod",
    "_RV_strtol",
    "_RV_strtoul",
    "_RV_calloc",
    "_RV_free",
    "_RV_malloc",
    "_RV_realloc",
    "_RV_atexit",
    "_RV_getenv",
    "_RV_system",
    "_RV_mblen",
    "_RV_mbstowcs",
    "_RV_mbtowc",
    "_RV_wcstombs",
    "_RV_wctomb",
    "_RV_bsearch",
    "_RV_qsort",
    /***************************** string.h ********************************/
    "_RV_memchr",
    "_RV_memcmp",
    "_RV_memcpy",
    "_RV_memccpy",
    "_RV_memmove",
    "_RV_memset",
    "_RV_strcat",
    "_RV_strncat",
    "_RV_strchr",
    "_RV_strcmp",
    "_RV_strncmp",
    "_RV_strcoll",
    "_RV_strcpy",
    "_RV_strncpy",
    "_RV_strcspn",
    "_RV_strerror",
    "_RV_strlen",
    "_RV_strpbrk",
    "_RV_strrchr",
    "_RV_strspn",
    "_RV_strstr",
    "_RV_strtok",
    "_RV_strxfrm",
    "_RV_bzero",
    "_RV_bcopy",
    /***************************** time.h ********************************/
    "_RV_asctime",
    "_RV_ctime",
    "_RV_gmtime",
    "_RV_localtime",
    "_RV_mktime",
    "_RV_strftime",
    "_RV_time",
    "_RV___errno_location",
    /***************************** sys/times.h ********************************/
    "_RV_times",
    /***************************** unistd.h ********************************/
    "_RV_read",
    "_RV_write",
    "_RV_unlink",
    "_RV_getcwd",
    "_RV_getopt",
    /********************************* utime.h ************************************/
    "_RV_utime",
    /******************************* call by ptr **********************************/
    "_RV_call_wrapper_by_ptr",
    "_RV_has_wrapper",
    "_RV_global_init_code",
    "_RV_global_clear_code",


    "_RV_fmd_pmd_set_null",
    "_RV_fmd_pmd_dc_snda",
    "_RV_trie_remove_pmd",
    "_RV_hashtbl_insert_fmd"
};

#endif