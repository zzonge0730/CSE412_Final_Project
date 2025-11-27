#include "Utils.h"

using namespace llvm;

bool IsSafeCheckCall(CallInst *CI){
    if(CI->getCalledFunction()) {
        std::string callName = CI->getCalledFunction()->getName();
        if(callName.find("__asan_store") != std::string::npos || callName.find("__asan_load") != std::string::npos) {
            return true;
        }
    }
    return false;
}

bool IsIntraTaskConsidered(CallInst *CI) {
    if(CI->getCalledFunction()) {
        std::string callName = CI->getCalledFunction()->getName();
        if(callName.find("__asan_store") != std::string::npos || callName.find("__asan_load") != std::string::npos ||
        callName.find("__sanitizer_ptr_cmp") != std::string::npos || callName.find("__sanitizer_ptr_sub") != std::string::npos) {
            return true;
        }
    }
    return false;
}


// TODO:
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


bool IsSafeCheckCallForLoopFree(CallInst *CI) {
    if (CI->getCalledFunction()) {
        std::string callName = CI->getCalledFunction()->getName();
        if (
            callName.find("__asan_store") != std::string::npos || callName.find("__asan_load") != std::string::npos
            ) {
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
    calleeName == "realloc") {
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
    if (calleeName == "free") {
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
    if (calleeName == "realloc") {
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
    calleeName == "realloc") {
        return callInst;
    }

    return nullptr;
}

Value * getFreedObject (CallInst * callInst) {
    if (!isDeallocator(callInst)) return nullptr;

    auto callee = callInst->getCalledFunction();
    if (callee == nullptr) return nullptr;
    auto calleeName = callee->getName();
    if (calleeName == "free") {
        return callInst->getArgOperand(0);
    }

    return nullptr;
}

uint32_t getSafeCheckCost(Instruction * callInst) {
    uint32_t cost = 1;
    if (CallInst * CI = dyn_cast<CallInst>(callInst)) {
        Function * func = CI->getCalledFunction();
        if (func) {
            std::string funcName = func->getName();
            if (funcName == "__asan_load1" || funcName == "__asan_load2" || funcName == "__asan_load4" ||
                funcName == "__asan_store1" || funcName == "__asan_store2" || funcName == "__asan_store4") {
                cost = 25;
            } else if (funcName == "__asan_load8" || funcName == "__asan_load16" || 
                funcName == "__asan_store8" || funcName == "__asan_store16") {
                cost = 15;
            } else if (funcName == "__asan_storeN" || funcName == "__asan_loadN") {
                cost = 19;
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
                    cost += 100;// TODO:
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
                    cost += 100; // TODO: 
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

bool isASANLibFunc(Function * func) {
    std::string funcName = func->getName();
    if (asanLibFunction.count(funcName) > 0) {
        return true;
    }
    for (auto it = asanLibFunction.begin(); it != asanLibFunction.end(); ++it) {
        if (funcName.find(*it) != std::string::npos) {
            return true;
        }
    }
    return false;
}
