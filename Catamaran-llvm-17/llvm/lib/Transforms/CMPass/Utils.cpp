#include "Utils.h"



using namespace llvm;

bool IsSafeCheckCall(CallInst *CI){
    if(CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if(callName.equals("__softboundcets_metadata_load") ||
        callName.equals("__softboundcets_temporal_load_dereference_check") ||
        callName.equals("__softboundcets_spatial_load_dereference_check") ||
        callName.equals("__softboundcets_temporal_store_dereference_check") ||
        callName.equals("__softboundcets_spatial_store_dereference_check")) {
            return true;
        }
    }
    return false;
}

bool IsSafeCheckCallStore(CallInst *CI){
    if(CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if(callName.equals("__softboundcets_metadata_store")) {
            return true;
        }
    }
    return false;
}

bool IsSafeCheckCallStoreForSafeC(CallInst *CI){
    if(CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if(callName.equals("_safeC_metadata_update")) {
            return true;
        }
    }
    return false;
}

bool IsSafeCheckCallStoreForMC(CallInst *CI){
    if(CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if( callName.equals("_RV_fmd_tbl_update_pmd") ||
            callName.equals("_RV_pmd_tbl_update_pmd") ||
            callName.equals("_RV_pmd_tbl_update_ptr") ||
            callName.equals("_RV_pmd_tbl_update_fpmd") ||
            callName.equals("_RV_pmd_tbl_update_sa")) {
            return true;
        }
    }
    return false;
}

bool IsIntraTaskConsideredForSB(CallInst *CI) {
    if(CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if( callName.equals("__softboundcets_temporal_load_dereference_check") ||
            callName.equals("__softboundcets_spatial_load_dereference_check") ||
            callName.equals("__softboundcets_temporal_store_dereference_check") ||
            callName.equals("__softboundcets_spatial_store_dereference_check")) {
            return true;
        }
    }
    return false;
}

bool IsIntraTaskConsideredForSafeC(CallInst *CI) {
    if(CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if( callName.equals("_safeC_spatial_check") ||
            callName.equals("_safeC_spatial_check_array2")) {
            return true;
        }
    }
    return false;
}

bool IsIntraTaskConsideredForMC(CallInst * CI) {
    if(CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if (callName.equals("_RV_check_dpc_ss") ||
            callName.equals("_RV_check_dpv") ||
            callName.equals("__RV_check_dpv_ss")) {
            return true;
        }
    }
    return false;   
}

bool IsSafeCheckCallForMovec(CallInst *CI) {
    if (CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if (callName.equals("_RV_pmd_tbl_lookup") ||
            callName.equals("_RV_fmd_tbl_lookup_fpmd") ||
            callName.equals("_RV_check_dpv") ||
            callName.equals("__RV_check_dpv") ||
            callName.equals("_RV_check_dpfv") ||
            callName.equals("_RV_check_dpc") ||
            callName.equals("__RV_check_dpc") ||
            callName.equals("_RV_check_dpc_ss") ||
            callName.equals("__RV_check_dpc_ss") ||
            callName.equals("__RV_check_dpv_ss") ||
            callName.equals("_RV_check_dpfc") ||
            callName.equals("_RV_fmd_tbl_update_pmd") ||
            callName.equals("_RV_pmd_tbl_update_pmd") ||
            callName.equals("_RV_pmd_tbl_update_ptr") ||
            callName.equals("_RV_pmd_tbl_update_fpmd") ||
            callName.equals("_RV_pmd_tbl_update_sa")) {
                return true;
        }
    }

    return false;
}

bool IsSafeCheckCallForSafeC(CallInst *CI) {
    if (CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if (callName.equals("_safeC_metadata_lookup_base_bound") ||
            callName.equals("_safeC_metadata_update") ||
            callName.equals("_safeC_spatial_check") ||
            callName.equals("_safeC_spatial_check_array2")) {
                return true;
        }
    }

    return false;
}

