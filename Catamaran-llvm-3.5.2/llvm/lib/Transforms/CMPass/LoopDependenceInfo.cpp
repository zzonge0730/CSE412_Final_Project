#include "LoopDependenceInfo.h"

LoopDependenceInfo::LoopDependenceInfo(PDG * pdg, Loop * loop,
    DominatorSummary& ds, ScalarEvolution& se) : LoopDependenceInfo{pdg, loop, ds, se, 4, true, true} {
    
}

LoopDependenceInfo::LoopDependenceInfo(PDG * pdg, Loop * loop, DominatorSummary& ds, ScalarEvolution& se,
    uint32_t maxCores, bool enableFloatAsReal, bool enableLoopAwareDependenceAnalysis) 
    : DOALLChunkSize{8}, maxCoreNumber{maxCores}, loopSummary{loop}, areLoopAwareAnalysisEnabled{enableLoopAwareDependenceAnalysis}{
    //assertions
    for (auto edge : pdg->getEdges()) {
        assert(!edge->isLoopCarriedDependence() && "Flag was already set");
    }

    //enable all transformations
    // this->enableAllTransformations();

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
    // this step identifies instructions that are loop invariants
    auto topLoop = this->loopSummary.getLoopNestingTreeRoot();
    this->invariantManager = new InvariantManager(topLoop, this->loopPDG);

    //create the induction variable manager
    //identifies IVs
    //First, we need to compute the LoopDependenceGraph that doesn't include memory dependences
    //Memory depdences don't matter for the IV detection
    //Then, we compute the SCCDAG of this sub-LDG
    //Next, we can identify IVs from this new SCCDAG

    std::vector<Value *> loopInternals;
    for (auto internalNode : loopPDG->getInternalNodePairs()) {
        loopInternals.push_back(internalNode.first);
    }
    std::unordered_set<DGEdge<Value> *> memDeps{};
    for (auto currentDep : loopPDG->getSortedDependences()) {
        if (currentDep->isMemoryDependence()) {
            memDeps.insert(currentDep);
        }
    }
    auto loopDGWithoutMemoryDeps = loopPDG->createSubgraphFromValues(loopInternals, false, memDeps);
    auto loopSCCDAGWithoutMemoryDeps = new SCCDAG(loopDGWithoutMemoryDeps);

    //calculate various attributes on SCCs
    this->inductionVariables = new InductionVariableManager(this->loopSummary, *this->invariantManager, se, *loopSCCDAGWithoutMemoryDeps, *loopEnviroment);
    this->sccdagAttrs = new SCCDAGAttrs(enableFloatAsReal, pdg, loopSCCDAG, this->loopSummary, se, *this->inductionVariables, ds);
    this->domainSpaceAnalysis = new LoopIterationDomainSpaceAnalysis(this->loopSummary, *this->inductionVariables, se);


    //collect induction variable information
    auto iv = this->inductionVariables->getLoopGoverningInductionVariable(*this->loopSummary.getLoop(*loop->getHeader()));
    // if (iv == nullptr) errs() << "---42 iv\n";
    loopGoverningIVAttribution = iv == nullptr ? nullptr : new LoopGoverningIVAttribution(*iv, *loopSCCDAG->sccOfValue(iv->getLoopEntryPHI()), loopExitBlocks);

}

// void LoopDependenceInfo::enableAllTransformations(void) {

// }

LoopStructure * LoopDependenceInfo::getLoopStructure(void) const {
    return this->loopSummary.getLoopNestingTreeRoot();
}

void LoopDependenceInfo::fetchLoopAndBBInfo(Loop * loop, ScalarEvolution& se) {
    //compute the trip counts of all loops in the loop tree that starts with loop
    auto loopTripCount = se.getSmallConstantTripCount(loop, loop->getExitBlock());

    if (loopTripCount > 0) {
        this->compileTimeKnownTripCount = true;
        this->tripCount = loopTripCount;
    } else {
        this->compileTimeKnownTripCount = false;
        this->tripCount = 0;
    }
}

