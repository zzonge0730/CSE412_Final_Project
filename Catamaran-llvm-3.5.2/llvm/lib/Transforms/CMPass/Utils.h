// This file used to provide some useful helper functions
#ifndef UTILS_H
#define UTILS_H

//#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"

#include <memory>
#include <utility>
#include <string>
#include <set>
#include <unordered_set>
#include <unordered_map>

using namespace llvm;

bool IsSafeCheckCall(CallInst *CI);

bool IsIntraTaskConsidered(CallInst *CI);

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

bool isASANLibFunc(Function * libraryFunctio);
// template<typename T, typename... Args>
// std::unique_ptr<T> make_unique(Args&&... args) {
//     return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
// }

const std::unordered_set<std::string> asanLibFunction {
    "asan.module_ctor",
    "asan.module_dtor",
    "__asan_init_v4",
    "__asan_register_globals",
    "__asan_unregister_globals",
    "__asan_memmove",
    "__asan_memcpy",
    "__asan_memset",
    "__asan_handle_no_return",
    "__sanitizer_cov",
    "__sanitizer_cov_module_init",
    "__asan_stack_malloc",
    "__asan_stack_free",
    "__asan_poison_stack_memory",
    "__asan_unpoison_stack_memory",
    "__asan_before_dynamic_init",
    "__asan_after_dynamic_init",
    "__sanitizer_ptr_cmp",
    "__sanitizer_ptr_sub"
};

#endif