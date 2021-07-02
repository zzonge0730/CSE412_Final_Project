#ifndef DOALL_H
#define DOALL_H

#include "llvm/IR/Module.h"

#include "LoopDependenceInfo.h"

using namespace llvm;

class DOALL {
public:
    DOALL(Module& M);

    bool apply(LoopDependenceInfo * LDI, Catamaran& cat, Heuristics * H);

    bool canBeAppliedToLoop(LoopDependenceInfo * LDI, Catamaran& cat, Heuristics * H);

    static std::unordered_set<SCC *> getSCCsThatBlockDOALLToBeApplicable(LoopDependenceInfo * LDI, Catamaran& cat);
protected:

    void rewireLoopToIterateChunks(LoopDependenceInfo * LDI);

    void addChunkFunctionExecutionAsiderOriginalLoop(LoopDependenceInfo *LDI, Function *loopFunction, Catamaran * cat);

    void * fetchClone(Value * original) const;
};

#endif