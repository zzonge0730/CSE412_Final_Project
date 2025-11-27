#ifndef TRANSFERFORASAN_H
#define TRANSFERFORASAN_H

#include "llvm/Pass.h"
#include "LoopStructure.h"
#include "PDG.h"
#include "PDGAnalysis.h"
#include "DominatorSummary.h"
#include "StayConnectedNestedLoopForest.h"
#include "DOALLTask.h"
#include "LoopFreeTask.h"

#include "llvm/Analysis/CallGraph.h"
#include "llvm/Support/raw_ostream.h"

#include <queue>

using namespace llvm;

class TransferForAsan : public ModulePass {
public:
    static char ID;
    TransferForAsan();
    virtual ~TransferForAsan();
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

    bool instHappensBefore(Instruction * inst, Instruction * final);
    Constant * generateJoinFunc();
    uint32_t calBaselineCost(std::vector<Instruction*> safecheckInsts);

};

#endif