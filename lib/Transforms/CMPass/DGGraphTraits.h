#ifndef DGGRAPHTRAITS_H
#define DGGRAPHTRAITS_H

#include "DGBase.h"
#include "SCC.h"
#include "PDG.h"
#include "SCCDAG.h"

#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/GraphTraits.h"

#include <unordered_map>
#include <iterator>
#include <vector>
#include <set>
#include <string>
#include <utility>

using namespace llvm;


    template <class T>
    class DGElementWrapper {
      public:
        DGElementWrapper(T elem) : element{elem} {};

        void print(llvm::raw_ostream &ros) {
          ros << element;
        }

      private:
        T element;
    };
    using DGString = DGElementWrapper<std::string>;

    template <class T> class DGNodeWrapper ;

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
          if (unwrappedEntryNode && nodeToWrapperMap.find(unwrappedEntryNode) != nodeToWrapperMap.end()) {
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

        using NodeType = DGNodeWrapper<T> ;
        using ChildIteratorType = typename std::vector<NodeType*>::iterator;
        using nodes_iterator = typename std::unordered_set<NodeType*>::iterator;

        nodes_iterator nodes_begin() { return nodes.begin(); }

        nodes_iterator nodes_end() { return nodes.end(); }

        DG *wrappedGraph;
        NodeType* entryNode;
        std::unordered_set<NodeType*> nodes;
    };

    template <class T>
    class DGNodeWrapper {
      public:
        DGNodeWrapper (DGNode<T> *node) : wrappedNode{node} {}

        void print(llvm::raw_ostream &ros) {
          wrappedNode->print(ros);
        }

        using NodeType = DGNodeWrapper<T> ;
        using ChildIteratorType = typename std::vector<NodeType*>::iterator;

        ChildIteratorType child_begin() { return outgoingNodeInstances.begin(); }

        ChildIteratorType child_end() { return outgoingNodeInstances.end(); }

        DGNode<T> *wrappedNode;
        std::vector<NodeType*> outgoingNodeInstances;
        std::vector<DGEdge<T> *> outgoingEdgeInstances;
    };

    /*
    * GraphTraitsBase template
    */

    template<class DGWrapper, class NodeTypeT>
    struct GraphTraitsBase {
      using NodeType = NodeTypeT ;
      using ChildIteratorType = typename std::vector<NodeType*>::iterator;
      using nodes_iterator = typename std::unordered_set<NodeType*>::iterator;

      static NodeType* getEntryNode(const DGWrapper * dg) { return dg->entryNode; }

      static nodes_iterator nodes_begin(DGWrapper *dg) { return dg->nodes_begin(); }

      static nodes_iterator nodes_end(DGWrapper *dg) { return dg->nodes_end(); }

      static ChildIteratorType child_begin(NodeType* node) { return node->child_begin(); }

      static ChildIteratorType child_end(NodeType* node) { return node->child_end(); }
    };

  /*
  * Specializations for GraphTraits using GraphTraitsBase 
  */
namespace llvm {
  template<> struct GraphTraits<DGGraphWrapper<PDG, Value> *> : 
    public GraphTraitsBase<DGGraphWrapper<PDG, Value>, DGNodeWrapper<Value>> {};
}



#endif