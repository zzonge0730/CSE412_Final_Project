#include "Hot.h"

//----------Instructions------
uint64_t Hot::getStaticInstructions (Instruction *i) const {
  return 1;
}

uint64_t Hot::getInvocations (Instruction *i) const {
  auto bb = i->getParent();

  auto inv = this->getInvocations(bb);

  /*
   * If the instruction is not a call or invoke instruction, then the basic block invocation is the instruction invocation.
   */
  if (  (!isa<CallInst>(i)) && (!isa<InvokeInst>(i))  ){
    return inv;
  }

  /*
   * The instruction can invoke another function, which might terminate the program execution.
   * This would lead to a mismatch between the basic block invocations and the instruction one.
   *
   * To deal with this mismatch, we check the invocations of the callee: the callee invocations must be grather or equal the instruction invocations.
   */
  Function *callee = nullptr;
  if (auto callInst = dyn_cast<CallInst>(i)){
    callee = callInst->getCalledFunction();
  } else {
    auto callInst2 = cast<InvokeInst>(i);
    callee = callInst2->getCalledFunction();
  }
  if (  (callee == nullptr) || (callee->empty()) ){

    /*
     * If the callee is unknown or it isn't part of the program, then we cannot make any adjustment.
     */
    return inv;
  }

  /*
   * Adjust the invocation number.
   */
  auto calleeInv = this->getInvocations(callee);
  if (calleeInv < inv){
    inv = calleeInv;
  }
  assert(inv <= calleeInv);

  return inv;
}

uint64_t Hot::getTotalInstructions (Instruction *i) const {
  if (this->instructionTotalInstructions.find(i) == this->instructionTotalInstructions.end()){

    /*
     * This is not a call instruction.
     * Hence, self instructions is equal to total instructions.
     */
    return this->getInvocations(i);
  }

  /*
   * This is a call instruction.
   */
  return this->instructionTotalInstructions.at(i);
}
      
uint64_t Hot::getSelfInstructions (Instruction *i) const {
  return this->getInvocations(i);
}

bool Hot::hasBeenExecuted (Instruction *i) const {
  if (this->getInvocations(i) == 0){
    return false;
  }

  return true;
}

//--------BasicBlock-------
void Hot::setBasicBlockInvocations (BasicBlock *bb, uint64_t invocations){

  /*
   * Check if bb is the entry point of a function.
   */
  auto f = bb->getParent();
  auto& entryBB = f->getEntryBlock();
  if (&entryBB == bb){

    /*
     * Insert the number of invocations of a function.
     */
    this->functionInvocations[f] = invocations;
  }

  /*
   * Insert the number of invocations of the basic block bb.
   */
  this->bbInvocations[bb] = invocations;

  return ;
}
      
bool Hot::hasBeenExecuted (BasicBlock *bb) const {
  if (this->getInvocations(bb) == 0){
    return false;
  }

  return true;
}

uint64_t Hot::getInvocations (BasicBlock *bb) const {
  assert(bb != nullptr);

  auto inv = this->bbInvocations.at(bb);

  return inv;
}
      
uint64_t Hot::getSelfInstructions (BasicBlock *bb) const {
  auto invs = this->getInvocations(bb);

  return invs * this->getStaticInstructions(bb);
}

uint64_t Hot::getTotalInstructions (BasicBlock *bb) const {
  uint64_t t = 0;

  for (auto &inst: *bb){
    t += this->getTotalInstructions(&inst);
  }

  return t;
}
      
uint64_t Hot::getStaticInstructions (BasicBlock *bb) const {
  auto inv = this->getInvocations(bb);
  
  auto bbLength = std::distance(bb->begin(), bb->end());

  return inv * bbLength;
}

uint64_t Hot::getStaticInstructions (
  BasicBlock *bb, 
  std::function<bool (Instruction *i)> canIConsiderIt
  ) const {
  uint64_t t = 0;

  for (auto& i : *bb){
    if (!canIConsiderIt(&i)){
      continue ;
    }
    t++;
  }

  return t;
}

