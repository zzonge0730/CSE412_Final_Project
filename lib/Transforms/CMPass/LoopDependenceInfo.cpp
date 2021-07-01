#include "LoopDependenceInfo.h"

LoopDependenceInfo::LoopDependenceInfo(PDG * pdg, Loop * loop,
    DominatorSummary& ds, ScalarEvolution& se) : LoopDependenceInfo{pdg, loop, ds, se, 4, true, {}, true} {
    
}

LoopDependenceInfo::LoopDependenceInfo(PDG * pdg, Loop * loop, DominatorSummary& ds, ScalarEvolution& se,
    uint32_t maxCores, bool enableFloatAsReal, 
    std::unordered_set<LoopDependenceInfoOptimization> optimizations, bool enableLoopAwareDependenceAnalysis) 
    : DOALLChunkSize{8}, maxCoreNumber{maxCores}, loopSummary{loop}, 
    enabledOpts{optimizations}, areLoopAwareAnalysisEnabled{enableLoopAwareDependenceAnalysis}{
    //assertions
    for (auto edge : pdg->getEdges()) {
        assert(!edge->isLoopCarriedDependence() && "Flag was already set");
    }

    //enable all transformations
    this->enableAllTransformations();

    //fetch the loop dependence graph (i.e., the subset of the PDG that relates to the loop @loop)
    this->fetchLoopAndBBInfo(loop, se);
    LoopStructure * ls = this->getLoopStructure();
    auto loopExitBlocks = ls->getLoopExitBasicBlocks();
    auto DGs = this->createDGsForLoop(loop, pdg, ds, se);
    this->loopPDG = DGs.first;
    SCCDAG * loopSCCDAG = DGs.second;

    //create the enviroment for the loop
    this->loopEnviroment = new LoopEnvironment(loopPDG, loopExitBlocks);

    //create the invariant manager
    auto topLoop = this->loopSummary.getLoopNestingTreeRoot();
    this->invariantManager = new InvariantManager(topLoop, this->loopPDG);

    //calculate various attributes on SCCs
    this->inductionVariables = new InductionVarManager();


    //collect induction variable information

}

void LoopDependenceInfo::enableAllTransformations(void) {

}

LoopStructure * LoopDependenceInfo::getLoopStructure(void) const {

}

void LoopDependenceInfo::fetchLoopAndBBInfo(Loop * loop, ScalarEvolution& se) {

}