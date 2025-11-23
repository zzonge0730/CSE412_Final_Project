#ifndef INVARIANTMANAGER_H
#define INVARIANTMANAGER_H

#include "PDG.h"
#include "PDGAnalysis.h"
#include "LoopSummary.h"

#include "llvm/IR/Value.h"
#include "llvm/IR/Instruction.h"



#include "DGBase.h"

#include <unordered_set>

using namespace llvm;

class InvariantManager {
public:
    InvariantManager(LoopStructure * loopS, PDG * loopPDG);

    InvariantManager() = delete;

    bool isLoopInvariant(Value * value) const;

    std::unordered_set<Instruction *> getLoopInstructionThatAreLoopInvariants(void) const;

private:
    std::unordered_set<Instruction *> invariants;
    LoopStructure * ls;

    //inner class defines methods to determine whether values are invariant
    //and relies on the dependence graph passed to the invariant manager.
    //However, the graph may become invalidated later on, so to prevent keeping that pointer
    //around after the construction of InvariantManager, we encapsulate it in this inner class
    class InvarianceChecker {
        public:
            InvarianceChecker(LoopStructure * loop, PDG * loopPDG, std::unordered_set<Instruction *>& invariants);
        private:
            LoopStructure * loop;
            PDG * loopPDG;
            std::unordered_set<Instruction*>& invariants;
            //used to cache instructions already checked and known NOT to be invariant
            std::unordered_set<Instruction*> notInvariants;

            //to pass as a lambda to a dependence iteration function on PDG
            //we bind isEvolvingValue to this member variable
            bool isEvolvingValue(Value * toValue, DGEdge<Value> *dep);

            //for each top level call to isEvolvingValue, track values checked
            //in case of a cycle of dependencies
            std::unordered_set<Instruction *> dependencyValuesBeingChecked;

            bool arePHIIncomingValuesEquivalent(PHINode* phi);
    };


};

#endif