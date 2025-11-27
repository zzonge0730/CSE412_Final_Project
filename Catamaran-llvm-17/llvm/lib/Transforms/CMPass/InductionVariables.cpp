#include "InductionVariables.h"

InductionVariable::InductionVariable  (
  LoopStructure *LS,
  InvariantManager &IVM,
  ScalarEvolution &SE,
  PHINode *loopEntryPHI,
  SCC &scc,
  LoopEnvironment &loopEnv,
  ScalarEvolutionReferentialExpander &referentialExpander
) : scc{scc}, loopEntryPHI{loopEntryPHI}, startValue{nullptr},
    stepSCEV{nullptr}, computationOfStepValue{}, isComputedStepValueLoopInvariant{false} {

  /*
   * Fetch initial value of induction variable
   */
  auto bbs = LS->getBasicBlocks();
  for (auto i = 0; i < loopEntryPHI->getNumIncomingValues(); ++i) {
    auto incomingBB = loopEntryPHI->getIncomingBlock(i);
    if (bbs.find(incomingBB) == bbs.end()) {
      this->startValue = loopEntryPHI->getIncomingValue(i);
      break;
    }
  }

  traverseCycleThroughLoopEntryPHIToGetAllIVInstructions(LS);
  traverseConsumersOfIVInstructionsToGetAllDerivedSCEVInstructions(LS, IVM, SE);
  collectValuesInternalAndExternalToLoopAndSCC(LS, loopEnv);
  deriveStepValue(LS, SE, referentialExpander, loopEnv);
}

void InductionVariable::traverseCycleThroughLoopEntryPHIToGetAllIVInstructions (LoopStructure * LS) {

  /*
   * Collect intermediate values of the IV within the loop (by traversing its strongly connected component)
   * Traverse data dependencies the header PHI has.
   */
  std::queue<DGNode<Value> *> ivIntermediateValues;
  std::set<Value *> valuesVisited;
  ivIntermediateValues.push(scc.fetchNode(loopEntryPHI));

  while (!ivIntermediateValues.empty()) {
    auto node = ivIntermediateValues.front();
    auto value = node->getT();
    ivIntermediateValues.pop();

    if (valuesVisited.find(value) != valuesVisited.end()) continue;
    valuesVisited.insert(value);

    /*
     * Classify the encountered value as either a PHI or a non-PHI intermediate instruction
     * If it is not an instruction, skip
     * If it is not within the IV's loop, skip
     */
    if (!isa<Instruction>(value)) continue;
    auto instruction = cast<Instruction>(value);
    if (!LS->isIncluded(instruction)) continue;
    this->allInstructions.insert(instruction);
    if (auto phi = dyn_cast<PHINode>(instruction)) {
      this->PHIs.insert(phi);
    } else {
      this->nonPHIIntermediateValues.insert(instruction);
    }

    /*
     * Traverse all dependencies this instruction has that are internal
     * to the SCC; they are transitive dependencies of the loop entry PHI
     * and thus must be intermediate values
     */
    for (auto edge : node->getIncomingEdges()) {
      if (!edge->isDataDependence() || edge->isMemoryDependence()) continue;
      auto otherNode = edge->getOutgoingNode();
      auto otherValue = otherNode->getT();
      if (!scc.isInternalNode(otherValue)) continue;
      ivIntermediateValues.push(otherNode);
    }
  }

  /*
   * Include any casts on intermediate values
   * TODO: Determine what other instructions could still represent the induction variable
   * but not necessarily appear in the SCC for that induction variable
   */
  std::set<CastInst *> castsToAdd{};
  for (auto intermediateValue : this->allInstructions) {
    for (auto user : intermediateValue->users()) {
      if (auto castInst = dyn_cast<CastInst>(user)) {
        if (!LS->isIncluded(castInst)) continue;
        castsToAdd.insert(castInst);
      }  
    }
  }
  this->allInstructions.insert(castsToAdd.begin(), castsToAdd.end());

  return;
}