bool IsConsideredFunForInterTask(Function &F) {
    
    StringRef str = F.getName();
    if (
    // for bzip2
    str.equals("BZ2_decompress") ||
    str.equals("bsW") 

    // for other subjects...
    ) {
        return true;
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
                funcName.equals("__softboundcets_abort") ||
                // funcName.equals("__softboundcets_metadata_load") ||
                // funcName.equals("__softboundcets_temporal_load_dereference_check") ||
                // funcName.equals("__softboundcets_spatial_load_dereference_check") ||
                // funcName.equals("__softboundcets_temporal_store_dereference_check") ||
                // funcName.equals("__softboundcets_spatial_store_dereference_check") ||
                funcName.equals("__softboundcets_stack_memory_allocation") ||
                funcName.equals("__softboundcets_load_base_shadow_stack") ||
                funcName.equals("__softboundcets_load_bound_shadow_stack") ||
                funcName.equals("__softboundcets_load_key_shadow_stack") ||
                funcName.equals("__softboundcets_load_lock_shadow_stack") ||
                funcName.equals("__softboundcets_get_global_lock") ||
                // funcName.equals("__softboundcets_metadata_store") ||
                funcName.equals("__softboundcets_allocate_shadow_stack_space") ||
                funcName.equals("__softboundcets_store_base_shadow_stack") ||
                funcName.equals("__softboundcets_store_bound_shadow_stack") ||
                funcName.equals("__softboundcets_store_key_shadow_stack") ||
                funcName.equals("__softboundcets_store_lock_shadow_stack") ||
                funcName.equals("__softboundcets_deallocate_shadow_stack_space") ||
                funcName.equals("__softboundcets_stack_memory_deallocation")) {
                return false;
            }
            return true;
    }
    return false;
}


