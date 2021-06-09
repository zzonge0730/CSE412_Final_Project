#ifndef DATAFLOW_ENGINE_H
#define DATAFLOW_ENGINE_H

#include "DataFlowResult.h"

#include <functional>
#include <list>

using namespace llvm;

class DataFlowEngine {
public:
    DataFlowEngine();

    DataFlowResult * applyForward(
      Function * f, 
      std::function<void (Instruction *, DataFlowResult *)> computeGEN,
      std::function<void (Instruction *, DataFlowResult *)> computeKILL,
      std::function<void (Instruction *inst, std::set<Value *>& IN)> initializeIN,
      std::function<void (Instruction *inst, std::set<Value *>& OUT)> initializeOUT,
      std::function<void (Instruction *inst, std::set<Value *>& IN, Instruction *predecessor, DataFlowResult * df)> computeIN,
      std::function<void (Instruction *inst, std::set<Value *>& OUT, DataFlowResult *df)> computeOUT);

    DataFlowResult * applyForward(
      Function * f,
      std::function<void (Instruction *, DataFlowResult *)> computeGEN,
      std::function<void (Instruction *inst, std::set<Value *>& IN)> initializeIN,
      std::function<void (Instruction *inst, std::set<Value *>& OUT)> initializeOUT,
      std::function<void (Instruction *inst, std::set<Value *>& IN, Instruction *predecessor, DataFlowResult * df)> computeIN,
      std::function<void (Instruction *inst, std::set<Value *>& OUT, DataFlowResult *df)> computeOUT);

    DataFlowResult * applyBackward(
      Function *f,
      std::function<void (Instruction *, DataFlowResult *)> computeGEN,
      std::function<void (Instruction *, DataFlowResult *)> computeKILL,
      std::function<void (std::set<Value *>& IN, Instruction *inst, DataFlowResult *df)> computeIN,
      std::function<void (std::set<Value *> & OUT, Instruction *successor, DataFlowResult *df)> computeOUT);
    DataFlowResult * applyBackward(
      Function *f,
      std::function<void (Instruction *, DataFlowResult *)> computeGEN,
      std::function<void (std::set<Value *>& IN, Instruction *inst, DataFlowResult *df)> computeIN,
      std::function<void (std::set<Value *> & OUT, Instruction *successor, DataFlowResult *df)> computeOUT);    

protected:
    void computeGENAndKILL(
      Function *f,
      std::function<void (Instruction *, DataFlowResult *)> computeGEN,
      std::function<void (Instruction *, DataFlowResult *)> computeKILL,
      DataFlowResult *df);

private:
    DataFlowResult * applyCustomizableForwardAnalysis(
      Function *f,
      std::function<void (Instruction *, DataFlowResult *)> computeGEN,
      std::function<void (Instruction *, DataFlowResult *)> computeKILL,
      std::function<void (Instruction *inst, std::set<Value *>& IN)> initializeIN,
      std::function<void (Instruction *inst, std::set<Value *>& OUT)> initializeOUT,
      std::function<void (Instruction *inst, std::set<Value *>& IN, Instruction *predecessor, DataFlowResult *df)> computeIN,
      std::function<void (Instruction *inst, std::set<Value *>& OUT, DataFlowResult *df)> computeOUT,
      std::function<void (std::list<BasicBlock *> &worklist, BasicBlock *bb)> appendBB,
      std::function<Instruction * (BasicBlock *bb)> getFirstInstruction,
      std::function<Instruction * (BasicBlock *bb)> getLastInstruction);
};





#endif
