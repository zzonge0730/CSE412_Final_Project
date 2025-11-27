#include "PDG.h"
#include "Utils.h"
#include <algorithm>
#include <assert.h>

using namespace llvm;

PDG::PDG(Module &M) {
    // int count = 0;
    // Function* entryFunc = nullptr;
    for (auto &F : M) {
        if (F.isDeclaration()) continue;
        if (isASANLibFunc(&F)) continue;
        addNodesOf(F);
    }
    //set the etnry node
    auto mainF = M.getFunction("main");
    assert(mainF != nullptr);
    this->setEntryPointAt(*mainF);
    for (auto edge : this->getEdges()) {
        assert(!edge->isLoopCarriedDependence() && "Flag was already set");
    }
}

PDG::PDG(Function &F) {
    addNodesOf(F);
    setEntryPointAt(F);
}

PDG::PDG(Loop *loop) {
    //create a node per instruction within loops of LI(loopinfo) only
    for (auto bbi = loop->block_begin(); bbi != loop->block_end(); bbi++) {
        for (auto &I : **bbi) {
            this->addNode(cast<Value>(&I), true);//inclusion = true;
        }
    }

    //set the entry node
    auto bbBegin = *(loop->block_begin());
    this->entryNode = this->internalNodeMap[&*(bbBegin->begin())];
    assert(this->entryNode != nullptr);
}

PDG::PDG(std::vector<Value *> &values) {
    for (auto &n : values) {
        this->addNode(n, true);//inclusion = true;
    }

    //set the entry node
    this->entryNode = this->internalNodeMap[*(values.begin())];
    assert(this->entryNode != nullptr);
}

PDG::PDG() {
}

void PDG::addNodesOf(Function &F) {
    // for (auto &arg : F.args()) {
    //     addNode(cast<Value>(&arg), true);//inclusion = true
    // }
    //---zyy---
    for (Function::arg_iterator arg_it = F.arg_begin(); arg_it != F.arg_end(); ++arg_it) {
        addNode(cast<Value>(&arg_it), true);
    }

    for (auto &BB : F) {
        for (auto &I : BB) {
            // errs() << "68node: " << *cast<Value>(&I) << "\n";
            addNode(cast<Value>(&I), true);//inclusion = true
        }
    }
}

void PDG::setEntryPointAt(Function &F) {
    auto entryInst = &*(F.begin()->begin());
    entryNode = internalNodeMap[entryInst];
    assert(entryNode != nullptr);
}

DGEdge<Value> * PDG::addEdge(Value * from, Value * to){
    return this->DG<Value>::addEdge(from, to);
}

PDG * PDG::createFunctionSubgraph(Function &F) {
    if (F.empty()) return nullptr;

    auto funcPDG = new PDG(F);
    //recreate all edges connected to internal nodes of function
    copyEdgesInto(funcPDG, true);//linkToExternal = true
    for (auto edge : funcPDG->getEdges()){
        assert(!edge->isLoopCarriedDependence() && "Flag was already set");
    }
    return funcPDG;
}

PDG * PDG::createLoopsSubgraph(Loop * loop) {
    //create a node per instruction within loops of loopinfo only
    auto loopsPDG = new PDG(loop);
    //recreate all edges connected to internal nodes of loop
   copyEdgesInto(loopsPDG, true);//linkToExternal = true
   
   return loopsPDG;
}

PDG * PDG::createSubgraphFromValues(std::vector<Value *> &valueList, bool linkToExternal) {
    return createSubgraphFromValues(valueList, linkToExternal, {});
}

PDG * PDG::createSubgraphFromValues(std::vector<Value *> &valueList, bool linkToExternal, std::unordered_set<DGEdge<Value> *> edgesToIgnore){
    if (valueList.empty()) return nullptr;
    auto newPDG = new PDG(valueList);

    copyEdgesInto(newPDG, linkToExternal, edgesToIgnore);

    return newPDG;
}

void PDG::copyEdgesInto(PDG * pdg, bool linkToExternal) {
    copyEdgesInto(pdg, linkToExternal, {});
}

void PDG::copyEdgesInto(PDG * pdg, bool linkToExternal, std::unordered_set<DGEdge<Value> *> const & edgesToIgnore) {
    for (auto *oldEdge : allEdges) {
        if (edgesToIgnore.find(oldEdge) != edgesToIgnore.end()) continue;

        auto nodePair = oldEdge->getNodePair();
        auto fromT = nodePair.first->getT();
        auto toT = nodePair.second->getT();

        //check whether edge belongs to nodes within function F
        auto fromInclusion = pdg->isInternalNode(fromT);
        auto toInclusion = pdg->isInternalNode(toT);
        if (!fromInclusion && !toInclusion) continue;
        if(!linkToExternal &&(!fromInclusion || !toInclusion)) continue;

        //create appropriate external nodes and associate edge to them
        auto newFromNode = pdg->isInGraph(fromT) ? pdg->fetchNode(fromT) : pdg->addNode(fromT, fromInclusion); 
        auto toFromNode = pdg->isInGraph(toT) ? pdg->fetchNode(toT) : pdg->addNode(toT, toInclusion);

        // copy edge to match properties
        if (oldEdge == nullptr) continue;
        pdg->copyAddEdge(*oldEdge);
    }
}

