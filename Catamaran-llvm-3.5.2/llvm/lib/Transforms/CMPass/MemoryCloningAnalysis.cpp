#include "MemoryCloningAnalysis.h"
#include "Utils.h"



MemoryCloningAnalysis::MemoryCloningAnalysis(LoopStructure * loopS, DominatorSummary& ds, PDG * loopPDG) {
    assert(loopS != nullptr);
    assert(loopPDG != nullptr);
    //collect allocations at the top of the function
    //the assumption is that all AllocaInst are stated before any other instructions
    std::unordered_set<AllocaInst *> allocations;
    Function * function = loopS->getFunction();
    auto& entryBlock = function->getEntryBlock();

    for (auto& inst : entryBlock) {
        //only handle stack objects
        auto alloca = dyn_cast<AllocaInst>(&inst);
        if (alloca == nullptr) {
            continue;
        }
        allocations.insert(alloca);
    }

    //need to check whether we can determine at compile time the size of the stack objects
    //fetch the data layout
    // auto& dataLayout = function->getParent()->getDataLayout();

    //const DataLayout tmpDL(StringRef(dataLayout));

    const DataLayout tmp(function->getParent());

    //check each stack object's size
    for (auto allocation : allocations) {
        //check if we know the size in bits of the stack object
        // auto sizeInBitsOptional = allocation->getAllocationSizeInBits(dataLayout);
        auto sizeInBitsOptional = allocation->getAllocationSizeInBits(tmp);
        if (!sizeInBitsOptional.hasValue()) {
            continue;
        }

        //fetch the size of the stack object
        auto sizeInBits = sizeInBitsOptional.getValue();

        //check if the stack object is clonable
        //auto location = std::move(make_unique<ClonableMemoryLocation>(allocation, sizeInBits, loopS, ds, loopPDG));
        auto location = new ClonableMemoryLocation(allocation, sizeInBits, loopS, ds, loopPDG);
        if (!location->isClonableLocation()) {
            continue;
        }
        //the stack object is clonable
        this->clonableMemoryLocations.insert(std::move(location));
    }

}

std::unordered_set<ClonableMemoryLocation *> MemoryCloningAnalysis::getClonableMemoryLocations (void) const {
    std::unordered_set<ClonableMemoryLocation *> locations{};
    for (auto &location : this->clonableMemoryLocations) {
        locations.insert(location);
    }
    return locations;
}

const std::unordered_set<ClonableMemoryLocation *> MemoryCloningAnalysis::getClonableMemoryLocationsFor (Instruction *I) const {
  std::unordered_set<ClonableMemoryLocation *> locs = {};
  /*
   * Determine if it is worth mapping from instructions to locations
   */
  for (auto &location : this->clonableMemoryLocations) {
    if (location->getAllocation() == I) {
      locs.insert(location);
    }
    if (location->isInstructionCastOrGEPOfLocation(I)) {
      locs.insert(location);
    }
    if (location->isInstructionLoadingLocation(I)) {
      locs.insert(location);
    }
    if (location->isInstructionStoringLocation(I)) {
      locs.insert(location);
    }
    if (auto callInst = dyn_cast<CallInst>(I)){
      if (callInst->isLifetimeStartOrEnd()){
        auto ptr = callInst->getArgOperand(1);
        auto loc = location;
        if (loc->mustAliasMemoryLocationWithinObject(ptr)){
          locs.insert(location);
        }
      }
    }
  }

  return locs;
}

std::unordered_set<Instruction *> ClonableMemoryLocation::getInstructionsUsingLocationOutsideLoop (void) const {
  std::unordered_set<Instruction *> instructions;
  for (auto I : this->castsAndGEPs) {
    if (loopS->isIncluded(I)) continue;
    instructions.insert(I);
  }
  for (auto I : this->storingInstructions) {
    if (loopS->isIncluded(I)) continue;
    instructions.insert(I);
  }
  for (auto I : this->loadInstructions) {
    if (loopS->isIncluded(I)) continue;
    instructions.insert(I);
  }
  for (auto I : this->nonStoringInstructions) {
    if (loopS->isIncluded(I)) continue;
    instructions.insert(I);
  }

  return instructions;
}
      
