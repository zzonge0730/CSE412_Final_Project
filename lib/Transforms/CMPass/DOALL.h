#ifndef DOALL_H
#define DOALL_H

#include "llvm/IR/Module.h"

#include "LoopDependenceInfo.h"
#include "Master.h"
#include "DOALLTask.h"
#include "EnvBuilder.h"
#include "IVStepperUtility.h"

#include "llvm/IR/IRBuilder.h"

using namespace llvm;

class DOALL {
public:
    DOALL(Module& M);

    ~DOALL();
    bool apply(LoopDependenceInfo * LDI, Master& master);

    bool canBeAppliedToLoop(LoopDependenceInfo * LDI, Master& master);

    static std::unordered_set<SCC *> getSCCsThatBlockDOALLToBeApplicable(LoopDependenceInfo * LDI, Master& cat);

    void addPredecessorAndSuccessorsBasicBlockToTasks(LoopDependenceInfo * LDI, std::vector<DOALLTask *> taskStructs);

    void initEnvironmentBuilder(LoopDependenceInfo * LDI, std::set<int>nonReducableVars, std::set<int>reducableVars);

    void cloneSeqLoop(LoopDependenceInfo * LDI, int taskIndex);

    void generateCodeToLoadLiveInVars(LoopDependenceInfo * LDI, int taskIndex);

    void cloneMemoryLocationsLocallyAndRewireLoop(LoopDependenceInfo * LDI, int taskIndex);

    void adjustDataFlowToUseClones(LoopDependenceInfo * LDI, int taskIndex);
    void adjustDataFlowToUseClones(Instruction * cloneInst, int taskIndex);

    void setReducableVarsToBeginAtIdentifyValue(LoopDependenceInfo * LDI, int taskIndex);

    void rewireLoopToIterateChunks(LoopDependenceInfo * LDI);

    void generateCodeToStoreLiveOutVars(LoopDependenceInfo * LDI, int taskIndex);

    void addChunkFunctionExecutionAsideOriginalLoop(LoopDependenceInfo * LDI, Function * f, Master& master);

    void reset(void);

    Value * getEnvArray(void) const;
    BasicBlock * getLoopEntryPoint(void);
    BasicBlock * getLoopExitPoint(void);
protected:

    void rewireLoopToIterateChunks(LoopDependenceInfo * LDI);

    void addChunkFunctionExecutionAsiderOriginalLoop(LoopDependenceInfo *LDI, Function *loopFunction, Master * cat);

    void * fetchClone(Value * original) const;

    FunctionType * taskSignature;
    Module * M;
    uint32_t numOfTaskInstantces;
    EnvBuilder * envBuilder;
    BasicBlock * entryPointOfParallelizedLoop;
    BasicBlock * exitPointOfParallelizedLoop;

    std::vector<DOALLTask*> tasks;
};

#endif