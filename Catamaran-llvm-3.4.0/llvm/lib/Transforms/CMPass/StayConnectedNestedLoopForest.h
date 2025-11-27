#ifndef STAYCONNECTEDNESTEDLOOPFOREST_H
#define STAYCONNECTEDNESTEDLOOPFOREST_H

#include "LoopStructure.h"
#include "DominatorSummary.h"

#include <unordered_set>
#include <vector>
#include <unordered_map>


class StayConnectedNestedLoopForest ;

  class StayConnectedNestedLoopForestNode {
    public:
      StayConnectedNestedLoopForestNode (StayConnectedNestedLoopForest *f, LoopStructure *l);

      StayConnectedNestedLoopForestNode (StayConnectedNestedLoopForest *f, LoopStructure *l, StayConnectedNestedLoopForestNode *parent);

      LoopStructure * getLoop (void) const ;

      StayConnectedNestedLoopForestNode * getParent (void) const ;

      std::unordered_set<StayConnectedNestedLoopForestNode *> getDescendants (void) const ;

      bool visitPreOrder (
        std::function<bool (StayConnectedNestedLoopForestNode *n, uint32_t treeLevel)> funcToInvoke
        ) ;

      bool visitPostOrder (
        std::function<bool (StayConnectedNestedLoopForestNode *n, uint32_t treeLevel)> funcToInvoke
        ) ;

      ~StayConnectedNestedLoopForestNode();

    private:
      friend class StayConnectedNestedLoopForest ;
      StayConnectedNestedLoopForest *forest;
      LoopStructure *loop;
      StayConnectedNestedLoopForestNode *parent;
      std::unordered_set<StayConnectedNestedLoopForestNode *> descendants;

      bool visitPreOrder (std::function<bool (StayConnectedNestedLoopForestNode *n, uint32_t treeLevel)> funcToInvoke, uint32_t treeLevel) ;
      bool visitPostOrder (std::function<bool (StayConnectedNestedLoopForestNode *n, uint32_t treeLevel)> funcToInvoke, uint32_t treeLevel) ;
  };

  class StayConnectedNestedLoopForest {
    public:
      StayConnectedNestedLoopForest (
        std::vector<LoopStructure *> const & loops, 
        std::unordered_map<Function *, DominatorSummary *> const &doms
        );

      std::set<StayConnectedNestedLoopForestNode *> getTrees (void) const ;

      void removeTree (StayConnectedNestedLoopForestNode *tree) ;
      
      void addTree (StayConnectedNestedLoopForestNode *tree) ;

      ~StayConnectedNestedLoopForest();

    private:
      std::unordered_map<LoopStructure *, StayConnectedNestedLoopForestNode *> nodes;
      std::set<StayConnectedNestedLoopForestNode *> trees;
      std::unordered_map<Function *, std::unordered_set<LoopStructure *>> functionLoops;
      std::unordered_map<BasicBlock *, StayConnectedNestedLoopForestNode *> headerLoops;

      void addChildrenToTree (
        StayConnectedNestedLoopForestNode *root, 
        std::unordered_map<Function *, DominatorSummary *> const &doms, 
        std::unordered_set<StayConnectedNestedLoopForestNode *> &potentialTrees
        );
  };

#endif