std::pair<PDG *, SCCDAG *> LoopDependenceInfo::createDGsForLoop(Loop* loop, PDG* functionPDG,
    DominatorSummary& ds, ScalarEvolution& se) {
    //create the loop dependence graph
    for (auto edge : functionPDG->getEdges()) {
        assert(!edge->isLoopCarriedDependence() && "Flag was already set!");
    }
    auto loopDG = functionPDG->createLoopsSubgraph(loop);

    for (auto edge : loopDG ->getEdges()) {
        assert(!edge->isLoopCarriedDependence() && "Flag was already set!!");
    }        

    std::vector<Value *> loopInternals;
    for (auto internalNode : loopDG->getInternalNodePairs()) {
        loopInternals.push_back(internalNode.first);
    }

    auto loopInternalPDG = loopDG->createSubgraphFromValues(loopInternals, false);

    /*
    * Detect the loop-carried data dependences.
    *
    * HACK: The reason LoopCarriedDependencies is constructed SPECIFICALLY with the DG
    * that is used to query it is because it holds references to edges copied to that specific
    * instance of the DG. Edges are NOT referential to a single DG source.
    * When they are, this won't need to be done
    *
    * HACK: The SCCDAG is constructed with a loop internal DG to avoid external nodes in the loop DG
    * which provide context (live-ins/live-outs) but which complicate analyzing the resulting SCCDAG 
    */
    LoopCarriedDependencies::setLoopCarriedDependencies(this->loopSummary, ds,*loopDG);

    //perform loop-aware memory dependence analysis to refine the loop dependence graph
    auto loopStructure = this->loopSummary.getLoopNestingTreeRoot();
    auto loopExitBlocks = loopStructure->getLoopExitBasicBlocks();
    auto loopEnv = LoopEnvironment(loopDG, loopExitBlocks);
    auto preRefinedSCCDAG = SCCDAG(loopInternalPDG);
    auto invManager = InvariantManager(loopStructure, loopDG);
    auto ivManager = InductionVariableManager(this->loopSummary, invManager, se, preRefinedSCCDAG, loopEnv);
    auto domainSpace = LoopIterationDomainSpaceAnalysis(this->loopSummary, ivManager, se);

    // enable loop-aware memory dependence analysis
    // if (this->areLoopAwareAnalysisEnabled) {
    //     refinePDGWithLoopAwareMemDepAnalysis(loopDG, loopStructure, &this->loopSummary, &domainSpace);
    // }

    //Analyze the loop to identify opportunities of cloning stack objects
    // this->removeUnnecessaryDependenciesThatCloningMemoryNegates(loopDG, ds);

    //remove mmeory dependences with know thread-safe library functions
    //is there any thread-safe library function for SoftBoundCETS?
    //may be we should hack it, and make it thread-safe
    // this->removeUnnecessaryDependenciesWithThreadSafeLibraryFunctions(loopDG, ds);

    //Build a SCCDAG of loop-internal instructions
    loopInternalPDG = loopDG->createSubgraphFromValues(loopInternals, false);
    auto loopSCCDAG = new SCCDAG(loopInternalPDG);

  /*
   * Check that all loop instructions belong to LDI-specific containers.
   */
//   {
//   int64_t numberOfInstructionsInLoop = 0;
//   for (auto bbIter : l->blocks()){
//     for (auto &I : *bbIter){
//       assert(std::find(loopInternals.begin(), loopInternals.end(), &I) != loopInternals.end());
//       assert(loopInternalDG->isInternal(&I));
//       assert(loopSCCDAG->doesItContain(&I));
//       numberOfInstructionsInLoop++;
//     }
//   }

//   /*
//    * Check that all LDI-specific containers include only loop instructions.
//    */
//   assert(loopInternals.size() == numberOfInstructionsInLoop);
//   assert(loopInternalDG->numNodes() == loopInternals.size());
//   }

    return std::make_pair(loopDG, loopSCCDAG);

}

PDG * LoopDependenceInfo::getLoopPDG(void) const {
    return this->loopPDG;
}

uint64_t LoopDependenceInfo::getID(void) const {
    return this->getLoopStructure()->getID();
}

LoopDependenceInfo::~LoopDependenceInfo() {
    if (this->loopPDG) {
        delete this->loopPDG;
    }
    if (this->loopEnviroment) {
        delete this->loopEnviroment;
    }
    if (this->inductionVariables) {
        delete this->inductionVariables;
    }
    if (this->invariantManager) {
        delete this->invariantManager;
    }

    if (this->loopGoverningIVAttribution) {
        delete this->loopGoverningIVAttribution;
    }

    if (this->domainSpaceAnalysis) {
        delete this->domainSpaceAnalysis;
    }

    if (this->sccdagAttrs) { // why not?
        delete this->sccdagAttrs;
    }

    if (this->memoryCloningAnalysis) { //why not?
        delete this->memoryCloningAnalysis;
    }
}