bool ClonableMemoryLocation::mustAliasMemoryLocationWithinObject (Value *ptr) const {

  /*
   * Same value.
   */
  if (ptr == this->allocation){
    return true;
  }

  /*
   * Aliases.
   */
  for (auto aliasPtr : this->castsAndGEPs){
    if (aliasPtr == ptr){
      return true;
    }
  }

  return false;
}

std::unordered_set<Instruction *> ClonableMemoryLocation::getLoopInstructionsUsingLocation (void) const {
  std::unordered_set<Instruction *> instructions;
  for (auto I : this->castsAndGEPs) {
    if (!loopS->isIncluded(I)) continue;
    instructions.insert(I);
  }
  for (auto I : this->storingInstructions) {
    if (!loopS->isIncluded(I)) continue;
    instructions.insert(I);
  }
  for (auto I : this->loadInstructions) {
    if (!loopS->isIncluded(I)) continue;
    instructions.insert(I);
  }
  for (auto I : this->nonStoringInstructions) {
    if (!loopS->isIncluded(I)) continue;
    instructions.insert(I);
  }
  return instructions;
}

ClonableMemoryLocation::ClonableMemoryLocation (
  AllocaInst *allocation,
  uint64_t sizeInBits,
  LoopStructure *loop,
  DominatorSummary &DS,
  PDG *ldg
) : allocation{allocation}
    ,sizeInBits{sizeInBits}
    ,loopS{loop}
    ,isClonable{false}
    ,isScopeWithinLoop{false}
{

  /*
   * Check if the current stack object's scope is the loop.
   */
  this->setObjectScope(allocation, loop, DS);

  /*
   * Only consider struct and integer types for objects that has scope outside the loop.
   */
  this->allocatedType = allocation->getAllocatedType();
  if (  (!this->isScopeWithinLoop)
        && (!allocatedType->isStructTy())
        && (!allocatedType->isIntegerTy()) 
     ){
    return;
  }

  /*
   * Identify the instructions that access the stack location.
   */
  if (!this->identifyStoresAndOtherUsers(loop, DS)) {
    return;
  }

  /*
   * For stack objects that have scope not fully contained within the target loop, we need to check if the stack object is completely initialized for every iteration.
   * In other words, 
   * 1) there is no RAW loop-carried data dependences that involve this stack object and
   * 2) there is no RAW from outside the loop to inside it.
   */
  this->identifyInitialStoringInstructions(loop, DS);
  if (!this->isScopeWithinLoop){
    if (  (!this->areOverrideSetsFullyCoveringTheAllocationSpace())
          || (this->isThereRAWThroughMemoryFromOutsideLoop(loop, allocation, ldg))
      ){
      return;
    }
  }

  /*
   * The location is clonable.
   */
  this->isClonable = true;

  return;
}

void ClonableMemoryLocation::setObjectScope (
  AllocaInst *allocation,
  LoopStructure *loop,
  DominatorSummary &ds
  ) {

  /*
   * Look for lifetime calls in the loop.
   */
  for (auto inst : loop->getInstructions()){

    /*
     * Check if the current instruction is a call to lifetime intrinsics.
     */
    auto call = dyn_cast<CallInst>(inst);
    if (call == nullptr){
      continue ;
    }
    if (!call->isLifetimeStartOrEnd()){
      continue;
    }

    /*
     * The current instruction is a call to lifetime intrinsics.
     *
     * Check if it is about the stack object we care.
     */
    auto objectUsed = call->getArgOperand(1);
    if (auto castInst = dyn_cast<CastInst>(objectUsed)){
      objectUsed = castInst->getOperand(0);
    }
    if (objectUsed == allocation){

      /*
       * We found a lifetime call about our stack object.
       */
      this->isScopeWithinLoop = true;
      return ;
    }
  }

  return ;
}

AllocaInst * ClonableMemoryLocation::getAllocation (void) const {
  return this->allocation;
}

bool ClonableMemoryLocation::isClonableLocation (void) const {
  return this->isClonable;
}

bool ClonableMemoryLocation::isInstructionCastOrGEPOfLocation (Instruction *I) const {
  if (castsAndGEPs.find(I) != castsAndGEPs.end()) return true;
  return false;
}

bool ClonableMemoryLocation::isInstructionStoringLocation (Instruction *I) const {
  if (storingInstructions.find(I) != storingInstructions.end()) return true;
  return false;
}

