#ifndef DATAFLOW_RESULT_H
#define DATAFLOW_RESULT_H

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Value.h"

#include <set>
#include <map>

using namespace llvm;

class DataFlowResult {
public:
    DataFlowResult();

    std::set<Value *>& GEN(Instruction *inst);
    std::set<Value *>& KILL(Instruction *inst);
    std::set<Value *>& IN(Instruction *inst);
    std::set<Value *>& OUT(Instruction *inst);

private:
    std::map<Instruction *, std::set<Value *>> gens;
    std::map<Instruction *, std::set<Value *>> kills;
    std::map<Instruction *, std::set<Value *>> ins;
    std::map<Instruction *, std::set<Value *>> outs;


};

#endif