#ifndef LOOPFREETASK_H
#define LOOPFREETASK_H

#include <random>
#include "LoopDependenceInfo.h"
#include "DOALLTask.h"

class LoopFreeTask {

public:
    LoopFreeTask(uint32_t ID, Module *M);

    void transform();

    void setSafeCheckCodesForOneTask(std::vector<Instruction *> insts);
    void setInfo(std::set<Instruction *> safeCheckReleatedInsts);
    void setJoinPoint(Instruction * taskJP);
    void eraseSafeCheckCodes();
    void setJoinFunc(Constant * joinF);
    void setMergeDirection(int direction);
    void setCreatePt(Instruction * startPt);

private:
    uint32_t ID;
    uint32_t subID;
    Module * M;
    Instruction * taskJoinPoint;
    uint8_t mergedirection;//0 - no merge, 1 - backward, 2 - forward
    std::map<uint32_t, Constant *> ctors;
    Constant * joinFunc;
    std::mt19937 loopFreeSeed;
    void genCtorForSpawn(Function * wrapperFunc);
    std::vector<Value *> genSpawnArgs( std::vector<Instruction *> checksGroup, Function * wrapperFunc);
    std::vector<Instruction *> safeCheckCodeForOneTask;
    std::set<Instruction *> safeCheckInstsInNonLoopBody;
    std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckCallInstJoinPoints;

    std::vector<Instruction *> safeCheckVector;
    Instruction * multiCheckStartPt;

    void SafeCheckTobeMerged();

};


#endif