#ifndef SCCDAGATTRS_H
#define SCCDAGATTRS_H

#include "DGBase.h"

#include "PDG.h"
// LLVM 14: PDGAnalysis는 레거시 PassManager를 사용하므로 임시로 forward declaration만 사용
// #include "PDGAnalysis.h"
class PDGAnalysis; // Forward declaration
#include "SCCDAG.h"
#include "SCCAttrs.h"
#include "DominatorSummary.h"
#include "LoopSummary.h"
#include "AccumulatorOpInfo.h"
#include "InductionVariables.h"
#include "MemoryCloningAnalysis.h"
#include "LoopCarriedDependencies.h"

#include "llvm/Analysis/ScalarEvolution.h"

class SCCDAGAttrs {
public:

    SCCDAGAttrs (
        bool enableFloatAsReal,
        PDG *loopDG,
        SCCDAG *loopSCCDAG,
        LoopSummary &LIS,
        ScalarEvolution &SE,
        InductionVariableManager &IV,
        DominatorSummary &DS
    ) ;
    
    SCCDAGAttrs () = delete ;

    /*
        * Graph wide structures
        */
    AccumulatorOpInfo accumOpInfo;

    /*
        * Dependencies in graph
        */
    std::unordered_map<SCC *, Criticisms> sccToLoopCarriedDependencies;

    /*
        * Isolated clonable SCCs and resulting inherited parents
        */
    std::unordered_map<SCC *, std::unordered_set<SCC *>> parentsViaClones;
    std::unordered_map<SCC *, std::unordered_set<DGEdge<SCC> *>> edgesViaClones;

    /*
        * Methods on SCCDAG.
        */
    std::set<SCC *> getSCCsWithLoopCarriedDependencies (void) const ;
    std::set<SCC *> getSCCsWithLoopCarriedDataDependencies (void) const ;
    std::set<SCC *> getSCCsWithLoopCarriedControlDependencies (void) const ;
    std::unordered_set<SCCAttrs *> getSCCsOfType (SCCAttrs::SCCType sccType);
    bool isLoopGovernedBySCC (SCC *scc) const ;
    bool areAllLiveOutValuesReducable (LoopEnvironment *env) const ;

    /*
        * Methods on single SCC.
        */
    bool isSCCContainedInSubloop (const LoopSummary &LIS, SCC *scc) const ;
    SCCAttrs * getSCCAttrs (SCC *scc) const; 

    /*
        * Methods about single dependence.
        */
    bool isALoopCarriedDependence (SCC *scc, DGEdge<Value> *dependence) ;

    /*
        * Methods about multiple dependences.
        */
    void iterateOverLoopCarriedDataDependences (
        SCC *scc, 
        std::function<bool (DGEdge<Value> *dependence)> func
        ) ;

    void iterateOverLoopCarriedControlDependences (
        SCC *scc, 
        std::function<bool (DGEdge<Value> *dependence)> func
        ) ;

    void iterateOverLoopCarriedDependences (
        SCC *scc, 
        std::function<bool (DGEdge<Value> *dependence)> func
        ) ;

    /*
        * Return the SCCDAG of the loop.
        */
    // TODO: Return const reference to SCCDAG, not a raw pointer
        SCCDAG * getSCCDAG (void) const ;



    ~SCCDAGAttrs ();

    private:
    bool enableFloatAsReal;
    std::unordered_map<SCC *, SCCAttrs *> sccToInfo;
    PDG *loopDG;
    SCCDAG *sccdag;     /* SCCDAG of the related loop.  */
    MemoryCloningAnalysis *memoryCloningAnalysis;

    /*
        * Helper methods on SCCDAG
        */
    void collectSCCGraphAssumingDistributedClones ();
    void collectLoopCarriedDependencies (LoopSummary &LIS);

    /*
        * Helper methods on single SCC
        */
    bool checkIfReducible (SCC *scc, LoopSummary &LIS);
    bool checkIfIndependent (SCC *scc);
    bool checkIfSCCOnlyContainsInductionVariables (
        SCC *scc,
        LoopSummary &LIS,
        std::set<InductionVariable *> &loopGoverningIVs,
        std::set<InductionVariable *> &IVs
    );
    void checkIfClonable (SCC *scc, ScalarEvolution &SE, LoopSummary &LIS);
    void checkIfClonableByUsingLocalMemory(SCC *scc, LoopSummary &LIS) ;
    bool isClonableByInductionVars (SCC *scc) const ;
    bool isClonableBySyntacticSugarInstrs (SCC *scc) const ;
    bool isClonableByCmpBrInstrs (SCC *scc) const ;
    bool isClonableByHavingNoMemoryOrLoopCarriedDataDependencies(SCC *scc, LoopSummary &LIS) const ;

};

#endif