bool ClonableMemoryLocation::isInstructionLoadingLocation (Instruction *I) const {
  if (nonStoringInstructions.find(I) != nonStoringInstructions.end()) return true;
  if (loadInstructions.find(I) != loadInstructions.end()) return true;
  return false;
}

bool ClonableMemoryLocation::isMemCpyInstrinsicCall (CallInst *call) {
  auto calledFn = call->getCalledFunction();
  if (!calledFn || !calledFn->hasName()) return false;
  auto name = calledFn->getName();
  std::string nameString = std::string(name);
  return nameString.find("llvm.memcpy") != std::string::npos;
}

bool ClonableMemoryLocation::identifyStoresAndOtherUsers (LoopStructure *loop, DominatorSummary &DS) {

  /*
   * Determine all uses of the stack location.
   * Ensure they only exist within the loop provided.
   */
  std::queue<Instruction *> allocationUses{};
  allocationUses.push(this->allocation);
  while (!allocationUses.empty()) {

    /*
     * Fetch the current instruction that uses the stack location.
     */
    auto I = allocationUses.front();
    allocationUses.pop();

    /*
     * Check all users of the current instruction.
     */
    for (auto user : I->users()) {

      /*
       * Find storing and non-storing instructions
       */
      if (auto cast = dyn_cast<CastInst>(user)) {

        /*
         * NOTE: Continue without checking if the cast is in the loop
         * We still check the cast's uses of course
         */
        allocationUses.push(cast);
        this->castsAndGEPs.insert(cast);
        continue;
      }
      if (auto gep = dyn_cast<GetElementPtrInst>(user)) {

        /*
         * NOTE: Continue without checking if the gep is in the loop
         * We still check the GEP's uses of course
         */
        allocationUses.push(gep);
        this->castsAndGEPs.insert(gep);
        continue;
      } 
      if (auto store = dyn_cast<StoreInst>(user)) {

        /*
         * As straightforward as it gets
         */
        this->storingInstructions.insert(store);

      } else if (auto load = dyn_cast<LoadInst>(user)){

        /*
         * This instruction reads from the stack object.
         */
        this->loadInstructions.insert(load);

      } else if (auto call = dyn_cast<CallInst>(user)) {

        /*
         * Ignore lifetime instructions
         * 
         */
        if (call->isLifetimeStartOrEnd()) {
          continue;
        }

        /*
         * We consider llvm.memcpy as a storing instruction if the use is the dest (first operand) 
         */
        auto isMemCpy = ClonableMemoryLocation::isMemCpyInstrinsicCall(call);
        auto isUseTheDestinationOp = (call->getNumArgOperands() == 4) && (call->getArgOperand(0) == I);
        auto isUseTheSourceOp = (call->getNumArgOperands() == 4) && (call->getArgOperand(1) == I);
        if (isMemCpy && isUseTheDestinationOp) {
          storingInstructions.insert(call);
        } else if (isMemCpy && isUseTheSourceOp) {
          loadInstructions.insert(call);
        } else {
          this->nonStoringInstructions.insert(call);
        }

      } else if (auto inst = dyn_cast<Instruction>(user)) {

        this->nonStoringInstructions.insert(inst);

      } else {

        /*
         * All users must be instructions
         */
        return false;
      }

      /*
       * All users must be within the loop or dominate the loop
       */
      auto inst = cast<Instruction>(user);
      if (inst == nullptr) continue;
      // if (!loop->isIncluded(inst)) { 
        // inst->print(errs() << "Outside loop!: "); 
        // errs() << "Outside loop!: " << *inst << "\n";
        // errs() << "\n"; 
      // }
      if (!loop->isIncluded(inst)) {
        auto block = inst->getParent();
        auto header = loop->getHeader();
        // if (block != nullptr) errs() << "block is " << *block << "...\n";
        // if (header != nullptr) errs() << "header is " << *header << " null...\n";
        if (!DS.DT.dominates(block, header)) {
          return false;
        }
      }

      /*
       * No InvokeInst can receive the allocation in any form
       */
      if (auto invokeInst = dyn_cast<InvokeInst>(inst)) {
        return false;
      }
    }
  }

  return true;
}

