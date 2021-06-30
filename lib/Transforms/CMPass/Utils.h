// This file used to provide some useful helper functions
#ifndef UTILS_H
#define UTILS_H

//#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"



using namespace llvm;

bool IsSafeCheckCall(CallInst *CI);
bool IsSafeCheckFun(StringRef funcName);

bool IsEmittingInst(Instruction &I);
bool IsMemAccessInst(Instruction &I);

#endif