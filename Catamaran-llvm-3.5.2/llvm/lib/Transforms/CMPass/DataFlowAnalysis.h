#ifndef DATAFLOW_ANALYSIS_H
#define DATAFLOW_ANALYSIS_H

#include "DataFlowResult.h"

#include <functional>

using namespace llvm;

class DataFlowAnalysis {
public:
    DataFlowAnalysis();

    DataFlowResult * runReachableAnalysis(Function *F);
    DataFlowResult * runReachableAnalysis(Function *F, std::function<bool (Instruction *I)> filter);
    DataFlowResult * getFullSets(Function *F);
};

#endif