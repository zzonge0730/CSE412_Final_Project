#include "DataFlowResult.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

DataFlowResult::DataFlowResult() {}

std::set<Value *>& DataFlowResult::GEN(Instruction *inst) {
    auto& value_set = this->gens[inst];
    return value_set;
}

std::set<Value *>& DataFlowResult::KILL(Instruction *inst) {
    auto& value_set = this->kills[inst];
    return value_set;
}

std::set<Value *>& DataFlowResult::IN(Instruction *inst) {
    auto& value_set = this->ins[inst];
    return value_set;
}

std::set<Value *>& DataFlowResult::OUT(Instruction *inst) {
    //errs() << "OUT-23\n";
    auto& value_set = this->outs[inst];
    //errs() << "OUT-25\n";
    return value_set;
}
