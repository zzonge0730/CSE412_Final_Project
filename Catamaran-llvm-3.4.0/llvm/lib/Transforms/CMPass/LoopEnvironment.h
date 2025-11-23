#ifndef LOOPENVIROMENT_H
#define LOOPENVIROMENT_H

#include "PDG.h"
#include "PDGAnalysis.h"

#include "llvm/IR/BasicBlock.h"
#include "llvm/ADT/iterator_range.h"
#include "llvm/IR/Value.h"

#include <vector>
#include <iterator>
#include <set>
#include <unordered_map>

using namespace llvm;

class LoopEnvironment {
public:
    LoopEnvironment(PDG * pdg, std::vector<BasicBlock *>& exitBlocks);

    LoopEnvironment() = delete;

    iterator_range<std::vector<Value *>::iterator> getProducers(void);
    iterator_range<std::set<int>::iterator> getEnvIndicesOfLiveInVars(void);
    iterator_range<std::set<int>::iterator> getEnvIndicesOfLiveOutVars(void);

    uint64_t size(void) const;

    int64_t indexOfExitBlockTaken(void) const;

    Type * typeOfEnviromentLocation(uint64_t index) const;

    bool isLiveIn(Value * val) const;

    Value * producerAT(uint64_t index) const;

    std::set<Value *> consumersOf(Value * producer) const; 

    uint64_t addLiveInValue(Value * newLiveInValue, const std::unordered_set<Instruction *>& consumers);

    bool isProducer(Value * producer) const;

private:
    uint64_t addLiveInProducer(Value *producer);
    uint64_t addProducer(Value *producer, bool liveIn);
    void addLiveOutProducer(Value * producer);
    int indexOfProducer(Value * producer);

    std::vector<Value *> envProducers;
    std::unordered_map<Value *, int> producerIndexMap;
    std::unordered_map<Value *, std::set<Value *>> prodConsumers;

    std::set<int> liveInIndices;
    std::set<int> liveOutIndices;

    bool hasExitBlockEnv;
    Type * exitBlockType;

};

#endif