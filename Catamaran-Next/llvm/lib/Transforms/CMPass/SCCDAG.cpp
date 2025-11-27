#include "SCCDAG.h"
#include "DGGraphTraits.h"


SCCDAG::SCCDAG(PDG *pdg) {
// #if 0
  // LLVM 14: 1단계 - GraphTraits 구조 변경으로 인한 문제
  // TODO: 2단계에서 LLVM 14의 새로운 GraphTraits API로 수정 필요
  /*
   * Create nodes of the SCCDAG.
   *
   * Iterate over all nodes in the PDG to calculate strongly connected components (see Tarjan's DFS algo).
   */
  std::set<DGNode<Value> *> visited;
  DGNode<Value> *originalEntryNode = pdg->getEntryNode();

  for (auto nodeToVisit : pdg->getNodes()) {
    if (visited.find(nodeToVisit) != visited.end()) continue;

    pdg->setEntryNode(nodeToVisit);

    DGGraphWrapper<PDG, Value> pdgWrapper(pdg);
  //   //scc_iterator<DGGraphWrapper<PDG, llvm::Value> *, llvm::GraphTraits<DGGraphWrapper<PDG, llvm::Value> *>>
  for (auto pdgI = scc_begin(&pdgWrapper); pdgI != scc_end(&pdgWrapper); ++pdgI) {
      /*
       * Identify a new SCC.
       */
      const std::vector<DGNodeWrapper<Value> *> &sccNodes = *pdgI;
      auto firstNodeWrapper = *sccNodes.begin();
      auto firstNode = firstNodeWrapper->wrappedNode;
      if (visited.find(firstNode) != visited.end()) {
        continue;
      }

      std::set<DGNode<Value> *> unwrappedNodes{};
      for (auto sccNode : sccNodes) {
        unwrappedNodes.insert(sccNode->wrappedNode);
      }

      /*
       * Add a new SCC to the SCCDAG.
       */
      visited.insert(unwrappedNodes.begin(), unwrappedNodes.end());
      auto scc = new SCC(unwrappedNodes);
      auto isInternal = false;
      for (auto node : unwrappedNodes) {
        isInternal |= pdg->isInternalNode(node->getT());
      }

      this->addNode(scc, /*inclusion=*/ isInternal);
    }
  }

  pdg->setEntryNode(originalEntryNode);
// #else
//   // LLVM 14: 1단계 - 기능 비활성화 (임시)
//   // TODO: 2단계에서 LLVM 14의 새로운 GraphTraits API로 수정 필요
//   (void)pdg; // unused parameter warning 방지
// #endif

  /*
   * Create the map from a Value to an SCC included in the SCCDAG.
   */
// #if 0
  // LLVM 14: 1단계 - 기능 비활성화 (임시)
  this->markValuesInSCC();
// #else
//   // LLVM 14: 1단계 - 기능 비활성화 (임시)
// #endif

  /*
   * Create dependences between nodes of the SCCDAG.
   */
  this->markEdgesAndSubEdges();

  /*
   * Compute transitive dependences between nodes of the SCCDAG.
   */
  orderedDirty = true;
  this->computeReachabilityAmongSCCs();

  return ;
}

bool SCCDAG::doesItContain (Instruction *inst) const {

  /*
   * Fetch the SCC that contains the instruction given as input.
   */
  auto SCC = this->sccOfValue(inst);

  return SCC != nullptr;
}

void SCCDAG::markValuesInSCC (void) {

  /*
   * Maintain association of each SCC's node value to its SCC
   */
  this->valueToSCCNode.clear();
  for (auto sccNode : this->getNodes()) {
    auto scc = sccNode->getT();
    for (auto instPair : scc->getInternalNodePairs()) {
      this->valueToSCCNode[instPair.first] = sccNode;
    }
  }
}

