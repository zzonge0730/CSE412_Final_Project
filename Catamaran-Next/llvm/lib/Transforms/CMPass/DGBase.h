// Program Dependence Graph Node and Edge
#ifndef DGBASE_H
#define DGBASE_H

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/iterator_range.h"

#include <climits>
#include <unordered_map>
#include <unordered_set>
#include <queue>
#include <set>
#include <vector>
#include <iterator>
#include <utility>

#include <string>

using namespace llvm;

template <class T> class DGNode;
template <class T, class SubT> class DGEdgeBase;
template <class T> class DGEdge;

//Criticism is a PDG edge with a bool value to differentiate loop-carried
//from intra-interation edges. Also specify type of dep(mem/reg/ctrl);
typedef DGEdge<Value> Criticism;
typedef std::set<Criticism *> Criticisms;

enum DataDependenceType {
    DG_DATA_NONE,
    DG_DATA_RAW,
    DG_DATA_WAR,
    DG_DATA_WAW
};

template <class T>
class DG {
public:
    DG() : nodeIdCounter{0} {}

    typedef typename std::unordered_set<DGNode<T> *>::iterator nodes_iterator;
    typedef typename std::unordered_set<DGNode<T> *>::const_iterator nodes_const_iterator;

    typedef typename std::unordered_set<DGEdge<T> *>::iterator edges_iterator;
    typedef typename std::unordered_set<DGEdge<T> *>::const_iterator edges_const_iterator;

    typedef typename std::unordered_map<T *, DGNode<T> *>::iterator node_map_iterator;

    //Node Iterators
    nodes_iterator begin_nodes(){
        auto node = allNodes.begin();
        return node;
    }

    nodes_iterator end_nodes(){
        auto node = allNodes.end();
        return node;
    }

    nodes_const_iterator begin_nodes() const {
        auto node = allNodes.begin();
        return node;
    }

    nodes_const_iterator end_nodes() const {
        auto node = allNodes.end();
        return node;
    }
    //Edge iterators
    edges_iterator begin_edges() {
        auto edge = allEdges.begin();
        return edge;
    }

    edges_iterator end_edges() {
        auto edge = allEdges.end();
        return edge;
    }

    edges_const_iterator begin_edges() const {
        auto edge = allEdges.begin();
        return edge;
    }

    edges_const_iterator end_edges() const {
        auto edge = allEdges.begin();
        return edge;
    }

    //internalNode iterators
    node_map_iterator begin_internal_node_map() {
        auto node = internalNodeMap.begin();
        return node;
    }

    node_map_iterator end_internal_node_map() {
        auto node = internalNodeMap.end();
        return node;
    }

    //externalNode iterators
    node_map_iterator begin_external_node_map() {
        auto node = externalNodeMap.begin();
        return node;
    }

    node_map_iterator end_external_node_map() {
        auto node = externalNodeMap.end();
        return node;
    }

    //Node properties
    DGNode<T> *getEntryNode() const {
        return entryNode;
    }

    void setEntryNode(DGNode<T> *node) {
        entryNode = node;
    }

    bool isInternalNode(T *node) const {
        return internalNodeMap.find(node) != internalNodeMap.end();
    }

    bool isExternalNode(T *node) const {
        return externalNodeMap.find(node) != externalNodeMap.end();
    }

    bool isInGraph(T *node) const {
        return isInternalNode(node) || isExternalNode(node);
    }

    unsigned numNodes() const {
        return allNodes.size();
    }

    unsigned numInternalNodes() const {
        return internalNodeMap.size();
    }

    unsigned numExternalNodes() const {
        return externalNodeMap.size();
    }

    //Edge properties
    unsigned numEdges() const {
        return allEdges.size();
    }

    //Iterator ranges
    llvm::iterator_range<nodes_iterator> getNodes() {
        return llvm::make_range(allNodes.begin(), allNodes.end());
    }

    llvm::iterator_range<edges_iterator> getEdges() {
        return llvm::make_range(allEdges.begin(), allEdges.end());
    }

    llvm::iterator_range<node_map_iterator> getInternalNodePairs() {
        return llvm::make_range(internalNodeMap.begin(), internalNodeMap.end());
    }

