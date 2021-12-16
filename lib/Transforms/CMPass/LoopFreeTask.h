// #ifndef LOOPFREETASK_H
// #define LOOPFREETASK_H

// class LoopFreeTask {

// public:
//     LoopFreeTask(uint32_t ID, Module *M);

//     void transform();

//     void setSafeCheckCodesForOneTask(std::unordered_set<Instruction *> insts);
//     void setInfo(std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckBody, std::unordered_map<Instruction *, std::set<Instruction *>> joinPoints ,
//     std::unordered_map<Instruction *, std::set<Instruction *>> range);
//     void setJoinPoint(Instruction * taskJP);
//     void setTargetBB(BasicBlock * BB);
//     void eraseSafeCheckCodes();
//     void setJoinFunc(Constant * joinF);

// private:
//     uint32_t ID;
//     uint32_t subID;
//     Module * M;
//     Instruction * taskJoinPoint;
//     BasicBlock * targetBB;
    //    std::map<uint32_t, Constant *> ctors;
    //    Constant * joinFunc;
        // std::mt19937 loopFreeSeed;
    //         void genCtorForSpawn(Function * wrapperFunc);
    // std::vector<Value *> genSpawnArgs( std::vector<Instruction *> checksGroup, Function * wrapperFunc);
//     std::unordered_set<Instruction *> safeCheckCodeForOneTask;
//     std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsInNonLoopBody;
//     std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckCallInstJoinPoints;
//     std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsMoveRange;
//     std::vector<Instruction *> safeCheckVector;

//     std::vector<Instruction *> enumerateAndChooseMax();


// };


// #endif