#include "DOALL.h"

DOALL::DOALL(Module& M) {

}

bool DOALL::apply(LoopDependenceInfo * LDI, Master& master) {
    //fetch the loop headers
    auto loopStructure = LDI->getLoopStructure();
    auto loopHeader = loopStructure->getHeader();
    auto loopPreHeader = loopStructure->getPreHeader();

    //fetch the loop function
    auto loopFunction = loopStructure->getFunction();

    //fetch the loop environment
    auto loopEnv = LDI->loopEnviroment;

    //print the parallelization request
    errs() << "DOALL: Start the parallelization.\n";
    errs() << "DOALL: Number of threads to extract = " << LDI->getMaxCoreNumber() << "\n";
    errs() << "DOALL: Chunk Size = " << LDI->DOALLChunkSize << "\n";

    //generate an empty task for the parallel DOALL execution
    DOALLTask * chunkerTask = new DOALLTask(0, this->taskSignature, this->M);
    this->addPredecessorAndSuccessorsBasicBlockToTasks(LDI, {chunkerTask});
    this->numOfTaskInstantces = LDI->getMaxCoreNumber();

    //allocate memory for all environment variables
    auto preEnvRange = loopEnv->getEnvIndicesOfLiveInVars();
    auto postEnvRange = loopEnv->getEnvIndicesOfLiveOutVars();
    std::set<int> nonReducableVars(preEnvRange.begin(), preEnvRange.end());
    std::set<int> reducableVars(postEnvRange.begin(), postEnvRange.end()); 
    this->initEnvironmentBuilder(LDI, nonReducableVars, reducableVars);
    //clone loop into the single task used by DOALL
    this->cloneSeqLoop(LDI, 0);

    //load all loop live-in values at the entry point of the task
    auto envUser = this->envBuilder->getUser(0);
    for (auto envIndex : loopEnv->getEnvIndicesOfLiveInVars()) {
        envUser->addLiveInIndex(envIndex);
    }
    for (auto envIndex : loopEnv->getEnvIndicesOfLiveOutVars()) {
        envUser->addLiveOutIndex(envIndex);
    }
    this->generateCodeToLoadLiveInVars(LDI, 0);
    
    //flow loading live-ins as this re-wiring overrides
    //the live-in mapping to use locally cloned memory instructions that are live-in to the loop
    this->cloneMemoryLocationsLocallyAndRewireLoop(LDI, 0);

    //adjust dataflow to use clones
    this->adjustDataFlowToUseClones(LDI, 0);
    this->setReducableVarsToBeginAtIdentifyValue(LDI, 0);
    this->rewireLoopToIterateChunks(LDI);

    //add the final return to the single task's exit block
    IRBuilder<> exitB(tasks[0]->getExit());
    exitB.CreateRetVoid();

    //store final resutls to loop live-out variables
    this->generateCodeToStoreLiveOutVars(LDI, 0);
    this->addChunkFunctionExecutionAsideOriginalLoop(LDI, loopFunction, master);
    //print the final DOALL loop
    tasks[0]->getTaskBody()->print(errs() << "DOALL: Final parallelized loop:\n");
    errs() << "\n";

    errs() << "DOALL: Exit\n";
    return true;
}

