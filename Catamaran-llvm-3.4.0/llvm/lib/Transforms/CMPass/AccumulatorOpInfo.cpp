#include "AccumulatorOpInfo.h"
#include "llvm/IR/Constants.h"
AccumulatorOpInfo::AccumulatorOpInfo () {
  this->sideEffectFreeOps = {
    Instruction::Add,
    Instruction::FAdd,
    Instruction::Mul,
    Instruction::FMul,
    Instruction::Sub,
    Instruction::FSub,
    Instruction::Or,
    Instruction::And
  };

  this->accumOps = std::set<unsigned>(sideEffectFreeOps.begin(), sideEffectFreeOps.end());

  this->opIdentities = {
    { Instruction::Add, 0 },
    { Instruction::FAdd, 0 },
    { Instruction::Mul, 1 },
    { Instruction::FMul, 1 },
    { Instruction::Sub, 0 },
    { Instruction::FSub, 0 },
    { Instruction::Or, 0 },
    { Instruction::And, 1 }
  };

  this->integerReducingOperators = {
    { Instruction::Add, Instruction::Add },
    { Instruction::FAdd, Instruction::Add },
    { Instruction::Mul, Instruction::Mul },
    { Instruction::FMul, Instruction::Mul },
    { Instruction::Sub, Instruction::Add },
    { Instruction::FSub, Instruction::Add },
    { Instruction::Or, Instruction::Or },
    { Instruction::And, Instruction::And }
  };

  this->floatingReducingOperators = {
    { Instruction::Add, Instruction::FAdd },
    { Instruction::FAdd, Instruction::FAdd },
    { Instruction::Mul, Instruction::FMul },
    { Instruction::FMul, Instruction::FMul },
    { Instruction::Sub, Instruction::FAdd },
    { Instruction::FSub, Instruction::FAdd },
  };
}

bool AccumulatorOpInfo::isSubOp (unsigned op) {
  return Instruction::Sub == op || Instruction::FSub == op;
}

bool AccumulatorOpInfo::isMulOp (unsigned op) {
  return Instruction::Mul == op || Instruction::FMul == op;
}

bool AccumulatorOpInfo::isAddOp (unsigned op) {
  return Instruction::Add == op || Instruction::FAdd == op;
}

unsigned AccumulatorOpInfo::accumOpForType (unsigned op, Type *type) {
  switch (type->getTypeID()) {
    case Type::IntegerTyID:
      assert(integerReducingOperators.find(op) != integerReducingOperators.end()
        && "Attempting to reduce unknown integer operator!");
      return integerReducingOperators.at(op);
    case Type::HalfTyID:
    case Type::FloatTyID:
    case Type::DoubleTyID:
      assert(floatingReducingOperators.find(op) != floatingReducingOperators.end()
        && "Attempting to reduce unknown floating operator!");
      return floatingReducingOperators.at(op);
    default:
      assert(false
        && "Attempting to reduce unknown type!");
  }
}

Value *AccumulatorOpInfo::generateIdentityFor (Instruction *accumulator, Type *castType) {
  Value *initVal = nullptr;
  auto opIdentity = this->opIdentities[accumulator->getOpcode()];
  if (castType->isIntegerTy()) initVal = ConstantInt::get(castType, opIdentity);
  if (castType->isFloatTy()) initVal = ConstantFP::get(castType, (float)opIdentity);
  if (castType->isDoubleTy()) initVal = ConstantFP::get(castType, (double)opIdentity);
  assert(initVal != nullptr);
  return initVal;
}