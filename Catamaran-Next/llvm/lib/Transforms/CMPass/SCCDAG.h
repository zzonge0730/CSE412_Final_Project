#ifndef SCCDAG_H
#define SCCDAG_H

#include "PDG.h"
// LLVM 14: PDGAnalysis는 레거시 PassManager를 사용하므로 임시로 forward declaration만 사용
// #include "PDGAnalysis.h"
class PDGAnalysis; // Forward declaration
#include "SCC.h"

#include "llvm/ADT/SCCIterator.h"
#include "llvm/IR/Value.h"

#include "BitMatrix.h"

/*
* SCCDAG of a loop.
*/
class SCCDAG : public DG<SCC> {
public:

    /*
    * Constructor.
    */
    SCCDAG (PDG *loopDependenceGraph) ;

    /*
    * Check if @inst is included in the SCCDAG.
    */
    bool doesItContain (Instruction *inst) const ;

    /*
    * Return the number of instructions that compose the SCCDAG.
    */
    int64_t numberOfInstructions (void) ;

    /*
    * Iterate over SCCs until @funcToInvoke returns true or no other SCC exists.
    */
    bool iterateOverSCCs (std::function<bool (SCC *)> funcToInvoke);

    /*
    * Return the range that includes all SCCs.
    */
    std::unordered_set<SCC *> getSCCs (void) ;

    /*
    * Iterate over instructions inside the SCCDAG until @funcToInvoke returns true or no other instruction exists.
    */
    bool iterateOverInstructions (std::function<bool (Instruction *)> funcToInvoke);

    /*
    * Iterate over live-ins and live-outs of the loop represented by the SCCDAG until @funcToInvoke returns true or no other live-in and live-out exist.
    */
    bool iterateOverLiveInAndLiveOut (std::function<bool (Value *)> funcToInvoke);

    /*
    * Iterate over all instructions (internal and external) until @funcToInvoke returns true or no other instruction exists.
    * External nodes represent live-ins and live-outs of the loop represented by the SCCDAG.
    */
    bool iterateOverAllInstructions (std::function<bool (Instruction *)> funcToInvoke);

    /*
    * Iterate over all values (internal and external) until @funcToInvoke returns true or no other value exists.
    * External values represent live-ins and live-outs of the loop represented by the SCCDAG.
    */
    bool iterateOverAllValues (std::function<bool (Value *)> funcToInvoke);

    /*
    * Merge SCCs of @sccSet to become a single node of the SCCDAG.
    */
    void mergeSCCs (std::set<DGNode<SCC> *> &sccSet);

    /*
    * Return the SCC that contains @val
    */
    SCC * sccOfValue (Value *val) const;

    /*
    * Define a collection of SCCs type.
    */
    typedef std::vector<SCC *> SCCSet;

    /*
    * Compute ordering between nodes of the SCCDAG.
    */
    bool orderedBefore (const SCC *earlySCC, const SCCSet &lates) const;
    bool orderedBefore (const SCCSet &earlies, const SCC *lateSCC) const;
    bool orderedBefore (const SCC *earlySCC, const SCC *lateSCC) const;

    /*
    * Get the index of a node of the SCCDAG.
    */
    uint32_t getSCCIndex (const SCC *scc) const;

    /*
    * Deconstructor.
    */
    ~SCCDAG() ;

protected:
    void markValuesInSCC (void);
    void markEdgesAndSubEdges (void);

    std::unordered_map<Value *, DGNode<SCC> *> valueToSCCNode;

private:

    /*
    * BitMatrix for keeping the topological order of the SCCDAG nodes.
    */
    BitMatrix ordered;

    /*
    * ordered_dirty is true if the ordering of SCCDAG nodes is invalid.
    */
    bool orderedDirty;

    // SCC nodes to Ids map.
    std::unordered_map<const SCC *, uint32_t> sccIndexes;

    /*
    * Compute transitive dependences between nodes of the SCCDAG.
    */
    void computeReachabilityAmongSCCs(void);
};

#endif