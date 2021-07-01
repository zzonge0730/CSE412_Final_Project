#ifndef ACCUMULATOROPINFO_H
#define ACCUMULATOROPINFO_H

#include <set>
#include <unordered_map>

#include "llvm/IR/Instruction.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Type.h"


using namespace llvm;

class AccumulatorOpInfo {
public:
    AccumulatorOpInfo ();

    std::set<unsigned> sideEffectFreeOps;
    std::set<unsigned> accumOps;
    std::unordered_map<unsigned, unsigned> opIdentities;
    std::unordered_map<unsigned, unsigned> integerReducingOperators;
    std::unordered_map<unsigned, unsigned> floatingReducingOperators;

    bool isMulOp (unsigned op);
    bool isAddOp (unsigned op);
    bool isSubOp (unsigned op);
    unsigned accumOpForType (unsigned op, Type *type);
    Value *generateIdentityFor (Instruction *accumulator, Type *castType);
};
#endif