bool ClonableMemoryLocation::isThereRAWThroughMemoryFromOutsideLoop (
  LoopStructure *loop, 
  AllocaInst *al, 
  PDG *ldg, 
  std::unordered_set<Instruction *> insts
  ) const {

  for (auto inst : insts){

    /*
     * Check if the inst is within the loop.
     */
    if (!loop->isIncluded(inst)){
      continue ;
    }

    /*
     * The inst is within the loop.
     *
     * Check if there is a memory dependence from an instruction outside the loop to this inst.
     */
    auto functor = [loop](Value *fromValue, DGEdge<Value> *d) -> bool{

      /*
       * Check if the source of the dependence is with an instruction.
       */
      auto inst = dyn_cast<Instruction>(fromValue);
      if (inst == nullptr){
        return false;
      }

      /*
       * The source of the dependence is with an instruction.
       *
       * Check if the source of the dependence is outside the loop.
       */
      if (loop->isIncluded(inst)){

        /*
         * The source is within the loop.
         */
        return false;
      }

      /*
       * The source of the dependence is with an instruction that is outside the loop.
       *
       * Check if the dependence is a RAW.
       */
      if (!d->isRAWDependence()){
        return false;
      }

      /*
       * We found a memory RAW from an instruction outside the loop to an instruction inside the loop.
       *
       * We can stop the iteration.
       */
      return true;
    };
    if (ldg->iteratorOverDependencesFrom(inst, false, true, false, false, functor)){

      /*
       * We found a memory RAW from a store inside the loop to a load after the loop.
       */
      return true;
    }
  }

  return false;
}
        
bool ClonableMemoryLocation::isThereRAWThroughMemoryFromOutsideLoop (LoopStructure *loop, AllocaInst *al, PDG *ldg) const {

  /*
   * Check every read of the stack object.
   */
  if (  this->isThereRAWThroughMemoryFromOutsideLoop(loop, al, ldg, this->storingInstructions)
        || this->isThereRAWThroughMemoryFromOutsideLoop(loop, al, ldg, this->nonStoringInstructions)
     ){
    return true;
  }


  return false;
}

bool ClonableMemoryLocation::identifyInitialStoringInstructions (LoopStructure * loop, DominatorSummary &DS) {

  /*
   * Group non-storing instructions by sets of dominating basic blocks
   * for which any two sets do not dominate each other
   */
  std::unordered_set<Instruction *> instructionsNeedingCoverage;
  for (auto nonStoringInstruction : this->nonStoringInstructions) {
    instructionsNeedingCoverage.insert(nonStoringInstruction);
  }
  for (auto loadInstruction : this->loadInstructions) {
    instructionsNeedingCoverage.insert(loadInstruction);
  }
  for (auto instToCover : instructionsNeedingCoverage) {

    /*
     * Fetch the basic block of the current instruction.
     */
    auto instBlock = instToCover->getParent();

    // nonStoringInstruction->print(errs() << "Grouping non storing instruction: "); errs() << "\n";

    auto belongsToExistingSet = false;
    for (auto &overrideSet : this->overrideSets) {
      auto overrideSetDominatingBlock = overrideSet->dominatingBlockOfNonStoringInsts;
      if (DS.DT.dominates(overrideSetDominatingBlock, instBlock)) {
        overrideSet->subsequentNonStoringInstructions.insert(instToCover);
        belongsToExistingSet = true;

        // overrideSet->dominatingBlockOfNonStoringInsts->printAsOperand(
        //   errs() << "\tIs dominated by override set: "
        // );

        break;
      }
    }

    /*
     * If the instruction hasn't been added to a set, create a new set
     */
    if (belongsToExistingSet) continue;

    // errs() << "\tIs not dominated by current override set\n";
    // nonStoringBlock->printAsOperand(errs() << "\tCreating set: "); errs() << "\n";

    //auto overrideSet = std::move(make_unique<OverrideSet>());
    auto overrideSet = new OverrideSet();
    overrideSet->dominatingBlockOfNonStoringInsts = instBlock;
    overrideSet->subsequentNonStoringInstructions.insert(instToCover);
    //this->overrideSets.insert(std::move(overrideSet));
    this->overrideSets.insert(std::move(overrideSet));
  }

  /*
   * Find which storing instructions belong to which override sets
   */
  for (auto storingInstruction : storingInstructions) {
    /*
     * Only instructions in the loop can possibly override this memory every iteration
     */
    if (!loop->isIncluded(storingInstruction)) {
      continue;
    }

    auto storingBlock = storingInstruction->getParent();

    for (auto &overrideSet : overrideSets) {
      auto overrideSetDominatingBlock = overrideSet->dominatingBlockOfNonStoringInsts;
      if (DS.DT.dominates(storingBlock, overrideSetDominatingBlock)) {
        overrideSet->initialStoringInstructions.insert(storingInstruction);

        // overrideSet->dominatingBlockOfNonStoringInsts->printAsOperand(
        //   errs() << "Belongs to override set: "
        // );
        // storingInstruction->print(errs() << "\t"); errs() << "\n";

      }
    }
  }

  /*
   * Ensure all override sets have at least one storing instruction
   */
  for (auto &overrideSet : overrideSets) {
    if (overrideSet->initialStoringInstructions.size() == 0) {

      // overrideSet->dominatingBlockOfNonStoringInsts->printAsOperand(
      //   errs() << "Override set has no initial storing instructions: "
      // );
      // errs() << "\n";

      return false;
    }
  }

  return true;
}

