#ifndef SCC_H
#define SCC_H

#include <functional>
#include "DGBase.h"
/*
    * Strongly Connected Component
    */
class SCC : public DG<Value> {
public:

    /*
    * Constructors.
    */
    SCC (std::set<DGNode<Value> *> internalNodes) ;
    SCC (std::set<DGNode<Value> *> internalNodes, std::set<DGNode<Value> *> externalNodes) ;

    /*
    * Iterate over values inside the SCC until @funcToInvoke returns true or no other one exists.
    */
    bool iterateOverValues (std::function<bool (Value *)> funcToInvoke);

    /*
    * Iterate over all values (internal and external) until @funcToInvoke returns true or no other value exists.
    * External nodes represent live-ins and live-outs of the SCC.
    */
    bool iterateOverAllValues (std::function<bool (Value *)> funcToInvoke);

    /*
    * Iterate over instructions inside the SCC until @funcToInvoke returns true or no other instruction exists.
    */
    bool iterateOverInstructions (std::function<bool (Instruction *)> funcToInvoke);

    /*
    * Iterate over all instructions (internal and external) until @funcToInvoke returns true or no other instruction exists.
    * External nodes represent live-ins and live-outs of the SCC.
    */
    bool iterateOverAllInstructions (std::function<bool (Instruction *)> funcToInvoke);

    /*
    * Check if the SCC has cycles in it.
    */
    bool hasCycle (bool ignoreControlDep = false) ;

    /*
    * Return the number of instructions that compose the SCC.
    */
    int64_t numberOfInstructions (void) const ;

    /*
    * Print
    */
    raw_ostream &print (raw_ostream &stream, std::string prefixToUse = "", int maxEdges = 15) ;

    /*
    * Print
    */
    raw_ostream &printMinimal (raw_ostream &stream, std::string prefixToUse = "") ;

    /*
    * Deconstructor.
    */
    ~SCC() ;

private:
    void copyNodesAndEdges (std::set<DGNode<Value> *> internalNodes, std::set<DGNode<Value> *> externalNodes) ;
};

template<> 
class DGEdge<SCC> : public DGEdgeBase<SCC, Value> {
    public:
        DGEdge(DGNode<SCC> *src, DGNode<SCC> *dst) : DGEdgeBase<SCC, Value>(src, dst) {}
        DGEdge(const DGEdge<SCC> &oldEdge) : DGEdgeBase<SCC, Value>(oldEdge) {}
};

#endif