// This file used to identify safe-check codes and origin codes

#include "IdentifyPass.h"

using namespace llvm;

char IdentifyPass::ID = 0;

void IdentifyPass::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.setPreservesAll();
}
bool IdentifyPass::runOnModule(Module &M) {
    for (Function &F : M) {
        //DEBUG(dbgs() << "IdentifyPass on " << F.getName() << "\n");
        if (F.isDeclaration()) continue;
        errs() << "IdentifyPass on " << F.getName() << "\n";
        SafeCheckBlocks[&F] = BlockSet();
        SafeCheckInstructions[&F] = InstructionSet();
        OriginCodeInstructions[&F] = InstructionVec();
        SafeCheckInstructionsThemselves[&F] = InstructionVec();
        SCBranches[&F] = InstructionVec();

        findInstructions(&F);

        //MDNode * MD = MDNode::get(M.getContext(), {});
        //for (Instruction *Inst : SafeCheckInstructions[&F]) {
        //    Inst->setMetadata("safecheck", MD);
        //}
        //for (Instruction *Inst : OriginCodeInstructions[&F]) {
        //    Inst->setMetadata("origincode", MD);
        //}
    }
    //DEBUG(dbgs() << "End IdentifyPass on " << M.getSourceFileName() << "\n");
    //errs() <<  "End IdentifyPass on " << M.getSourceFileName() << "\n";
    DebugPrint();
    return false;
}
void IdentifyPass::DebugPrint() const {
    //DEBUG(dbgs() << "IdentifyPass print member size\n");
    errs() << "IdentifyPass print member size\n";
    errs() << "SafeCheckBlocks Size: " << SafeCheckBlocks.size() << "\n";
    std::map<Function*, BlockSet>::const_iterator iter1;
    for (iter1 = SafeCheckBlocks.begin(); iter1 != SafeCheckBlocks.end(); iter1++) {
        errs() << iter1->first << " : " << iter1->second.size() << "\n";
    }
    errs() << "SafeCheckInstructions Size: " << SafeCheckInstructions.size() << "\n";
    std::map<Function*, InstructionSet>::const_iterator iter2;
    for (iter2 = SafeCheckInstructions.begin(); iter2 != SafeCheckInstructions.end(); iter2++) {
        errs() << iter2->first << " : " << iter2->second.size() << "\n";
        
        std::set<llvm::Instruction*>::const_iterator inst_iter1;
        for (inst_iter1 = iter2->second.begin(); inst_iter1 != iter2->second.end(); inst_iter1++) {
            errs() << *(*inst_iter1) << "\n";
        }
        errs() << "^^^^^^^^^^^SafeCheckInstructions^^^^^^^^^^^\n";
    }
    errs() << "OriginCodeInstructions Size: " << OriginCodeInstructions.size() << "\n";
    std::map<Function*, InstructionVec>::const_iterator iter3;
    for (iter3 = OriginCodeInstructions.begin(); iter3 != OriginCodeInstructions.end(); iter3++) {
        errs() << iter3->first << " : " << iter3->second.size() << "\n";

        std::list<llvm::Instruction*>::const_iterator inst_iter2;
        for (inst_iter2 = iter3->second.begin(); inst_iter2 != iter3->second.end(); inst_iter2++) {
            errs() << *(*inst_iter2) << "\n";
        }
        errs() << "^^^^^^^^^^^OriginCodeInstructions^^^^^^^^^^^\n";
    }
    errs() << "SafeCheckInstructionsThemselves Size: " << SafeCheckInstructionsThemselves.size() << "\n";
    std::map<Function*, InstructionVec>::const_iterator iter4;
    for (iter4 = SafeCheckInstructionsThemselves.begin(); iter4 != SafeCheckInstructionsThemselves.end(); iter4++) {
        errs() << iter4->first << " : " << iter4->second.size() << "\n";

        std::list<llvm::Instruction*>::const_iterator inst_iter3;
        for (inst_iter3 = iter4->second.begin(); inst_iter3 != iter4->second.end(); inst_iter3++) {
            errs() << *(*inst_iter3) << "\n";
        }
        errs() << "^^^^^^^^^^^SafeCheckInstructionsThemselves^^^^^^^^^^\n";
    }

    errs() << "InstructionsBySafeCheck Size: " << InstructionsBySafeCheck.size() << "\n";
    std::map<Instruction*, InstructionSet>::const_iterator iter5;
    for (iter5 = InstructionsBySafeCheck.begin(); iter5 != InstructionsBySafeCheck.end(); iter5++) {
        errs() << iter5->first << " : " << iter5->second.size() << "\n";

        std::set<llvm::Instruction*>::const_iterator inst_iter4;
        for (inst_iter4 = iter5->second.begin(); inst_iter4 != iter5->second.end(); inst_iter4++) {
            errs() << *(*inst_iter4) << "\n";
        }
        errs() << "^^^^^^^^^^^InstructionsBySafeCheck^^^^^^^^^^^\n";
    }

    errs() << "SCBranches Size: " << SCBranches.size() << "\n";
    std::map<Function*, InstructionVec>::const_iterator iter6;
    for (iter6 = SCBranches.begin(); iter6 != SCBranches.end(); iter6++) {
        errs() << iter6->first << " : " << iter6->second.size() << "\n";

        std::list<llvm::Instruction*>::const_iterator inst_iter5;
        for (inst_iter5 = iter6->second.begin(); inst_iter5 != iter6->second.end(); inst_iter5++) {
            errs() << *(*inst_iter5) << "\n";
        }
        errs() << "^^^^^^^^^^^SCBranches^^^^^^^^^^^\n";
    }

}
// CallInst * IdentifyPass::findSafeCheckCall(BasicBlock *BB) const {
//     for (Instruction &I : *BB) {
//         // if (const CallInst *CI = dyn_cast<CallInst>(&I)){
//         //     errs() << "---CallInst: " << *CI << "\n";
//         //     if (IsSafeCheckCall(CI)){
//         //         return CI;
//         //     }
//         // }
//         errs() << "--OriginInst: " << I << "\n";
//         if (isa<CallInst>(&I)){
//             errs() << "---CallInst: " << I << "\n";
//             CallInst *CI = dyn_cast<CallInst>(&I);
//             if (IsSafeCheckCall(CI)){
//                 //return CI;
//             }
//         }
//     }
//     return 0;
// }

