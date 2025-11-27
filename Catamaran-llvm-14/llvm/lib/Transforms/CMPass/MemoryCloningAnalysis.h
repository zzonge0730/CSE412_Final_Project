#ifndef MEMORYCLONINGANALYSIS_H
#define MEMORYCLONINGANALYSIS_H

#include "llvm/IR/Instruction.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DataLayout.h"

#include "LoopStructure.h"
#include "DominatorSummary.h"
#include "PDG.h"

#include <memory>
using namespace llvm;

class ClonableMemoryLocation {
public:
    ClonableMemoryLocation(AllocaInst * allocation, uint64_t sizeInBits,
    LoopStructure *ls, DominatorSummary& ds, PDG * loopPDG);

    AllocaInst * getAllocation(void) const;

    std::unordered_set<Instruction *> getLoopInstructionsUsingLocation(void) const;

    std::unordered_set<Instruction *> getInstructionsUsingLocationOutsideLoop(void) const;

    bool isInstructionCastOrGEPOfLocation(Instruction * inst) const;
    bool isInstructionStoringLocation(Instruction * inst) const;
    bool isInstructionLoadingLocation(Instruction * inst) const;

    bool mustAliasMemoryLocationWithinObject(Value * ptr) const;

    bool isClonableLocation(void) const;

    static bool isMemCpyInstrinsicCall(CallInst * call);

private:
    AllocaInst * allocation;
    Type * allocatedType;
    uint64_t sizeInBits;
    LoopStructure * loopS;
    bool isClonable;
    bool isScopeWithinLoop;

    std::unordered_set<Instruction *> castsAndGEPs;
    std::unordered_set<Instruction *> storingInstructions;
    std::unordered_set<Instruction *> loadInstructions;
    std::unordered_set<Instruction *> nonStoringInstructions;

    bool identifyStoresAndOtherUsers(LoopStructure * ls, DominatorSummary& ds);

    bool isThereRAWThroughMemoryFromOutsideLoop(LoopStructure * ls,
    AllocaInst * acInst, PDG * loopPDG) const;

    bool isThereRAWThroughMemoryFromOutsideLoop(LoopStructure * ls,
    AllocaInst * acInst, PDG * loopPDG, std::unordered_set<Instruction*> insts) const; 

    
    // A set of storing instructions that completely override the allocation's
    // values before any use it dominates gets to using the allocation
    struct OverrideSet{ 
        BasicBlock * dominatingBlockOfNonStoringInsts;
        std::unordered_set<Instruction *> initialStoringInstructions;
        std::unordered_set<Instruction *> subsequentNonStoringInstructions;
    };
    // std::unordered_set<std::unique_ptr<OverrideSet>> overrideSets;
    std::unordered_set<OverrideSet *> overrideSets;
    bool identifyInitialStoringInstructions(LoopStructure * loop,  DominatorSummary& ds);
    bool areOverrideSetsFullyCoveringTheAllocationSpace(void) const;
    bool isOverrideSetFullyCoveringTheAllocationSpace(OverrideSet *overrideSet) const;

    void setObjectScope(AllocaInst * allocation, LoopStructure * loopS, DominatorSummary& ds);

};

class MemoryCloningAnalysis {
public:
    MemoryCloningAnalysis(LoopStructure * loopS, DominatorSummary& ds, PDG * loopPDG);

    const std::unordered_set<ClonableMemoryLocation *> getClonableMemoryLocationsFor(Instruction * inst) const;

    std::unordered_set<ClonableMemoryLocation *> getClonableMemoryLocations(void) const;

private:
    // std::unordered_set<std::unique_ptr<ClonableMemoryLocation>> clonableMemoryLocations;
    std::unordered_set<ClonableMemoryLocation *> clonableMemoryLocations;
};

#endif