void InductionVariable::traverseConsumersOfIVInstructionsToGetAllDerivedSCEVInstructions (
  LoopStructure *LS,
  InvariantManager &IVM,
  ScalarEvolution &SE
) {

  /*
   * Recursive search up uses of an instruction to determine if derived
   * Since we do not have the SCC that pertains to children IVs, we only
   * label acyclic dependent computation on this IV as "derived"
   */
  std::unordered_set<Instruction *> checked;
  std::function<bool(Instruction *)> checkIfDerived;
  checkIfDerived = [&](Instruction *I) -> bool {

    /*
     * Check the cache of confirmed derived values,
     * and then what we have already traversed to prevent traversing a cycle
     */
    if (derivedSCEVInstructions.find(I) != derivedSCEVInstructions.end()) {
      return true;
    }
    if (checked.find(I) != checked.end()) {
      return false;
    }
    checked.insert(I);

    /*
     * Only check SCEVable values in the loop
     */
    if (!SE.isSCEVable(I->getType())) return false;
    if (!LS->isIncluded(I)) return false;

    /*
     * We only handle unary/binary operations on IV instructions.
     */
    auto scev = SE.getSCEV(I);
    if (!isa<SCEVCastExpr>(scev) && !isa<SCEVNAryExpr>(scev) && !isa<SCEVUDivExpr>(scev)) return false;

    /*
     * Ensure the instruction uses the IV at least once, and only this IV,
     * apart from constants and loop invariants
     */
    bool usesAtLeastOneIVInstruction = false;
    // for (auto &use : I->operands()) {
    for (User::op_iterator OpIt = I->op_begin(); OpIt != I->op_end(); ++OpIt ) {
      auto usedValue = (*OpIt).get();

      if (isa<ConstantInt>(usedValue)) continue;
      if (IVM.isLoopInvariant(usedValue)) continue;

      if (auto usedInst = dyn_cast<Instruction>(usedValue)) {
        if (!LS->isIncluded(usedInst)) continue;
        auto isIVUse = this->isIVInstruction(usedInst);
        auto isDerivedUse = checkIfDerived(usedInst);
        if (isIVUse || isDerivedUse) {
          usesAtLeastOneIVInstruction = true;
          continue;
        }
      }

      return false;
    }

    if (!usesAtLeastOneIVInstruction) return false;

    /*
     * Cache the result
     */
    derivedSCEVInstructions.insert(I);

    return true;
  };

  /*
   * Queue traversal through users of IV instructions to find all derived instructions
   */
  std::queue<Instruction *> intermediates;
  std::unordered_set<Instruction *> visited;
  for (auto ivInst : allInstructions) {
    intermediates.push(ivInst);
    visited.insert(ivInst);
  }

  while (!intermediates.empty()) {
    auto I = intermediates.front();
    intermediates.pop();

    for (auto user : I->users()) {
      if (auto userInst = dyn_cast<Instruction>(user)) {
        if (visited.find(userInst) != visited.end()) continue;
        visited.insert(userInst);

        /*
         * If the user isn't derived, do not continue traversing users
         */
        if (!checkIfDerived(userInst)) continue;
        intermediates.push(userInst);
      }
    }
  }

  return;
}

void InductionVariable::collectValuesInternalAndExternalToLoopAndSCC (
  LoopStructure *LS,
  LoopEnvironment &loopEnvironment
) {

  auto bbs = LS->getBasicBlocks();

  /*
   * Values internal to the IV's SCC are in scope but should
   * NOT be referenced when computing the IV's step value
   */
  for (auto internalNodePair : scc.getInternalNodePairs()) {
    auto value = internalNodePair.first;
    valuesInScopeOfInductionVariable.insert(value);
  }

  /*
   * Values external to the IV's SCC are in scope
   * 
   * HACK: they should be referenced when computing the IV's step value
   * even if they aren't loop external, but that would require a more
   * powerful way to distinguish instructions in the loop that are
   * still loop invariant, which isn't possible at this time. Therefore,
   * we force the expansion of all but live in values. In turn, the expander
   * will return that it could not expand SCEVAddRecExpr, exiting gracefully.
   */
  for (auto externalPair : scc.getExternalNodePairs()) {
    auto value = externalPair.first;
    valuesInScopeOfInductionVariable.insert(value);
  }

  /*
   * All live ins are in scope and should be referenced
   */
  for (auto liveIn : loopEnvironment.getProducers()) {
    valuesInScopeOfInductionVariable.insert(liveIn);
    valuesToReferenceInComputingStepValue.insert(liveIn);
  }
}