bool DOALL::canBeAppliedToLoop(LoopDependenceInfo * LDI, Master& cat) {
    errs() << "DOALL: Checking if the loop parallelism is DOALL.\n";

    //fetch the loop structure
    auto loopStructure = LDI->getLoopStructure();

    //the loop must have one single exit path
    uint32_t numOfExits = 0;
    for (auto BB : loopStructure->getLoopExitBasicBlocks()) {
        //fetch the last instruction beforre the terminator
        auto terminator = BB->getTerminator();
        auto prevInst = terminator->getPrevNode();

        //check if the last instruction is a call to a function that cannot return (e.g., abort(), exit());
        if (prevInst == nullptr) {
            numOfExits++;
            continue;
        }
        if (auto callInst = dyn_cast<CallInst>(prevInst)) {
            auto callee = callInst->getCalledFunction();
            if (callee != nullptr && (callee->getName() == "exit" || callee->getName() == "abort" || 
            callee->getName() == "softboundcets_abort" || callee->getName() == "softboundcets_exit")) {
                continue;
            }
        }
        numOfExits++;
    }
    
    if (numOfExits != 1) {
        errs() << "DOALL: More than 1 loop exit blocks\n";
        return false;
    }

    //the loop must have all live-out variables to be reducable
    auto sccManager = LDI->getSCCManager();
    if (!sccManager->areAllLiveOutValuesReducable(LDI->loopEnviroment)) {
        errs() << "DOALL: Some post environment value is not reducable\n";
        return false;
    }

    //the compiler must be able to remove loop-carried data dependences of all SCCs with loop-carried data dependences
    auto nonDOALLSCCs = DOALL::getSCCsThatBlockDOALLToBeApplicable(LDI, cat);
    if (nonDOALLSCCs.size() > 0) {
        for (auto scc : nonDOALLSCCs) {
            errs() << "DOALL: We found an SCC of the loop that is non clonable and non commutative\n";
            sccManager->iterateOverLoopCarriedDataDependences(scc, [](DGEdge<Value>*dep) -> bool {
                auto fromInst = dep->getOutgoingT();
                auto toInst = dep->getIncomingT();
                errs() << "DOALL: " << *fromInst << "---->" << *toInst;
                if (dep->isMemoryDependence()) {
                    errs() << " via memory\n";
                } else {
                    errs() << " via variable\n";
                }
                return false;
            });
        }

        //there is at least one SCC that blocks DOALL to be applicable
        return false;
    }

    //the loop must have at least one induction variable
    //this is because the trip count must be controlled by an induction variable
    auto loopGoverningIVAttr = LDI->getLoopGoverningIVAttribution();
    if (!loopGoverningIVAttr) {
        errs() << "DOALL: Loop does not have an induction variable to control the number of iterations\n";
        return false;
    }

    //due to a limitation in our ability to chunk induction variables
    //all induction variables must have step size that are loop invariant
    auto IVManager = LDI->getInductionVariableManager();
    for (auto IV : IVManager->getInductionVariables(*loopStructure)) {
        if (IV->isStepValueLoopInvariant()) {
            continue;
        }
        errs() << "DOALL: Loop has an induction variable with step size that is not loop invariant\n";
        return false;
    }

    //check if the final value of the induction variable is a loop invariant
    auto invariantManager = LDI->getInvariantManager();
    LoopGoverningIVUtility ivUtility(loopGoverningIVAttr->getInductionVariable(), *loopGoverningIVAttr);
    auto& derivation = ivUtility.getConditionValueDerivation();
    for (auto I : derivation) {
        if (!invariantManager->isLoopInvariant(I)) {
            errs() << "DOALL: Loop has the governing induction variable that is compared against a non-invariant";
            errs() << "DOALL:  The non-invariant is = " << *I << "\n";
            return false;
        }
    }

    //!!There is a DOALL one
    errs() << "---DOALL: The loop can be parallelized with DOALL---\n";
    return true;
}

std::unordered_set<SCC *> DOALL::getSCCsThatBlockDOALLToBeApplicable(LoopDependenceInfo * LDI, Master& cat) {

}

void DOALL::rewireLoopToIterateChunks(LoopDependenceInfo * LDI) {
    
}

void DOALL::addChunkFunctionExecutionAsiderOriginalLoop(LoopDependenceInfo *LDI, Function *loopFunction, Master * cat) {

}

void * DOALL::fetchClone(Value * original) const {

}

void DOALL::addPredecessorAndSuccessorsBasicBlockToTasks(LoopDependenceInfo * LDI, std::vector<DOALLTask *> taskStructs) {

}

void DOALL::initEnvironmentBuilder(LoopDependenceInfo * LDI, std::set<int>nonReducableVars, std::set<int>reducableVars) {
    if (tasks.size() == 0) {
        errs() << "ERROR: Tasks haven't been created yet!\n";
        abort();
    }

    //collect the type of each environment variable
    std::vector<Type *> varTypes;
    for (uint64_t i = 0; i < LDI->loopEnviroment->size(); i++) {
        varTypes.push_back(LDI->loopEnviroment->typeOfEnviromentLocation(i));
    }

    this->envBuilder = new EnvBuilder(this->M->getContext());
    this->envBuilder->createEnvVariables(varTypes, nonReducableVars, reducableVars, this->numOfTaskInstantces);

    this->envBuilder->createEnvUsers(this->tasks.size());
    for (int i = 0; i < this->tasks.size(); i++) {
        auto task = this->tasks[i];
        auto envUser = envBuilder->getUser(i);
        auto entryBlock = task->getEntry();
        IRBuilder<> entryBuilder(entryBlock);
        envUser->setEnvArray(entryBuilder.CreateBitCast(task->getEnvironment(), PointerType::getUnqual(envBuilder->getEnvArrayTy())));
    }
}