    llvm::iterator_range<node_map_iterator> getExternalNodePairs() {
        return llvm::make_range(externalNodeMap.begin(), externalNodeMap.end());
    }

    //fetch / create nodes and edges
    DGNode<T> *addNode(T * node, bool inclusion);
    DGNode<T> *fetchNode(T * key);
    const DGNode<T> *fetchConstNode(T * key) const;

    DGEdge<T> *addEdge(T *from, T *to);
    DGEdge<T> *copyAddEdge(DGEdge<T> &edgeToCopy);
    std::unordered_set<DGEdge<T> *> fetchEdges(DGNode<T> *From, DGNode<T> *To);

    //merge / extract graphs
    std::unordered_set<DGNode<T> *> getTopLevelNodes(bool onlyInternal = false);
    std::unordered_set<DGNode<T> *> getLeafNodes(bool onlyInternal = false);
    std::vector<std::unordered_set<DGNode<T> *> *>  getDisconnectedSubgraphs();
    std::unordered_set<DGNode<T> *> getNextDepthNodes(DGNode<T> *node);
    std::unordered_set<DGNode<T> *> getPreviousDepthNodes(DGNode<T> *node);
    void removeNode(DGNode<T> *node);
    void removeEdge(DGEdge<T> *edge);
    void copyNodesIntoNewGraph(DG<T> &newGraph, std::unordered_set<DGNode<T> *> nodesToPartition, DGNode<T> *entryNode);
    void clear();

    llvm::raw_ostream & print(llvm::raw_ostream &o);
protected:
    int nodeIdCounter;
    std::unordered_set<DGNode<T> *> allNodes;
    std::unordered_set<DGEdge<T> *> allEdges;
    DGNode<T> *entryNode;
    std::unordered_map<T *, DGNode<T> *> internalNodeMap;
    std::unordered_map<T *, DGNode<T> *> externalNodeMap;
};

template <class T>
class DGNode {
public:
    //typedef typename std::vector<DGNode<T> *>::iterator nodes_iterator;
    typedef typename std::unordered_set<DGEdge<T> *>::iterator edges_iterator;
    typedef typename std::unordered_set<DGEdge<T> *>::const_iterator edges_const_iterator;

    //outgoing iterators
    edges_iterator begin_outgoing_edges() {
        return outgoingEdges.begin();
    }

    edges_iterator end_outgoing_edges() {
        return outgoingEdges.end();
    }

    edges_const_iterator begin_outgoing_edges() const {
        return outgoingEdges.begin();
    }

    edges_const_iterator end_outgoing_edges() const {
        return outgoingEdges.end();
    }

    //incoming edges
    edges_iterator begin_incoming_edges() {
        return incomingEdges.begin();
    }

    edges_iterator end_incoming_edges() {
        return incomingEdges.end();
    }

    edges_const_iterator begin_incoming_edges() const {
        return incomingEdges.begin();
    }

    edges_const_iterator end_incoming_edges() const {
        return incomingEdges.end();
    }

    std::unordered_set<DGEdge<T> *> getAllConnectedEdges() {
        std::unordered_set<DGEdge<T> *> allConnectedEdges{outgoingEdges.begin(), outgoingEdges.end()};
        allConnectedEdges.insert(incomingEdges.begin(), incomingEdges.end());
        return allConnectedEdges;
    }

    inline llvm::iterator_range<edges_iterator> getOutgoingEdges() {
        return llvm::make_range(outgoingEdges.begin(), outgoingEdges.end());
    }

    inline llvm::iterator_range<edges_iterator> getIncomingEdges() {
        return llvm::make_range(incomingEdges.begin(), incomingEdges.end());
    }

    T *getT() const { return theT;}

    unsigned numOutgoingEdges() { return outgoingEdges.size();}
    unsigned numIncomingEdges() { return incomingEdges.size();}
    unsigned numConnectedEdges() { return numOutgoingEdges() + numIncomingEdges();}

    void addIncomingEdge(DGEdge<T> *edge);
    void addOutgoingEdge(DGEdge<T> *edge);
    void removeConnectedEdge(DGEdge<T> *edge);
    void removeConnectedNode(DGNode<T> *node);