/*
 * Examine the step recurrence SCEV and either retrieve the single value
 * representing the SCEV or expand values to represent it
 */
void InductionVariable::deriveStepValue (
  LoopStructure *LS,
  ScalarEvolution &SE,
  ScalarEvolutionReferentialExpander &referentialExpander,
  LoopEnvironment &loopEnv
) {

  auto loopEntrySCEV = SE.getSCEV(loopEntryPHI);
  assert(loopEntrySCEV->getSCEVType() == SCEVTypes::scAddRecExpr);
  this->stepSCEV = cast<SCEVAddRecExpr>(loopEntrySCEV)->getStepRecurrence(SE);

  switch (stepSCEV->getSCEVType()) {
    case SCEVTypes::scConstant:
      deriveStepValueFromSCEVConstant(cast<SCEVConstant>(stepSCEV));
      break;
    case SCEVTypes::scUnknown:
      deriveStepValueFromSCEVUnknown(cast<SCEVUnknown>(stepSCEV), LS);
      break;
    case SCEVTypes::scAddExpr:
    case SCEVTypes::scAddRecExpr:
    case SCEVTypes::scMulExpr:
    case SCEVTypes::scSignExtend:
    case SCEVTypes::scSMaxExpr:
    // case SCEVTypes::scSMinExpr:
    case SCEVTypes::scTruncate:
    case SCEVTypes::scUDivExpr:
    case SCEVTypes::scUMaxExpr:
    // case SCEVTypes::scUMinExpr:
    case SCEVTypes::scZeroExtend:

      /*
       * Not all composite SCEVs are handled, so if the derivation fails,
       * do not claim understanding of the step recurrence
       */
      if (!deriveStepValueFromCompositeSCEV(stepSCEV, referentialExpander, LS)) {
        this->stepSCEV = nullptr;
      }
      break;
    case SCEVTypes::scCouldNotCompute:
      break;
  }

}

void InductionVariable::deriveStepValueFromSCEVConstant (const SCEVConstant *scev) {
  this->singleStepValue = scev->getValue();
  this->isComputedStepValueLoopInvariant = true;
}

void InductionVariable::deriveStepValueFromSCEVUnknown (const SCEVUnknown *scev, LoopStructure *LS) {
  this->singleStepValue = scev->getValue();
  this->isComputedStepValueLoopInvariant = LS->isLoopInvariant(this->singleStepValue);
}

bool InductionVariable::deriveStepValueFromCompositeSCEV (
  const SCEV *scev,
  ScalarEvolutionReferentialExpander &referentialExpander,
  LoopStructure *LS
) {

  // auto M = headerPHI->getFunction()->getParent();
  // DataLayout DL(M);
  // const char name = 'a';
  // SCEVExpander *expander = new SCEVExpander(SE, DL, &name);

  // stepSCEV->print(errs() << "Referencing: "); errs() << "\n";
  auto stepSizeReferenceTree = referentialExpander.createReferenceTree(scev, valuesInScopeOfInductionVariable);
  if (!stepSizeReferenceTree) return false;

  // stepSizeReferenceTree->getSCEV()->print(errs() << "Expanding: "); errs() << "\n";
  auto tempBlock = BasicBlock::Create(loopEntryPHI->getContext());
  IRBuilder<> tempBuilder(tempBlock);
  auto finalValue = referentialExpander.expandUsingReferenceValues(
    stepSizeReferenceTree,
    valuesToReferenceInComputingStepValue,
    tempBuilder
  );
  if (!finalValue) return false;

  this->isComputedStepValueLoopInvariant = true;
  auto references = stepSizeReferenceTree->collectAllReferences();
  // TODO: Only check leaf reference values
  for (auto reference : references) {
    if (reference->getValue() && LS->isLoopInvariant(reference->getValue())) {
      this->isComputedStepValueLoopInvariant = false;
      break;
    }
  }

  // finalValue->print(errs() << "Expanded final value: "); errs() << "\n";

  /*
   * If no instruction was expanded (where a value is referenced instead)
   * OR
   * if only one instruction was expanded to represent the step recurrence
   * then save that single value
   */
  if (tempBlock->size() < 2) {
    singleStepValue = finalValue;
  }

  /*
    * Save expanded values that compute the step recurrence
    */
  for (auto &I : *tempBlock) {
    computationOfStepValue.push_back(&I);
  }

  return true;
}

