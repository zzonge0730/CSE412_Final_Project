#ifndef LOOPDEPENDENCEINFO_H
#define LOOPDEPENDENCEINFO_H

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"

#include "PDG.h"
#include "PDGAnalysis.h"
#include "DominatorSummary.h"
#include "LoopEnviroment.h"
#include "LoopSummary.h"

#include <unordered_set>

enum LoopDependenceInfoOptimization {
    MEMORY_CLONING_ID,
    THREAD_SAFE_LIBRARY_ID
};

enum Transformation {
    NONE_ID,
    DOALL_ID
};

class LoopDependenceInfo {
public:
    LoopEnviroment * loopEnviroment;

    //parallelization options
    uint32_t DOALLChunkSize;

    LoopDependenceInfo(PDG * pdg, Loop * loop, DominatorSummary& ds, ScalarEvolution& se);

    LoopDependenceInfo(PDG * pdg, Loop * loop, DominatorSummary& ds, ScalarEvolution& se,
    uint32_t maxCores, bool enableFloatAsReal, 
    std::unordered_set<LoopDependenceInfoOptimization> optimizations, bool enableLoopAwareDependenceAnalysis);

    LoopDependenceInfo() = delete;


private:
    std::set<Transformation> enabledTransformations;
    std::unordered_set<LoopDependenceInfoOptimization> enabledOpts;

    //dependence graph of the loop
    //this graph does not include instructions outside the loop
    //(no external dependences are included)
    PDG * loopPDG;

    uint32_t maxCoreNumber;

    //describe the loops with the current one as outermost
    //each loop is described in terms of its control structure
    //(latch, header)
    LoopSummary loopSummary;


};

#endif