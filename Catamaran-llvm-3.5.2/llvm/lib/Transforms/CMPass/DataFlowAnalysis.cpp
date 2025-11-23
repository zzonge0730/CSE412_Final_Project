#include "DataFlowAnalysis.h"
#include "DataFlowEngine.h"

#include <set>

using namespace llvm;

DataFlowAnalysis::DataFlowAnalysis() {}

DataFlowResult * DataFlowAnalysis::getFullSets(Function *f) {
    auto dfRes = new DataFlowResult{};
    for (BasicBlock &BB : *f) {
        for (Instruction &I : BB) {
            auto &inSetOfInst = dfRes->IN(&I);
            auto &outSetOfInst = dfRes->OUT(&I);

            for (BasicBlock &bb : *f) {
                for (Instruction &i : bb) {
                    inSetOfInst.insert(&i);
                    outSetOfInst.insert(&i);
                }
            }
        }
    }
    return dfRes;
}

DataFlowResult * DataFlowAnalysis::runReachableAnalysis(Function *f,
  std::function<bool (Instruction *I)> filter) {

    //allocate the engine
    auto dfEngine = DataFlowEngine{};

    //define the data-flow equations
    auto computeGEN = [filter](Instruction * I, DataFlowResult *dfRes) {
        //check if the instruction should be considered
        if (!filter(I)) {
            return;
        }

        //add the instruction to the GEN set
        auto& gen = dfRes->GEN(I);
        gen.insert(I);

        return;
    };

    auto computeKILL = [](Instruction *, DataFlowResult *) {
        return;
    };

    auto computeOUT = [](std::set<Value *>& OUT, Instruction *succ, DataFlowResult *dfRes) {
        auto& inSet = dfRes->IN(succ);
        OUT.insert(inSet.begin(), inSet.end());
        return;
    };

    auto computeIN = [](std::set<Value *>& IN, Instruction *inst, DataFlowResult *dfRes) {
        auto& genI = dfRes->GEN(inst);
        auto& outI = dfRes->OUT(inst);

        //IN[inst] = GEN[inst] U OUT[inst] 
        IN.insert(genI.begin(), genI.end());
        IN.insert(outI.begin(), outI.end());
        return;
    };

    //run the data flow analysis needed to identify the instructions that could be executed from a given point
    auto dfR = dfEngine.applyBackward(f, computeGEN, computeKILL, computeIN, computeOUT);
    return dfR;

  }

DataFlowResult * DataFlowAnalysis::runReachableAnalysis(Function *f) {
    auto noFilter = [](Instruction *I) -> bool {
        return true;
    };

    auto dfRes = this->runReachableAnalysis(f, noFilter);
    return dfRes;
}