InductionVariable::~InductionVariable () {
  // BasicBlock *tempBlock = nullptr;
  // if (tempBlock) {
  //   tempBlock->deleteValue();
  // }
}

SCC *InductionVariable::getSCC (void) const {
  return &scc;
}

PHINode * InductionVariable::getLoopEntryPHI (void) const {
  return loopEntryPHI;
}

std::unordered_set<PHINode *> InductionVariable::getPHIs (void) const {
  return PHIs;
}

std::unordered_set<Instruction *> InductionVariable::getNonPHIIntermediateValues (void) const {
  return nonPHIIntermediateValues;
}

std::unordered_set<Instruction *> InductionVariable::getAllInstructions(void) const {
  return allInstructions;
}

std::unordered_set<Instruction *> InductionVariable::getDerivedSCEVInstructions(void) const {
  return derivedSCEVInstructions;
}

Value *InductionVariable::getStartValue (void) const {
  return startValue;
}

Value *InductionVariable::getSingleComputedStepValue (void) const {
  return singleStepValue;
}

const SCEV * InductionVariable::getStepSCEV (void) const {
  return stepSCEV;
}

std::vector<Instruction *> InductionVariable::getComputationOfStepValue(void) const {
  return computationOfStepValue;
}

bool InductionVariable::isStepValueLoopInvariant (void) const {
  return isComputedStepValueLoopInvariant;
}

bool InductionVariable::isIVInstruction (Instruction *I) const {
  return allInstructions.find(I) != allInstructions.end();
}

bool InductionVariable::isDerivedFromIVInstructions (Instruction *I) const {
  return derivedSCEVInstructions.find(I) != derivedSCEVInstructions.end();
}

InductionVariableManager::InductionVariableManager (
  LoopSummary &LIS,
  InvariantManager &IVM,
  ScalarEvolution &SE,
  SCCDAG &sccdag,
  LoopEnvironment &loopEnv
) : LIS{LIS}, loopToIVsMap{}, loopToGoverningIVAttrMap{} {

  /*
   * Fetch the loop to analyze.
   */
  auto loopToAnalyze = LIS.getLoopNestingTreeRoot();

  /*
   * Fetch the function that includes the loop.
   */
    // errs() << "----loopToAnalyze----\n";
    // std::string str;
    // raw_string_ostream ros(str);
    // loopToAnalyze->print(ros);
    // ros.flush();
    // errs() << str << "\n";


  auto &F = *loopToAnalyze->getHeader()->getParent();

  // errs() << "F is: " << F << "\n";
  /*
   * Identify the induction variables.
   */
  ScalarEvolutionReferentialExpander referentialExpander(SE, F);
  // errs() << "---435\n";
  for (auto &loop : LIS.loops) {
    this->loopToIVsMap[loop.get()] = std::unordered_set<InductionVariable *>();
    // errs() << "---438i\n";
    /*
     * Fetch the loop header.
     */
    auto header = loop->getHeader();

    /*
     * Iterate over all phis within the loop header.
     */
    // errs() << "---447i\n";
    // errs() << "count phi: " << std::distance(header->phis().begin(), header->phis().end()) << "\n";
    for (auto &phi : header->phis()) {
      // errs() << "---448i\n";
      /*
       * Check if the PHI node can be analyzed by the SCEV analysis.
       */
      if (!SE.isSCEVable(phi.getType())){
        continue ;
      }

      /*
       * Fetch the SCEV.
       */
      auto scev = SE.getSCEV(&phi);
      if (!scev){
        continue ;
      }

      /*
       * Check if the SCEV suggests this is an induction variable.
       */
      if (scev->getSCEVType() != SCEVTypes::scAddRecExpr) {
        continue;
      }

      /*
       * Allocate the induction variable.
       */
      auto sccContainingIV = sccdag.sccOfValue(&phi);
      auto IV = new InductionVariable(loop.get(), IVM, SE, &phi, *sccContainingIV, loopEnv, referentialExpander); 

      /*
       * Only save IVs for which the step size is understood
       */
      if (!IV->getStepSCEV()) {
        delete IV;
        continue;
      }

      /*
       * Save the IV.
       */
      // errs() << "---487i\n";
      this->loopToIVsMap[loop.get()].insert(IV);
      auto exitBlocks = LIS.getLoop(phi)->getLoopExitBasicBlocks();
      auto attribution = new LoopGoverningIVAttribution(*IV, *sccContainingIV, exitBlocks);
      if (attribution->isSCCContainingIVWellFormed()) {
        // errs() << "---491i\n";
        loopToGoverningIVAttrMap[loop.get()] = attribution;
      } else {
        delete attribution;
      }
    }
  }

  return ;
}