    std::string toString();
    llvm::raw_ostream &print(llvm::raw_ostream &O);

protected:
    DGNode(int id) : ID{id}, theT(nullptr) {}
    DGNode(int id, T *node) : ID{id}, theT(node) {}

    int ID;
    T *theT;
    std::unordered_set<DGEdge<T> *> outgoingEdges;
    std::unordered_set<DGEdge<T> *> incomingEdges;

friend class DG<T>;
};

template <class T, class SubT>
class DGEdgeBase {
public:
    DGEdgeBase(DGNode<T> *src, DGNode<T> * dst) : from(src), to(dst),
    memory(false), must(false), dataDepType(DG_DATA_NONE), isControl(false),
    isLoopCarried(false), isRemovable(false), isSequence(false) {}
    DGEdgeBase(const DGEdgeBase<T, SubT> &oldEdge);

    typedef typename std::unordered_set<DGEdge<SubT> *>::iterator edges_iterator;
    typedef typename std::unordered_set<DGEdge<SubT> *>::const_iterator edges_const_iterator;

    //edge iterators
    edges_iterator begin_sub_edges() {
        return subEdges.begin();
    } 

    edges_iterator end_sub_edges() {
        return subEdges.end();
    }

    edges_const_iterator begin_sub_edges() const {
        return subEdges.begin();
    }

    edges_const_iterator end_sub_edges() const {
        return subEdges.end();
    }

    inline llvm::iterator_range<edges_iterator> getSubEdges() {
        return llvm::make_range(subEdges.begin(), subEdges.end());
    }

    std::pair<DGNode<T> *, DGNode<T> *> getNodePair() const {
        return std::make_pair(from, to);
    }
    
    void setNodePair(DGNode<T> * from, DGNode<T> * to) {
        this->from = from;
        this->to = to;
    }

    DGNode<T> *getOutgoingNode() const {
        return from;
    }

    DGNode<T> *getIncomingNode() const {
        return to;
    }

    T * getOutgoingT() const {
        return from->getT();
    }

    T * getIncomingT() const {
        return to->getT();
    }

    bool isMemoryDependence() const {
        return memory;
    }

    bool isMustDependence() const {
        return must;
    }

    bool isRAWDependence() const {
        return dataDepType == DG_DATA_RAW;
    }

    bool isWARDependence() const {
        return dataDepType == DG_DATA_WAR;
    }

    bool isWAWDependence() const {
        return dataDepType == DG_DATA_WAW;
    }

    bool isControlDependence() const {
        return isControl;
    }

    // --zyy notice !
    bool isDataDependence() const {
        return !isControl;
    }

    bool isLoopCarriedDependence() const {
        return isLoopCarried;
    }

    bool isRemovableDependence() const {
        return isRemovable;
    }

    bool isSeqDependence() const {
        return isSequence;
    }

    DataDependenceType getDataDependenceType() const {
        return dataDepType;
    }

    void setControl(bool ctrl) {
        isControl = ctrl;
    }

    void setSequence(bool seq) {
        isSequence = seq;
    }

    void setLoopCarried(bool lc) {
        isLoopCarried = lc;
    }

    void setRemovable(bool remove) {
        isRemovable = remove;
    }

    void setMemMustType(bool mem, bool mst, DataDependenceType dDType) {
        memory = mem;
        must = mst;
        dataDepType = dDType;
    }

    void setEdgeAttributes(bool mem, bool must, std::string str, bool ctrl, bool lc, bool rm, bool seq) {
        setMemMustType(mem, must, stringToDataDep(str));
        setControl(ctrl);
        setLoopCarried(lc);
        setRemovable(rm);
        setSequence(seq);
    }

    void addSubEdge(DGEdge<SubT> *edge) {
        subEdges.insert(edge);
        isLoopCarried |= edge->isLoopCarriedDependence();
        if (edge->isRemovableDependence() && (subEdges.size() == 1 || this->isRemovableDependence())) {
            isRemovable = true;
        } else {
            isRemovable = false;
        }
    }

    void removeSubEdge(DGEdge<SubT> *edge) {
        subEdges.erase(edge);
    }