bool ClonableMemoryLocation::areOverrideSetsFullyCoveringTheAllocationSpace (void) const {
  if (overrideSets.size() == 0) return false;

  for (auto &overrideSet : overrideSets) {
    if (!this->isOverrideSetFullyCoveringTheAllocationSpace(overrideSet)) {
      return false;
    }
  }

  return true;
}

bool ClonableMemoryLocation::isOverrideSetFullyCoveringTheAllocationSpace (
  OverrideSet *overrideSet
) const {
  std::unordered_set<int64_t> structElementsStoredTo;
  for (auto storingInstruction : overrideSet->initialStoringInstructions) {
    if (auto store = dyn_cast<StoreInst>(storingInstruction)) {

      /*
       * Fetch the pointer of the memory location modified by @store.
       */
      auto pointerOperand = store->getPointerOperand();

      /*
       * If the pointer is the returned value of an alloca, then @store is initializing the whole memory object.
       */
      if (dyn_cast<AllocaInst>(pointerOperand)) {

        /*
         * The allocation is stored directly to and is completely overriden
         */
        return true;
      } 

      if (auto gep = dyn_cast<GetElementPtrInst>(pointerOperand)) {

        // gep->print(errs() << "Examining GEP for coverage: "); errs() << "\n";

        /*
         * Only supporting struct GEP accesses that match the allocation's struct type
         */
        // auto sourceElementTy = gep->getSourceElementType();
        auto sourceElementTy = gep->getType();
        if (!sourceElementTy->isStructTy()) continue;
        if (sourceElementTy != this->allocatedType) continue;

        /*
         * Ensure the struct itself is accessed (base idx 0)
         * Track element idx stored to
         */
        auto baseIdxIter = gep->idx_begin();
        auto elementIdxIter = baseIdxIter + 1;
        auto baseIdxValue = dyn_cast<ConstantInt>(baseIdxIter->get());
        auto elementIdxValue = dyn_cast<ConstantInt>(elementIdxIter->get());
        if (!baseIdxValue || !elementIdxValue) continue;
        if (baseIdxValue->getValue().getSExtValue() != 0) continue;

        auto elementIdx = elementIdxValue->getValue().getSExtValue();
        structElementsStoredTo.insert(elementIdx);

        // errs() << "\tElement: " << elementIdx << "\n";

      }

    } else if (auto call = dyn_cast<CallInst>(storingInstruction)) {
      assert(ClonableMemoryLocation::isMemCpyInstrinsicCall(call));

      // call->print(errs() << "Examining llvm.memcpy call: "); errs() << "\n";

      /*
       * Naively require that the whole allocation is written to
       */
      auto bytesStoredValue = call->getOperand(2);
      auto bytesStoredConst = dyn_cast<ConstantInt>(bytesStoredValue);
      if (!bytesStoredConst) continue;

      auto bitsStored = bytesStoredConst->getValue().getSExtValue() * 8;
      if (this->sizeInBits == bitsStored) return true;
    }
  }

  if (this->allocation->getAllocatedType()->isStructTy()) {

    // errs() << "Number of elements covered: " << structElementsStoredTo.size()
      // << " versus struct element number: " << this->allocatedType->getStructNumElements() << "\n";

    if (structElementsStoredTo.size() == this->allocatedType->getStructNumElements()) return true;
  }

  return false;
}
