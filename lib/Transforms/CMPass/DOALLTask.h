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

    bool doesOriginalLiveOutHaveManyClones (Instruction *I) const ;

    std::unordered_set<Instruction *> getClonesOfOriginalLiveOut (Instruction *I) const ;

    void addLiveOut (Instruction *original, Instruction *internal) ;

    void removeLiveOut (Instruction *original, Instruction *removed) ;

private:
    uint32_t ID;
    Function * F;

};

#endif