double Hot::getBranchFrequency (BasicBlock *sourceBB, BasicBlock *targetBB) const {
  auto &branchSuccessors = this->branchProbability.at(sourceBB);
  
  /*
   * Check if we have information about the branch.
   */
  if (branchSuccessors.find(targetBB) == branchSuccessors.end()){

    /* 
     * We do not have information about the branch.
     */
    return 0;
  }

  /*
   * We have information about the branch.
   *
   * Fetch the frequency.
   */
  auto f = branchSuccessors.at(targetBB);

  return f;
}
      
void Hot::setBranchFrequency (BasicBlock *src, BasicBlock *dst, double branchFrequency){
  auto &branchSuccessors = this->branchProbability[src];
  branchSuccessors[dst] = branchFrequency;

  return ;
}

//---------Function--------
uint64_t Hot::getStaticInstructions (Function *f) const {
  uint64_t t = 0;
  for (auto &bb : *f){
    auto bbLength = std::distance(bb.begin(), bb.end());
    //t += this->getStaticInstructions(&bb);
    t += bbLength;
  }

  return t;
}

uint64_t Hot::getStaticInstructions (
  Function *f,
  std::function<bool (Instruction *i)> canIConsiderIt
  ) const {
  uint64_t t = 0;

  for (auto& bb : *f){
    t += this->getStaticInstructions(&bb, canIConsiderIt);
  }

  return t;
}

uint64_t Hot::getSelfInstructions (Function *f) const {
  auto insts = this->functionSelfInstructions.at(f);

  return insts;
}
      
uint64_t Hot::getInvocations (Function *f) const {
  auto invs = this->functionInvocations.at(f);

  return invs;
}

void Hot::setFunctionTotalInstructions (Function *f, uint64_t totalInstructions) {
  this->functionTotalInstructions[f] = totalInstructions;
    
  return ;
}

bool Hot::isFunctionTotalInstructionsAvailable (Function &F) const {
  if (this->functionTotalInstructions.find(&F) == this->functionTotalInstructions.end()){
    return false;
  }
  return true;
}

uint64_t Hot::getTotalInstructions (Function *f) const {
  if (!this->isFunctionTotalInstructionsAvailable(*f)){
    return 0;
  }
  auto t = this->functionTotalInstructions.at(f);

  return t;
}

bool Hot::hasBeenExecuted (Function *f) const {
  if (this->getInvocations(f) == 0){
    return false;
  }

  return true;
}

double Hot::getDynamicTotalInstructionCoverage (Function *f) const {
  auto mInsts = this->getTotalInstructions();
  auto lInsts = this->getTotalInstructions(f);
  auto hotness = ((double)lInsts) / ((double)mInsts);

  return hotness;
}

//-----------Loop-------
uint64_t Hot::getStaticInstructions (LoopStructure *l) const {
  uint64_t t = 0;
  for (auto bb : l->getBasicBlocks()){
    t += this->getStaticInstructions(bb);
  }

  return t;
}

uint64_t Hot::getStaticInstructions (
  LoopStructure *l,
  std::function<bool (Instruction *i)> canIConsiderIt
  ) const {
  uint64_t t = 0;
  for (auto bb : l->getBasicBlocks()){
    t += this->getStaticInstructions(bb, canIConsiderIt);
  }

  return t;
}

uint64_t Hot::getInvocations (LoopStructure *l) const {

  /*
   * Fetch the pre-header.
   */
  auto preH = l->getPreHeader();

  /*
   * Fetch the number of invocations of the preheader. 
   * This is the same as the invocations of the loop.
   */
  auto preHInvocations = this->getInvocations(preH);

  return preHInvocations;
}

uint64_t Hot::getSelfInstructions (LoopStructure *loop) const {
  uint64_t insts = 0;

  for (auto bb : loop->getBasicBlocks()){
    insts += this->getStaticInstructions(bb);
  }

  return insts;
}

uint64_t Hot::getTotalInstructions (LoopStructure *loop) const {
  uint64_t insts = 0;

  for (auto bb : loop->getBasicBlocks()){
    insts += this->getTotalInstructions(bb);
  }

  return insts;
}

