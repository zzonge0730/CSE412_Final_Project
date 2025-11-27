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
#include <unordered_map>

using namespace llvm;

bool IsSafeCheckCall(CallInst *CI);
bool IsSafeCheckCallStore(CallInst *CI);
bool IsSafeCheckCallStoreForSafeC(CallInst *CI);
bool IsSafeCheckCallStoreForMC(CallInst *CI);
bool IsSafeCheckCallForMovec(CallInst *CI);
bool IsSafeCheckCallForSafeC(CallInst *CI);
bool IsIntraTaskConsideredForSB(CallInst *CI);
bool IsIntraTaskConsideredForMC(CallInst *CI);
bool IsIntraTaskConsideredForSafeC(CallInst *CI);
bool IsSafeCheckFun(StringRef funcName);
bool IsConsideredFunForInterTask(Function &F);

bool IsEmittingInst(Instruction &I);
bool IsMemAccessInst(Instruction &I);

bool isAllocator(CallInst *callInst);
bool isDeallocator(CallInst *callInst);

bool isReallocator (CallInst *callInst);

Value * getAllocatedObject (CallInst *callInst);

Value * getFreedObject (CallInst *callInst);

uint32_t getSafeCheckCost(Instruction *callInst);
uint32_t getSpawnableCost();
uint32_t getOriginalCost(Instruction *start, Instruction *end);
bool IsSafeCheckCallForLoopFree(CallInst *CI);
bool instHappensBefore(Instruction *inst, Instruction *final);
Instruction * getNextInstruction(Instruction *I, BasicBlock *BB);

uint32_t calCost(std::pair<Instruction*, Instruction*> pair, std::unordered_map<Instruction *, Instruction *>safeCheckInstJoinPoint);


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

const std::unordered_set<std::string> softboundcetsLibFunction {
    "__softboundcets_global_init",
    "__softboundcets_stub",
    "__softboundcets_init",
    "__softboundcets_allocate_shadow_stack_space",
    "__softboundcets_load_base_shadow_stack",
    "__softboundcets_load_bound_shadow_stack",
    "__softboundcets_load_key_shadow_stack",
    "__softboundcets_load_lock_shadow_stack",
    "__softboundcets_store_base_shadow_stack",
    "__softboundcets_store_bound_shadow_stack",
    "__softboundcets_store_key_shadow_stack",
    "__softboundcets_store_lock_shadow_stack",
    "__softboundcets_deallocate_shadow_stack_space",
    "__softboundcets_trie_allocate",
    "__softboundcets_print_metadata",
    "__softboundcets_intermediate",
    "__softboundcets_dummy",
    "__softboundcets_introspect_metadata",
    "__softboundcets_copy_metadata",
    "__softboundcets_shrink_bounds",
    "__softboundcets_spatial_call_dereference_check",
    "__softboundcets_spatial_load_dereference_check",
    "__softboundcets_spatial_store_dereference_check",
    "__softboundcets_memcopy_check",
    "__softboundcets_memset_check",
    "__softboundcets_metadata_store",
    "__softboundcets_metadata_map",
    "__softboundcets_metadata_load_base",
    "__softboundcets_metadata_load_bound",
    "__softboundcets_metadata_load_key",
    "__softboundcets_metadata_load_lock",
    "__softboundcets_metadata_load",
    "__softboundcets_temporal_load_dereference_check",
    "__softboundcets_temporal_store_dereference_check",
    "__softboundcets_stack_memory_deallocation",
    "__softboundcets_memory_deallocation",
    "__softboundcets_allocate_lock_location",
    "__softboundcets_allocation_secondary_trie_allocate_range",
    "__softboundcets_allocation_secondary_trie_allocate",
    "__softboundcets_stack_memory_allocation",
    "__softboundcets_memory_allocation",
    "__softboundcets_get_global_lock",
    "__softboundcets_add_to_free_map",
    "__softboundcets_check_remove_from_free_map",
    "__softboundcets_metadata_load_vector",
    "__softboundcets_metadata_store_vector"
};

#endif