void DOALL::cloneSeqLoop(LoopDependenceInfo * LDI, int taskIndex) {
    //fetch the task
    //auto& ctx = this->M->getContext();
    auto task = this->tasks[taskIndex];

    //code to filter out instructions we don't want to clone
    auto filter = [](Instruction * inst) -> bool {
        if (auto call = dyn_cast<CallInst>(inst)) {
            if (call->isLifetimeStartOrEnd()) {
                return false;
            }
        }
        return true;
    };

    //clone all basic blocks of the original loop
    auto topLoop = LDI->getLoopStructure();
    for (auto originBB : topLoop->orderedBBs) {
        //clone the basic block
        task->cloneAndAddBasicBlock(originBB, filter);
    }

}

void DOALL::generateCodeToLoadLiveInVars(LoopDependenceInfo * LDI, int taskIndex) {
    //fetch the task
    auto task = this->tasks[taskIndex];

    //fetch the user of environment attached to the task
    auto envUser = this->envBuilder->getUser(taskIndex);

    //generate loads IR to load values from the live-in enviroment variables
    IRBuilder<> builder(task->getEntry());
    for (auto envIndex : envUser->getEnvIndicesOfLiveInVars()) {
        //fetch the current producer of the original code that generates the live-in value
        auto producer = LDI->loopEnviroment->producerAT(envIndex);

        //create GEP access of the environment varialbe at the given index
        envUser->createEnvPtr(builder, envIndex, producer->getType());

        auto envPointer = envUser->getEnvPtr(envIndex);

        //load the live-in value from the environment pointer
        auto envLoad = builder.CreateLoad(envPointer);

        //register the load as a "clone " of the original producer
        task->addLiveIn(producer, envLoad);
    }
}

