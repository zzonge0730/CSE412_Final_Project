#include "Utils.h"

#include <string>
#include <set>

using namespace llvm;

bool IsSafeCheckCall(CallInst *CI){
    if(CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if(callName.startswith("__softboundcets") || 
        //callName.startswith("softboundcets") ||
        callName.startswith("__asan_") || 
        callName.startswith("__ubsan_")){
            if (callName.equals("__softboundcets_init") ||
                callName.equals("__softboundcets_dummy") ||
                callName.equals("__softboundcets_abort")
                // callName.equals("__softboundcets_metadata_load") ||
                // callName.equals("__softboundcets_temporal_load_dereference_check") ||
                // callName.equals("__softboundcets_spatial_load_dereference_check") ||
                // callName.equals("__softboundcets_temporal_store_dereference_check") ||
                // callName.equals("__softboundcets_spatial_store_dereference_check") ||
                // callName.equals("__softboundcets_stack_memory_allocation") ||
                // callName.equals("__softboundcets_load_base_shadow_stack") ||
                // callName.equals("__softboundcets_load_bound_shadow_stack") ||
                // callName.equals("__softboundcets_load_key_shadow_stack") ||
                // callName.equals("__softboundcets_load_lock_shadow_stack") ||
                // callName.equals("__softboundcets_get_global_lock") ||
                // callName.equals("__softboundcets_metadata_store") ||
                // callName.equals("__softboundcets_allocate_shadow_stack_space") ||
                // callName.equals("__softboundcets_store_base_shadow_stack") ||
                // callName.equals("__softboundcets_store_bound_shadow_stack") ||
                // callName.equals("__softboundcets_store_key_shadow_stack") ||
                // callName.equals("__softboundcets_store_lock_shadow_stack") ||
                // callName.equals("__softboundcets_deallocate_shadow_stack_space") ||
                // callName.equals("__softboundcets_stack_memory_deallocation")
            ){
                return false;
            }
            return true;
        }
    }
    return false;
}

bool IsSafeCheckFun(StringRef funcName) {
    if(funcName.startswith("__softboundcets") || 
        //funcName.startswith("") ||
        funcName.startswith("__asan_") || 
        funcName.startswith("__ubsan_")){
            if (funcName.equals("__softboundcets_init") ||
                funcName.equals("__softboundcets_dummy") ||
                funcName.equals("__softboundcets_abort") 
                // funcName.equals("__softboundcets_metadata_load") ||
                // funcName.equals("__softboundcets_temporal_load_dereference_check") ||
                // funcName.equals("__softboundcets_spatial_load_dereference_check") ||
                // funcName.equals("__softboundcets_temporal_store_dereference_check") ||
                // funcName.equals("__softboundcets_spatial_store_dereference_check") ||
                // funcName.equals("__softboundcets_stack_memory_allocation") ||
                // funcName.equals("__softboundcets_load_base_shadow_stack") ||
                // funcName.equals("__softboundcets_load_bound_shadow_stack") ||
                // funcName.equals("__softboundcets_load_key_shadow_stack") ||
                // funcName.equals("__softboundcets_load_lock_shadow_stack") ||
                // funcName.equals("__softboundcets_get_global_lock") ||
                // funcName.equals("__softboundcets_metadata_store") ||
                // funcName.equals("__softboundcets_allocate_shadow_stack_space") ||
                // funcName.equals("__softboundcets_store_base_shadow_stack") ||
                // funcName.equals("__softboundcets_store_bound_shadow_stack") ||
                // funcName.equals("__softboundcets_store_key_shadow_stack") ||
                // funcName.equals("__softboundcets_store_lock_shadow_stack") ||
                // funcName.equals("__softboundcets_deallocate_shadow_stack_space") ||
                // funcName.equals("__softboundcets_stack_memory_deallocation")
                ) {
                return false;
            }
            return true;
    }
    return false;
}

bool IsEmittingInst(Instruction &I) {
    return !(isa<BitCastInst>(I) || isa<PHINode>(I));
}

bool IsMemAccessInst(Instruction &I) {
    return isa<AllocaInst>(I) || 
           isa<LoadInst>(I) ||
           isa<StoreInst>(I) ||
           isa<AtomicCmpXchgInst>(I) ||
           isa<AtomicRMWInst>(I) ||
           isa<GetElementPtrInst>(I);
}

