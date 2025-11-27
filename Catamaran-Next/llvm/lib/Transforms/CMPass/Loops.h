#ifndef LOOPS_H
#define LOOPS_H

#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "LoopStructure.h"
#include "PDG.h"
// LLVM 14: PDGAnalysis는 레거시 PassManager를 사용하므로 임시로 forward declaration만 사용
// #include "PDGAnalysis.h"
class PDGAnalysis; // Forward declaration
#include "DominatorSummary.h"
#include "StayConnectedNestedLoopForest.h"
#include "LoopFreeTask.h"

#include "llvm/Analysis/CallGraph.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
// LLVM 14: Dominators.h가 llvm/IR로 이동
#include "llvm/IR/Dominators.h"
// LLVM 14: FunctionPropertiesAnalysis는 필요시 나중에 추가
// #include "llvm/Analysis/FunctionPropertiesAnalysis.h"

#include <queue>

using namespace llvm;

class Loops : public PassInfoMixin<Loops> {
public:
    Loops() = default;
    ~Loops() = default;
    
    // LLVM 14: PreservedAnalyses를 반환하는 run 함수
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);

    Function * getEntryFunction(void) const;

    // LLVM 14: AnalysisManager를 전달받도록 수정 필요
    std::vector<LoopStructure *> * getLoopStructures(ModuleAnalysisManager &AM);
    std::vector<LoopStructure *> * getLoopStructures(Function * func, FunctionAnalysisManager &FAM);



private:

    Module * program;
    PDG * pdg;
    PDGAnalysis * pdgAnalysis = nullptr;
    std::unordered_map<BasicBlock*, uint32_t> loopHeaderToLoopIndexMap;


    std::vector<Function*> * getModuleFunctionsReachableFrom(
        Module * M, Function * startingPoint, ModuleAnalysisManager &AM
    );

    PDG * getFunctionDependenceGraph(Function * func);

    StayConnectedNestedLoopForest * organizeLoopsInTheirNestingForest(
        std::vector<LoopStructure *> const & loops, ModuleAnalysisManager &AM
    );

    DominatorSummary * getDominators(Function * f, FunctionAnalysisManager &FAM);

    std::vector<LoopDependenceInfo *> selectTheOrderOfLoopsToParallelize(
        StayConnectedNestedLoopForestNode * tree, ModuleAnalysisManager &AM);


    void linkTransformedLoopToOriginalFunction(
    Module * M,
    BasicBlock * originalPreHeader,
    BasicBlock * startOfParallelizeLoopInOriginalFunc,
    BasicBlock * endOfParallelizedLoopInOriginalFunc,
    Value * envArray,
    Value * envIndexForExitVariable,
    std::vector<BasicBlock*>& loopExitBlocks);

    bool instHappensBefore(Instruction * inst, Instruction * final);
    Constant * generateJoinFunc();
    uint32_t calBaselineCost(std::vector<Instruction*> safecheckInsts);

};

#endif