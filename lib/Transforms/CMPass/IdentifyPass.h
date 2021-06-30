// This file used to identify safe-check codes and origin codes
// This file is modified from SanRazor
// 0 -- only cares about safe check function calls
// 1 -- not only safe check function calls, but also related IR instructions

#ifndef IDENTIFYPASS_H
#define IDENTIFYPASS_H

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

namespace llvm{
    class AnalysisUsage;
    class BasicBlock;
    class CallInst;
    class Function;
    class Instruction;
    class Value;
    class StringRef;
    class dyn_cast;
}
typedef std::set<llvm::BasicBlock*> BlockSet;
typedef std::set<llvm::Instruction*> InstructionSet;
typedef std::list<llvm::Instruction*> InstructionVec;

class IdentifyPass : public llvm::ModulePass {

public:
    static char ID;
    IdentifyPass() : llvm::ModulePass(ID) { level = 0;}
    virtual void getAnalysisUsage(llvm::AnalysisUsage &AU) const override;
    virtual bool runOnModule(llvm::Module &M) override;
    void DebugPrint() const;

    // const BlockSet &getSafeCheckBlocks(llvm::Function *F) const {
    //     return SafeCheckBlocks.at(F);
    // }

    // const InstructionVec &getOnlySafeCheck(llvm::Function *F) const {
    //     return SafeCheckInstructionsThemselves.at(F);
    // }
    // InstructionVec& getOnlySafeCheck(Function *F) {
    //     return SafeCheckInstructionsThemselves.at(F);
    // }

    // std::set<Instruction *> getSafeCheckSet() {
    //     return SafeCheckSet;
    // }

    // Searches the given basic block for a call instruction that corresponds to
    // a safe check
    //llvm::CallInst *findSafeCheckCall(llvm::BasicBlock *BB) const;

private:
    unsigned int level;
    
    //All blocks belong to safe check
    std::map<llvm::Function*, BlockSet> SafeCheckBlocks;
    //std::map<llvm::Instruction*, InstructionSet> SafeCheckInstructionsUnderBlocks;

    //All instructions that belong to safe check
    std::map<llvm::Function*, InstructionSet> SafeCheckInstructions;
    //std::map<llvm::Instruction*, InstructionSet> InstructionsBySafeCheck;

    //All instruction that belong to origin codes
    std::map<llvm::Function*, InstructionVec> OriginCodeInstructions;

    //All safe check themselves
    std::map<llvm::Function*, InstructionVec> SafeCheckInstructionsThemselves;
    //std::set<Instruction *> SafeCheckSet;

    //A map of all instructions required by a given safe check branch
    std::map<llvm::Instruction*, InstructionSet> InstructionsBySafeCheck;

    std::map<llvm::Function*, InstructionVec> SCBranches;

    

    void findInstructions(llvm::Function *F);
    //bool onlyUsedInSafeCheck(llvm::Value *V);

};

#endif