std::unordered_set<InductionVariable *> InductionVariableManager::getInductionVariables (void) const {
  
  /*
   * Fetch the outermost loop of @this.
   */
  auto loop = this->LIS.getLoopNestingTreeRoot();

  /*
   * Fetch the induction variables of the loop.
   */
  auto IVs = this->getInductionVariables(*loop);

  return IVs;
}

std::unordered_set<InductionVariable *> InductionVariableManager::getInductionVariables (Instruction *i) const {
  std::unordered_set<InductionVariable *> s{};

  /*
   * Iterate over every loop and their induction variables.
   */
  for (auto loopIVPair : this->loopToIVsMap){

    /*
     * Fetch the set of induction variables of the current loop.
     */
    auto IVs = loopIVPair.second;

    /*
     * Check each induction variable.
     */
    for (auto IV : IVs){
      auto insts = IV->getAllInstructions();
      if (insts.find(i) != insts.end()){
        s.insert(IV);
      }
    }
  }

  return s;
}

bool InductionVariableManager::doesContributeToComputeAnInductionVariable (Instruction *i) const {

  /*
   * Fetch the induction variable that @i contributes to.
   */
  auto IVs = this->getInductionVariables(i);
  if (IVs.size() == 0){
    return false;
  }

  return true;
}

InductionVariableManager::~InductionVariableManager () {
  for (auto ivAttributions : loopToGoverningIVAttrMap) {
    delete ivAttributions.second;
  }
  loopToGoverningIVAttrMap.clear();

  for (auto loopIVs : loopToIVsMap) {
    for (auto IV : loopIVs.second) {
      delete IV;
    }
  }
  loopToIVsMap.clear();

  return ;
}

InductionVariable * InductionVariableManager::getInductionVariable (LoopStructure &LS, Instruction *i) const {

  /*
   * Fetch all induction variables.
   */
  auto IVs = this->getInductionVariables(LS);

  /*
   * Check each induction variable.
   */
  for (auto IV : IVs){
    if (IV->isIVInstruction(i)){

      /*
       * We found an induction variable that involves the instruction given as input.
       */
      return IV;
    }
  }

  return nullptr;
}

std::unordered_set<InductionVariable *> InductionVariableManager::getInductionVariables (LoopStructure &LS) const {
  return this->loopToIVsMap.at(&LS);
}

InductionVariable * InductionVariableManager::getDerivingInductionVariable (
  LoopStructure &LS,
  Instruction *derivedInstruction
) const {

  for (auto IV : this->getInductionVariables(LS)){
    if (IV->isDerivedFromIVInstructions(derivedInstruction)){

      /*
       * We found an induction variable that derives the instruction given as input.
       */
      return IV;
    }
  }

  return nullptr;
}

InductionVariable * InductionVariableManager::getLoopGoverningInductionVariable (LoopStructure &LS) const {

  /*
   * Check if the loop has the governing IV.
   */
  if (loopToGoverningIVAttrMap.find(&LS) == loopToGoverningIVAttrMap.end()) {
    // errs() << "---623\n";
    return nullptr;
  }

  /*
   * Fetch the governing IV.
   */
  auto attribution = loopToGoverningIVAttrMap.at(&LS);

  return &attribution->getInductionVariable();
}

LoopGoverningIVAttribution * InductionVariableManager::getLoopGoverningIVAttribution (LoopStructure &LS) const {
  if (loopToGoverningIVAttrMap.find(&LS) == loopToGoverningIVAttrMap.end()) {
    return nullptr;
  }

  return loopToGoverningIVAttrMap.at(&LS);
}