bool IsSafeCheckCallForLoopFree(CallInst *CI) {
    if (CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if (
            // callName.equals("__softboundcets_metadata_load") ||
            callName.equals("__softboundcets_temporal_load_dereference_check") ||
            callName.equals("__softboundcets_spatial_load_dereference_check") ||
            callName.equals("__softboundcets_temporal_store_dereference_check") ||
            callName.equals("__softboundcets_spatial_store_dereference_check") ||
            // callName.equals("__softboundcets_metadata_store") ||
            callName.equals("_RV_check_dpv") || 
            callName.equals("__RV_check_dpv") || 
            callName.equals("_RV_check_dpc") || 
            callName.equals("__RV_check_dpc") || 
            callName.equals("_RV_check_dpc_ss") ||
            callName.equals("__RV_check_dpc_ss") ||
            callName.equals("__RV_check_dpv_ss") ||
            // callName.equals("_safeC_metadata_lookup_base_bound") ||
            // callName.equals("_safeC_metadata_update") ||
            callName.equals("_safeC_spatial_check") ||
            callName.equals("_safeC_spatial_check_array2")) {
            return true;
        }
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

bool isAllocator(CallInst * callInst) {
    if (callInst == nullptr) return false;
    
    auto callee = callInst->getCalledFunction();
    if (callee == nullptr) return false;

    //check if it is a call to a library
    if (!callee->empty()) return false;

    auto calleeName = callee->getName();
    if (calleeName == "malloc" ||
    calleeName == "calloc" || 
    calleeName == "realloc" ||
    calleeName == "softboundcets_malloc" ||
    calleeName == "softboundcets_calloc" ||
    calleeName == "softboundcets_realloc" ||
    calleeName == "_RV_malloc" ||
    calleeName == "_RV_calloc" ||
    calleeName == "_RV_realloc") {
        return true;
    }

    return false;
}

bool isDeallocator(CallInst * callInst) {
    if (callInst == nullptr) return false;

    auto callee = callInst->getCalledFunction();
    if (callee == nullptr) return false;

    if (!callee->empty()) return false;

    auto calleeName = callee->getName();
    if (calleeName == "free" || 
    calleeName == "softboundcets_free" ||
    calleeName == "_RV_free") {
        return true;
    }

    return false;
}

bool isReallocator (CallInst * callInst) {
    if (callInst == nullptr) return false;

    auto callee = callInst->getCalledFunction();
    if (callee == nullptr) return false;

    if (!callee->empty()) return false;

    auto calleeName = callee->getName();
    if (calleeName == "realloc" || 
    calleeName == "softboundcets_realloc" ||
    calleeName == "_RV_realloc") {
        return true;
    }

    return false;
}

Value * getAllocatedObject (CallInst * callInst) {
    if (!isAllocator(callInst)) return nullptr;

    auto callee = callInst->getCalledFunction();
    if (callee == nullptr) return nullptr;
    auto calleeName = callee->getName();
    if (calleeName == "malloc" ||
    calleeName == "calloc" || 
    calleeName == "realloc" ||
    calleeName == "softboundcets_malloc" ||
    calleeName == "softboundcets_calloc" ||
    calleeName == "softboundcets_realloc" ||
    calleeName == "_RV_malloc" ||
    calleeName == "_RV_calloc" ||
    calleeName == "_RV_realloc") {
        return callInst;
    }

    return nullptr;
}

Value * getFreedObject (CallInst * callInst) {
    if (!isDeallocator(callInst)) return nullptr;

    auto callee = callInst->getCalledFunction();
    if (callee == nullptr) return nullptr;
    auto calleeName = callee->getName();
    if (calleeName == "free" || 
    calleeName == "softboundcets_free" ||
    calleeName == "_RV_free") {
        return callInst->getArgOperand(0);
    }

    return nullptr;
}

uint32_t getSafeCheckCost(Instruction * callInst) {
    uint32_t cost = 1;
    if (CallInst * CI = dyn_cast<CallInst>(callInst)) {
        Function * func = CI->getCalledFunction();
        if (func) {
            // LLVM 14: StringRef → string 변환
            std::string funcName = func->getName().str();
            if (funcName == "__softboundcets_spatial_load_dereference_check") {
                cost = 18;
            } else if (funcName == "__softboundcets_spatial_store_dereference_check") {
                cost = 18;
            } else if (funcName == "__softboundcets_temporal_load_dereference_check") {
                cost = 12;
            } else if (funcName == "__softboundcets_temporal_store_dereference_check") {
                cost = 12;
            } else if (funcName == "__softboundcets_metadata_load") {
                cost = 57;
            } else if (funcName == "__softboundcets_metadata_store") {
                cost = 66;
            } else if (funcName == "_RV_check_dpv") {
                cost = 62;
                cost = 10;
            } else if (funcName == "_RV_check_dpfv") {
                cost = 58;
            } else if (funcName == "_RV_check_dpc") {
                cost = 25;
            } else if (funcName == "_RV_check_dpc_ss") {
                cost = 26;
            } else if (funcName == "_RV_check_dpfc") {
                cost = 21;
            } else if (funcName == "_RV_pmd_tbl_lookup") {
                cost = 67;
            } else if (funcName.find("_RV_pmd_tbl_update_") != funcName.npos) {
                cost = 128;
            } else {
                cost = 10;
            }
        }
    }
    return cost;
}
uint32_t getSpawnableCost() {
    return 10;
}
uint32_t getOriginalCost(Instruction * start, Instruction * end) {
    uint32_t cost = 1;
    BasicBlock * startBB = start->getParent();
    BasicBlock * endBB = end->getParent();
    if (endBB != startBB) {
        bool flag = true;
        for (Instruction& inst : *startBB) {
            if (start == &inst) {
                flag = true;
            }
            if (flag) {
                if (CallInst * ci = dyn_cast<CallInst>(&inst)) {
                    if (!IsSafeCheckCallForMovec(ci)) {
                        cost += 100;
                    }
                } else {
                    if (IsMemAccessInst(inst)) ++cost;
                }
                
            }
        }
    } else {
        bool flag = false;
        for (Instruction& inst : *startBB) {
            if (start == &inst) {
                flag = true;
            }
            if (flag) {
                if (CallInst * ci = dyn_cast<CallInst>(&inst)) {
                    if (!IsSafeCheckCallForMovec(ci)) {
                        cost += 100;
                    }
                } else {
                    if (IsMemAccessInst(inst)) ++cost;
                }

            }

            if (end == &inst) {
                break;
            }
        }
    }
    return cost;
}

bool instHappensBefore(Instruction * inst, Instruction * final) {
    Function * parentFunc = final->getParent()->getParent();
    bool flag = false;
    for (BasicBlock& BB : *parentFunc) {
        for (Instruction& I : BB) {
            if (inst == &I) {
                flag = true;
            }
            if (final == &I) {
                return flag;
            }
        }
    }
}

Instruction * getNextInstruction(Instruction * I, BasicBlock *BB) {
    Instruction * Next = nullptr;
    for (BasicBlock::iterator BBit = BB->begin(), BBend = BB->end();
        BBit != BBend; ++BBit) {
        Next = &*BBit;
        if (I == Next) {
            Next = &*(++BBit);
            break;
        }
    }
    return Next;
}

uint32_t calCost(std::pair<Instruction*, Instruction*> pair, std::unordered_map<Instruction *, Instruction *> safeCheckCallInstJoinPoint) {
    uint32_t res = 0;
    Instruction * leftInst = pair.first;
    Instruction * rightInst = pair.second; // may be rightInst is a nullptr
    if (rightInst != nullptr) {
        // errs() << "--436\n";
        Instruction * leftInstJP = safeCheckCallInstJoinPoint.at(leftInst);
        // if (leftInstJP == nullptr) errs() << "l is null...\n";
        
        
        Instruction * rightInstJP = safeCheckCallInstJoinPoint.at(rightInst);
        // if (rightInstJP == nullptr) errs() << "r is null...\n";
        // errs() << "--438\n";
        //judge which cost model to cal
        Instruction * leftInstNext = getNextInstruction(leftInst, leftInst->getParent());
        Instruction * rightInstNext = getNextInstruction(rightInst, rightInst->getParent());
        // errs() << "--439\n";
        Instruction * leftInstJPNext = getNextInstruction(leftInstJP, leftInstJP->getParent());
        Instruction * rightInstJPNext = getNextInstruction(rightInstJP, rightInstJP->getParent());
        // errs() << "--437\n";
        if (leftInstNext != rightInst && rightInstNext != leftInst) { // a, d , e
            if (leftInstJPNext != rightInstJP && rightInstJPNext != leftInstJP && leftInstJP != rightInstJP) {
                if (instHappensBefore(leftInstJP, rightInstJP)) {
                    //leftJP  rightJP
                    //d
                    if (instHappensBefore(leftInst, rightInst)) {
                        // errs() << "--451\n";
                        //leftInst  rightInst
                        uint32_t ts1 = getOriginalCost(leftInst, rightInst);
                        uint32_t ts2 = getOriginalCost(rightInst, leftInstJP);
                        uint32_t ts3 = getOriginalCost(leftInstJP, rightInstJP);
                        uint32_t tm1px = getSafeCheckCost(leftInst) + getSpawnableCost();
                        uint32_t tm2px = getSafeCheckCost(rightInst) + getSpawnableCost();
                        res = std::max(tm1px + ts3, ts1 + std::max(ts2 + ts3, tm2px));
                        
                    } else {
                        // rightInst leftInst , 
                        //another e model, reverse m1 and m2
                        // errs() << "--452\n";
                        uint32_t ts1 = getOriginalCost(rightInst, leftInst);
                        uint32_t ts2 = getOriginalCost(leftInst, leftInstJP);
                        uint32_t ts3 = getOriginalCost(leftInstJP, rightInstJP);
                        uint32_t tm1px = getSafeCheckCost(leftInst) + getSpawnableCost();
                        uint32_t tm2px = getSafeCheckCost(rightInst) + getSpawnableCost();
                        res = std::max(tm2px, ts1 + ts3 + std::max(ts2, tm1px));
                    }
                    
                } else {//rightJP leftJP 
                    //e
                    if (instHappensBefore(leftInst, rightInst)) {
                        //left  right
                        // errs() << "--453\n";
                        uint32_t ts1 = getOriginalCost(leftInst, rightInst);
                        uint32_t ts2 = getOriginalCost(rightInst, rightInstJP);
                        uint32_t ts3 = getOriginalCost(rightInstJP, leftInstJP);
                        uint32_t tm1px = getSafeCheckCost(leftInst) + getSpawnableCost();
                        uint32_t tm2px = getSafeCheckCost(rightInst) + getSpawnableCost();
                        res = std::max(tm1px, ts1 + ts3 + std::max(ts2, tm2px));

                    } else {
                        //right left 
                        //another d model, reverse m1 and m2
                        // errs() << "--454\n";
                        uint32_t ts1 = getOriginalCost(rightInst, leftInst);
                        uint32_t ts2 = getOriginalCost(leftInst, rightInstJP);
                        uint32_t ts3 = getOriginalCost(rightInstJP, leftInstJP);
                        uint32_t tm1px = getSafeCheckCost(leftInst) + getSpawnableCost();
                        uint32_t tm2px = getSafeCheckCost(rightInst) + getSpawnableCost();
                        res = std::max(ts3 + tm2px, ts1 + std::max(ts2 + ts3, tm1px));
                    }
                }
            } else {
                //a
                if (instHappensBefore(leftInst, rightInst)) {
                    // errs() << "--456\n";
                    uint32_t ts1 = getOriginalCost(leftInst, rightInst);
                    uint32_t ts2 = getOriginalCost(rightInst, rightInstJP);
                    uint32_t tm1px = getSafeCheckCost(leftInst) + getSpawnableCost();
                    uint32_t tm2px = getSafeCheckCost(rightInst) + getSpawnableCost();
                    res = std::max(tm1px, ts1 + std::max(ts2, tm2px));

                } else {
                    // errs() << "--457\n";
                    uint32_t ts1 = getOriginalCost(rightInst, leftInst);
                    uint32_t ts2 = getOriginalCost(leftInst, leftInstJP);
                    uint32_t tm1px = getSafeCheckCost(leftInst) + getSpawnableCost();
                    uint32_t tm2px = getSafeCheckCost(rightInst) + getSpawnableCost();
                    res = std::max(tm2px, ts1 + std::max(ts1, tm1px));
                }
            }
        } else { // b, c
            if (leftInstJPNext != rightInstJP && rightInstJPNext != leftInstJP && leftInstJP != rightInstJP) {
                //b
                
                if (instHappensBefore(leftInstJP, rightInstJP)) {
                    // errs() << "--458\n";
                    uint32_t ts2 = getOriginalCost(leftInstJP, rightInstJP);
                    uint32_t ts1 = getOriginalCost(leftInst, leftInstJP);
                    uint32_t tm1px = getSafeCheckCost(leftInst) + getSpawnableCost();
                    uint32_t tm2px = getSafeCheckCost(rightInst) + getSpawnableCost();
                    res = std::max(ts2 + std::max(ts1, tm1px), tm2px);
                } else {
                    // errs() << "--459\n";
                    uint32_t ts2 = getOriginalCost(rightInstJP, leftInstJP);
                    uint32_t ts1 = getOriginalCost(rightInst, rightInstJP);
                    uint32_t tm1px = getSafeCheckCost(leftInst) + getSpawnableCost();
                    uint32_t tm2px = getSafeCheckCost(rightInst) + getSpawnableCost();
                    res = std::max(ts2 + std::max(ts1, tm2px), tm1px);
                }
            } else {
                //c
                // errs() << "--460\n";
                uint32_t ts1 = getOriginalCost(leftInst, leftInstJP);
                uint32_t tm1px = getSafeCheckCost(leftInst) + getSpawnableCost();
                uint32_t tm2px = getSafeCheckCost(rightInst) + getSpawnableCost();
                res = tm1px >= ts1 ? std::max(tm1px, ts1) : std::max(ts1, tm2px);
            }
        }
    } else {//rightInst is a nullptr
        // errs() << "--461\n";
        Instruction * leftInstJP = safeCheckCallInstJoinPoint.at(leftInst);
        uint32_t ts2 = getOriginalCost(leftInst, leftInstJP);
        uint32_t ts1 = getOriginalCost(&*(leftInst->getParent()->begin()),leftInst);
        uint32_t tm1px = getSafeCheckCost(leftInst) + getSpawnableCost();
        res = std::max(ts1 + ts2, ts1 + tm1px);
    }

    return res;
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

// LLVM 14: PDGAnalysis가 비활성화되어 있으므로, static 메서드들을 Utils로 이동
// libraryFunction 정의 (PDGAnalysis.cpp에서 복사)
static const std::unordered_set<std::string> libraryFunction {
    // ctype.h
  "isalnum",
  "isalpha",
  "isblank",
  "iscntrl",
  "isdigit",
  "isgraph",
  "islower",
  "isprint",
  "ispunct",
  "isspace",
  "isupper",
  "isxdigit",
  "tolower",
  "toupper",

  // math.h
  "cos",
  "sin",
  "tan",
  "acos",
  "asin",
  "atan",
  "atan2",
  "cosh",
  "sinh",
  "tanh",
  "acosh",
  "asinh",
  "atanh",
  "exp",
  "ldexp",
  "log",
  "log10",
  "exp2",
  "expm1",
  "ilogb",
  "log1p",
  "log2",
  "logb",
  "scalbn",
  "scalbln",
  "pow",
  "sqrt",
  "cbrt",
  "hypot",
  "erf",
  "erfc",
  "tgamma",
  "lgamma",
  "ceil",
  "floor",
  "fmod",
  "trunc",
  "round",
  "lround",
  "llround",
  "nearbyint",
  "remainder",
  "copysign",
  "nextafter",
  "nexttoward",
  "fdim",
  "fmax",
  "fmin",
  "fabs",
  "abs",
  "fma",
  "fpclassify",
  "isfinite",
  "isinf",
  "isnan",
  "isnormal",
  "signbit",
  "isgreater",
  "isgreaterequal",
  "isless",
  "islessequal",
  "islessgreater",
  "isunordered",

  // time.h
  "clock",
  "difftime",

  // wctype.h
  "iswalnum",
  "iswalpha",
  "iswblank",
  "iswcntrl",
  "iswdigit",
  "iswgraph",
  "iswlower",
  "iswprint",
  "iswpunct",
  "iswspace",
  "iswupper",
  "iswxdigit",
  "towlower",
  "towupper",
  "iswctype",
  "towctrans",

  "atoi",
  "atoll",
  "exit",
  "strcmp",
  "strncmp",
  "rand_r"
};

// externalThreadSafeFunctions 정의 (PDGAnalysis.cpp에서 복사)
static const std::unordered_set<std::string> externalThreadSafeFunctions {
    "malloc",
    "calloc",
    "realloc",
    "free", 
    // for soundness, below functions are considered thread safe.
    "fgetc",
    "fopen",
    "fclose",
    "fwrite",
    "fread",
    "fprintf",
    "fscanf",

    "printf",
    "scanf",

    // ------------ softboundcets version ------------
    "softboundcets_malloc",
    "softboundcets_calloc",
    "softboundcets_realloc",
    "softboundcets_free",

    "softboundcets_fgetc",
    "softboundcets_fopen",
    "softboundcets_fclose",
    "softboundcets_fwrite",
    "softboundcets_fread",

    // ------------ movec version ------------
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
    "_RV_free",
    "_RV_malloc",
    "_RV_realloc",
    "_RV_read",
    "_RV_write"
};

bool isTheLibraryFunctionPure(Function * libF) {
    // LLVM 14: StringRef → string 변환
    std::string funcName = libF->getName().str();
    if (libraryFunction.count(funcName)) {
        return true;
    }
    return false;
}

bool isTheLibraryFunctionThreadSafe(Function * libraryFunction) {
    // LLVM 14: StringRef → string 변환
    std::string funcName = libraryFunction->getName().str();
    if (externalThreadSafeFunctions.count(funcName)) {
        return true;
    }
    return false;
}