    void clearSubEdges() {
        subEdges.clear();
        setLoopCarried(false);
        setRemovable(false);
    }

    std::string toString();
    llvm::raw_ostream &print(llvm::raw_ostream &stream, std::string linePrefix = "");
    std::string dataDepToString() {
        if (this->isRAWDependence())
            return "RAW";
        else if (this->isWARDependence())
            return "WAR";
        else if (this->isWAWDependence())  
            return "WAW";
        else
            return "NONE";
    }

    static DataDependenceType stringToDataDep(std::string str) {
        if (str == "RAW")
            return DG_DATA_RAW;
        else if (str == "WAR")
            return DG_DATA_WAR;
        else if (str == "WAW")
            return DG_DATA_WAW;
        else
            return DG_DATA_NONE;
    }

protected:
    DGNode<T> *from;
    DGNode<T> *to;
    std::unordered_set<DGEdge<SubT> *> subEdges;

    bool memory;
    bool must;
    bool isControl;
    bool isLoopCarried;
    bool isRemovable;
    bool isSequence;//---zyy---


    DataDependenceType dataDepType;


};

template <class T>
class DGEdge : public DGEdgeBase<T, T> {
public:
    DGEdge(DGNode<T> *src, DGNode<T> *dst) : DGEdgeBase<T, T>(src, dst) {}
    DGEdge(const DGEdge<T> &oldEdge) : DGEdgeBase<T, T>(oldEdge) {} 
};

//DG<T> class method implementations
template <class T>
DGNode<T> *DG<T>::addNode(T *theT, bool inclusion){
    auto node = new DGNode<T>(nodeIdCounter++, theT);
    allNodes.insert(node);
    auto &map = inclusion ? internalNodeMap : externalNodeMap;
    map[theT] = node;
    return node;
}

template <class T>
DGNode<T> *DG<T>::fetchNode(T *theT) {
    assert(theT != nullptr && "theT is nullptr\n");
    auto nodeI = internalNodeMap.find(theT);
    return (nodeI != internalNodeMap.end()) ? nodeI->second : externalNodeMap[theT];
}

// template <class T>
// const DGNode<T> *DG<T>::fetechConstNode(T *theT) const {
//     auto nodeI = internalNodeMap.find(theT);
//     return (nodeI != internalNodeMap.end()) ? nodeI->second : externalNodeMap.find(theT)->second;
// }

template <class T>
DGEdge<T> *DG<T>::addEdge(T * from, T * to) {
    auto fromNode = fetchNode(from);
    auto toNode = fetchNode(to);
    //errs() << "---DGBase 523---\n";
    auto edge = new DGEdge<T>(fromNode, toNode);
    allEdges.insert(edge);
    //errs() << "---DGBase 526---\n";
    fromNode->addOutgoingEdge(edge);
    //errs() << "---DGBase 529---\n";
    assert(toNode == nullptr && "toNode is nullptr");
    assert(edge == nullptr && "edge is nullptr");
    toNode->addIncomingEdge(edge);
    //errs() << "---DGBase 531---\n";
    return edge;
}

template <class T>
std::unordered_set<DGEdge<T> *> DG<T>::fetchEdges(DGNode<T> *from, DGNode<T> * to) {
    std::unordered_set<DGEdge<T> *> edgeSet;
    for (auto &edge : from->getOutgoingEdges()) {
        if (edge->getIncomingNode() == to) {
            edgeSet.insert(edge);
        }
    }
    return edgeSet;
}

template <class T>
DGEdge<T> *DG<T>::copyAddEdge(DGEdge<T> &edgeToCopy) {
    auto edge = new DGEdge<T>(edgeToCopy);
    allEdges.insert(edge);
    auto nodePair = edgeToCopy.getNodePair();
    auto fromNode = fetchNode(nodePair.first->getT());
    auto toNode = fetchNode(nodePair.second->getT());
    edge->setNodePair(fromNode, toNode);
    fromNode->addOutgoingEdge(edge);
    // assert(toNode == nullptr && "toNode is nullptr");
    // assert(edge == nullptr && "edge is nullptr");
    // if (toNode == nullptr) {
    //     errs() << "---546\n";
    //     errs() << "nodePair.first: " << nodePair.first->toString() << "\n";
    //     errs() << "nodePair.second: " << nodePair.second->toString() << "\n";
    // }
    toNode->addIncomingEdge(edge);
    // errs() << "---540\n";
    return edge;
}

