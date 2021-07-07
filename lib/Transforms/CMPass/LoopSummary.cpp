#include "LoopSummary.h"
#include <queue>
LoopSummary::LoopSummary(Loop * loop) {
    std::unordered_map<Loop *, LoopStructure *> loopToSummary;
    loopToSummary[loop->getParentLoop()] = nullptr;

    //subloops only include 1-level deep loops
    //entirely contained within the top level loop
    std::queue<Loop *> toSummarize;

    toSummarize.push(loop);
    while(!toSummarize.empty()) {
        auto l = toSummarize.front();
        toSummarize.pop();

        //fetch the parent loop
        auto parent = l->getParentLoop();
        assert(loopToSummary.find(parent) != loopToSummary.end());

        //create the summary of the current loop
        LoopStructure * parentStruct = loopToSummary[parent];
        LoopStructure * childStruct = this->createSummary(l, parentStruct);
        loopToSummary[l] = childStruct;

        if (parentStruct) {
            parentStruct->addChild(childStruct);
        }

        //iterate over the sub loops of the current loop
        for (auto subLoop : l->getSubLoops()) {
            toSummarize.push(subLoop);
        }
    }

    //set the root of the tree
    assert(loopToSummary.find(loop) != loopToSummary.end());
    this->topLoop = loopToSummary[loop];
}



LoopStructure * LoopSummary::getLoop(Instruction& instIncludedInLoop) const {
    BasicBlock * bb = instIncludedInLoop.getParent();
    return this->getLoop(*bb);
}

LoopStructure * LoopSummary::getLoop(BasicBlock& bbIncludedInLoop) const {
    if (this->bbToLoop.find(&bbIncludedInLoop) == this->bbToLoop.end()) {
        return nullptr;
    }

    return this->bbToLoop.at(&bbIncludedInLoop);
}

LoopStructure * LoopSummary::getLoopNestingTreeRoot(void) const {
    assert(this->topLoop != nullptr);
    return this->topLoop;
}

void LoopSummary::print(raw_ostream& stream) const {
    stream << "Loop Summary: \n";
    for (auto& loop : this->loops) {
        loop->print(stream);
    }
}



LoopStructure * LoopSummary::createSummary(Loop * loop, LoopStructure * parentLoop) {
    //fetch the loop header
    auto loopHeader = loop->getHeader();

    //allocate the loopstructure
    std::shared_ptr<LoopStructure> lsSummary;
    lsSummary = std::make_shared<LoopStructure>(loop, parentLoop);

    //create the map from basic blocks to loop;

    auto lsPtr = lsSummary.get();
    // for (auto BB : loop->blocks()) {
    for (auto BBIt = loop->block_begin(); BBIt != loop->block_end(); ++BBIt) {
        this->bbToLoop[*BBIt] = lsPtr;
    }

    auto ls = this->loops.insert(std::move(lsSummary)).first->get();
    return ls;
}