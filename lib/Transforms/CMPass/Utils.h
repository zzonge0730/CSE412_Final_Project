// This file used to provide some useful helper functions
#ifndef UTILS_H
#define UTILS_H

//#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"


#include <memory>
#include <utility>

using namespace llvm;

bool IsSafeCheckCall(CallInst *CI);
bool IsSafeCheckFun(StringRef funcName);

bool IsEmittingInst(Instruction &I);
bool IsMemAccessInst(Instruction &I);

bool isAllocator(CallInst * callInst);
bool isDeallocator(CallInst * callInst);

// template<typename T, typename... Args>
// std::unique_ptr<T> make_unique(Args&&... args) {
//     return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
// }

#endif