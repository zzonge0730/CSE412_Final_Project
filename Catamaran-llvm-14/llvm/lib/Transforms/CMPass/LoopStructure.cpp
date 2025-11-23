#include "LoopStructure.h"


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
    // for (auto bb : loop->blocks()) {
    for (auto BBIt = loop->block_begin(); BBIt != loop->block_end(); ++BBIt) {
        orderedBBs.push_back(*BBIt);
        BBs.insert(*BBIt);
        if (loop->isLoopLatch(*BBIt)) {
            latchBBs.insert(*BBIt);
        }

        for (auto& inst : **BBIt) {
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
    // errs() << "exitBlocksSize: " << this->exitBlocks.size() << "\n";
    // LLVM 14: getExitEdges()는 SmallVectorImpl을 받음
    SmallVector<std::pair<BasicBlock *, BasicBlock *>, 10> ExitEdges;
    loop->getExitEdges(ExitEdges);
    // LLVM 14: SmallVector에서 vector로 변환 시 const 포인터로 변환
    this->exitEdges.reserve(ExitEdges.size());
    for (const auto &edge : ExitEdges) {
        this->exitEdges.push_back(std::make_pair(edge.first, edge.second));
    }

    this->ID = LoopStructure::globalID++;

    calculateLoopBody();
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

std::vector<std::pair<const BasicBlock *, const BasicBlock *>> LoopStructure::getLoopExitEdges(void) const {
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
    stream << "--->Loop Summary: " << this->ID << ", depth: " << depth << "\n";
    stream << "--->Loop PreHeader: " << "\n";
    preHeader->print(stream);
    stream << "--->Loop Header: " << "\n";
    // header->begin()->print(stream);
    header->print(stream);
    stream << "--->Loop Body: " << "\n";
    // for (auto bb : BBs) {
    //     bb->print(stream);
    // }
    for (auto bb : orderedBBs) {
        bb->print(stream);
    }
    stream << "--->Loop Latch: " << "\n";
    for (auto latchBB : latchBBs) {
        latchBB->print(stream);
    }
    stream << "--->Loop Exit: " << "\n";
    for (auto exitBB : exitBlocks) {
        exitBB->print(stream);
    }

    stream << "--->Loop Invariant: " << "\n";
    for (auto inv : this->invariants) {
        // inv->print(stream);
        errs() << *inv << "\n";
    }

    stream << "\n";
}

bool LoopStructure::isContainedInstructionLoopInvariant(Instruction *inst) const {
    //Naively as llvm, not including loop interanl instructions
    //which derive from loop invariants as being loop invariant
    //We simply cache loop instructions which LLVM's isLoopInvariant returns true for
    return this->invariants.find(inst) != this->invariants.end();
}

void LoopStructure::calculateLoopBody(void) {
    // orderedBBs - loopheaderBB - looplatchBBs
    std::unordered_set<BasicBlock *> prologue(this->latchBBs.begin(), this->latchBBs.end());
    prologue.insert(this->header);

    std::set_difference(this->orderedBBs.begin(), this->orderedBBs.end(), 
                        prologue.begin(), prologue.end(),
    std::inserter(this->bodyBBs, this->bodyBBs.begin()));
    
}

std::unordered_set<BasicBlock *> LoopStructure::getLoopBody(void) {
    //for while loop, loop header, loop body and loop latch are all in the loop body
    if (this->bodyBBs.size() == 0) {
        //is a while loop
        return this->BBs;
    }
    return this->bodyBBs;
}

bool LoopStructure::isLoopExitBlock(BasicBlock * bb) {
    for (auto BB : this->exitBlocks) {
        if (bb == BB) {
            return true;
        }
    }
    return false;

}

bool LoopStructure::isInLoopLatch(Instruction * inst) {
    for (auto BB : this->latchBBs) {
        for (auto& I : *BB) {
            if (inst == &I) {
                return true;
            }
        }
    }
    return false;
}