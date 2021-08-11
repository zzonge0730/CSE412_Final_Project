#ifndef SANRAZOR_H
#define SANRAZOR_H

#include "llvm/Pass.h"
#include "llvm/IR/Instructions.h"
#include "Utils.h"
//#include "llvm/IR/Metadata.h"
//#include "llvm/IR/CFG.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/Debug.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

#include <map>
#include <set>
#include <list>
#include <vector>
#include <iterator>

using namespace llvm;

class SanRazorPass : public ModulePass {

public:
    static char ID;
    SanRazorPass() : ModulePass(ID) {}
    virtual void getAnalysisUsage(AnalysisUsage &AU) const override;
    virtual bool runOnModule(Module &M) override;
    void DebugPrint();

    // Types used to store sanity check blocks / instructions
    typedef std::set<BasicBlock*> BlockSet;
    typedef std::set<Instruction*> InstructionSet;
    typedef std::list<Instruction*> InstructionVec;

    const InstructionVec &getSCBranches(Function *F) const {
        return SCBranches.at(F);
    }

    const InstructionVec &getSCBranchesV(Function *F) const {
        return SCBranchesV.at(F);
    }
    
    const BlockSet &getSanityCheckBlocks(Function *F) const {
        return SanityCheckBlocks.at(F);
    }

    const InstructionVec &getUCBranches(Function *F) const {
        return UCBranches.at(F);
    }

    const InstructionSet &getInstructionsBySanityCheck(Instruction *Inst) const {
        return InstructionsBySanityCheck.at(Inst);
    }

    const InstructionSet &getChecksByInstruction(Instruction *Inst) const {
        return ChecksByInstruction.at(Inst);
    }

    // Searches the given basic block for a call instruction that corresponds to
    // a sanity check and will abort the program (e.g., __assert_fail).
    CallInst *findSanityCheckCall(BasicBlock *BB);
private:
    // All blocks that abort due to sanity checks
    std::map<Function*, BlockSet> SanityCheckBlocks;
    // std::map<Function*, BlockSet> SanityCheckBlocksPlus;
    std::map<Instruction*, InstructionSet> ChecksByInstruction;

    // All instructions that belong to sanity checks
    std::map<Function*, InstructionSet> SanityCheckInstructions;
    std::map<Instruction*, InstructionSet> InstructionsBySanityCheck;
    
    // All sanity checks themselves (branch instructions that could lead to an abort)
    std::map<Function*, InstructionVec> SCBranches;
    std::map<Function*, InstructionVec> SCBranchesV;

    std::map<Function*, InstructionVec> UCBranches;

    void findInstructions(Function *F);
    bool onlyUsedInSanityChecks(Value *V);

};


#endif