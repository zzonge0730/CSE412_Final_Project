#include "LoopEnvironment.h"
#include "llvm/IR/Instructions.h"

#include <unordered_set>

LoopEnvironment::LoopEnvironment(PDG * pdg, std::vector<BasicBlock *>& exitBlocks) {
    //initialize the enviroment of the loop
    for (auto nodeI : pdg->getExternalNodePairs()) {
        //fetch the live in/out variable
        auto externalNode = nodeI.second;
        auto externalValue = externalNode->getT();

        //determine whether the external node is a producer(i.e., live-in)
        bool isProducer = false;
        std::unordered_set<Instruction *> consumerOfLiveInValue;
        for (auto edge : externalNode->getOutgoingEdges()) {
            
            //memory and control dependences can be skipped as they do not dictate live-in values
            if (edge->isMemoryDependence() || edge->isControlDependence()) {
                continue;
            }
            //the current dependence from @externalNode to an instruction
            //within a loop means we have a new live-in value
            isProducer = true;

            //fetch the current consumer of the new live-in value
            auto consumerOfNewLiveIn = edge->getIncomingT();
            assert(isa<Instruction>(consumerOfNewLiveIn));
            auto consumerOfNewLiveIn_Inst = cast<Instruction>(consumerOfNewLiveIn);

            //add the current consumer of the new live-in we have just found
            consumerOfLiveInValue.insert(consumerOfNewLiveIn_Inst);
        }

        if (isProducer) {
            this->addLiveInValue(externalValue, consumerOfLiveInValue);
        }

        //determine whether the external value is a consumer (i.e., live-out)
        for (auto edge : externalNode->getIncomingEdges()) {
            //memory and control dependences can be skipped as they do not dictate live-out values
            if (edge->isMemoryDependence() || edge->isControlDependence()) {
                continue;
            }

            auto internalValue = edge->getOutgoingT();
            if (!this->isProducer(internalValue)) {
                this->addLiveOutProducer(internalValue);
            }
            this->prodConsumers[internalValue].insert(externalValue);
        }
    }

    //check if there are multiple exits for this loop
    //if so, we need an extra variable to keep track of which exit has been taken
    this->hasExitBlockEnv = exitBlocks.size() > 1;
    if (this->hasExitBlockEnv) {
        auto& ctx = exitBlocks[0]->getContext();
        this->exitBlockType = IntegerType::get(ctx, 32);
    }
    
}
uint64_t LoopEnvironment::addLiveInValue(Value * newLiveInValue, const std::unordered_set<Instruction *>& consumers) {
    //add the live-in value
    uint64_t newIndex = this->addLiveInProducer(newLiveInValue);

    //add the consumer
    for (auto consumer : consumers) {
        this->prodConsumers[newLiveInValue].insert(consumer);
    }
    return newIndex;
}

bool LoopEnvironment::isProducer(Value * producer) const {
    return producerIndexMap.find(producer) != producerIndexMap.end();
}

uint64_t LoopEnvironment::addLiveInProducer(Value *producer) {
    uint64_t newIndex = addProducer(producer, true);
    return newIndex;
}
uint64_t LoopEnvironment::addProducer(Value *producer, bool liveIn) {
    //make sure @producer isn't aready part of the enviroment
    uint64_t index = 0;
    for (auto pro : this->envProducers) {
        if (producer == pro) {
            assert(this->envProducers[index] == producer);
            return index;
        }
        index++;
    }

    //add @producer to the enviroment
    uint64_t envIndex = this->envProducers.size();
    this->envProducers.push_back(producer);
    producerIndexMap[producer] = envIndex;
    if (liveIn) {
        this->liveInIndices.insert(envIndex);
    } else {
        this->liveOutIndices.insert(envIndex);
    }

    return envIndex;

}
void LoopEnvironment::addLiveOutProducer(Value * producer) {
    addProducer(producer, false);
}
int LoopEnvironment::indexOfProducer(Value * producer) {
    return this->producerIndexMap[producer];
}

iterator_range<std::vector<Value *>::iterator> LoopEnvironment::getProducers(void) {
    return make_range(envProducers.begin(), envProducers.end());
}
iterator_range<std::set<int>::iterator> LoopEnvironment::getEnvIndicesOfLiveInVars(void) {
    return make_range(liveInIndices.begin(), liveInIndices.end());
}
iterator_range<std::set<int>::iterator> LoopEnvironment::getEnvIndicesOfLiveOutVars(void) {
    return make_range(liveOutIndices.begin(), liveOutIndices.end());
}

uint64_t LoopEnvironment::size(void) const {
    return envProducers.size() + (hasExitBlockEnv ? 1 : 0);
}

int64_t LoopEnvironment::indexOfExitBlockTaken(void) const {
    return hasExitBlockEnv ? envProducers.size() : -1;
}

Type * LoopEnvironment::typeOfEnviromentLocation(uint64_t index) const {
    if (index < envProducers.size()) {
        return this->envProducers[index]->getType();
    }
    return exitBlockType;
}

bool LoopEnvironment::isLiveIn(Value * val) const {
    //check if @val belongs to the enviroment
    if (producerIndexMap.find(val) == producerIndexMap.end()) {
        return false;
    }

    //fetch the index of @val
    int index = producerIndexMap.at(val);

    //check if @val is live-in var
    return isProducer(val) && (liveInIndices.find(index) != liveInIndices.end());
}

Value * LoopEnvironment::producerAT(uint64_t index) const {
    assert(index < envProducers.size());
    return envProducers[index];
}

std::set<Value *> LoopEnvironment::consumersOf(Value * producer) const {
    std::set<Value *> s;
    if (prodConsumers.find(producer) == prodConsumers.end()) {
        return s;
    }
    s = prodConsumers.at(producer);
    return s;
}