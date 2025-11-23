#ifndef LOOPSTRUCTURE_H
#define LOOPSTRUCTURE_H

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Analysis/LoopInfoImpl.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"

#include "llvm/Support/raw_ostream.h"

#include <unordered_set>
#include <vector>
#include <utility>

using namespace llvm;

class LoopStructure {
public:
    LoopStructure(Loop* loop);

    LoopStructure(Loop* loop, LoopStructure* parentLoop);

    uint64_t getID(void) const;

    Function * getFunction(void) const;

    BasicBlock * getHeader(void) const;

    BasicBlock * getPreHeader(void) const;

    Instruction * getEntryInstruction(void) const;

    //return the nesting level of the loop.
    //1 means the outermost loop.

    uint32_t getNestingLevel(void) const;

    LoopStructure * getParentLoop(void) const;

    void setParentLoop(LoopStructure * parentLoop);

    std::unordered_set<LoopStructure *> getChildren(void) const;

    std::unordered_set<LoopStructure *> getDescendants(void) const; //more details

    void addChild(LoopStructure * child);

    std::unordered_set<BasicBlock *> getLatches(void) const;

    std::unordered_set<BasicBlock *> getBasicBlocks(void) const;

    std::unordered_set<Instruction *> getInstructions(void) const;

    uint64_t getNumberOfInstructions(void) const;

    std::vector<BasicBlock *> getLoopExitBasicBlocks(void) const;

    std::vector<std::pair<const BasicBlock *, const BasicBlock *>> getLoopExitEdges(void) const;

    uint64_t numberOfExitBasicBlocks(void) const;

    bool isLoopInvariant(Value * value) const;

    bool isIncluded(BasicBlock * bb) const;

    bool isIncluded(Instruction * inst) const;

    bool isIncludedInItsSubLoops(Instruction * inst) const;

    //this function returns the total number of sub-loops contained by @this
    //
    uint32_t getNumberOfSubLoops(void) const;

    void print(raw_ostream & stream);

    std::vector<BasicBlock *> orderedBBs;

    std::unordered_set<BasicBlock *> getLoopBody(void);

    bool isLoopExitBlock(BasicBlock * bb);
    bool isInLoopLatch(Instruction * inst);

private:
    uint64_t ID;
    BasicBlock * header;
    BasicBlock * preHeader;
    uint32_t depth;
    LoopStructure * parent;
    std::unordered_set<Instruction *> invariants;
    std::unordered_set<LoopStructure *> children;
    std::unordered_set<BasicBlock *> latchBBs;
    std::unordered_set<BasicBlock *> BBs;

    //
    std::vector<BasicBlock *> exitBlocks;
    std::vector<std::pair<const BasicBlock *, const BasicBlock *>> exitEdges;

    static uint64_t globalID;

    bool isContainedInstructionLoopInvariant(Instruction *inst) const;

    void calculateLoopBody(void);
    std::unordered_set<BasicBlock *> bodyBBs;
};

#endif