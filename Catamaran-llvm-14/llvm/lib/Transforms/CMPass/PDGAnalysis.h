// This file used to analysis PDG
#ifndef PDGANALYSIS_H
#define PDGANALYSIS_H

// LLVM 14: PDGAnalysis는 레거시 PassManager를 사용하므로 임시로 완전히 비활성화
// 모든 include와 클래스 정의를 #if 0으로 감싸서 전역 생성자 충돌 방지
#if 0
#include "PDG.h"
//#include "PDGPrinter.h"

#include "./DataFlowAnalysis.h"

#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/ADT/StringSet.h"

#include "Utils.h"

// LLVM 14: ModulePass forward declaration (레거시 PassManager 포함 방지)
namespace llvm {
    class ModulePass;
    class Module;
    class AnalysisUsage;
}

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

    bool isActualCode(CallInst *call);

    // LLVM 14: AliasResult는 llvm namespace에 있음
    llvm::AliasResult doTheyAlias (PDG *pdg, Function &F, AliasAnalysis &AA, Value * instI, Value * instJ);

    void addEdgeFromFunctionModRef(PDG * pdg, Function &F, AliasAnalysis &AA, CallInst *call, StoreInst *store, bool flag);
    void addEdgeFromFunctionModRef(PDG * pdg, Function &F, AliasAnalysis &AA, CallInst *call, LoadInst *load, bool flag);
    void addEdgeFromFunctionModRef(PDG * pdg, Function &F, AliasAnalysis &AA, CallInst *call, CallInst *otherCall);
    

    template<class InstI, class InstJ>
    void addEdgeFromMemoryAlias(PDG *pdg, Function &F, AliasAnalysis &AA, InstI *instI, InstJ *instJ, DataDependenceType dpType) {
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
#else
// LLVM 14: 임시로 비활성화 (전역 생성자 충돌 방지)
// Forward declaration only - include 없이 최소한의 선언만
class PDGAnalysis {
    // Empty forward declaration
};
#endif

#endif






