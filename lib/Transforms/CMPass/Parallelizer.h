#ifndef PARALLELIZER_H
#define PARALLELIZER_H

#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/Analysis/Dominators.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Function.h"

#include "DOALL.h"
#include "Master.h"


using namespace llvm;

class Parallelizer : public ModulePass {

public:
    static char ID;
    Parallelizer();
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    bool runOnModule(Module& M) override;

private:

    bool parallelizeLoop(LoopDependenceInfo * LDI, Master& master, DOALL& doall);

    void printLoop(Loop* loop);

    std::vector<LoopDependenceInfo *> selectTheOrderOfLoopsToParallelize(
        Master& master, StayConnectedNestedLoopForestNode * tree
    );


};

#endif