void IdentifyPass::findInstructions(Function *F) {
    // A list of instructions that are used by safe checks. 
    // They become safe check instructions if it turns out they are not used by anything else
 //   std::set<Instruction*> workList;

    // A list of basic blocks that contain safe check instructions.
    // They become safe check basic blocks if it turns out they don't contain anything else.
//    std::set<BasicBlock*> bbWorkList;

    // A map from instructions to the checks that use them.
//    std::map<Instruction*, InstructionSet> instToChecksMap;

    // for (BasicBlock &BB : *F) {
    //     if (findSafeCheckCall(&BB)) {
    //         SafeCheckBlocks[F].insert(&BB);

    //         //All instructions inside safe check blocks are safe check instructions
    //         for (Instruction &I : BB) {
    //             workList.insert(&I);
    //         }

    //         //All branches to safe check blocks are safe check branches
    //         for (User *U : BB.users()) {
    //             if (Instruction *Inst = dyn_cast<Instruction>(U)) {
    //                 //means that BB is used in Inst
    //                 workList.insert(Inst);
    //             }
    //             BranchInst *BI = dyn_cast<BranchInst>(U);
    //             if (BI && BI->isConditional()) {
    //                 SCBranches[F].push_back(BI);
    //                 instToChecksMap[BI].insert(BI);
    //             }
                
    //         }
    //     }
    // }

    // while (!workList.empty()) {
    //     while (!workList.empty()) {
    //         Instruction *Inst = *workList.begin();
    //         workList.erase(Inst);
    //         if (onlyUsedInSafeCheck(Inst)) {
    //             if (SafeCheckInstructions[F].insert(Inst).second) {
    //                 for (Use &U : Inst->operands()) {
    //                     if (Instruction * I = dyn_cast<Instruction>(U.get())) {
    //                         workList.insert(I);
    //                         // copy instToChecksMap from Inst to I
    //                         auto findExist = instToChecksMap.find(Inst);
    //                         if (findExist != instToChecksMap.end()) {
    //                             instToChecksMap[I].insert(findExist->second.begin(), findExist->second.end());
    //                         }
    //                     }
    //                 }

    //                 bbWorkList.insert(Inst->getParent());

    //                 //Fill InstructionsBySafeCheck from the inverse instToChecksMap
    //                 auto findExistInverse = instToChecksMap.find(Inst);
    //                 if (findExistInverse != instToChecksMap.end()) {
    //                     for (Instruction * CI : findExistInverse->second) {
    //                         InstructionsBySafeCheck[CI].insert(Inst);
    //                     }
    //                 }
                    
    //             }
    //         }
    //     }

    //     // ... and checking whether this causes basic blocks to contain only
    //     // safe checks. This would in turn cause terminators to be added to the worklist
    //     while (!bbWorkList.empty()) {
    //         BasicBlock * BB = *bbWorkList.begin();
    //         bbWorkList.erase(BB);

    //         bool AllInstAreSafeChecks = true;
    //         for (Instruction &I : *BB) {
    //             if (!SafeCheckInstructions.at(BB->getParent()).count(&I)) {
    //                 AllInstAreSafeChecks = false;
    //                 break;
    //             }
    //         }

    //         if (AllInstAreSafeChecks) {
    //             for (User *U : BB->users()) {
    //                 if (Instruction *Inst = dyn_cast<Instruction>(U)) {
    //                     workList.insert(Inst);
    //                 }
    //             }
    //         }
    //     }

    // }
    for (BasicBlock &BB : *F) {
        for (Instruction &I : BB) {
            if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                if (IsSafeCheckCall(CI)) {
                    SafeCheckInstructionsThemselves[F].push_back(&I);
                    //SafeCheckSet.insert(&I);
                } else {
                    OriginCodeInstructions[F].push_back(&I);
                }
            } else {
                OriginCodeInstructions[F].push_back(&I);
            }
        }

        // CallInst * safeCheckCall = findSafeCheckCall(&BB);
        // if (safeCheckCall) {
        //     SafeCheckBlocks[F].insert(&BB);
        //     SafeCheckInstructionsThemselves[F].push_back(safeCheckCall);
        // }
    }
    //identify origin codes
    // for (BasicBlock &BB : *F) {
    //     for (Instruction &I : BB) {
    //         if (!SafeCheckInstructionsThemselves[F].count(&I)) {
    //             OriginCodeInstructions[F].push_back(&I);
    //         }
    //     }
    // }
    
}

// bool IdentifyPass::onlyUsedInSafeCheck(Value *V) {
//     for (User *U : V->users()) {
//         Instruction *Inst = dyn_cast<Instruction>(U);
//         if(!Inst) 
//             return false;

//         Function *F = Inst->getParent()->getParent();
//         if (!(SafeCheckInstructions[F].count(Inst))) {
//             return false;
//         }
//     }
//     return true;
// }

static RegisterPass<IdentifyPass> X("identify", "Finds instructions belonging to safe check codes", false, false);