template <class T>
std::unordered_set<DGNode<T> *> DG<T>::getTopLevelNodes(bool onlyInternal){
    std::unordered_set<DGNode<T> *> topLevelNodes;
    //Add all nodes that have no incoming nodes
    //exclude itself, and external nodes if onlyInternal = true
    for (auto node : allNodes) {
        if (onlyInternal && isExternalNode(node->getT())) continue;
        bool hasNoIncoming = true;
        for (auto incomingEdge : node->getIncomingEdges()) {
            bool edgeToSelf = (incomingEdge->getOutgoingNode() == node);
            bool edgeToExternal = onlyInternal && isExternalNode(incomingEdge->getOutgoingT());
            hasNoIncoming &= edgeToSelf || edgeToExternal;
        }
        if (hasNoIncoming)
            topLevelNodes.insert(node);
    }
    return topLevelNodes;
}

template <class T>
std::unordered_set<DGNode<T> *> DG<T>::getLeafNodes(bool onlyInternal) {
    std::unordered_set<DGNode<T> *> leafNodes;
    if (onlyInternal) {
        for (auto node : allNodes) {
            bool noChildNode = true;
            for (auto edge : node->getOutgoingEdges()) {
                noChildNode &= (edge->getIncomingNode() == node);
            }
            if (noChildNode) 
                leafNodes.insert(node);
        }
    } else {
        for (auto nodePair : getInternalNodePairs()) {
            bool noChildNode = true;
            for (auto edge : nodePair.second->getOutgoingEdges()) {
                noChildNode &= (edge->getIncomingNode() == nodePair.second);
            }
            if (noChildNode)
                leafNodes.insert(nodePair.second);
        }
    }
    return leafNodes;
}

template <class T>
std::vector<std::unordered_set<DGNode<T> *> *> DG<T>::getDisconnectedSubgraphs(){
    std::vector<std::unordered_set<DGNode<T> *> *> connectedComponents;
    std::unordered_set<DGNode<T> *> visitedNodes;

    for (auto node : allNodes) {
        if (visitedNodes.find(node) != visitedNodes.end()) continue; // node has been visited before.
        
        //Perform BFS to find the connected component this node belongs to
        auto component = new std::unordered_set<DGNode<T> *>();
        std::queue<DGNode<T> *> connectedNodes;

        visitedNodes.insert(node);
        connectedNodes.push(node);
        while(!connectedNodes.empty()) {
            auto curNode = connectedNodes.front();
            connectedNodes.pop();
            component->insert(curNode);

            auto checkToVisitNode = [&](DGNode<T> *node) -> void {
                if (visitedNodes.find(node) != visitedNodes.end()) return;
                visitedNodes.insert(node);
                connectedNodes.push(node);
            };

            for (auto edge : curNode->getOutgoingEdges()) {
                checkToVisitNode(edge->getIncomingNode());
            }
            for (auto edge : curNode->getIncomingEdges()) {
                checkToVisitNode(edge->getOutgoingNode());
            }
        }
        connectedComponents.push_back(component);
    }

    return connectedComponents;
}

template <class T>
std::unordered_set<DGNode<T> *> DG<T>::getNextDepthNodes(DGNode<T> *node) {
    std::unordered_set<DGNode<T> *> incomingNodes;
    for (auto edge : node->getOutgoingEdges()) {
        incomingNodes.insert(edge->getIncomingNode());
    }
    std::unordered_set<DGNode<T> *> nextDepthNodes;
    for (auto incoming : incomingNodes) {
        //check if edge exists from another next to this next node
        //if so, it isn't the next depth
        bool isNextDepth = true;
        for (auto incomingE : incoming->getIncomingEdges()) {
            isNextDepth &= (incomingNodes.find(incomingE->getOutgoingNode()) == incomingNodes.end());
        }
        if (!isNextDepth) continue;
        nextDepthNodes.insert(incoming);
    }

    return nextDepthNodes;
}

