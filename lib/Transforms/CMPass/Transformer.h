#ifndef TRANSFORMER_H
#define TRANSFORMER_H

//generate multi-thread code based on DecisionMaker (create and joinPoints, DOALL)

#include "llvm/Support/raw_ostream.h"
#include "llvm/Pass.h"

#include <algorithm>
#include <random>
#include <map>
#include <vector>

#include "DecisionMaker.h"

using namespace llvm;

class Transformer : public ModulePass {
public:
    static char ID;
    Transformer();
    virtual ~Transformer();
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    void releaseMemory() override;
    bool runOnModule(Module &M) override;

private:
    void generateConstructorForSpawnableFunc(std::set<uint32_t> &arities, Module &M, uint32_t maxargs);
    void generateJoin(Module &M);
    void createThread(CallInst * CI, std::set<Instruction*> joinPoints, Function * spawnableFun);
    //void createJoin(std::set<Instruction*>& joinPoints, Value* id);
    void handleRetVal(CallInst * CI, AllocaInst * retVal);
    std::vector<Value *> genSpawnArgs(CallInst * CI, Function * spawnableF, AllocaInst * &retVal);

    Constant * join;
    std::map<uint32_t, Constant *> ctors;//constructors indexed by arity
    std::mt19937 seed;

};

#endif