void LoopDependenceInfo::removeUnnecessaryDependenciesThatCloningMemoryNegates(PDG * loopInternalDG, DominatorSummary& ds) {
    //fetch the loop sub-tree rooted at @this
    auto rootLoop = this->loopSummary.getLoopNestingTreeRoot();

    //create the memory cloning analyzer
    this->memoryCloningAnalysis = new MemoryCloningAnalysis(rootLoop, ds, loopInternalDG);

    //identify opportunities for cloning stack locations
    std::unordered_set<DGEdge<Value> *> edgesToRemove;
    for (auto edge : LoopCarriedDependencies::getLoopCarriedDependenciesForLoop(*rootLoop, this->loopSummary, *loopInternalDG)) {
        if (!edge->isMemoryDependence()) continue;

        //only dependences between instructions can be removed by cloning memory objects
        auto producer = dyn_cast<Instruction>(edge->getOutgoingT());
        auto consumer = dyn_cast<Instruction>(edge->getIncomingT());
        if (!producer || !consumer) continue;

        auto locationsProducer = this->memoryCloningAnalysis->getClonableMemoryLocationsFor(producer);
        auto locationsConsumer = this->memoryCloningAnalysis->getClonableMemoryLocationsFor(consumer);
        if (locationsProducer.empty() || locationsConsumer.empty()) continue;


        bool isRAW = false;
        for (auto locP : locationsProducer) {
            for (auto locC : locationsConsumer) {
                if (edge->isRAWDependence() && 
                locP->isInstructionStoringLocation(producer) &&
                locC->isInstructionLoadingLocation(consumer))
                isRAW = true;
            }
        }
    
        bool isWAR = false;
        for (auto locP : locationsProducer) {
            for (auto locC : locationsConsumer) {
                if (edge->isWARDependence() && 
                locP->isInstructionLoadingLocation(producer) &&
                locC->isInstructionStoringLocation(consumer))
                isWAR = true;
            }
        }

        bool isWAW = false;
        for (auto locP : locationsProducer) {
            for (auto locC : locationsConsumer) {
                if (edge->isWAWDependence() && 
                locP->isInstructionStoringLocation(producer) &&
                locC->isInstructionStoringLocation(consumer))
                isWAW = true;
            }
        }

        if (!isRAW && !isWAR && !isWAW) continue;

        producer->print(errs() << "Found alloca location for producer: "); errs() << "\n";
        consumer->print(errs() << "Found alloca location for consumer: "); errs() << "\n";
        // locationProducer->getAllocation()->print(errs() << "producer Alloca: "); errs() << "\n";
        // locationConsumer->getAllocation()->print(errs() << "consumer Alloca: "); errs() << "\n";

        edgesToRemove.insert(edge);
    }

    //remove it
    for (auto edge : edgesToRemove) {
        edge->setLoopCarried(false);
        loopInternalDG->removeEdge(edge);
    }
}

void LoopDependenceInfo::removeUnnecessaryDependenciesWithThreadSafeLibraryFunctions(PDG * loopPDG, DominatorSummary& ds) {
    auto rootLoop = this->loopSummary.getLoopNestingTreeRoot();

    std::unordered_set<DGEdge<Value> *> edgesToRemove;

    for (auto edge : LoopCarriedDependencies::getLoopCarriedDependenciesForLoop(*rootLoop, this->loopSummary, *loopPDG)) {
        if (!edge->isMemoryDependence()) continue;

        auto producer = dyn_cast<Instruction>(edge->getOutgoingT());
        auto consumer = dyn_cast<Instruction>(edge->getIncomingT());
        if (!producer || !consumer) continue;

        //only self-dependences are considered to be removed
        if (producer != consumer) continue;

        //only dependences with thread-safe library functions can be removed
        if (auto producerCall = dyn_cast<CallInst>(producer)) {
            auto callee = producerCall->getCalledFunction();
            if (callee != nullptr) {
                if (PDGAnalysis::isTheLibraryFunctionThreadSafe(callee)) {
                    edgesToRemove.insert(edge);
                    continue;
                }
            }
        }
    }

    //remove it
    for (auto edge : edgesToRemove) {
        edge->setLoopCarried(false);
        loopPDG->removeEdge(edge);
    }
}

void LoopDependenceInfo::refinePDGWithLoopAwareMemDepAnalysis(PDG * loopPDG, LoopStructure * loopStructure, LoopSummary * loopSummary,
LoopIterationDomainSpaceAnalysis * loopIDSA) {
    if (loopIDSA == nullptr) {
        errs() << "loopIDSA is nullptr...\n";
        return;
    }

    //compute the reachability of instructions within the loop.
    auto dfRes = computeReachabilityFromInstructions(loopStructure);

    std::unordered_set<DGEdge<Value> *> edgesToRemove;
    for (auto dependency : LoopCarriedDependencies::getLoopCarriedDependenciesForLoop(*loopStructure, *loopSummary, *loopPDG)) {
        if (!dependency->isMemoryDependence()) continue;

        auto fromInst = dyn_cast<Instruction>(dependency->getOutgoingT());
        auto toInst = dyn_cast<Instruction>(dependency->getIncomingT());
        if (!fromInst || !toInst) continue;

        //we can only remove dependencies between a producer and consumer
        //where we know the producer can never reach the consumer during the same iteration
        auto& afterInstructions = dfRes->OUT(fromInst);
        if (afterInstructions.find(toInst) != afterInstructions.end()) continue;

        //above, not find in after instructions,

        if (loopIDSA->areInstructionsAccessingDisjointMemoryLocationsBetweenIterations(fromInst, toInst)) {
            edgesToRemove.insert(dependency);
        }
    }
    //remove it
    for (auto edge : edgesToRemove) {
        edge->setLoopCarried(false);
        loopPDG->removeEdge(edge);
    }

    delete dfRes;
}