void DOALL::cloneMemoryLocationsLocallyAndRewireLoop(LoopDependenceInfo * LDI, int taskIndex) {
    //fetch the task
    auto task = this->tasks[taskIndex];

    //loop related structures
    auto rootLoop = LDI->getLoopStructure();
    auto memoryCloningAnalysis = LDI->getMemoryCloningAnalysis();
    auto envUser = this->envBuilder->getUser(taskIndex);

    task->getTaskBody()->print(errs());
    rootLoop->getFunction()->print(errs());

    //check every task object that can be safely cloned
    for (auto location : memoryCloningAnalysis->getClonableMemoryLocations()) {
        //fetch the stack object
        auto allocaLoc = location->getAllocation();

        //check if this is a allocation used by this stack
        auto loopInstructionRequiringClonedOperands = location->getLoopInstructionsUsingLocation();
        std::unordered_set<Instruction*> taskInsturctions;
        for (auto inst : loopInstructionRequiringClonedOperands) {
            if (!task->isAnOriginalInstruction(inst)) {
                continue;
            }
            taskInsturctions.insert(inst);
        }
        if (taskInsturctions.size() == 0) {
            //the current stack object is not used by the task / loop
            continue;
        }

        //Then, the stack object can be safely cloned , and it is used by our loop
        //First, we need to remove the alloca instruction to be a live-in
        task->removeLiveIn(alloca);

        //Traverse operands of loop instruction to clone all live-in references (casts and GEPs)
        //of the allocation to clone
        //state all cloned instructions in the stack's instruction map for data flow adjustment later
        auto& entryBlock = *(task->getTaskBody()->begin());
        auto firstInst = &*entryBlock.begin();
        IRBuilder<> entryBuilder(&entryBlock);

        std::queue<Instruction *> instructionsToConvertOperandsOf;
        for (auto inst : taskInsturctions) {
            instructionsToConvertOperandsOf.push(inst);
        }
        for (auto inst : location->getInstructionsUsingLocationOutsideLoop()) {
            instructionsToConvertOperandsOf.push(inst);
        }

        while (!instructionsToConvertOperandsOf.empty()) {
            auto inst = instructionsToConvertOperandsOf.front();
            instructionsToConvertOperandsOf.pop();

            for (int i = 0; i < inst->getNumOperands(); i++) {
                auto op = inst->getOperand(i);

                //ensure the instruction is outside the loop and not already cloned
                auto opInst = dyn_cast<Instruction>(op);
                if (!opInst || rootLoop->isIncluded(opInst)) continue;

                //ensure the operand is a reference of the allocation
                if (!location->isInstructionCastOrGEPOfLocation(opInst)) continue;

                //ensure the isntruction hasn't been cloned yet
                if (task->isAnOriginalInstruction(opInst)) continue;

                //clone operand and then add to queue
                auto opInstClone = opInst->clone();
                entryBuilder.Insert(opInstClone);
                entryBuilder.SetInsertPoint(opInstClone);
                instructionsToConvertOperandsOf.push(opInstClone);

                //we want the cloned instruction to be used
                task->addLiveIn(opInst, opInstClone);
                task->addInstruction(opInst, opInstClone);


                //check if there are new live-in values we need to pass to the task
                for (int j = 0; j < opInst->getNumOperands(); j++) {
                    auto opJ = opInst->getOperand(j);

                    if (dyn_cast<Constant>(opJ)) {
                        //if the current operand is a constant
                        //there is no need for a live-in
                        continue;
                    }

                    //check if the current operand is the alloca instruction that will be cloned
                    if (opJ == allocaLoc) {
                        continue;
                    }

                    //check if the current operand requires to become a live-in
                    bool newLiveIn = true;
                    for (auto envIndex : envUser->getEnvIndicesOfLiveInVars()) {
                        auto producer = LDI->loopEnviroment->producerAT(envIndex);
                        if (producer == opJ) {
                            newLiveIn = false;
                            break;
                        }
                    }
                    if (!newLiveIn) continue;

                    //now the current operand must become a new live-in
                    //make space in the enviroment for the new live-in
                    auto newLiveInEnvIndex = LDI->loopEnviroment->addLiveInValue(opJ, {opInst});
                    this->envBuilder->addVariableToEnvironment(newLiveInEnvIndex, opJ->getType());

                    //declare the new live-in of the loop is also a new live-in for the user
                    //of the environment
                    envUser->addLiveInIndex(newLiveInEnvIndex);

                    //add the load inside the task to load from the enviroment the new live-in
                    envUser->createEnvPtr(entryBuilder, newLiveInEnvIndex, opJ->getType());
                    auto envLocationLoad = entryBuilder.CreateLoad(envUser->getEnvPtr(newLiveInEnvIndex));

                    //make the task aware that new load represents the live-in value
                    task->addLiveIn(opJ, envLocationLoad);
                }
            }
        }
        //clone the stack object at the beginning of the task
        auto allocaClone = allocaLoc->clone();;
        auto firstI = &*entryBlock.begin();
        entryBuilder.SetInsertPoint(firstI);
        entryBuilder.Insert(allocaClone);

        //keep track of the original-clone mapping
        task->addInstruction(allocaLoc, allocaClone);

    }
    
    errs() << "---after---memorycloneANDrewireloop\n";
    task->getTaskBody()->print(errs());
    rootLoop->getFunction()->print(errs());

}

void DOALL::adjustDataFlowToUseClones(LoopDependenceInfo * LDI, int taskIndex) {
    //fetch the task
    auto& task = this->tasks[taskIndex];

    //rewire the data flows
    for (auto originInst : task->getOriginalInstructions()) {
        auto cloneInst = task->getCloneOfOriginalInstruction(originInst);
        this->adjustDataFlowToUseClones(cloneInst, taskIndex);
    }
}

void DOALL::setReducableVarsToBeginAtIdentifyValue(LoopDependenceInfo * LDI, int taskIndex) {

}

void DOALL::rewireLoopToIterateChunks(LoopDependenceInfo * LDI) {

}

void DOALL::generateCodeToStoreLiveOutVars(LoopDependenceInfo * LDI, int taskIndex) {

}

void DOALL::addChunkFunctionExecutionAsideOriginalLoop(LoopDependenceInfo * LDI, Function * f, Master& master) {

}

void DOALL::reset(void) {
    for (auto task : tasks) {
        if (task) delete task;
    }
    tasks.clear();
    this->numOfTaskInstantces = 0;
    if (envBuilder) {
        delete envBuilder;
        envBuilder = nullptr;
    }

}

Value * DOALL::getEnvArray(void) const {
    return this->envBuilder->getEnvArray();
}
BasicBlock * DOALL::getLoopEntryPoint(void) {
    return this->entryPointOfParallelizedLoop;
}
BasicBlock * DOALL::getLoopExitPoint(void) {
    return this->exitPointOfParallelizedLoop;
}