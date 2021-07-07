#ifndef HOT_H
#define HOT_H

#include "SCC.h"
#include "LoopStructure.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"

class Hot {
public:

    Hot ();

    bool isAvailable (void) const ;

    /*
    * =========================== Instructions ================================
    */
    uint64_t getStaticInstructions (Instruction *i) const ;
    
    bool hasBeenExecuted (Instruction *i) const ;

    uint64_t getInvocations (Instruction *i) const ;

    uint64_t getSelfInstructions (Instruction *i) const ;

    uint64_t getTotalInstructions (Instruction *i) const ;


    /*
    * =========================== Basic blocks ================================
    */
    uint64_t getStaticInstructions (BasicBlock *bb) const ;

    uint64_t getStaticInstructions (
    BasicBlock *bb, 
    std::function<bool (Instruction *i)> canIConsiderIt
    ) const ;

    bool hasBeenExecuted (BasicBlock *bb) const ;

    uint64_t getInvocations (BasicBlock *bb) const ;

    uint64_t getSelfInstructions (BasicBlock *bb) const ;

    uint64_t getTotalInstructions (BasicBlock *bb) const ;

    void setBasicBlockInvocations (BasicBlock *bb, uint64_t invocations);


    /*
    * =========================== SCC  ========================================
    */

    uint64_t getSelfInstructions (SCC *scc) const ;

    uint64_t getTotalInstructions (SCC *scc) const ;


    /*
    * =========================== Loops =======================================
    */
    
    uint64_t getStaticInstructions (LoopStructure *l) const ;

    uint64_t getStaticInstructions (
    LoopStructure *l,
    std::function<bool (Instruction *i)> canIConsiderIt
    ) const ;

    /*
    * Return the number of times the loop @l has been executed.
    */
    uint64_t getInvocations (LoopStructure *l) const ;

    /*
    * Return the total number of iterations executed by @l among all its invocations.
    */
    uint64_t getIterations (LoopStructure *l) const ;

    /*
    * Return the total number of instructions executed excluding the instructions executed by the callees.
    */
    uint64_t getSelfInstructions (LoopStructure *loop) const ;

    /*
    * Return the total number of instructions executed including the instructions executed by the callees.
    */
    uint64_t getTotalInstructions (LoopStructure *loop) const ;

    /*
    * Return the coverage of @loop
    *
    * @return Between 0 and 1
    */
    double getDynamicTotalInstructionCoverage (LoopStructure *loop) const ;

    double getAverageTotalInstructionsPerInvocation (LoopStructure *loop) const ;

    double getAverageLoopIterationsPerInvocation (LoopStructure *loop) const ;

    double getAverageTotalInstructionsPerIteration (LoopStructure *loop) const ;

    /*
    * =========================== Functions ==================================
    */
    
    uint64_t getStaticInstructions (Function *f) const ;

    uint64_t getStaticInstructions (
    Function *f,
    std::function<bool (Instruction *i)> canIConsiderIt
    ) const ;

    bool hasBeenExecuted (Function *f) const ;

    uint64_t getInvocations (Function *f) const ;

    uint64_t getSelfInstructions (Function *f) const ;

    uint64_t getTotalInstructions (Function *f) const ;

    double getDynamicTotalInstructionCoverage (Function *f) const ;


    /*
    * =========================== Module ======================================
    */

    bool hasBeenExecuted (void) const ;

    bool getInvocations (void) const ;

    uint64_t getSelfInstructions (void) const ;

    uint64_t getTotalInstructions (void) const ;


    /*
    * =========================== Branches ====================================
    */
    double getBranchFrequency (BasicBlock *sourceBB, BasicBlock *targetBB) const ;

    void setBranchFrequency (BasicBlock *src, BasicBlock *dst, double branchFrequency);


    void computeProgramInvocations (Module &M);

private:
    std::unordered_map<BasicBlock *, std::unordered_map<BasicBlock *, double>> branchProbability;
    std::unordered_map<BasicBlock *, uint64_t> bbInvocations;
    std::unordered_map<Function *, uint64_t> functionInvocations;
    std::unordered_map<Function *, uint64_t> functionSelfInstructions;
    std::unordered_map<Function *, uint64_t> functionTotalInstructions;
    std::unordered_map<Instruction *, uint64_t> instructionTotalInstructions;
    uint64_t moduleNumberOfInstructionsExecuted;

    void computeTotalInstructions (Module &M); 

    void computeTotalInstructions (Function &F, std::unordered_map<Function *, bool> &evaluationStack);

    void setFunctionTotalInstructions (Function *f, uint64_t totalInstructions) ;

    bool isFunctionTotalInstructionsAvailable (Function &F) const ;
};

#endif