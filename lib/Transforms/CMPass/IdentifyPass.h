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

using namespace llvm;
typedef std::set<BasicBlock*> BlockSet;
typedef std::set<Instruction*> InstructionSet;
typedef std::list<Instruction*> InstructionVec;

class IdentifyPass : public ModulePass {

public:
    static char ID;
    IdentifyPass() : ModulePass(ID) { level = 0;}
    virtual void getAnalysisUsage(AnalysisUsage &AU) const override;
    virtual bool runOnModule(Module &M) override;
    void DebugPrint() const;

    // const BlockSet &getSafeCheckBlocks(Function *F) const {
    //     return SafeCheckBlocks.at(F);
    // }

    // const InstructionVec &getOnlySafeCheck(Function *F) const {
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
    //CallInst *findSafeCheckCall(BasicBlock *BB) const;

private:
    unsigned int level;
    
    //All blocks belong to safe check
    std::map<Function*, BlockSet> SafeCheckBlocks;
    //std::map<Instruction*, InstructionSet> SafeCheckInstructionsUnderBlocks;

    //All instructions that belong to safe check
    std::map<Function*, InstructionSet> SafeCheckInstructions;
    //std::map<Instruction*, InstructionSet> InstructionsBySafeCheck;

    //All instruction that belong to origin codes
    std::map<Function*, InstructionVec> OriginCodeInstructions;

    //All safe check themselves
    std::map<Function*, InstructionVec> SafeCheckInstructionsThemselves;
    //std::set<Instruction *> SafeCheckSet;

    //A map of all instructions required by a given safe check branch
    std::map<Instruction*, InstructionSet> InstructionsBySafeCheck;

    std::map<Function*, InstructionVec> SCBranches;

    std::map<Instruction*, Instruction*> instToSafeCheckMap;
    

    void findInstructions(Function *F);
    //bool onlyUsedInSafeCheck(Value *V);

};

#endif
