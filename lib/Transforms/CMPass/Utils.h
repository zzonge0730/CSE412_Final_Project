// This file used to provide some useful helper functions
#ifndef UTILS_H
#define UTILS_H

//#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"



namespace llvm {
    class BranchInst;
    class CallInst;
    class LLVMContext;
    class raw_ostream;
}

bool IsSafeCheckCall(llvm::CallInst *CI);

#endif