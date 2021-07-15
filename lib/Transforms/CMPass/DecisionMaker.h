#ifndef DECISION_MAKER_H
#define DECISION_MAKER_H

#include "PDG.h"
#include "PDGAnalysis.h"
#include "IdentifyPass.h"
#include "llvm/Analysis/CallGraphSCCPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/LoopInfo.h"

#include "llvm/Pass.h"

#include "llvm/Support/raw_ostream.h"

#include <iterator>
#include <utility>

using namespace llvm;

// find join points

// find DOALL

// make decisions to get profitable join points

// assume that each DOALL is profitable

struct FuncStatus {
    uint64_t numOfInst; // the number of IR instructions in the function 
    uint64_t numOfEmittingInst; // the number of emit code (not BitCast or Phi)
    uint64_t numOfMemAccess; // the number of loads/stores
    std::map<Function *, uint32_t> numofFuncCalls; // the number of callee function been called 
    uint64_t totalCost; // the insts of all and callees
    bool isSafeCheck;
    FuncStatus() : numOfInst(0), numOfEmittingInst(0), numOfMemAccess(0),
        totalCost(0), isSafeCheck(false) {}
    raw_ostream& print(raw_ostream & O) const;
};

class DecisionMaker : public ModulePass {
public:
    static char ID;
    DecisionMaker();
    virtual ~DecisionMaker();
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    void releaseMemory() override;
    bool runOnModule(Module &M) override;
    
    //  
    std::map<CallInst *, std::set<Instruction *>> getProfitableJoinPoints();
    //std::map<CallInst *, std::set<Instruction *>> getAllJoinPoints();
    std::set<Function*> getFuncToBeSpawned();

    typedef typename std::map<CallInst *, std::set<Instruction *>>::iterator join_iterator;

    join_iterator join_begin() {
        return profitableJoinPoints.begin();
    }

    join_iterator join_end() {
        return profitableJoinPoints.end();
    }

    std::vector<std::pair<std::set<CallInst *>, uint32_t>> getSafeCheckToBeMergedGroup();

private:
    //
    std::vector<std::pair<CallInst *, std::set<Instruction *>>> allJoinPoints;
    std::map<CallInst *, std::set<Instruction *>> profitableJoinPoints;
    std::set<Function *> funcToBeSpawned;

    std::map<Function *, FuncStatus> funcStatusMap;

    //safeCheckGroup - 0, means that latter check move forward
    //safeCheckGroup - 1, menas that former check move backward
    //safeCheckGroup - 2, init state
    //safeCheckGroup - 3, we can't move any thing
    std::vector<std::pair<std::set<CallInst *>, uint32_t>> safeCheckToBeMergedGroup;

    std::set<Instruction*> findAllJoinPoints(PDG * pdg, CallInst *CI, Function &F);
    //bool hasJoinPointInBlock(std::set<Instruction *> points, BasicBlock *);
    void processSCCForJoinPoints(PDG * pdg, CallGraphSCC &SCC);
    void processSCCForFuncStatusMap(CallGraphSCC &SCC);
    FuncStatus calculateFuncStatus(Function &F/*, LoopInfo &LI, ScalarEvolution &SE*/);

    FuncStatus *  getFuncStatus(Function &F);
    //void findAllProfitableJoinPoints(Function &F);

    //estimate cost between spawnable function and join points
    uint64_t getSafeCheckBetweenJoinPointCost(Function &, CallInst *, Instruction */*,LoopInfo &, ScalarEvolution &*/);
    
    uint64_t getSafeCheckBetweenSafeChecktCost(Function &, CallInst *, CallInst *);

    //need a profitabilty class to identify the cost of a function
    uint64_t getSafeCheckCost(CallInst * SafeCheck);

    //spawnable cost, is a constant variable ?
    uint64_t getSpawnableCost();

    uint32_t getDirection(PDG * pdg, Function &, CallInst *, CallInst *);

    // using join_iteratror = decltype(profitableJoinPoints.begin());
    // join_iterator join_begin() { return profitableJoinPoints.begin();}
    // join_iterator join_end() { return profitableJoinPoints.end();}

};



#endif