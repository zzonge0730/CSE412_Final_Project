#ifndef LOOPSUMMARY_H
#define LOOPSUMMARY_H

#include <memory>
#include <set>
#include <unordered_map>

#include "llvm/Analysis/LoopInfo.h"

#include "LoopStructure.h"

class LoopSummary {
public:
    std::set<std::shared_ptr<LoopStructure>> loops;

    LoopSummary(Loop * loop);

    LoopSummary() = delete;

    LoopStructure * getLoop(Instruction& instIncludedInLoop) const;

    LoopStructure * getLoop(BasicBlock& bbIncludedInLoop) const;

    LoopStructure * getLoopNestingTreeRoot(void) const;

    void print(raw_ostream& stream) const;

private:
    LoopStructure * topLoop;

    std::unordered_map<BasicBlock *, LoopStructure *> bbToLoop;

    LoopStructure * createSummary(Loop * loop, LoopStructure * parentLoop);
};

#endif