// This file used to record partial cfgs from safe check code / basic blocks
#ifndef PARTIALCFGS_H
#define PARTIALCFGS_H

#include "DGBase.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/LoopInfo.h"


using namespace llvm;

class PartialCFGs : public DG<BasicBlock> {
public:
    PartialCFGs(Module &M);

    PartialCFGs(Function &F);

    PartialCFGs(Loop * L);

    PartialCFGs(std::set<BasicBlock *> &bbs);

private:
    void connectBasicBlockNodes();

};

#endif