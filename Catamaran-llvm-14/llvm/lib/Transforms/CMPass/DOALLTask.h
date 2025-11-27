#ifndef DOALLTASK_H
#define DOALLTASK_H

#include <random>
#include "SCCDAGAttrs.h"
#include "LoopDependenceInfo.h"
#include "llvm/IR/IntrinsicInst.h"

class DOALLTask {
public:
    DOALLTask(uint32_t ID, FunctionType * funcType, Module * M);

    uint32_t getID(void) const;


    //Live-in values
    bool isAnOriginalLiveIn (Value *v) const ;

    Value * getCloneOfOriginalLiveIn (Value *o) const ;

    void addLiveIn (Value *original, Value *internal) ;

    void removeLiveIn (Instruction *original);

    //Live-out instructions

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

    //Body
    Function * getTaskBody (void) const ;

    //Dependences with the outside code
    Value * getEnvironment (void) const ;

    Value *chunkSizeArg, *coreArg, *numCoresArg;
    Value * envArg, *instanceIndexV;

    void setLoopHeader(BasicBlock * loopH);
    void setWhereToInsertFunc(Instruction * inst);
    void addLiveInVar(Value * liveIn);
    void setSafeCheckInstsNoInLoopBody(std::unordered_set<Instruction *> checkInsts);
    void setSafeCheckInstsInLoopBody(std::unordered_map<Instruction *, std::set<Instruction *>> safecodes);
    void setAllInstsToOneCallInstInLoopBody(std::unordered_map<Instruction *, std::set<Instruction *>> allinsts);    
    bool isOriginalLiveInVar(Value * v);
    void clearClones();
    void setLiveInInitVal(std::unordered_map<Value *, Value *> initMap);
    void eraseSafeCheckCodes();
    void setLDI(LoopDependenceInfo * LDI);
    void splitLoop();
    void setOldLoopBody(std::unordered_set<BasicBlock *> oldBBs);
    void setBrInstRelated(std::unordered_set<Instruction *> instSet);
    void setBitCastLiveInVarRelated(std::unordered_map<Value *, std::unordered_set<Instruction *>> bitcastMap);
    void setJoinFunc(Constant * joinF);
    void setJoinPoints(std::unordered_set<Instruction *> joinPoints);
    void setDoNotParallelCodes(std::unordered_map<Instruction *, std::set<Instruction *>> codes);


private:
    uint32_t ID;
    Function * F;
    Module * M;

    //one-to-one mapping between the original live in value and a pointer
    //to the environment where that original live in values is stored for use by the task
    std::unordered_map<Value *, Value *> liveInClones;


    std::unordered_map<Instruction*, std::unordered_set<Instruction*>> liveOutClones;

    //one-to-one mapping between the original loop's structure and the task's cloned loop structure
    std::unordered_map<BasicBlock *, BasicBlock *> basicBlockClones;
    std::unordered_map<Instruction*, Instruction*> instructionClones;

    BasicBlock * entryBlock; // loop preheader, directly jump to loop header
    BasicBlock * exitBlock; //loopExit --- ret void

    std::vector<BasicBlock *> lastBlocks;

    BasicBlock * loopHeader;
    BasicBlock * newLoopHeader;
    // BasicBlock * loopLatch;
    // BasicBlock * newLoopLatch;
    Instruction * whereToInsertFunc;
    std::unordered_set<Instruction *> notInLoopBody;
    std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsInLoopBody;
    std::unordered_map<Instruction *, std::set<Instruction *>> allInstsToOneCallInstInLoopBody;
    std::unordered_set<BasicBlock *> oldLoopBody;
    // std::unordered_set<Instruction *> cmpInstRelated;
    std::unordered_set<Instruction *> brInstRelated;
    std::unordered_map<Value *, std::unordered_set<Instruction *>> bitcastLiveInVarRelated;
    BasicBlock * newLoopBody;

    std::vector<Value *> liveInVars;
    std::map<uint32_t, Constant *> ctors;
    Constant * joinFunc;
    std::unordered_set<Instruction *> joinPoints;

    std::unordered_map<Value *, Value *> liveInInitValue;
    LLVMContext& getTaskLLVMContext(void) const;

    void genCtorForSpawn(Module * M, Function * wrapperFunc);
    std::vector<Value *> genSpawnArgs(Module * M, Function * wrapperFunc);

    std::mt19937 loopSeed;

    LoopDependenceInfo * LDI;

    bool instIsInLoopBody(Instruction * inst);
    bool instIsInAllInstsToOneCall(Instruction * inst);
    bool instIsInBrInstRelated(Instruction * inst);

    bool hasStoreInstInNewLoopBody(Value * liveIn);
    bool liveInNeedACMem(Value * liveIn);
    bool isLocalVarLiveIn(Value * liveIn);
    bool usedByLLVMIntrinsic(Value * V);
    bool phiCornerCase(Instruction * inst, BasicBlock * bb);
    bool succIsPHIBB(BasicBlock * BB);  
    bool isOriginalInst(Instruction * inst);

    std::unordered_map<Instruction *, std::set<Instruction *>> doNotParallelCodes;
    bool isDoNotParallelCodes(Instruction * inst);
    bool IsForRelated(Instruction * inst);
};

#endif