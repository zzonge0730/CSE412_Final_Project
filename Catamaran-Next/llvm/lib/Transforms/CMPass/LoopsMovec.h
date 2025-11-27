#ifndef LOOPS_MOVEC_H
#define LOOPS_MOVEC_H

// LLVM 14: llvm/Pass.h는 레거시 PassManager를 포함하므로 제거
// #include "llvm/Pass.h"
// LLVM 14: ModulePass forward declaration
namespace llvm {
    class ModulePass;
    class Module;
    class AnalysisUsage;
}
#include "LoopStructure.h"
#include "PDG.h"
// LLVM 14: PDGAnalysis는 레거시 PassManager를 사용하므로 임시로 forward declaration만 사용
// #include "PDGAnalysis.h"
class PDGAnalysis; // Forward declaration
#include "DominatorSummary.h"
#include "StayConnectedNestedLoopForest.h"
#include "LoopFreeTask.h"
#include "Utils.h"
#include "llvm/Analysis/CallGraph.h"

#include <queue>
#include <algorithm>

using namespace llvm;

// LLVM 14: ModulePass는 레거시 PassManager이므로, 현재는 사용하지 않음
// TODO: 새 PassManager로 전환 필요
// 임시로 비활성화 (전역 생성자 충돌 방지)
#if 0
class LoopsMovec : public ModulePass {
public:
    static char ID;
    LoopsMovec();
    virtual ~LoopsMovec();
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    bool runOnModule(Module &M) override;

    Function * getEntryFunction(void) const;

    std::vector<LoopStructure *> * getLoopStructures(void);
    std::vector<LoopStructure *> * getLoopStructures(Function * func);



private:

    Module * program;
    PDG * pdg;
    PDGAnalysis * pdgAnalysis;
    std::unordered_map<BasicBlock*, uint32_t> loopHeaderToLoopIndexMap;


    std::vector<Function*> * getModuleFunctionsReachableFrom(
        Module * M, Function * startingPoint
    );

    PDG * getFunctionDependenceGraph(Function * func);

    StayConnectedNestedLoopForest * organizeLoopsInTheirNestingForest(
        std::vector<LoopStructure *> const & loops
    );

    DominatorSummary * getDominators(Function * f);

    std::vector<LoopDependenceInfo *> selectTheOrderOfLoopsToParallelize(StayConnectedNestedLoopForestNode * tree);

    void linkTransformedLoopToOriginalFunction(
    Module * M,
    BasicBlock * originalPreHeader,
    BasicBlock * startOfParallelizeLoopInOriginalFunc,
    BasicBlock * endOfParallelizedLoopInOriginalFunc,
    Value * envArray,
    Value * envIndexForExitVariable,
    std::vector<BasicBlock*>& loopExitBlocks);

    Constant * generateJoinFunc();
    static bool isTheMovecLibraryFunction(Function * libF);
    // static const std::unordered_set<std::string> movecLibFunction;

    uint32_t calBaselineCostForMC(std::vector<Instruction*> safecheckInsts);



};
#else
// LLVM 14: 임시로 비활성화 (전역 생성자 충돌 방지)
class LoopsMovec {
    // Forward declaration only
};
#endif

#endif