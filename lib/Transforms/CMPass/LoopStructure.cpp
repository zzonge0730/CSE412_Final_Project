#include "LoopStructure.h"
#include "llvm/ADT/SmallVector.h"

uint64_t LoopStructure::globalID = 0;

LoopStructure::LoopStructure(Loop* loop) : LoopStructure(loop, nullptr){

}

LoopStructure::LoopStructure(Loop* loop, LoopStructure* parentLoop) : parent{parentLoop} {
    //set the nesting level
    this->depth = loop->getLoopDepth();

    //set the headers
    this->header = loop->getHeader();
    this->preHeader = loop->getLoopPreheader();

    //set the basicblocks and latches of the loop
    for (auto bb : loop->blocks()) {
        orderedBBs.push_back(bb);
        BBs.insert(bb);
        if (loop->isLoopLatch(bb)) {
            latchBBs.insert(bb);
        }

        for (auto& inst : *bb) {
            //loop implementation of isLoopInvariant simply checks if the value
            //is in the loop, not if it changes between iterations
            if (loop->isLoopInvariant(&inst)) {
                invariants.insert(&inst);
            }
        }
    }

    //set the loop exists and exit edges
    SmallVector<BasicBlock *, 10> exits;
    loop->getExitBlocks(exits);
    this->exitBlocks = std::vector<BasicBlock *>(exits.begin(), exits.end());

    SmallVector<std::pair<BasicBlock *, BasicBlock *>, 10> exitEdges;
    loop->getExitEdges(exitEdges);
    this->exitEdges = std::vector<std::pair<BasicBlock *, BasicBlock *>>(exitEdges.begin(), exitEdges.end());

    this->ID = LoopStructure::globalID++;
}

uint64_t LoopStructure::getID(void) const {
    return this->ID;
}

Function * LoopStructure::getFunction(void) const {
    return this->header->getParent();
}

BasicBlock * LoopStructure::getHeader(void) const {
    return this->header;
}

BasicBlock * LoopStructure::getPreHeader(void) const {
    return this->preHeader;
}

Instruction * LoopStructure::getEntryInstruction(void) const {
    return &*this->header->begin();
}


uint32_t LoopStructure::getNestingLevel(void) const {
    return this->depth;
}

LoopStructure * LoopStructure::getParentLoop(void) const {
    return this->parent;
}

void LoopStructure::setParentLoop(LoopStructure * parentLoop) {
    this->parent = parentLoop;
}

std::unordered_set<LoopStructure *> LoopStructure::getChildren(void) const {
    return this->children;
}
//more details
std::unordered_set<LoopStructure *> LoopStructure::getDescendants(void) const {
    std::unordered_set<LoopStructure *> descendants;
    for (auto child : this->children) {
        descendants.insert(child);
        auto childDescendants = child->getDescendants();
        descendants.insert(childDescendants.begin(), childDescendants.end());
    }
    return descendants;
}

void LoopStructure::addChild(LoopStructure * child) {
    this->children.insert(child);
}

std::unordered_set<BasicBlock *> LoopStructure::getLatches(void) const {
    return this->latchBBs;
}

std::unordered_set<BasicBlock *> LoopStructure::getBasicBlocks(void) const {
    return this->BBs;
}

std::unordered_set<Instruction *> LoopStructure::getInstructions(void) const {
    std::unordered_set<Instruction *> insts{};
    for (auto bb : this->BBs) {
        for (auto& I : *bb) {
            insts.insert(&I);
        }
    }
    return insts;
}

uint64_t LoopStructure::getNumberOfInstructions(void) const {
    uint64_t count = 0;
    for (auto bb : this->BBs) {
        count += bb->size();
    }
    return count;
}

std::vector<BasicBlock *> LoopStructure::getLoopExitBasicBlocks(void) const {
    return this->exitBlocks;
}

std::vector<std::pair<BasicBlock *, BasicBlock *>> LoopStructure::getLoopExitEdges(void) const {
    return this->exitEdges;
}
uint64_t LoopStructure::numberOfExitBasicBlocks(void) const {
    return this->exitBlocks.size();
}

bool LoopStructure::isLoopInvariant(Value * value) const {
    //check if value is an instruction
    if (auto inst = dyn_cast<Instruction>(value)) {
        //check if the instruction is not included in the loop
        if (!this->isIncluded(inst->getParent())) {
            return true;
        }

        return this->isContainedInstructionLoopInvariant(inst);
    }

    //check if value is an argument
    if (auto arg = dyn_cast<Argument>(value)) {
        return true;
    }

    return false;
}

bool LoopStructure::isIncluded(BasicBlock * bb) const {
    return this->BBs.find(bb) != this->BBs.end();
}

bool LoopStructure::isIncluded(Instruction * inst) const {
    BasicBlock * bb = inst->getParent();
    return this->isIncluded(bb);
}

bool LoopStructure::isIncludedInItsSubLoops(Instruction * inst) const {
    //check if the instruction is part of the loop
    if (!this->isIncluded(inst)) {
        return false;
    }

    //check its children
    for (auto subLoop : this->children) {
        if (subLoop->isIncluded(inst)) {
            return true;
        }
    }

    return false;
}

//this function returns the total number of sub-loops contained by @this
//
uint32_t LoopStructure::getNumberOfSubLoops(void) const {
    uint32_t count = 0;
    //check its children
    for (auto subLoop : this->children) {
        //add current sub-loop
        count++;

        count += subLoop->getNumberOfSubLoops();
    }
    return count;
}

void LoopStructure::print(raw_ostream & stream) {
    stream << "Loop Summary: " << this->ID << ", depth: " << depth << "\n";
    header->begin()->print(stream);
    stream << "\n";
}

bool LoopStructure::isContainedInstructionLoopInvariant(Instruction *inst) const {
    //Naively as llvm, not including loop interanl instructions
    //which derive from loop invariants as being loop invariant
    //We simply cache loop instructions which LLVM's isLoopInvariant returns true for
    return this->invariants.find(inst) != this->invariants.end();
}