double Hot::getDynamicTotalInstructionCoverage (LoopStructure *loop) const {
  auto mInsts = this->getTotalInstructions();
  auto lInsts = this->getTotalInstructions(loop);
  auto hotness = ((double)lInsts) / ((double)mInsts);

  return hotness;
}
      
double Hot::getAverageLoopIterationsPerInvocation (LoopStructure *loop) const {

  /*
   * Fetch the number of times the loop is invoked.
   */
  auto loopInvocations = this->getInvocations(loop);
  if (loopInvocations == 0){
    return 0;
  }

  /*
   * Fetch the total number of iterations executed.
   */
  auto loopIterations = this->getIterations(loop);

  /*
   * Compute the stats.
   */
  auto stats = ((double)loopIterations) / ((double)loopInvocations);

  return stats;
}

double Hot::getAverageTotalInstructionsPerInvocation (LoopStructure *loop) const {

  /*
   * Fetch the number of times the loop is invoked.
   */
  auto loopInvocations = this->getInvocations(loop);
  if (loopInvocations == 0){
    return 0;
  }

  /*
   * Compute the stats.
   */
  auto loopTotal = this->getTotalInstructions(loop);
  auto averageInstsPerInvocation = ((double)loopTotal) / ((double)loopInvocations);

  return averageInstsPerInvocation;
}

double Hot::getAverageTotalInstructionsPerIteration (LoopStructure *loop) const {

  /*
   * Fetch the average number of instructions per invocation.
   */
  auto instsPerInvocation = this->getAverageTotalInstructionsPerInvocation(loop);
  if (instsPerInvocation == 0){
    return 0;
  }

  /*
   * Fetch the average number of iterations per invocation.
   */
  auto itersPerInvocation = this->getAverageLoopIterationsPerInvocation(loop);

  /*
   * Compute the average instructions per iteration.
   */
  auto instsPerIteration = instsPerInvocation / itersPerInvocation;

  return instsPerIteration;
}

uint64_t Hot::getIterations (LoopStructure *l) const {

  /*
   * Fetch the header.
   */
  auto loopHeader = l->getHeader();

  /*
   * Fetch the invocations of the header and its successors within the loop.
   */
  auto headerInvocations = this->getInvocations(loopHeader);
  uint64_t succInvocations = 0;
  //for (auto succBB : successors(loopHeader)){
  for (succ_iterator SI = succ_begin(loopHeader); SI != succ_end(loopHeader); ++SI) {
    if (!l->isIncluded(*SI)){
      continue ;
    }
    succInvocations += this->getInvocations(*SI);
  }

  /*
   * Compute the total number of iterations executed.
   */
  uint64_t loopIterations = 0;
  if (headerInvocations == succInvocations){
    loopIterations = headerInvocations;

  } else {
    loopIterations = headerInvocations - 1;
  }

  return loopIterations;
}

//----Module-----
uint64_t Hot::getSelfInstructions (void) const {
  return this->moduleNumberOfInstructionsExecuted;
}
      
bool Hot::hasBeenExecuted (void) const {
  if (this->getSelfInstructions() > 0){
    return true;
  }

  return false;
}
      
bool Hot::getInvocations (void) const {
  if (this->hasBeenExecuted()){
    return 1;
  }

  return 0;
}

uint64_t Hot::getTotalInstructions (void) const {
  return this->getSelfInstructions();
}

//----------SCC----
uint64_t Hot::getSelfInstructions (SCC *scc) const {
  uint64_t t=0;

  auto accumulateF = [this, &t] (Instruction *i) -> bool {
    t += this->getSelfInstructions(i);
    return false;
  };
  scc->iterateOverInstructions(accumulateF);

  return t;
}

uint64_t Hot::getTotalInstructions (SCC *scc) const {
  uint64_t t=0;

  auto accumulateF = [this, &t] (Instruction *i) -> bool {
    t += this->getTotalInstructions(i);
    return false;
  };
  scc->iterateOverInstructions(accumulateF);

  return t;
}

