#ifndef _INTER_TASK_H
#define _INTER_TASK_H

#include <random>
#include "llvm/Pass.h"
#include "PDG.h"
#include "PDGAnalysis.h"
#include "llvm/IR/IntrinsicInst.h"

using namespace llvm;

class InterTask : public ModulePass {
public:
    static char ID;
    InterTask();
    virtual ~InterTask();
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    bool runOnModule(Module &M) override;

private:
    Module * mo;
    std::map<uint32_t, Constant *> ctors;
    Constant * joinFunc;
    uint32_t id;
    std::mt19937 taskSeed;
    Constant * generateJoin();
    void genCtorForSpawn(Function * wrapperFunc);
    std::vector<Value *> genSpawnArgs(CallInst * CI, Function * wrapperFunc);
    
};

#endif