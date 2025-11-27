#ifndef LOOPGOVERNINGIVATTRIBUTION_H
#define LOOPGOVERNINGIVATTRIBUTION_H

#include "InductionVariables.h"
#include "SCC.h"

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"

#include <set>
#include <vector>

using namespace llvm;

class InductionVariable;

class LoopGoverningIVAttribution {
public:
    LoopGoverningIVAttribution (InductionVariable &IV, SCC &scc, std::vector<BasicBlock *> &exitBlocks) ;

    LoopGoverningIVAttribution () = delete ;

    InductionVariable & getInductionVariable (void) const;

    CmpInst *getHeaderCmpInst(void) const;

    Value * getHeaderCmpInstConditionValue (void) const;

    BranchInst *getHeaderBrInst (void) const;

    BasicBlock *getExitBlockFromHeader (void) const;

    bool isSCCContainingIVWellFormed (void) const;

    std::set<Instruction *> getConditionValueDerivation(void) const ;

    Instruction * getIntermediateValueUsedInCompare (void) const ;

private:
    InductionVariable & IV;
    SCC & scc;
    std::set<Instruction *> conditionValueDerivation;
    Value *conditionValue;
    Instruction *intermediateValueUsedInCompare;
    CmpInst *headerCmp;
    BranchInst *headerBr;
    BasicBlock *exitBlock;
    bool isWellFormed;
};

#endif