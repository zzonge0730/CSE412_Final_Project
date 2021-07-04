#ifndef DOALLTASK_H
#define DOALLTASK_H


#include "SCCDAGAttrs.h"

class DOALLTask {
public:
    DOALLTask(uint32_t ID, FunctionType * funcType, Module& M);

    uint32_t getID(void) const;

    Value * getTaskInstanceID(void) const;

    //Live-in values
    bool isAnOriginalLiveIn (Value *v) const ;

    Value * getCloneOfOriginalLiveIn (Value *o) const ;

    std::unordered_set<Value *> getOriginalLiveIns (void) const ;

    void addLiveIn (Value *original, Value *internal) ;

    void removeLiveIn (Instruction *original);

    //Live-out instructions
    bool doesOriginalLiveOutHaveManyClones (Instruction *I) const ;

    std::unordered_set<Instruction *> getClonesOfOriginalLiveOut (Instruction *I) const ;

    void addLiveOut (Instruction *original, Instruction *internal) ;

    void removeLiveOut (Instruction *original, Instruction *removed) ;

    //Instructions
    bool isAnOriginalInstruction (Instruction *i) const ;

    bool isAClonedInstruction (Instruction *i) const ;

    Instruction * getCloneOfOriginalInstruction (Instruction *o) const ;

    void addInstruction (Instruction *original, Instruction *internal) ;

    std::unordered_set<Instruction *> getOriginalInstructions (void) const ;

    Instruction * cloneAndAddInstruction (Instruction *original);

    void removeOriginalInstruction (Instruction *o);

    //BasicBlocks
    bool isAnOriginalBasicBlock (BasicBlock *o) const ;

    BasicBlock * getCloneOfOriginalBasicBlock (BasicBlock *o) const ;

    std::unordered_set<BasicBlock *> getOriginalBasicBlocks (void) const ;

    void addBasicBlock (BasicBlock *original, BasicBlock *internal) ;

    BasicBlock * addBasicBlockStub (BasicBlock *original);

    BasicBlock * cloneAndAddBasicBlock (BasicBlock *original);

    BasicBlock * cloneAndAddBasicBlock (BasicBlock *original, std::function<bool (Instruction *origInst)> filter);

    void removeOriginalBasicBlock (BasicBlock *b);

    BasicBlock * getEntry (void) const ;

    BasicBlock * getExit (void) const ;

    uint32_t getNumberOfLastBlocks (void) const ;

    BasicBlock * getLastBlock (uint32_t blockID) const ;

    void tagBasicBlockAsLastBlock (BasicBlock *b) ;

    //Body
    Function * getTaskBody (void) const ;

    //Dependences with the outside code
    Value * getEnvironment (void) const ;

    void extractFuncArgs();

    Value *chunkSizeArg, *coreArg, *numCoresArg;

private:
    uint32_t ID;
    Function * F;

};

#endif