#include "LoopCarriedDependencies.h"

#include <queue>
#include <unordered_set>

void LoopCarriedDependencies::setLoopCarriedDependencies (
  const LoopSummary &LIS,
  const DominatorSummary &DS,
  PDG &dgForLoops
) {

  for (auto edge : dgForLoops.getEdges()) {
    assert(!edge->isLoopCarriedDependence() && "Flag was already set");
  }

  for (auto edge : dgForLoops.getEdges()) {
    auto loop = getLoopOfLCD(LIS, DS, edge);
    if (!loop) continue;
    edge->setLoopCarried(true);
  }
}

LoopStructure * LoopCarriedDependencies::getLoopOfLCD(const LoopSummary &LIS, const DominatorSummary &DS, DGEdge<Value> *edge) {
  //fetch the loop
  auto topLoop = LIS.getLoopNestingTreeRoot();
  assert(topLoop != nullptr);
  auto topLoopHeader = topLoop->getHeader();
  auto topLoopHeaderBranch = topLoopHeader->getTerminator();
  
  //fetch the instructions involved in the dependence
  auto producer = edge->getOutgoingT();
  auto consumer = edge->getIncomingT();

  //only dependences between instruction can be loop-carried
  if (!isa<Instruction>(producer)) {
    return nullptr ;
  }
  if (!isa<Instruction>(consumer)) {
    return nullptr ;
  }

  // fetch the instructions involved in the dependence
  auto producerI = dyn_cast<Instruction>(producer);
  auto consumerI = dyn_cast<Instruction>(consumer);

  //fetch the innermost loops that contain the two instructions
  auto producerLoop = LIS.getLoop(*producerI);
  auto consumerLoop = LIS.getLoop(*consumerI);

  //if either of the instruction does not belong a loop, then the dependence cannot be loop-carried
  if (!producerLoop || !consumerLoop) {
    return nullptr ;
  }

  if (producerI == consumerI || !DS.DT.dominates(producerI, consumerI)) {
    auto producerLevel = producerLoop->getNestingLevel();
    auto consumerLevel = consumerLoop->getNestingLevel();
    auto isMemoryDependenceThusCanCrossLoops = edge->isMemoryDependence();
    auto isControlDependence = edge->isControlDependence();

    /*
     * If a memory-less data dependence producer cannot reach the header of the loop without reaching the consumer, then this is a false positive match.
     */
    // check if the dependence is data and via variable
    if (!edge->isMemoryDependence() && edge->isDataDependence()) {
      // the data dependence is variable based

      auto producerB = producerI->getParent();
      auto consumerB = consumerI->getParent();
      bool mustProducerReachConsumerBeforeHeader = !canBasicBlockReachHeaderBeforeOther(*consumerLoop, producerB, consumerB);

      if (mustProducerReachConsumerBeforeHeader) {
        return nullptr ;
      }

      if (DS.DT.dominates(consumerI, producerI)
      && DS.DT.dominates(topLoopHeaderBranch, consumerI)) {
        if (auto phiConsumer = dyn_cast<PHINode>(consumerI)) {
          return nullptr;
        }
      }
    }
    return consumerLoop;
  }

  return nullptr ;
}

std::set<DGEdge<Value> *> LoopCarriedDependencies::getLoopCarriedDependenciesForLoop (const LoopStructure &LS, const LoopSummary &LIS, PDG &LoopDG) {
  
  std::set<DGEdge<Value> *> LCEdges;
  for (auto edge : LoopDG.getEdges()) {
    if (!edge->isLoopCarriedDependence()) { 
      continue; 
    }

    auto consumer = edge->getIncomingT();
    auto consumerI = cast<Instruction>(consumer);
    auto consumerLoop = LIS.getLoop(*consumerI);
    if (consumerLoop != &LS) {
      continue;
    }

    LCEdges.insert(edge);
  }

  return LCEdges;
}

std::set<DGEdge<Value> *> LoopCarriedDependencies::getLoopCarriedDependenciesForLoop (const LoopStructure &LS, const LoopSummary &LIS, SCCDAG &sccdag) {

  std::set<DGEdge<Value> *> LCEdges;

  for (auto sccNode : sccdag.getNodes()) {
    auto scc = sccNode->getT();
    for (auto edge : scc->getEdges()) {
      if (!edge->isLoopCarriedDependence()) {
        continue;
      }

      auto consumer = edge->getIncomingT();
      auto consumerI = cast<Instruction>(consumer);
      auto consumerLoop = LIS.getLoop(*consumerI);
      if (consumerLoop != &LS) {
        continue;
      }

      auto producer = edge->getOutgoingT();
      auto producerI = dyn_cast<Instruction>(producer);
      if(producerI == NULL) { continue; }

      auto producerLoop = LIS.getLoop(*producerI);
      if(!producerLoop) {continue;}
      LCEdges.insert(edge);
    }
  }
  return LCEdges;
}

bool LoopCarriedDependencies::canBasicBlockReachHeaderBeforeOther (
  const LoopStructure &LS,
  BasicBlock *I,
  BasicBlock *J
) {

  assert(LS.isIncluded(I) && LS.isIncluded(J));

  // I->print(errs() << "Source:\n");
  // J->print(errs() << "Destination:\n");

  /*
   * If the source is the destination, the loop must be at a later iteration
   */
  if (I == J) {
    return true;
  }

  auto header = LS.getHeader();
  auto exitsVector = LS.getLoopExitBasicBlocks();
  std::set<BasicBlock *> exits(exitsVector.begin(), exitsVector.end());
  std::queue<BasicBlock *> queue;
  std::unordered_set<BasicBlock *> enqueued;
  queue.push(I);
  enqueued.insert(I);
  bool isJReached = false;

  while (!queue.empty()) {
    auto B = queue.front();
    queue.pop();

    /*
     * Check if the successor is the header block
     * Check if the successor is an exit block; if so, do not traverse further
     * Check if the destination is reached; if so, do not traverse further
     */
    if (B == header) return true;
    if (exits.find(B) != exits.end()) continue;
    if (B == J) {
      isJReached = true;
      continue;
    }

    for (auto succIter = succ_begin(B); succIter != succ_end(B); ++succIter) {
      auto succ = *succIter;

      /*
       * Do not re-traverse enqueued blocks
       */
      if (enqueued.find(succ) != enqueued.end()) continue;
      queue.push(succ);
      enqueued.insert(succ);
    }
  }

  /*
   * The header was never reached
   */
  assert(isJReached);
  return false;
}
