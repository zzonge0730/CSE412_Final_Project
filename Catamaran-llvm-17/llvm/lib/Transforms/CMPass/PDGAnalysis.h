// This file used to analysis PDG
#ifndef PDGANALYSIS_H
#define PDGANALYSIS_H

#include "PDG.h"
//#include "PDGPrinter.h"

#include "./DataFlowAnalysis.h"

#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/IR/PassManager.h" // ModuleAnalysisManager

#include "Utils.h"

using namespace llvm;

class PDGAnalysis {
public:
    // static char ID; // Removed for LLVM 17
    PDGAnalysis();
    virtual ~PDGAnalysis();

    // New PassManager compatible run
    bool run(Module &M, ModuleAnalysisManager &AM);
    
    // Legacy methods removed
    // bool doInitialization(Module &M) override;
    // void getAnalysisUsage(AnalysisUsage &AU) const override;
    
    void releaseMemory();
    // bool runOnModule(Module &M) override;

    PDG * getFunctionPDG(Function &F);
    PDG * getPDG(void);

    static bool isTheLibraryFunctionPure(Function * libraryFunction);
    static bool isTheLibraryFunctionThreadSafe(Function * libraryFunction);
private:
    Module *M;
    ModuleAnalysisManager *MAM; // Added for accessing analyses
    PDG *programDependenceGraph;
    std::unordered_map<Function *, PDG *> functionToFDGMap;
    DataFlowAnalysis dfAna;
    bool enableReachAnalysis;
    bool dumpPDG;
    //PDGPrinter printer;
    PDG * constructFunctionDGFromAnalysis(Function &F);
    PDG * constructPDGFromAnalysis(Module &M);

    void trimDGUsingCustomAliasAnalysis(PDG *pdg);

    void constructEdgesFromUseDefs(PDG *pdg);

    void constructEdgesFromAliases(PDG *pdg, Module &M);
    void constructEdgesFromAliasesForFunction(PDG *pdg, Function &F);

    void constructEdgesFromControl(PDG *pdg, Module &M);
    void constructEdgesFromControlForFunction(PDG *pdg, Function &F);

    void constructEdgesFromSequence(PDG *pdg, Module &M);
    void constructEdgesFromSequenceForFunction(PDG *pdg, Function &F);

    void iteratorInstForStore(PDG *pdg, Function &F, AAResults &AA, DataFlowResult * dfRes, StoreInst * store);
    void iteratorInstForLoad(PDG *pdg, Function &F, AAResults &AA, DataFlowResult * dfRes, LoadInst * load);
    void iteratorInstForCall(PDG *pdg, Function &F, AAResults &AA, DataFlowResult * dfRes, CallInst * call);

    bool isActualCode(CallInst *call);

    llvm::AliasResult doTheyAlias (PDG *pdg, Function &F, AAResults &AA, Value * instI, Value * instJ);

    void addEdgeFromFunctionModRef(PDG * pdg, Function &F, AAResults &AA, CallInst *call, StoreInst *store, bool flag);
    void addEdgeFromFunctionModRef(PDG * pdg, Function &F, AAResults &AA, CallInst *call, LoadInst *load, bool flag);
    void addEdgeFromFunctionModRef(PDG * pdg, Function &F, AAResults &AA, CallInst *call, CallInst *otherCall);
    

    template<class InstI, class InstJ>
    void addEdgeFromMemoryAlias(PDG *pdg, Function &F, AAResults &AA, InstI *instI, InstJ *instJ, DataDependenceType dpType) {
        bool must = false;

        //query the llvm alias analysis
        // LLVM 14: AliasResult는 llvm namespace에 있음
        switch(AA.alias((Value*)instI, (Value*)instJ)) {
            case llvm::AliasResult::NoAlias:
                return;
            case llvm::AliasResult::PartialAlias:
            case llvm::AliasResult::MayAlias:
                break;
            case llvm::AliasResult::MustAlias: 
                pdg->addEdge((Value*)instI, (Value*)instJ)->setMemMustType(true, true, dpType);
                return;
        }

        //TODO: add SVF alias analysis
        //check other alias analysis
        //check if svf is enabled
        // if (this->enableSVF) {
        //     //if SVF is enabled
        //     switch(SVFIntegration::alias((Value*)instI, (Value*)instJ)) {
        //         case NoAlias:
        //             return;
        //         case PartialAlias:
        //         case MayAlias:
        //             break;
        //         case MustAlias: 
        //             must = true;
        //             break;
        //     }
        // }
        if (isa<StoreInst>(instI) && isa<LoadInst>(instJ)) {
            StoreInst * tmpStoreInst = cast<StoreInst>(instI);
            LoadInst * tmpLoadInst = cast<LoadInst>(instJ);
            // errs() << "Store: " << *tmpStoreInst << "\n";
            // errs() << "Load: " << *tmpLoadInst << "\n";
            if (tmpStoreInst->getPointerOperand() == tmpLoadInst->getPointerOperand()) {
                // errs() << "--103\n";
                must = true; 
            }
        }

        //there is a dependence
        pdg->addEdge((Value*)instI, (Value*)instJ)->setMemMustType(true, must, dpType);
    }

    static const std::unordered_set<std::string> libraryFunction;
    static const std::unordered_set<std::string> externalThreadSafeFunctions;
};

#endif