//-----Hot------
Hot::Hot ()
  : moduleNumberOfInstructionsExecuted{0}
  {
  return ;
}
      
bool Hot::isAvailable (void) const {
  return this->hasBeenExecuted();
}
   
void Hot::computeProgramInvocations (Module &M){

  /*
   * Compute the total number of instructions executed.
   */
  for (auto pairs : this->bbInvocations){

    /*
     * Fetch the current basic block
     */
    auto bb = pairs.first;
    auto bbInv = pairs.second;

    /*
     * Fetch the number of invocations of the basic block and its length.
     */
    auto totalBBInsts = this->getInvocations(bb);
    auto bbLength = std::distance(bb->begin(), bb->end());

    /*
     * Update the module counter
     */
    this->moduleNumberOfInstructionsExecuted += (totalBBInsts * bbLength);
  }

  /*
   * Compute the total number of instructions executed by each function.
   * Each call instructions is considered one; so callee instructions are not considered.
   */
  for (auto pairs : this->functionInvocations){

    /*
     * Fetch the function.
     */
    auto f = pairs.first;
    
    /*
     * Consider all basic blocks.
     */
    uint64_t c = 0;
    for (auto& bb : *f){
      c += this->getStaticInstructions(&bb);
    }
    this->functionSelfInstructions[f] = c;
  }

  /*
   * Compute the total instructions.
   */
  this->computeTotalInstructions(M);

  return ;
}

void Hot::computeTotalInstructions (Module &moduleToAnalyze){

  /*
   * Analyze every function included in M and compute their total instructions executed.
   *
   * To do so, we iterate over all functions of M.
   */
  for (Function & F : moduleToAnalyze){

    /*
     * Fetch the next function defined within the module.
     */
    if (F.empty()){
      continue ;
    }

    /*
     * Compute the total instructions of F.
     */
    std::unordered_map<Function *, bool> evaluationStack;
    this->computeTotalInstructions(F, evaluationStack);
  }
   
  /*
   * Analyze every call instruction.
   *
   * To do so, we iterate over all functions and check all of their callers.
   */
  for (Function & F : moduleToAnalyze){

    /*
     * Fetch the next function defined within the module.
     */
    if (F.empty()){
      continue ;
    }

    /*
     * Check if the function has been executed at all.
     */
    if (!this->hasBeenExecuted(&F)){
      continue ;
    }

    /*
     * Fetch the total instructions executed by this function.
     */
    assert(this->isFunctionTotalInstructionsAvailable(F));
    uint64_t totalInstsOfF = this->getTotalInstructions(&F);
    uint64_t totalInstsOfFPerInvocation = totalInstsOfF / this->getInvocations(&F);
    uint64_t totalInstsOfFLeftover = totalInstsOfF;

    /*
     * Fetch all callers of the function.
     */
    Instruction *callerOfF = nullptr;
    for (User * useOfF : (F.uses())){

      /*
       * Fetch the next call instruction to F.
       */
      //auto userOfF = useOfF.getUser();
      if (!isa<Instruction>(*useOfF)){
        continue ;
      }
      callerOfF = cast<Instruction>(useOfF);

      /*
       * The instruction "userOfF" invokes F.
       *
       * Check if the caller has been executed at all.
       */
      if (!this->hasBeenExecuted(callerOfF)){
        continue ;
      }

      /*
       * Compute the fraction of the callee that is associated to the specific call instruction we are analyzying.
       * To this end, we make the assumption that the distribution of total instructions of the callee is uniform among its invocations.
       *
       * The total number of instructions executed by this call is the call itself plus the total instructions executed by the callee divided by its invocations due to this call.
       */
      auto instructionInvocations = this->getInvocations(callerOfF);
      auto calleeTotalInstsFraction = totalInstsOfFPerInvocation * instructionInvocations;
      this->instructionTotalInstructions[callerOfF] = calleeTotalInstsFraction + 1;

      /*
       * Remove the current fraction used of the callee.
       * This is needed to make sure the whole set of instructions of the callee will be distributed among the callers.
       */
      totalInstsOfFLeftover -= calleeTotalInstsFraction;
    }

    /*
     * Check if all the total instructions have been distributed among the callers.
     */
    if (  true
          && (totalInstsOfFLeftover > 0)
          && (callerOfF != nullptr) /* This handle the case where a function has not known callers  */
      ){

      /*
       * There is some leftover to still distribute.
       * This happen when the total instructions of the callee is not a multiple of the number of the callers.
       *
       * Our heuristic is to give the leftover to the last caller (this is completely arbitrary).
       */
      this->instructionTotalInstructions[callerOfF] += totalInstsOfFLeftover;
    }
  }

  return ;
}

