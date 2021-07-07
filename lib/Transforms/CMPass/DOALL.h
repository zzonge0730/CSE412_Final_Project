#ifndef DOALL_H
#define DOALL_H

#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

#include "LoopDependenceInfo.h"
#include "Master.h"
#include "DOALLTask.h"
#include "EnvBuilder.h"
#include "IVStepperUtility.h"

#include "llvm/IR/IRBuilder.h"
#include "llvm/Analysis/Dominators.h"

using namespace llvm;

class DOALL : public ModulePass {
public:
    static char ID;
    DOALL();
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    bool runOnModule(Module& M) override;
    bool doInitialization (Module& M) override;
    ~DOALL();
    bool apply(LoopDependenceInfo * LDI, Master& master);

    bool canBeAppliedToLoop(LoopDependenceInfo * LDI, Master& master);

    static std::unordered_set<SCC *> getSCCsThatBlockDOALLToBeApplicable(LoopDependenceInfo * LDI, Master& cat);


    void reset(void);

    Value * getEnvArray(void) const;
    BasicBlock * getLoopEntryPoint(void);
    BasicBlock * getLoopExitPoint(void);

    
protected:

    void rewireLoopToIterateChunks(LoopDependenceInfo * LDI);

    void addPredecessorAndSuccessorsBasicBlockToTasks(LoopDependenceInfo * LDI, std::vector<DOALLTask *> taskStructs);

    void initEnvironmentBuilder(LoopDependenceInfo * LDI, std::set<int>nonReducableVars, std::set<int>reducableVars);

    void cloneSeqLoop(LoopDependenceInfo * LDI, int taskIndex);

    void generateCodeToLoadLiveInVars(LoopDependenceInfo * LDI, int taskIndex);

    void cloneMemoryLocationsLocallyAndRewireLoop(LoopDependenceInfo * LDI, int taskIndex);

    void adjustDataFlowToUseClones(LoopDependenceInfo * LDI, int taskIndex);
    void adjustDataFlowToUseClones(Instruction * cloneInst, int taskIndex);

    void setReducableVarsToBeginAtIdentifyValue(LoopDependenceInfo * LDI, int taskIndex);


    void generateCodeToStoreLiveOutVars(LoopDependenceInfo * LDI, int taskIndex);

    void addChunkFunctionExecutionAsideOriginalLoop(LoopDependenceInfo * LDI, Function * f, Master& master);

    PHINode * fetchLoopEntryPHIOfProducer(LoopDependenceInfo * LDI, Value * producer);

    Value * fetchClone(Value * original) const;

    Value * getIdentityValueForEnvValue(LoopDependenceInfo * LDI, int environmentIndex, Type* typeForValue);

    std::unordered_map<InductionVariable *, Value *> cloneIVStepValueComputation(
        LoopDependenceInfo * LDI,
        int taskIndex,
        IRBuilder<>& insertBlock
    );

    std::set<BasicBlock *> determineLatestPointsToInsertLiveOutStore (
        LoopDependenceInfo *LDI,
        int taskIndex,
        Instruction *liveOut,
        bool isReduced,
        DominatorSummary &taskDS
    );

    Instruction * fetchOrCreatePHIForIntermediateProducerValueOfReducibleLiveOutVariable (
        LoopDependenceInfo *LDI, 
        int taskIndex,
        int envIndex,
        BasicBlock *insertBasicBlock,
        DominatorSummary &taskDS
    );

    void allocateEnvironmentArray(LoopDependenceInfo * LDI);
    void populateLiveInEnvironment(LoopDependenceInfo * LDI);

    BasicBlock * propagateLiveOutEnvironment (LoopDependenceInfo *LDI, Value *numberOfThreadsExecuted);

    Value * castToCorrectReducibleType(IRBuilder<>& builder, Value * value, Type* targetType);
    
    void adjustStepValueOfPointerTypeIVToReflectPointerArithmetic (
        std::unordered_map<InductionVariable *, Value *> clonedStepValueMap,
        IRBuilder<> &insertBlock);
        
    FunctionType * taskSignature;
    Module * M;
    uint32_t numOfTaskInstantces;
    EnvBuilder * envBuilder;
    BasicBlock * entryPointOfParallelizedLoop;
    BasicBlock * exitPointOfParallelizedLoop;

    Function *taskDispatcher;

    std::vector<DOALLTask*> tasks;
};

#endif