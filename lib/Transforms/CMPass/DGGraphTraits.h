#ifndef DGGRAPHTRAITS_H
#define DGGRAPHTRAITS_H

#include "DGBase.h"

#include "llvm/Support/raw_ostream.h"

#include <unordered_map>
#include <iterator>
#include <vector>
#include <set>

using namespace llvm;

template <class DG, class T>
class DGGraphWrapper {
    public:
    DGGraphWrapper (DG *graph) : wrappedGraph{graph}, entryNode{nullptr} {
        std::unordered_map<DGNode<T> *, DGNodeWrapper<T> *> nodeToWrapperMap;
        for (auto node : graph->getNodes()) {
            auto wrappedNode = new DGNodeWrapper<T>(node);
            this->nodes.insert(wrappedNode);
            nodeToWrapperMap.insert(std::make_pair(node, wrappedNode));
        }

        auto unwrappedEntryNode = graph->getEntryNode();
        if (nodeToWrapperMap.find(unwrappedEntryNode) != nodeToWrapperMap.end()) {
            this->entryNode = nodeToWrapperMap.at(unwrappedEntryNode);
        }

        for (auto node : this->nodes) {
            auto wrapped = node->wrappedNode;
            std::set<DGEdge<T> *> allOutgoingEdges{wrapped->begin_outgoing_edges(), wrapped->end_outgoing_edges()};
            for (auto edge : allOutgoingEdges) {
                auto unwrappedOtherNode = edge->getIncomingNode();
                if (nodeToWrapperMap.find(unwrappedOtherNode) != nodeToWrapperMap.end()) {
                    auto wrappedOtherNode = nodeToWrapperMap.at(unwrappedOtherNode);
                    node->outgoingNodeInstances.push_back(wrappedOtherNode);
                    node->outgoingEdgeInstances.push_back(edge);
                }
            }   
        }
    }

    ~DGGraphWrapper () {
        for (auto node : this->nodes) delete node;
        this->nodes.clear();
    }

    using NodeRef = DGNodeWrapper<T> *;
    using ChildIteratorType = typename std::vector<NodeRef>::iterator;
    using nodes_iterator = typename std::unordered_set<NodeRef>::iterator;

    nodes_iterator nodes_begin() { return nodes.begin(); }

    nodes_iterator nodes_end() { return nodes.end(); }

    DG *wrappedGraph;
    NodeRef entryNode;
    std::unordered_set<NodeRef> nodes;
};

template <class T>
class DGNodeWrapper {
    public:
    DGNodeWrapper (DGNode<T> *node) : wrappedNode{node} {}

    void print(raw_ostream &ros) {
        wrappedNode->print(ros);
    }

    using NodeRef = DGNodeWrapper<T> *;
    using ChildIteratorType = typename std::vector<NodeRef>::iterator;

    ChildIteratorType child_begin() { return outgoingNodeInstances.begin(); }

    ChildIteratorType child_end() { return outgoingNodeInstances.end(); }

    DGNode<T> *wrappedNode;
    std::vector<NodeRef> outgoingNodeInstances;
    std::vector<DGEdge<T> *> outgoingEdgeInstances;
};

#endif