template <class T>
std::unordered_set<DGNode<T> *> DG<T>::getPreviousDepthNodes(DGNode<T> *node) {
    std::unordered_set<DGNode<T> *> previousDepthNodes;

    std::unordered_set<DGNode<T> *> outgoingNodes;
    for (auto edge : node->getIncomingEdges()) {
        outgoingNodes.insert(edge->getOutgoingNode());
    }

    for (auto outgoing : outgoingNodes) {
        //check if edge exists from this previous to another previous node;
        //if so, it isn't the next depth
        bool isPreDepth = true;
        for (auto outgoingE : outgoing->getOutgoingEdges()) {
            isPreDepth &= (outgoingNodes.find(outgoingE->getIncomingNode()) == outgoingNodes.end());
        }
        if (!isPreDepth) continue;
        previousDepthNodes.insert(outgoing);
    }

    return previousDepthNodes;
}

template <class T>
void DG<T>::removeNode(DGNode<T> * node) {
    auto theT = node->getT();
    auto &map = isInternalNode(theT) ? internalNodeMap : externalNodeMap;
    map.erase(theT);
    allNodes.erase(node);

    //collect edges to operate on before doing deletes
    std::unordered_set<DGEdge<T> *> incomingToNode;
    std::unordered_set<DGEdge<T> *> outgoingFromNode;
    std::unordered_set<DGEdge<T> *> allToAndFromNode;
    for (auto edge : node->getIncomingEdges()) {
        incomingToNode.insert(edge);
    }
    for (auto edge : node->getOutgoingEdges()) {
        outgoingFromNode.insert(edge);
    }
    for (auto edge : node->getAllConnectedEdges()) {
        allToAndFromNode.insert(edge);
    }

    //Delete relations to edges and edges themselves
    for (auto edge : incomingToNode) {
        edge->getOutgoingNode()->removeConnectedNode(node);
    }
    for (auto edge : outgoingFromNode) {
        edge->getIncomingNode()->removeConnectedNode(node);
    }
    for (auto edge : allToAndFromNode) {
        allEdges.erase(edge);
        delete edge;
    }
    delete node;
}

template <class T>
void DG<T>::removeEdge(DGEdge<T> *edge) {
    edge->getOutgoingNode()->removeConnectedEdge(edge);
    edge->getIncomingNode()->removeConnectedEdge(edge);
    allEdges.erase(edge);
    delete edge;
}

template <class T>
void DG<T>::copyNodesIntoNewGraph(DG<T> &newGraph, std::unordered_set<DGNode<T> *> nodesToPartition,
DGNode<T> *entryNode) {
    for (auto node : nodesToPartition) {
        auto theT = node->getT();
        auto cloneNode = newGraph.addNode(theT, isInternalNode(theT));
        if (theT == entryNode->getT()) {
            newGraph.setEntryNode(cloneNode);
        }
    }

    //only add edges that connect between two nodes in that partition
    for (auto node : nodesToPartition) {
        for (auto edgeToCopy : node->getOutgoingEdges()) {
            auto incomingT = edgeToCopy->getIncomingNode()->getT();
            if(!newGraph.isInGraph(incomingT)) continue;
            newGraph.copyAddEdge(*edgeToCopy);
        }
    }
}

template <class T>
void DG<T>::clear() {
    allNodes.clear();
    allEdges.clear();
    entryNode = nullptr;
    internalNodeMap.clear();
    externalNodeMap.clear();
}

//DGNode<T> class method implementations

template <class T>
void DGNode<T>::addIncomingEdge(DGEdge<T> * edge) {
    //errs() << "---DGBase-766---\n";
    incomingEdges.insert(edge);
    //errs() << "---DGBase-768---\n";
    //auto node = edge->getOutgoingNode();
    //errs() << "---DGBase-770---\n";
}

template <class T>
void DGNode<T>::addOutgoingEdge(DGEdge<T> *edge) {
    outgoingEdges.insert(edge);
    //auto node = edge->getIncomingNode();
}

