#include "SanRazorPass.h"

using namespace llvm;

char SanRazorPass::ID = 0;

static RegisterPass<SanRazorPass> X("sanrazor", "Finds instructions belonging to safe check codes by SanRazor");

void SanRazorPass::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.setPreservesAll();
}

bool SanRazorPass::runOnModule(Module &M) {
    errs() << "SanRazorPass runOnModule begin...\n";
    for (Function &F: M) {
        SanityCheckBlocks[&F] = BlockSet();
        SanityCheckInstructions[&F] = InstructionSet();
        SCBranches[&F] = InstructionVec();
        UCBranches[&F] = InstructionVec();
        findInstructions(&F);

    }
    DebugPrint();
    errs() << "SanRazorPass runOnModule end...\n";
    return true;
}



void SanRazorPass::findInstructions(Function *F) {

    // A list of instructions that are used by sanity checks. They become sanity
    // check instructions if it turns out they're not used by anything else.
    std::set<Instruction*> Worklist;
    
    // A list of basic blocks that contain sanity check instructions. They
    // become sanity check blocks if it turns out they don't contain anything
    // else.
    std::set<BasicBlock*>   BlockWorklist;

    // A map from instructions to the checks that use them.
    
    // FILE *ff = fopen("./Cov/checkh.txt", "ab");
    for (BasicBlock &BB: *F) {

        if (findSanityCheckCall(&BB)) {
            SanityCheckBlocks[F].insert(&BB);

            // All instructions inside sanity check blocks are sanity check instructions
            for (Instruction &I: BB) {
                Worklist.insert(&I);
            }

            // All branches to sanity check blocks are sanity check branches
            // for (User *U: BB.users()) {
            //     if (Instruction *Inst = dyn_cast<Instruction>(U)) {
            //         Worklist.insert(Inst);
            //     }
            //     BranchInst *BI = dyn_cast<BranchInst>(U);
            //     if (BI && BI->isConditional()) {
            //         // SCBranches[F].push_back(BI);
            //         // fprintf(ff, "%s ", F->getName());
            //         // for (Instruction &I: *BI->getParent()){
            //         //     fprintf(ff, ":%s",I.getOpcodeName());
            //         // }
            //         // fprintf(ff, "\n");
            //         // UCBranches[F].remove(dyn_cast<Instruction>(U));
            //         ChecksByInstruction[BI].insert(BI);
            //     }
            // }
        }
        // ******
        else{
            // User checks but contain potential sanity checks
            // for (Instruction &I: BB) {
            //     BranchInst *BI = dyn_cast<BranchInst>(&I);
            //     if (BI && BI->isConditional()) {
            //         UCBranches[F].push_back(&I);
            //     }
            // }
        }
        // ******
    }

    while (!Worklist.empty()) {
        // Alternate between emptying the worklist...
        while (!Worklist.empty()) {
            Instruction *Inst = *Worklist.begin();
            Worklist.erase(Inst);
            if (onlyUsedInSanityChecks(Inst)) {
                if (SanityCheckInstructions[F].insert(Inst).second) {
                    // UCBranches[F].remove(Inst);
                    for (Use &U: Inst->operands()) {
                        if (Instruction *Op = dyn_cast<Instruction>(U.get())) {
                            Worklist.insert(Op);

                            // Copy ChecksByInstruction from Inst to Op
                            // auto CBI = ChecksByInstruction.find(Inst);
                            // if (CBI != ChecksByInstruction.end()) {
                            //     ChecksByInstruction[Op].insert(CBI->second.begin(), CBI->second.end());
                            // }
                        }
                    }

                    BlockWorklist.insert(Inst->getParent());

                    // Fill InstructionsBySanityCheck from the inverse ChecksByInstruction
                    // auto CBI = ChecksByInstruction.find(Inst);
                    // if (CBI != ChecksByInstruction.end()) {
                    //     for (Instruction *CI : CBI->second) {
                    //         InstructionsBySanityCheck[CI].insert(Inst);
                    //     }
                    // }
                }
            }
        }

        // ... and checking whether this causes basic blocks to contain only
        // sanity checks. This would in turn cause terminators to be added to
        // the worklist.
        while (!BlockWorklist.empty()) {
            BasicBlock *BB = *BlockWorklist.begin();
            BlockWorklist.erase(BB);
            
            bool allInstructionsAreSanityChecks = true;
            for (Instruction &I: *BB) {
                if (!SanityCheckInstructions.at(BB->getParent()).count(&I)) {
                    allInstructionsAreSanityChecks = false;
                    break;
                }
            }
            
            if (allInstructionsAreSanityChecks) {
                // SanityCheckBlocksPlus[F].insert(BB);
                for (User *U: BB->users()) {
                    if (Instruction *Inst = dyn_cast<Instruction>(U)) {
                        Worklist.insert(Inst);
                        BranchInst *BI = dyn_cast<BranchInst>(Inst);
                        if (BI && BI->isConditional()) {
                            for (Instruction &I: *BB) {
                                // auto CBI = ChecksByInstruction.find(&I);
                                // if (CBI != ChecksByInstruction.end() && ChecksByInstruction.find(BI) == ChecksByInstruction.end()) {
                                //     ChecksByInstruction[BI].insert(CBI->second.begin(), CBI->second.end());
                                // }
                            }
                        }
                    }
                }
            }
        }
    }
    // fclose(ff);
}

