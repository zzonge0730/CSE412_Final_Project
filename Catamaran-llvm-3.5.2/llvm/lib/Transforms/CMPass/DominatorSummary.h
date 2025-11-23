#ifndef DOMINATORSUMMARY_H
#define DOMINATORSUMMARY_H

#include "llvm/IR/BasicBlock.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/IR/Dominators.h"
#include "llvm/Support/raw_ostream.h"

#include <set>
#include <unordered_map>
#include <vector>


using namespace llvm;

namespace DTAliases {
    using Node = DomTreeNodeBase<BasicBlock>;
}

class DomNodeSummary {
public:
    DomNodeSummary (const DTAliases::Node &node);
    DomNodeSummary (const DomNodeSummary &node);

    BasicBlock *getBlock (void) const ;
    DomNodeSummary *getParent (void) ;
    std::vector<DomNodeSummary *> getChildren (void) ;
    //unsigned getLevel (void) const ;
    DomNodeSummary *getIDom (void) ;

    raw_ostream &print (raw_ostream &stream, std::string prefixToUse = "") ;

    friend class DomTreeSummary;

private:
    BasicBlock *B;
    unsigned level;

    DomNodeSummary *parent;
    std::vector<DomNodeSummary *> children;
    DomNodeSummary *iDom;
};

class DomTreeSummary {
public:
    DomTreeSummary (DominatorTree &DT);
    DomTreeSummary (PostDominatorTree &PDT);
    DomTreeSummary (DomTreeSummary &DTS, std::set<BasicBlock *> &bbSubset);
    ~DomTreeSummary ();

    void transferToClones (std::unordered_map<BasicBlock *, BasicBlock *> &bbCloneMap);
    raw_ostream &print (raw_ostream &stream, std::string prefixToUse = "") const ;

private:
    DomTreeSummary (std::set<DTAliases::Node *> nodes);
    DomTreeSummary (std::set<DomNodeSummary *> nodesSubset);

    template <typename TreeType>
    std::set<DTAliases::Node *> collectNodesOfTree (TreeType &T);
    std::set<DomNodeSummary *> filterNodes (
        std::set<DomNodeSummary *> &nodes,
        std::set<BasicBlock *> &bbSubset
    );

    template <typename NodeType>
    void cloneNodes (std::set<NodeType *> &nodes);

public:
    DomNodeSummary *getNode (BasicBlock *B) const ;
    bool dominates (Instruction *I, Instruction *J) const ;
    bool dominates (BasicBlock *B1, BasicBlock *B2) const ;
    bool dominates (DomNodeSummary *node1, DomNodeSummary *node2) const ;
    std::set<DomNodeSummary *> dominates (DomNodeSummary *node) const ;
    BasicBlock *findNearestCommonDominator (BasicBlock *B1, BasicBlock *B2) const ;
    DomNodeSummary *findNearestCommonDominator (DomNodeSummary *node1, DomNodeSummary *node2) const ;

private:
    std::set<DomNodeSummary *> nodes;
    std::unordered_map<BasicBlock *, DomNodeSummary *> bbNodeMap;
    bool post;
};

class DominatorSummary {
public:
    DominatorSummary (DominatorTree &DT, PostDominatorTree &PDT);
    DominatorSummary (DominatorSummary &DS, std::set<BasicBlock *> &bbSubset);

    void transferSummaryToClones (std::unordered_map<BasicBlock *, BasicBlock *> &bbCloneMap);

    DomTreeSummary DT, PDT;
};

#endif