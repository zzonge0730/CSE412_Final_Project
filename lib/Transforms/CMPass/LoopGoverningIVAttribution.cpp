#include "LoopGoverningIVAttribution.h"

LoopGoverningIVAttribution::LoopGoverningIVAttribution (InductionVariable &iv, SCC &scc, std::vector<BasicBlock *> &exitBlocks)
: 
    IV{iv}
, scc{scc}
, headerCmp{nullptr}
, conditionValueDerivation{}
, intermediateValueUsedInCompare{nullptr}
, isWellFormed{false} 
{

    /*
    * To understand how to transform the loop governing condition, it is far simpler to
    * know the sign of the step size at compile time. Extra overhead is necessary if this
    * is only known at runtime, and that enhancement has yet to be made
    */
    if (!iv.getSingleComputedStepValue() || !isa<ConstantInt>(iv.getSingleComputedStepValue())) {
        return;
    }

    auto headerPHI = iv.getLoopEntryPHI();
    auto ivInstructions = iv.getAllInstructions();

    /*
    * This attribution only understands integer typed induction variables
    */
    if (!headerPHI->getType()->isIntegerTy()) {
        return;
    }

    /*
    * Fetch the loop governing terminator.
    * NOTE: It should be the only conditional branch in the IV's SCC
    */
    BranchInst *loopGoverningTerminator = nullptr;
    auto sccOfIV = iv.getSCC();
    for (auto internalNodePair : sccOfIV->getInternalNodePairs()) {

        /*
        * Fetch the current instruction within the SCC that contains the IV
        */
        auto value = internalNodePair.first;

        /*
        * Check whether the current instruction is a branch
        */
        if (!isa<BranchInst>(value)) {
            continue;
        }

        /*
        * The current instruction is a branch.
        * Check whether it is a conditional one.
        */
        auto br = cast<BranchInst>(value);
        if (!br->isConditional()) {
            continue;
        }

        /*
        * The current branch is a conditional one.
        */
        if (loopGoverningTerminator) {
            return;
        }
        loopGoverningTerminator = br;
    }

    /*
    * Ensure the branch is in the header as this analysis does not understand do-while loops
    */
    if (!loopGoverningTerminator) {
        return;
    }
    if (loopGoverningTerminator->getParent() != headerPHI->getParent()) {
        return;
    }
    this->headerBr = loopGoverningTerminator;

    /*
    * Fetch the condition of the conditional branch
    */
    auto headerCondition = headerBr->getCondition();
    if (!isa<CmpInst>(headerCondition)) {
        return;
    }

    /*
    * HACK: We do not handle intermediate values being used in the comparison properly,
    * so for now we will make this check more strict to ensure the loop entry PHI is used
    */
    this->headerCmp = cast<CmpInst>(headerCondition);
    auto opL = headerCmp->getOperand(0), opR = headerCmp->getOperand(1);
    auto isOpLHSLoopEntryPHI = isa<Instruction>(opL) && headerPHI == cast<Instruction>(opL);
    auto isOpRHSLoopEntryPHI = isa<Instruction>(opR) && headerPHI == cast<Instruction>(opR);
    if (!(isOpLHSLoopEntryPHI ^ isOpRHSLoopEntryPHI)) {
        return;
    }
    this->conditionValue = isOpLHSLoopEntryPHI ? opR : opL;
    this->intermediateValueUsedInCompare = cast<Instruction>(isOpLHSLoopEntryPHI ? opL : opR);

    std::set<BasicBlock *> exitBlockSet(exitBlocks.begin(), exitBlocks.end());
    if (exitBlockSet.find(headerBr->getSuccessor(0)) != exitBlockSet.end()) {
        this->exitBlock = headerBr->getSuccessor(0);
    } else if (exitBlockSet.find(headerBr->getSuccessor(1)) != exitBlockSet.end()) {
        this->exitBlock = headerBr->getSuccessor(1);
    } else {
        return ;
    }

    if (scc.isInternalNode(conditionValue)) {
        std::queue<Instruction *> conditionDerivation;
        assert(isa<Instruction>(conditionValue)
            && "An internal value to an IV's SCC must be an instruction!");
        conditionDerivation.push(cast<Instruction>(conditionValue));

        while (!conditionDerivation.empty()) {
        auto value = conditionDerivation.front();
        conditionDerivation.pop();

        auto valueNodeInSCC = scc.fetchNode(value);
        for (auto edge : valueNodeInSCC->getIncomingEdges()) {
            if (!edge->isDataDependence()) continue;

            auto outgoingValue = edge->getOutgoingT();
            if (!scc.isInternalNode(outgoingValue)) {
                continue ;
            }
            assert(isa<Instruction>(outgoingValue)
                && "An internal value to an IV's SCC must be an instruction!");
            auto outgoingInst = cast<Instruction>(outgoingValue);

            /*
            * The exit condition value cannot be itself derived from the induction variable 
            */
            if (ivInstructions.find(outgoingInst) != ivInstructions.end()) {
                return;
            }

            /*
            * Check if we have already considered outgoingInst.
            */
            if (this->conditionValueDerivation.find(outgoingInst) != this->conditionValueDerivation.end()){
                continue ;
            }

            /*
            * @outgoingInst hasn't been considered yet.
            * It's time to consider it.
            */
            conditionValueDerivation.insert(outgoingInst);
            conditionDerivation.push(outgoingInst);
            }
        }
    }

    isWellFormed = true;

    return ;
}

InductionVariable & LoopGoverningIVAttribution::getInductionVariable(void) const {
    return this->IV;
}

CmpInst *LoopGoverningIVAttribution::getHeaderCmpInst(void) const {
    return headerCmp;
}

Value *LoopGoverningIVAttribution::getHeaderCmpInstConditionValue(void) const {
    return conditionValue;
}

BranchInst *LoopGoverningIVAttribution::getHeaderBrInst(void) const {
    return headerBr;
}

BasicBlock *LoopGoverningIVAttribution::getExitBlockFromHeader(void) const {
    return exitBlock;
}

bool LoopGoverningIVAttribution::isSCCContainingIVWellFormed(void) const {
    return isWellFormed;
}

std::set<Instruction *> LoopGoverningIVAttribution::getConditionValueDerivation(void) const { 
    return conditionValueDerivation;
}

Instruction * LoopGoverningIVAttribution::getIntermediateValueUsedInCompare (void) const {
    return intermediateValueUsedInCompare;
}