void SCCDAG::markEdgesAndSubEdges (void) {

  /*
   * Add edges between SCCs by looking at each SCC's outgoing edges
   *
   * Iterate across SCCs.
   */
  std::set<DGEdge<SCC> *> clearedEdges;
  for (auto outgoingSCCNode : this->getNodes()){

    /*
     * Fetch the current SCC.
     */
    auto outgoingSCC = outgoingSCCNode->getT();

    /*
     * Check dependences that go outside the current SCC.
     */
    for (auto externalNodePair : outgoingSCC->getExternalNodePairs()) {
      auto incomingNode = externalNodePair.second;
      if (incomingNode->numIncomingEdges() == 0) continue;

      auto incomingSCCNode = this->valueToSCCNode[externalNodePair.first];
      auto incomingSCC = incomingSCCNode->getT();

      /*
       * Find or create unique edge between the two connected SCC
       */
      std::unordered_set<DGEdge<SCC> *> edgeSet;
      for (auto edge : outgoingSCCNode->getOutgoingEdges()) {
        if (edge->getIncomingNode() != incomingSCCNode) continue;
        edgeSet.insert(edge);
      }
      for (auto edge : outgoingSCCNode->getIncomingEdges()) {
        if (edge->getOutgoingNode() != incomingSCCNode) continue;
        edgeSet.insert(edge);
      }
      auto sccEdge = edgeSet.empty() ? this->addEdge(outgoingSCC, incomingSCC) : (*edgeSet.begin());

      /*
       * Clear out subedges if not already done once; add all currently existing subedges
       */
      if (clearedEdges.find(sccEdge) == clearedEdges.end())
      {
        sccEdge->clearSubEdges();
        clearedEdges.insert(sccEdge);
      }
      for (auto edge : incomingNode->getIncomingEdges()) sccEdge->addSubEdge(edge);
    }
  }
}

void SCCDAG::mergeSCCs(std::set<DGNode<SCC> *> &sccSet)
{
  if (sccSet.size() < 2) return;

  std::set<DGNode<Value> *> mergeNodes;
  for (auto sccNode : sccSet)
  {
    for (auto internalNodePair : sccNode->getT()->getInternalNodePairs())
    {
      mergeNodes.insert(internalNodePair.second);
    }
  }

  /*
   * Note: nodes are from 2 contexts; internal nodes will point to external nodes,
   *  some of whose values are in nodes in this list, and some of whose values are NOT in nodes in this list.
   *  However, SCC's constructor accounts for that context mismatch and properly copies edges WITHOUT
   *  duplicating any nodes or edges.
   */
  auto mergeSCC = new SCC(mergeNodes);

  /*
   * Add the new SCC and remove the old ones
   * Reassign values to the SCC they are now in
   * Recreate all edges from SCCs to the newly merged SCC
   */
  auto mergeSCCNode = this->addNode(mergeSCC, /*inclusion=*/ true);
  for (auto sccNode : sccSet) this->removeNode(sccNode);
  this->markValuesInSCC();
  this->markEdgesAndSubEdges();
}

SCC * SCCDAG::sccOfValue (Value *val) const {
  auto sccIter = valueToSCCNode.find(val);
  return sccIter == valueToSCCNode.end() ? nullptr : sccIter->second->getT();
}

int64_t SCCDAG::numberOfInstructions (void) {

  /*
   * Iterate over SCCs.
   */
  int64_t n = 0;
  for (auto SCCPair : this->getInternalNodePairs()){
    auto SCC = SCCPair.first;
    n += SCC->numberOfInstructions();
  }

  return n;
}

bool SCCDAG::iterateOverInstructions (std::function<bool (Instruction *)> funcToInvoke){

  /*
   * Iterate over SCC.
   */
  for (auto sccNodePair : this->getInternalNodePairs()){

    /*
     * Iterate over instructions contained in the SCC.
     */
    auto SCC = sccNodePair.first;
    if (SCC->iterateOverInstructions(funcToInvoke)){
      return true;
    }
  }

  return false ;
}

bool SCCDAG::iterateOverLiveInAndLiveOut (std::function<bool (Value *)> funcToInvoke){

  /*
   * Iterate over live-ins and live-outs of SCCs.
   *
   * A live-in/live-out is an SCC, which in the simplest case, it is a Value
   */
  for (auto sccNodePair : this->getExternalNodePairs()){

    /*
     * Iterate over internal nodes of the current SCC.
     */
    auto SCC = sccNodePair.first;
    if (SCC->iterateOverValues(funcToInvoke)){
      return true;
    }
  }

  return false ;
}