CallInst *SanRazorPass::findSanityCheckCall(BasicBlock* BB) {
    for (Instruction &I: *BB) {
        if (CallInst *CI = dyn_cast<CallInst>(&I)) {
            if (IsSafeCheckCall(CI)) {
                return CI;
            }
        }
    }
    return 0;
}

bool SanRazorPass::onlyUsedInSanityChecks(Value* V) {
    // for (User *U: V->users()) {
    for (auto useIt = V->use_begin(); useIt != V->use_end(); ++useIt) {
        Instruction *Inst = dyn_cast<Instruction>(*useIt);
        if (!Inst) return false;
        
        Function *F = Inst->getParent()->getParent();
        if (!(SanityCheckInstructions[F].count(Inst))) {
            return false;
        }
    }
    return true;
}

void SanRazorPass::DebugPrint() {
    errs() << "----SanityCheckBlocks----\n";
    // std::map<Function*, BlockSet>::const_iterator iter2;
    // for (iter2 = SanityCheckBlocks.begin(); iter2 != SanityCheckBlocks.end(); iter2++) {
    //     errs() << iter2->first->getName() << " : " << iter2->second.size() << "\n";
        
    //     std::set<BasicBlock*>::const_iterator inst_iter1;
    //     for (inst_iter1 = iter2->second.begin(); inst_iter1 != iter2->second.end(); inst_iter1++) {
    //         errs() << *(*inst_iter1) << "\n";
    //     }
       
    // }
    errs() << "^^^^^^^^^^^SanityCheckBlocks^^^^^^^^^^^\n";
    errs() << "----ChecksByInstruction----\n";
    std::map<Instruction*, InstructionSet>::const_iterator iter5;
    for (iter5 = ChecksByInstruction.begin(); iter5 != ChecksByInstruction.end(); iter5++) {
        errs() << *(iter5->first) << " : " << iter5->second.size() << "\n";

        std::set<Instruction*>::const_iterator inst_iter4;
        for (inst_iter4 = iter5->second.begin(); inst_iter4 != iter5->second.end(); inst_iter4++) {
            errs() << *(*inst_iter4) << "\n";
        }
    }

    errs() << "^^^^^^^^^^^ChecksByInstruction^^^^^^^^^^^\n";
    errs() << "----SanityCheckInstructions----\n";
    std::map<Function*, InstructionSet>::const_iterator iter1;
    for (iter1 = SanityCheckInstructions.begin(); iter1 != SanityCheckInstructions.end(); iter1++) {
        errs() << iter1->first->getName() << " : " << iter1->second.size() << "\n";

        std::set<Instruction*>::const_iterator inst_iter2;
        for (inst_iter2 = iter1->second.begin(); inst_iter2 != iter1->second.end(); inst_iter2++) {
            errs() << *(*inst_iter2) << "\n";
        }
    }
    errs() << "^^^^^^^^^^^SanityCheckInstructions^^^^^^^^^^^\n";
    errs() << "----InstructionsBySanityCheck----\n";
    std::map<Instruction*, InstructionSet>::const_iterator iter3;
    for (iter3 = InstructionsBySanityCheck.begin(); iter3 != InstructionsBySanityCheck.end(); iter3++) {
        errs() << *(iter3->first) << " : " << iter3->second.size() << "\n";

        std::set<Instruction*>::const_iterator inst_iter3;
        for (inst_iter3 = iter3->second.begin(); inst_iter3 != iter3->second.end(); inst_iter3++) {
            errs() << *(*inst_iter3) << "\n";
        }
    }
    errs() << "^^^^^^^^^^^InstructionsBySanityCheck^^^^^^^^^^^\n";
    errs() << "----SCBranches----\n";

    errs() << "----SCBranchesV----\n";

    errs() << "----UCBranches----\n";

    errs() << "----DebugPrintEnd----\n";
}