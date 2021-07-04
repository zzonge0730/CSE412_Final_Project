#ifndef LOOPDEPENDENCEINFO_H
#define LOOPDEPENDENCEINFO_H

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"

#include "PDG.h"
#include "PDGAnalysis.h"
#include "DominatorSummary.h"
#include "LoopEnvironment.h"
#include "LoopSummary.h"
#include "SCCDAG.h"
#include "SCCDAGAttrs.h"
#include "InvariantManager.h"
#include "InductionVariables.h"
#include "LoopGoverningIVAttribution.h"
#include "LoopCarriedDependencies.h"
#include "LoopIterationDomainSpaceAnalysis.h"
#include "DataFlowResult.h"
#include "DataFlowEngine.h"

#include <unordered_set>
#include <utility>


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
    LoopEnvironment * loopEnviroment;

    //parallelization options
    uint32_t DOALLChunkSize;

    LoopDependenceInfo(PDG * pdg, Loop * loop, DominatorSummary& ds, ScalarEvolution& se);

    LoopDependenceInfo(PDG * pdg, Loop * loop, DominatorSummary& ds, ScalarEvolution& se,
    uint32_t maxCores, bool enableFloatAsReal, bool enableLoopAwareDependenceAnalysis);

    LoopDependenceInfo() = delete;

    uint64_t getID(void) const;//return the ID of the loop

    //enable all transformations
    //void enableAllTransformations(void);

    //return the object that describes the loop in terms of induction variables,
    //trip count, and control structure(e.g., latches, header)
    LoopStructure * getLoopStructure(void) const;

    PDG * getLoopPDG(void) const;

    ~LoopDependenceInfo();

    MemoryCloningAnalysis * getMemoryCloningAnalysis(void) const;
    LoopIterationDomainSpaceAnalysis * getLoopIterationDomainSpaceAnalysis(void) const;
    InvariantManager * getInvariantManager(void) const;
    SCCDAGAttrs * getSCCManager(void) const;
    InductionVariableManager * getInductionVariableManager(void) const;
    LoopGoverningIVAttribution * getLoopGoverningIVAttribution(void) const;

    //return true if scc is fully contained in a subloop
    //otherwise, false
    bool isSCCContainedInSubLoop(SCC * scc) const;

    bool iterateOverSubLoopsRecursively(std::function<bool (const LoopStructure& child)> funcToInvoke);

    void copyParallelizationOptionsFrom(LoopDependenceInfo * otherLDI);

    LoopStructure * getNestedMostLoopStructure(Instruction * I) const;

    const LoopSummary& getLoopHierarchyStructures(void) const;

    bool doesHaveCompileTimeKnownTripCount(void) const;
    
    uint64_t getCompileTimeTripCount(void) const;

    uint32_t getMaxCoreNumber(void) const;

private:

    bool areLoopAwareAnalysisEnabled;
    //dependence graph of the loop
    //this graph does not include instructions outside the loop
    //(no external dependences are included)
    PDG * loopPDG;

    uint32_t maxCoreNumber;

    //describe the loops with the current one as outermost
    //each loop is described in terms of its control structure
    //(latch, header)
    LoopSummary loopSummary;

    void fetchLoopAndBBInfo(Loop * loop, ScalarEvolution& se);

    std::pair<PDG *, SCCDAG *> createDGsForLoop(Loop* loop, PDG* functionPDG,
    DominatorSummary& ds, ScalarEvolution& se);

    InvariantManager* invariantManager;
    InductionVariableManager* inductionVariables;
    SCCDAGAttrs* sccdagAttrs;
    LoopIterationDomainSpaceAnalysis* domainSpaceAnalysis;
    LoopGoverningIVAttribution* loopGoverningIVAttribution;
    MemoryCloningAnalysis * memoryCloningAnalysis;

    bool compileTimeKnownTripCount;
    uint64_t tripCount;

    void removeUnnecessaryDependenciesThatCloningMemoryNegates(PDG * loopInternalDG, DominatorSummary& ds);

    void removeUnnecessaryDependenciesWithThreadSafeLibraryFunctions(PDG * loopPDG, DominatorSummary& ds);

    void refinePDGWithLoopAwareMemDepAnalysis(PDG * loopPDG, LoopStructure * loopStructure, LoopSummary * loopSummary,
    LoopIterationDomainSpaceAnalysis * loopIDSA);


    DataFlowResult * computeReachabilityFromInstructions(LoopStructure * loopStructure);
};

#endif