uint64_t PDG::getNumberOfInstructionsIncluded(void) const {
    return this->numInternalNodes();
}

uint64_t PDG::getNumberOfDependencesBetweenInstructions(void) const {
    return this->numEdges();
}

std::unordered_set<DGEdge<Value> *> PDG::getDependences(Value *from, Value *to) {
    //fetch the nodes
    auto srcNode = this->fetchNode(from);
    auto dstNode = this->fetchNode(to);
    if (!srcNode || !dstNode) {
        return {};
    }

    //fetch the dependences
    auto edgeSet = this->fetchEdges(srcNode, dstNode);

    return edgeSet;
}

PDG::~PDG() {
    for (auto *edge : allEdges) {
        if (edge) delete edge;
    }
    for (auto *node : allNodes) {
        if (node) delete node;
    }
}

bool PDG::iteratorOverDependencesFrom(
    Value *from, bool ctrl, bool mem, bool reg, bool seq, 
    std::function<bool (Value *to, DGEdge<Value> *dependence)> functionToInvokePerDependence
) {
    //fetch the node in the PDG
    auto pdgNode = this->fetchNode(from);
    if (pdgNode == nullptr) return false;

    //iterate over the edges of the node
    for (auto edgeIt = pdgNode->begin_outgoing_edges(); edgeIt != pdgNode->end_outgoing_edges(); edgeIt++){
        auto edge = *edgeIt;
        auto destValue = edge->getIncomingT();
        //check if this is a control dependence
        if (ctrl && edge->isControlDependence()) {
            if(functionToInvokePerDependence(destValue, edge)) {
                return true;
            }
            continue;
        }

        //check if this is a memory dependence
        if (mem && edge->isMemoryDependence()) {
            if (functionToInvokePerDependence(destValue, edge)) {
                 return true;
            }
            continue;
        }       

       
        //check if this is a register dependence
        if (reg && !edge->isMemoryDependence() && !edge->isControlDependence()){
            assert(edge->getDataDependenceType() != DG_DATA_NONE);
            if (functionToInvokePerDependence(destValue, edge)) {
                return true;
            }
            continue;     
        }     
    }
    return false;
}

bool PDG::iteratorOverDependencesTo(
    Value *to, bool ctrl, bool mem, bool reg, bool seq, 
    std::function<bool (Value *from, DGEdge<Value> *dependence)> functionToInvokePerDependence
) {
    //fetch the node in the PDG
    auto pdgNode = this->fetchNode(to);
    if (pdgNode == nullptr) return false;

    //iterate over the edges of the node
    for (auto edgeIt = pdgNode->begin_incoming_edges(); edgeIt != pdgNode->end_incoming_edges(); edgeIt++){
        //fetch the destination value
        auto edge = *edgeIt;
        auto srcValue = edge->getOutgoingT();

        //check if this is a contrl dependence
        if (ctrl && edge->isControlDependence()) {
            if (functionToInvokePerDependence(srcValue, edge)) {
                return true;
            }
            continue;
        }

        //check if this is a memory dependence
        if (mem && edge->isMemoryDependence()) {
             if (functionToInvokePerDependence(srcValue, edge)) {
                  return true;
             }
             continue;
        }

        //check if this is a register dependence
        if (reg && !edge->isMemoryDependence() && !edge->isControlDependence()) {
            assert(edge->getDataDependenceType() != DG_DATA_NONE);
            if (functionToInvokePerDependence(srcValue, edge)) {
                return true;
            }
            continue;
        }
    }
    return false;
}

std::vector<Value *> PDG::getSortedValues(void) {
    std::vector<Value *> sortedValues;
    //fetch all nodes
    auto nodes = this->getNodes();
    //create a sorted set of values
    for (auto node : nodes) {
        auto v = node->getT();
        sortedValues.push_back(v);
    }
    std::sort(sortedValues.begin(), sortedValues.end());//--zyy--add
    return sortedValues;
}

std::vector<DGEdge<Value> *> PDG::getSortedDependences(void) {
    std::vector<DGEdge<Value> *> sortedDep;
    //fetech all edges
    auto edges = this->getEdges();
    for (auto edge : edges) {
        assert(edge != nullptr);
        sortedDep.push_back(edge);
    }
    //sort
    auto sortingFunction = [](DGEdge<Value> *d1, DGEdge<Value> *d2) -> bool {
        assert(d1 != nullptr);
        assert(d2 != nullptr);
        
        auto src1 = d1->getOutgoingT();
        auto src2 = d2->getOutgoingT();
        assert(src1 != nullptr);
        assert(src2 != nullptr);
        if (src1 < src2) return true;
        if (src1 > src2) return false;
        assert(src1 == src2);

        auto dst1 = d1->getIncomingT();
        auto dst2 = d2->getIncomingT();
        assert(dst1 != nullptr);
        assert(dst2 != nullptr);
        if (dst1 < dst2) return true;
        if (dst1 > dst2) return false;
        assert(dst1 == dst2);
     
        return false;
    };
    std::sort(sortedDep.begin(), sortedDep.end(), sortingFunction);
    return sortedDep;
}








