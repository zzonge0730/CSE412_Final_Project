#ifndef DOALL_H
#define DOALL_H

#include "llvm/IR/Module.h"

using namespace llvm;

class DOALL {
public:
    DOALL(Module& M);

protected:

    void rewireLoopToIterateChunks(LoopDependenceInfo * LDI);

    void addChunkFunctionExecutionAsiderOriginalLoop(LoopDependenceInfo *LDI, Function *loopFunction, Catamaran * cat);

};

#endif