template <class T>
void DGNode<T>::removeConnectedEdge(DGEdge<T> *edge) {
    if (outgoingEdges.find(edge) != outgoingEdges.end()) {
        outgoingEdges.erase(edge);
    } else {
        incomingEdges.erase(edge);
    }
}

template <class T>
void DGNode<T>::removeConnectedNode(DGNode<T> *node) {
    std::unordered_set<DGEdge<T> *> outgoingEdgesToRemove{};
    std::unordered_set<DGEdge<T> *> incomingEdgesToRemove{};
    for (auto edge : outgoingEdges) {
        if (edge->getIncomingNode() == node ) {
            outgoingEdgesToRemove.insert(edge);
        }
    }
    for (auto edge : outgoingEdgesToRemove) {
        outgoingEdges.erase(edge);
    }

    for (auto edge : incomingEdges) {
        if (edge->getOutgoingNode() == node) {
            incomingEdgesToRemove.insert(edge);
        }
    }
    for (auto edge : incomingEdgesToRemove) {
        incomingEdges.erase(edge);
    }
}

template <class T>
std::string DGNode<T>::toString() {
    std::string nodeStr;
    llvm::raw_string_ostream ros(nodeStr);
    theT->print(ros);
    ros.flush();
    return nodeStr;
}

template <>
inline std::string DGNode<Instruction>::toString() {
    std::string str;
    if (!theT) return "Empty Node";
    llvm::raw_string_ostream ros(str);
    //theT->print(ros << theT->getFunction()->getName() << " : ");
    return str;
}

//DGEdge<T> class method implemenations

template<class T, class SubT>
DGEdgeBase<T, SubT>::DGEdgeBase(const DGEdgeBase<T, SubT> &oldEdge) {
    auto nodePair = oldEdge.getNodePair();
    from = nodePair.first;
    to = nodePair.second;
    setMemMustType(oldEdge.isMemoryDependence(), oldEdge.isMustDependence(), oldEdge.getDataDependenceType());
    setControl(oldEdge.isControlDependence());
    setLoopCarried(oldEdge.isLoopCarriedDependence());
    setRemovable(oldEdge.isRemovableDependence());
    setSequence(oldEdge.isSeqDependence());
    for (auto edge : oldEdge.subEdges) {
        addSubEdge(edge);
    }
}

template<class T, class SubT>
std::string DGEdgeBase<T, SubT>::toString() {
    if (this->subEdges.size() > 0) {
        std::string str;
        llvm::raw_string_ostream ros(str);
        for (auto edge : this->subEdges) {
            ros << edge->toString();
        }
        return ros.str();
    }
    if (this->isControlDependence()) return "CTRL";
    std::string edgeStr;
    llvm::raw_string_ostream ros(edgeStr);
    ros << "^^^" << this->dataDepToString();
    ros << (must ? "(must)" : "(may)");
    ros << (memory ? "from memory" : " ");
    ros << (isLoopCarried ? " >LC" : " >No-LC");
    ros << "\n";
    ros.flush();
    return edgeStr;
}


template <class T>
llvm::raw_ostream & DG<T>::print(llvm::raw_ostream & o) {
    // errs() << "print-850\n";
    // o << "Total node count: " << allNodes.size() << "\n";
    // o << "Internal node count: " << internalNodeMap.size() << "\n";
    // for (auto pair : getInternalNodePairs()) 
    //     pair.second->print(o) << "\n";
    // o << "External node count: " << externalNodeMap.size() << "\n";
    // for (auto pair : getExternalNodePairs()) 
    //     pair.second->print(o) << "\n";
    o << "Edge count: " << allEdges.size() << "\n";
    for (auto edge : allEdges) 
        edge->print(o) << "\n";
    return o;
}

template <class T, class SubT>
llvm::raw_ostream & DGEdgeBase<T, SubT>::print(llvm::raw_ostream &stream, std::string linePrefix) {
    from->print(stream << linePrefix << "From:\t") << "\n";
    to->print(stream << linePrefix << "To:\t") << "\n";
    stream << linePrefix << this->toString();
    return stream;
}

template <class T>
llvm::raw_ostream & DGNode<T>::print(llvm::raw_ostream &O) {
    theT->print(O);
    return O;
} 


#endif
