#ifndef IVSTEPPERUTILITY_H
#define IVSTEPPERUTILITY_H

#include "LoopGoverningIVAttribution.h"
#include "InductionVariables.h"

class IVUtility {
    public:

      static PHINode *createChunkPHI (
        BasicBlock *preheaderBlock,
        BasicBlock *headerBlock,
        Type *chunkPHIType,
        Value *chunkSize
      ) ;

      static void chunkInductionVariablePHI (
        BasicBlock *preheaderBlock,
        PHINode *ivPHI,
        PHINode *chunkPHI,
        Value *chunkStepSize
      ) ;

      static Value *offsetIVPHI (
        BasicBlock *insertBlock,
        PHINode *ivPHI,
        Value *startValue,
        Value *offsetValue
      );

      static void stepInductionVariablePHI (
        BasicBlock *preheaderBlock,
        PHINode *ivPHI,
        Value *additionalStepSize
      );

};

class LoopGoverningIVUtility {
public:
    LoopGoverningIVUtility (LoopGoverningIVAttribution &attribution) ;

    LoopGoverningIVUtility () = delete ;

    std::vector<Instruction *> &getConditionValueDerivation (void) ;

    void updateConditionAndBranchToCatchIteratingPastExitValue (
    CmpInst *cmpToUpdate,
    BranchInst *branchInst,
    BasicBlock *exitBlock) ;

    void cloneConditionalCheckFor (
    Value *recurrenceOfIV,
    Value *clonedComparedValue,
    BasicBlock *continueBlock,
    BasicBlock *exitBlock,
    IRBuilder<> &cloneBuilder) ;

private:
    LoopGoverningIVAttribution &attribution;
    CmpInst *condition;
    std::vector<Instruction *> conditionValueOrderedDerivation;

    CmpInst::Predicate nonStrictPredicate;
    bool doesOriginalCmpInstHaveIVAsLeftOperand;
    bool flipOperandsToUseNonStrictPredicate;
    bool flipBrSuccessorsToUseNonStrictPredicate;
};
#endif