bool SCCDAG::iterateOverAllInstructions (std::function<bool (Instruction *)> funcToInvoke){

  /*
   * Iterate over SCC.
   */
  for (auto sccNode : this->getNodes()){

    /*
     * Iterate over instructions contained in the SCC.
     */
    auto SCC = sccNode->getT();
    if (SCC->iterateOverAllInstructions(funcToInvoke)){
      return true;
    }
  }

  return false ;
}

bool SCCDAG::iterateOverAllValues (std::function<bool (Value *)> funcToInvoke){

  /*
   * Iterate over SCC.
   */
  for (auto sccNode : this->getNodes()){

    /*
     * Iterate over instructions contained in the SCC.
     */
    auto SCC = sccNode->getT();
    if (SCC->iterateOverAllValues(funcToInvoke)){
      return true;
    }
  }

  return false ;
}

bool SCCDAG::iterateOverSCCs (std::function<bool (SCC *)> funcToInvoke){

  /*
   * Iterate over SCC.
   */
  for (auto sccNode : this->getNodes()){
    if (funcToInvoke(sccNode->getT())){
      return true;
    }
  }

  return false ;
}

std::unordered_set<SCC *> SCCDAG::getSCCs (void) {
  std::unordered_set<SCC *> s;
  for (auto sccNode : this->getNodes()){
    s.insert(sccNode->getT());
  }

  return s;
}

SCCDAG::~SCCDAG() {
  for (auto *edge : allEdges){
    if (edge) {
      delete edge;
    }
  }

  for (auto *node : allNodes){
    if (node) {
      delete node;
    }
  }

  this->clear();

  return ;
}

bool SCCDAG::orderedBefore(const SCC *earlySCC, const SCCSet &lates) const {
  for (auto lscc : lates) {
    if (orderedBefore(earlySCC, lscc)) {
      return true;
    }
  }
  return false;
}

bool SCCDAG::orderedBefore(const SCCSet &earlies, const SCC *lateSCC) const {
  for (auto escc : earlies) {
    if (orderedBefore(escc, lateSCC)) {
      return true;
    }
  }
  return false;
}

/*
 * Returns true if there is a path of dependences from earlySCC to lateSCC.
 * O(1) complexity thanks to the precomputation of the bitMatrix.
 */
bool SCCDAG::orderedBefore(const SCC *earlySCC, const SCC *lateSCC) const {
  assert(!orderedDirty && "Must run computeReachabilityAmongSCCs() first");
  auto earlySCCid = sccIndexes.find(earlySCC)->second;
  auto lateSCCid = sccIndexes.find(lateSCC)->second;
  return ordered.test(earlySCCid, lateSCCid);
}

void SCCDAG::computeReachabilityAmongSCCs (void) {
  orderedDirty = false;
  const uint32_t Nscc = this->numNodes();

  /*
   * Compute indices for all SCC nodes.
   */
  uint32_t index = 0;
  for (const auto *SCCNode : this->getNodes()) {
    sccIndexes[SCCNode->getT()] = index;
    index++;
  }

  /*
   * Resize bitMatrix (NxN), where N is the number of SCC nodes.
   */
  ordered.resize(Nscc);

  /*
   * Populate bitMatrix with all reported dependences among SCC nodes.
   */
  for (auto *SCCEdge : this->getEdges()) {
    const SCC *srcSCC = SCCEdge->getOutgoingT();
    const SCC *dstSCC = SCCEdge->getIncomingT();
    ordered.set(sccIndexes[srcSCC], sccIndexes[dstSCC]);
  }

  /*
   * Compute transitive closure of the bitMatrix.
   */
  ordered.transitiveClosure();
}

uint32_t SCCDAG::getSCCIndex(const SCC *scc) const {
  auto sccF = sccIndexes.find(scc);
  return sccF->second;
}