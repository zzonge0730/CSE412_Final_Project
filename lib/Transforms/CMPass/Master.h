#ifndef MASTER_H
#define MASTER_H

#include "llvm/Pass.h"

#include "PDG.h"
#include "PDGAnalysis.h"
#include "LoopDependenceInfo.h"
#include "LoopStructure.h"
#include "StayConnectedNestedLoopForest.h"

using namespace llvm;

class Master : public ModulePass {
public:
    static char ID;
    IntegerType *int1ptr, *int8ptr, *int16ptr, *int32ptr, *int64ptr;
    Master();
    ~Master();
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    bool runOnModule(Module& M) override;

    std::vector<LoopDependenceInfo *> * getLoops(void);
    std::vector<LoopDependenceInfo *> * getLoops(double minHot);
    std::vector<LoopDependenceInfo *> * getLoops(Function * fun);
    std::vector<LoopDependenceInfo *> * getLoops(Function * fun, double minHot);

    std::vector<LoopStructure *> * getLoopStructures(void);
    std::vector<LoopStructure *> * getLoopStructures(double minHot);
    std::vector<LoopStructure *> * getLoopStructures(Function * fun);
    std::vector<LoopStructure *> * getLoopStructures(Function * fun, double minHot);

    LoopDependenceInfo * getLoop(LoopStructure * loop);
    
    StayConnectedNestedLoopForest * organizeLoopsInTheirNestingForest(
        std::vector<LoopStructure *> const & loops
    );

    void linkTransformedLoopToOriginalFunction(
        Module * M,
        BasicBlock * originalPreHeader,
        BasicBlock * startOfParallelizeLoopInOriginalFunc,
        BasicBlock * endOfParallelizedLoopInOriginalFunc,
        Value * envArray,
        Value * envIndexForExitVariable,
        std::vector<BasicBlock*>& loopExitBlocks
    );

private:
    double minHot;
    Module * program;
    PDG * programDependenceGraph;
    PDGAnalysis * pdgAnalysis;

    std::unordered_map<BasicBlock*, uint32_t> loopHeaderToLoopIndexMap;

    LoopDependenceInfo * getLoopDependenceInfoForLoop(
        Loop* loop, PDG * functionPDG, 
        DominatorSummary * ds, ScalarEvolution *se,
        uint32_t DOALLChunkSize, uint32_t maxCores
    );

    bool isLoopHot(LoopStructure * loopStructure, double minHot);
    bool isFunctionHot(Function * function, double minHot);

    std::vector<Function*> * getModuleFunctionsReachableFrom(
        Module * M, Function * startingPoint
    );


};

#endif