DataFlowResult * LoopDependenceInfo::computeReachabilityFromInstructions(LoopStructure * loopStructure) {
    auto loopHeader = loopStructure->getHeader();
    auto loopFunction = loopStructure->getFunction();

    //run the data flow analysis needed to identify the locations where singal instructions will be placed
    auto dfa = DataFlowEngine{};
    auto computeGEN = [](Instruction * I, DataFlowResult * dfRes) {
        auto& gen = dfRes->GEN(I);
        gen.insert(I);
        return;
    };

    auto computeOUT = [loopHeader](std::set<Value*>& OUT, Instruction *succ, DataFlowResult * dfRes) {
        //check if the successor is the header
        //in this case, we do not propagate the reachable instruction
        //we do this because we are interested in understanding the reachability of instructions within a single
        auto succBB = succ->getParent();
        if (succ == &*loopHeader->begin()) return;

        //propagate the data flow values
        auto& in = dfRes->IN(succ);
        OUT.insert(in.begin(), in.end());

        return;
    };

    auto computeIN = [](std::set<Value *>& IN, Instruction *inst, DataFlowResult *dfRes) {
        auto& genI = dfRes->GEN(inst);
        auto& outI = dfRes->OUT(inst);
        IN.insert(outI.begin(), outI.end());
        IN.insert(genI.begin(), genI.end());
        return;
    };
    return dfa.applyBackward(loopFunction, computeGEN, computeIN, computeOUT);
}

MemoryCloningAnalysis * LoopDependenceInfo::getMemoryCloningAnalysis(void) const {
    assert(this->memoryCloningAnalysis != nullptr);
    return this->memoryCloningAnalysis;
}
LoopIterationDomainSpaceAnalysis * LoopDependenceInfo::getLoopIterationDomainSpaceAnalysis(void) const {
    return this->domainSpaceAnalysis;
}
InvariantManager * LoopDependenceInfo::getInvariantManager(void) const {
    return this->invariantManager;
}
SCCDAGAttrs * LoopDependenceInfo::getSCCManager(void) const {
    return this->sccdagAttrs;
}
InductionVariableManager * LoopDependenceInfo::getInductionVariableManager(void) const {
    return this->inductionVariables;
}
LoopGoverningIVAttribution * LoopDependenceInfo::getLoopGoverningIVAttribution(void) const {
    return this->loopGoverningIVAttribution;
}

//return true if scc is fully contained in a subloop
//otherwise, false
bool LoopDependenceInfo::isSCCContainedInSubLoop(SCC * scc) const {
    return this->sccdagAttrs->isSCCContainedInSubloop(this->loopSummary, scc);
}

bool LoopDependenceInfo::iterateOverSubLoopsRecursively(std::function<bool (const LoopStructure& child)> funcToInvoke) {
    //iterate over the children
    for (auto subloop : this->loopSummary.loops) {
        if (funcToInvoke(*subloop)) {
            return true;
        }
    }

    return false;
}

void LoopDependenceInfo::copyParallelizationOptionsFrom(LoopDependenceInfo * otherLDI) {
    this->DOALLChunkSize = otherLDI->DOALLChunkSize;
    this->areLoopAwareAnalysisEnabled = otherLDI->areLoopAwareAnalysisEnabled;
    this->maxCoreNumber = otherLDI->maxCoreNumber;
}

LoopStructure * LoopDependenceInfo::getNestedMostLoopStructure(Instruction * I) const {
    return this->loopSummary.getLoop(*I);
}

const LoopSummary& LoopDependenceInfo::getLoopHierarchyStructures(void) const {
    return this->loopSummary;
}

bool LoopDependenceInfo::doesHaveCompileTimeKnownTripCount(void) const {
    return this->compileTimeKnownTripCount;
}

uint64_t LoopDependenceInfo::getCompileTimeTripCount(void) const {
    return this->tripCount;
}

uint32_t LoopDependenceInfo::getMaxCoreNumber(void) const {
    return this->maxCoreNumber;
}