// static std::set<std::string> SoftBoundCETSLibCalls {
//     "softboundcets_setenv",
//     "softboundcets_unsetenv",
//     "softboundcets_system",
//     "softboundcets_setreuid",
//     "softboundcets_mkstemp",
//     "softboundcets_geteuid",
//     "softboundcets_getuid",
//     "softboundcets_getrlimit",
//     "softboundcets_setrlimit",
//     "softboundcets_fread_unlocked",
//     "softboundcets_fread",
//     "softboundcets_umask",
//     "softboundcets_mkdir",
//     "softboundcets_chroot",
//     "softboundcets_rmdir",
//     "softboundcets_stat",
//     "softboundcets_fputc",
//     "softboundcets_fileno",
//     "softboundcets_fgetc",
//     "softboundcets_ungetc",
//     "softboundcets_strncmp",
//     "softboundcets_log",
//     "softboundcets_fwrite",
//     "softboundcets_atof",
//     "softboundcets_feof",
//     "softboundcets_remove",//math
//     "softboundcets_acos",
//     "softboundcets_atan2",
//     "softboundcets_sqrtf",
//     "softboundcets_expf",
//     "softboundcets_exp2",
//     "softboundcets_floorf",
//     "softboundcets_ceil",
//     "softboundcets_ceilf",
//     "softboundcets_floor",
//     "softboundcets_sqrt",
//     "softboundcets_fabs",
//     "softboundcets_abs",
//     "softboundcets_srand",
//     "softboundcets_srand48",
//     "softboundcets_pow",
//     "softboundcets_fabsf",
//     "softboundcets_tan",
//     "softboundcets_tanf",
//     "softboundcets_tanl",
//     "softboundcets_log10",
//     "softboundcets_sin",
//     "softboundcets_sinf",
//     "softboundcets_sinl",
//     "softboundcets_cos",
//     "softboundcets_cosf",
//     "softboundcets_cosl",
//     "softboundcets_exp",
//     "softboundcets_ldexp",//file
//     "softboundcets_tmpfile",
//     "softboundcets_ferror",
//     "softboundcets_ftell",
//     "softboundcets_fstat",
//     "softboundcets___lxstat",
//     "softboundcets_mbrtowc",
//     "softboundcets_mbsinit",
//     "softboundcets___fxstat",
//     "softboundcets___fxstatat",
//     "softboundcets_fflush",
//     "softboundcets_fputs",
//     "softboundcets_fsync",
//     "softboundcets_fdopendir",
//     "softboundcets_fseeko",
//     "softboundcets_mkdtemp",
//     "softboundcets_raise",
//     "softboundcets_linkat",
//     "softboundcets_utimes",
//     "softboundcets_futimens",
//     "softboundcets_utimensat",
//     "softboundcets___ctype_get_mb_cur_max",
//     "softboundcets_iswprint",
//     "softboundcets_getpagesize",
//     "softboundcets_dirfd",
//     "softboundcets_localeconv",
//     "softboundcets_gmtime",
//     "softboundcets_bsearch",
//     "softboundcets_getgrnam",
//     "softboundcets_rpmatch",
//     "softboundcets_regcomp",
//     "softboundcets_regerror",
//     "softboundcets_regexec",
//     "softboundcets_getpwnam",
//     "softboundcets_getpwuid",
//     "softboundcets_getgrgid",
//     "softboundcets_fopen",
//     "softboundcets_fdopen",
//     "softboundcets_fseek",
//     "softboundcets_popen",
//     "softboundcets_fclose",
//     "softboundcets_pclose",
//     "softboundcets_rewind",
//     "softboundcets_readdir",
//     "softboundcets_creat",
//     "softboundcets_fnmatch",
//     "softboundcets_opendir",
//     "softboundcets_closedir",
//     "softboundcets_rename", //unistd.h
//     "softboundcets_sleep",
//     "softboundcets_getcwd",
//     "softboundcets_setgid",
//     "softboundcets_getgid",
//     "softboundcets_getegid",
//     "softboundcets_readlinkat",
//     "softboundcets_renameat",
//     "softboundcets_unlinkat",
//     "softboundcets_symlinkat",
//     "softboundcets_mkdirat",
//     "softboundcets_fchown",
//     "softboundcets_fchownat",
//     "softboundcets_fchmod",
//     "softboundcets_chmod",
//     "softboundcets_openat",
//     "softboundcets_fchmodat",
//     "softboundcets___xmknodat",
//     "softboundcets_mkfifoat",
//     "softboundcets_getpid",
//     "softboundcets_getppid",
//     "softboundcets_chown",
//     "softboundcets_towlower",
//     "softboundcets_isatty",
//     "softboundcets_chdir",
//     "softboundcets_fchdir",//string
//     "softboundcets_strcmp",
//     "softboundcets_strcasecmp",
//     "softboundcets_strncasecmp",
//     "softboundcets_strlen",
//     "softboundcets_strpbrk",
//     "softboundcets_gets",
//     "softboundcets_fgets",
//     "softboundcets_perror",
//     "softboundcets_strspn",
//     "softboundcets_strcspn",
//     "softboundcets_mempcpy",
//     "softboundcets_memcmp",
//     "softboundcets_memrchr",
//     "softboundcets_rewinddir",
//     "softboundcets_memchr",
//     "softboundcets_rindex",
//     "softboundcets___getdelim",
//     "softboundcets_strtoul",
//     "softboundcets_strtod",
//     "softboundcets_strtol",
//     "softboundcets_strchrnul",
//     "softboundcets_strchr",
//     "softboundcets_strrchr",
//     "softboundcets_stpcpy",
//     "softboundcets_strcpy",
//     "softboundcets_abort",
//     "softboundcets_rand",
//     "softboundcets_atoi",
//     "softboundcets_puts",
//     "softboundcets_exit",
//     "softboundcets_strtok",
//     "softboundcets_strndup",
//     "softboundcets_strdup",
//     "softboundcets___strdup",
//     "softboundcets_strcat",
//     "softboundcets_strncat",
//     "softboundcets_strncpy",
//     "softboundcets_strstr",
//     "softboundcets_signal",
//     "softboundcets_clock",
//     "softboundcets_atol",
//     "softboundcets_realloc",
//     "softboundcets_calloc",
//     "softboundcets_mmap",
//     "softboundcets_malloc",
//     "softboundcets_putchar",
// };