void Hot::computeTotalInstructions (
  Function &F, 
  std::unordered_map<Function *, bool> &evaluationStack
  ){

  /*
   * Keep track we are evaluating the input function.
   */
  evaluationStack[&F] = true;

  /* 
   * Check if the callee has been executed at all.
   */
  if (!this->hasBeenExecuted(&F)){
    this->setFunctionTotalInstructions(&F, 0);
    return ;
  }

  /*
   * Iterate over all instructions.
   */
  double t = 0;
  for (auto& BB : F) {
      for (auto& inst : BB) {
        /*
        * Check if the instruction has been executed at all.
        */
        if (!this->hasBeenExecuted(&inst)){
        continue ;
        }

        /*
        * Fetch the number of invocations of this instruction.
        */
        auto instructionInvocations = this->getInvocations(&inst);

        /*
        * Count the instruction.
        *
        * Notice that this needs to be done even for call instructions.
        */
        t += instructionInvocations;

        /*
        * Check if the instruction can invoke another function.
        */
        if (!isa<CallInst>(&inst)){
        continue ;
        }
        auto callInst = dyn_cast<CallInst>(&inst);

        /*
        * The instruction invokes another function.
        * Hence, we need to count the instructions executed by the callee.
        *
        * Fetch the callee.
        */
        auto callee = callInst->getCalledFunction();

        /*
        * Check if the callee is known and we can inspect its body.
        */
        if (  false
            || (callee == nullptr)
            || (callee->empty())
        ){
        continue ;
        }
        assert(this->hasBeenExecuted(callee));
        assert(this->getInvocations(callee) >= this->getInvocations(callInst));

        /*
        * The callee is known and we can inspect its body.
        *
        * Check if we have already analyzed the callee.
        */
        uint64_t calleeTotalInsts = 0;
        if (!this->isFunctionTotalInstructionsAvailable(*callee)){

        /*
        * We have not analyzed the callee.
        *
        * Check if we are in the process of evaluating it.
        */
        if (evaluationStack[callee]){

            /*
            * We are in the middle of evaluating the callee.
            * We have to break this evaluation cycle to converge. 
            * For now, we consider the cost of the callee to be 1.
            */
            calleeTotalInsts = 1;

        } else {

            /*
            * We are not in the middle of the process of evaluating the callee.
            *
            * It is time to evaluate it.
            */
            this->computeTotalInstructions(*callee, evaluationStack);
            assert(this->isFunctionTotalInstructionsAvailable(*callee));

            /*
            * Now that the callee has been evaluated, we can fetch that information.
            */
            calleeTotalInsts = this->getTotalInstructions(callee);
        }

        } else {

        /*
        * The callee has been evalauted already.
        */
        calleeTotalInsts = this->getTotalInstructions(callee);
        }
        assert(calleeTotalInsts > 0);

        /*
        * Compute the fraction of the callee that is associated to the specific call instruction we are analyzying.
        * To this end, we make the assumption that the distribution of total instructions per callee invocation is uniform among its dynamic callers.
        */
        auto calleeTotalInstsPerInvocation = ((double)calleeTotalInsts) / ((double)this->getInvocations(callee));

        /*
        * Add the fraction of the total of the callee associated to the current instruction.
        */
        t += (calleeTotalInstsPerInvocation * ((double)instructionInvocations));
        }
  }


  /*
   * Set the total counter.
   */
  this->setFunctionTotalInstructions(&F, (uint64_t)t);

  return ;
}