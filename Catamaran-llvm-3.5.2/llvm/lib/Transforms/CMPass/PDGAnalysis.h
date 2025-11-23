// This file used to analysis PDG
#ifndef PDGANALYSIS_H
#define PDGANALYSIS_H
#include "PDG.h"
//#include "PDGPrinter.h"

#include "./DataFlowAnalysis.h"

#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/Analysis/PostDominators.h"

#include "Utils.h"

using namespace llvm;

class PDGAnalysis : public ModulePass {
public:
    static char ID;
    PDGAnalysis();
    virtual ~PDGAnalysis();

    bool doInitialization(Module &M) override;
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    void releaseMemory() override;
    bool runOnModule(Module &M) override;

    PDG * getFunctionPDG(Function &F);
    PDG * getPDG(void);

    static bool isTheLibraryFunctionPure(Function * libraryFunction);
    static bool isTheLibraryFunctionThreadSafe(Function * libraryFunction);
private:
    Module *M;
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

    void iteratorInstForStore(PDG *pdg, Function &F, AliasAnalysis &AA, DataFlowResult * dfRes, StoreInst * store);
    void iteratorInstForLoad(PDG *pdg, Function &F, AliasAnalysis &AA, DataFlowResult * dfRes, LoadInst * load);
    void iteratorInstForCall(PDG *pdg, Function &F, AliasAnalysis &AA, DataFlowResult * dfRes, CallInst * call);
     void iteratorInstForCast(PDG *pdg, Function &F, AliasAnalysis &AA, DataFlowResult * dfRes, PtrToIntInst * cast);

    bool isActualCode(CallInst *call);

    AliasAnalysis::AliasResult doTheyAlias (PDG *pdg, Function &F, AliasAnalysis &AA, Value * instI, Value * instJ);

    void addEdgeFromFunctionModRef(PDG * pdg, Function &F, AliasAnalysis &AA, CallInst *call, StoreInst *store, bool flag);
    void addEdgeFromFunctionModRef(PDG * pdg, Function &F, AliasAnalysis &AA, CallInst *call, LoadInst *load, bool flag);
    void addEdgeFromFunctionModRef(PDG * pdg, Function &F, AliasAnalysis &AA, CallInst *call, CallInst *otherCall);
    

    template<class InstI, class InstJ>
    void addEdgeFromMemoryAlias(PDG *pdg, Function &F, AliasAnalysis &AA, InstI *instI, InstJ *instJ, DataDependenceType dpType) {
        bool must = false;

        //query the llvm alias analysis
        switch(AA.alias((Value*)instI, (Value*)instJ)) {
            case AliasAnalysis::NoAlias:
                return;
            case AliasAnalysis::PartialAlias:
            case AliasAnalysis::MayAlias:
                break;
            case AliasAnalysis::MustAlias: 
                pdg->addEdge((Value*)instI, (Value*)instJ)->setMemMustType(true, true, dpType);
                return;
        }

        // if (isa<StoreInst>(instI) && isa<LoadInst>(instJ)) {
        //     StoreInst * tmpStoreInst = cast<StoreInst>(instI);
        //     LoadInst * tmpLoadInst = cast<LoadInst>(instJ);
        //     if (tmpStoreInst->getPointerOperand() == tmpLoadInst->getPointerOperand()) {
        //         must = true; 
        //     }
        // }

        //there is a dependence
        pdg->addEdge((Value*)instI, (Value*)instJ)->setMemMustType(true, must, dpType);
    }

    static const std::unordered_set<std::string> libraryFunction;
    static const std::unordered_set<std::string> externalThreadSafeFunctions;
};

#endif






