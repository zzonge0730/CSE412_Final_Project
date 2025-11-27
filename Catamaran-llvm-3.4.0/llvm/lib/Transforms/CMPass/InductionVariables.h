#ifndef INDUCTIONVARIABLES_H
#define INDUCTIONVARIABLES_H

#include "LoopStructure.h"
#include "InvariantManager.h"
#include "SCC.h"
#include "SCCDAG.h"
#include "LoopEnvironment.h"
#include "ScalarEvolutionReferencer.h"
#include "LoopGoverningIVAttribution.h"


#include "llvm/Analysis/ScalarEvolution.h"

#include <unordered_set>
#include <vector>

using namespace llvm;

class LoopGoverningIVAttribution;

class InductionVariable {
public:
    InductionVariable(LoopStructure * ls, InvariantManager& ivm,
    ScalarEvolution& se, PHINode * loopEntryPHI, SCC& scc,
    LoopEnvironment& loopEnv, ScalarEvolutionReferentialExpander& referentialExpander);

    SCC * getSCC(void) const;

    PHINode * getLoopEntryPHI(void) const;

    std::unordered_set<PHINode *> getPHIs(void) const;

    std::unordered_set<Instruction *> getNonPHIIntermediateValues(void) const;

    std::unordered_set<Instruction *> getAllInstructions(void) const;

    std::unordered_set<Instruction *> getDerivedSCEVInstructions(void) const;

    Value * getStartValue(void) const;

    Value * getSingleComputedStepValue(void) const;

    std::vector<Instruction *> getComputationOfStepValue(void) const;

    bool isStepValueLoopInvariant(void) const;

    const SCEV * getStepSCEV(void) const;

    bool isIVInstruction(Instruction * Inst) const;

    bool isDerivedFromIVInstructions(Instruction * Inst) const;

    ~InductionVariable();

private:
    SCC& scc;//scc that contains induction variable

    //the loop entry PHI node.
    //For normalized loops with a single header
    //this PHI is the destination of all loop carried dependencies for the IV
    PHINode * loopEntryPHI;

    //all PHIs, whether intermediate or the loop entry PHI
    std::unordered_set<PHINode *> PHIs;

    //all non-PHI intermediate values of the IV
    std::unordered_set<Instruction *> nonPHIIntermediateValues;

    //all PHI/non-PHI intermediate values AND all casts of the IV
    std::unordered_set<Instruction *> allInstructions;

    //Derived SCEV instructions relying solely on loop invariants, constants, and this IV
    std::unordered_set<Instruction *> derivedSCEVInstructions;

    //start value (the incoming value to the loop entry PHI from the header)
    Value * startValue;

    const SCEV *stepSCEV;

    Value * singleStepValue;

    //
    std::vector<Instruction *> computationOfStepValue;

    //whether the computed step value's uses are all loop invariant/external
    bool isComputedStepValueLoopInvariant;

          std::set<Value *> valuesToReferenceInComputingStepValue;
      std::set<Value *> valuesInScopeOfInductionVariable;
      void collectValuesInternalAndExternalToLoopAndSCC (
        LoopStructure *LS,
        LoopEnvironment &loopEnvironment
      ) ;

      void deriveStepValue (
        LoopStructure *LS,
        ScalarEvolution &SE,
        ScalarEvolutionReferentialExpander &referentialExpander,
        LoopEnvironment &loopEnv
      ) ;

      void deriveStepValueFromSCEVConstant (const SCEVConstant *scev) ;
      void deriveStepValueFromSCEVUnknown (const SCEVUnknown *scev, LoopStructure *LS) ;
      bool deriveStepValueFromCompositeSCEV (
        const SCEV *scev,
        ScalarEvolutionReferentialExpander &referentialExpander,
        LoopStructure *LS
      ) ;

      void traverseCycleThroughLoopEntryPHIToGetAllIVInstructions (LoopStructure * LS) ;

      void traverseConsumersOfIVInstructionsToGetAllDerivedSCEVInstructions (
        LoopStructure *LS,
        InvariantManager &IVM,
        ScalarEvolution &SE
      ) ;


};


class InductionVariableManager {
public:

    InductionVariableManager (
    LoopSummary &LIS,
    InvariantManager &IVM,
    ScalarEvolution &SE,
    SCCDAG &sccdag,
    LoopEnvironment &loopEnv
    );

    InductionVariableManager () = delete;

    /*
    * Return all induction variables including the loop-governing one of the outermost loop of the loop sub-tree related to @this.
    */
    std::unordered_set<InductionVariable *> getInductionVariables (void) const ;

    /*
    * Return all induction variables including the loop-governing one.
    */
    std::unordered_set<InductionVariable *> getInductionVariables (LoopStructure &LS) const ;

    /*
    * Return all induction variables that @i is involved in for any loop/sub-loop related to this manager.
    */
    std::unordered_set<InductionVariable *> getInductionVariables (Instruction *i) const ;

    InductionVariable * getInductionVariable (LoopStructure &LS, Instruction *i) const ;

    InductionVariable * getLoopGoverningInductionVariable (LoopStructure &LS) const ;

    bool doesContributeToComputeAnInductionVariable (Instruction *i) const ;

    LoopGoverningIVAttribution * getLoopGoverningIVAttribution (LoopStructure &LS) const ;

    InductionVariable * getDerivingInductionVariable (LoopStructure &LS, Instruction *derivedInstruction) const ;

    ~InductionVariableManager ();

private:
    LoopSummary &LIS;
    std::unordered_map<LoopStructure *, std::unordered_set<InductionVariable *>> loopToIVsMap;
    std::unordered_map<LoopStructure *, LoopGoverningIVAttribution *> loopToGoverningIVAttrMap;
};

#endif