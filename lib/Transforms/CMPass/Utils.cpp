#include "Utils.h"

using namespace llvm;

bool IsSafeCheckCall(CallInst *CI){
    if(CI->getCalledFunction()) {
        StringRef callName = CI->getCalledFunction()->getName();
        if(callName.startswith("__softboundcets") || 
        callName.startswith("softboundcets") ||
        callName.startswith("__asan_") || 
        callName.startswith("__ubsan_")){
            return true;
        }
    }
    return false;
}