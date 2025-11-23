#ifndef SCCATTRS_H
#define SCCATTRS_H

#include "llvm/IR/Instruction.h"

#include "SCC.h"
#include "AccumulatorOpInfo.h"
#include "LoopSummary.h"
#include "LoopVariables.h"

#include "MemoryCloningAnalysis.h"


#include <set>
#include <iterator>

using namespace llvm;

class SCCAttrs {
public:

    /*
    * Types.
    */
    enum SCCType {SEQUENTIAL, REDUCIBLE, INDEPENDENT};

    /*
    * Iterators.
    */
    typedef typename std::set<PHINode *>::iterator phi_iterator;
    typedef typename std::set<Instruction *>::iterator instruction_iterator;

    /*
    * Fields
    */
    std::set<Value *> stronglyConnectedDataValues;
    std::set<Value *> weaklyConnectedDataValues;

    std::set<std::pair<Value *, Instruction *>> controlPairs;

    /*
    * Constructor
    */
    SCCAttrs (
    SCC *s, 
    AccumulatorOpInfo &opInfo,
    LoopSummary &LIS
    );

    SCCAttrs () = delete ;

    ~SCCAttrs () ;

    /*
    * Get the SCC.
    */
    SCC * getSCC (void);

    /*
    * Return the type of SCC.
    */
    SCCType getType (void) const;

    /*
    * Return true if the iterations of the SCC must execute sequentially.
    * Return false otherwise.
    */
    bool mustExecuteSequentially (void) const ;

    /*
    * Return true if a reduction transformation can be applied to the SCC. 
    * Return false otherwise.
    */
    bool canExecuteReducibly (void) const ;

    /*
    * Return true if the iterations of the SCC are independent between each other.
    * Return false otherwise.
    */
    bool canExecuteIndependently (void) const ;

    /*
    * Return true if it is safe to clone the SCC.
    * Return false otherwise.
    */
    bool canBeCloned (void) const ;

    /*
    * Return true if cloning is possible through memory AllocaInst cloning
    */
    bool canBeClonedUsingLocalMemoryLocations (void) const;

    /*
    * Return true if the SCC exists because of updates of an induction variable.
    * Return false otherwise.
    */
    bool isInductionVariableSCC (void) const ;

    /*
    * Return true if the SCC is commutative
    * Return false otherwise.
    */
    bool isCommutative (void) const ;

    /*
    * Get the PHIs.
    */
    iterator_range<phi_iterator> getPHIs (void);

    /*
    * Check if the SCC contains a PHI instruction.
    */
    bool doesItContainThisPHI (PHINode *phi);

    /*
    * Return the single PHI if it exists. nullptr otherwise.
    */
    PHINode * getSinglePHI (void);

    /*
    * Return the single header PHI if it exists. nullptr otherwise.
    */
    PHINode * getSingleHeaderPHI (void);

    /*
    * Return the number of PHIs included in the SCC.
    */
    uint32_t numberOfPHIs (void);

    /*
    * Get the accumulators.
    */
    iterator_range<instruction_iterator> getAccumulators (void);

    /*
    * Return the single accumulator if it exists. nullptr otherwise.
    */
    Instruction * getSingleAccumulator (void);

    /*
    * Check if the SCC contains an accumulator.
    */
    bool doesItContainThisInstructionAsAccumulator (Instruction *inst);

    /*
    * Return the number of accumulators included in the SCC.
    */
    uint32_t numberOfAccumulators (void);

    /*
    * If only one loop carried variable is contained, return that variable
    */
    LoopCarriedVariable * getSingleLoopCarriedVariable (void) const ;

    /*
    * Add a loop carried cycle
    */
    void addLoopCarriedVariable (LoopCarriedVariable *variable) ;

    /*
    * Set the type of SCC.
    */
    void setType (SCCType t);

    /*
    * Set the SCC as created by updated of an induction variable.
    */
    void setSCCToBeInductionVariable (bool hasIV = true);

    /*
    * Set the SCC to be clonable.
    */
    void setSCCToBeClonable (bool isClonable = true);


    const std::pair<Value *, Instruction *> * getSingleInstructionThatControlLoopExit (void);

    void setSCCToBeClonableUsingLocalMemory (void) ;

    void addClonableMemoryLocationsContainedInSCC (std::unordered_set<const ClonableMemoryLocation *> locations) ;

    std::unordered_set<AllocaInst *> getMemoryLocationsToClone (void) const ;

private:
    SCC *scc;
    SCCType sccType;
    std::set<BasicBlock *> bbs;
    AccumulatorOpInfo accumOpInfo;
    std::set<Instruction *> controlFlowInsts;
    std::set<PHINode *> PHINodes;
    std::set<Instruction *> accumulators;
    std::set<PHINode *> headerPHINodes;
    std::unordered_set<LoopCarriedVariable *> loopCarriedVariables;

    std::unordered_set<const ClonableMemoryLocation *> clonableMemoryLocations;
    bool isSCCClonableIntoLocalMemory;

    bool isClonable;
    bool hasIV;
    bool commutative;

    void collectPHIsAndAccumulators (LoopStructure &LS);
    void collectControlFlowInstructions (void);
};
#endif