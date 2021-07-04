#include "DOALL.h"
#include "llvm/Support/CFG.h"

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
    DOALLTask * chunkerTask = new DOALLTask(0, this->taskSignature, *this->M);
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
    //TODO:
}

void DOALL::rewireLoopToIterateChunks(LoopDependenceInfo * LDI) {
   
    //fetch the task
    auto task = this->tasks[0];

    auto invariantManager = LDI->getInvariantManager();
    auto loopSummary = LDI->getLoopStructure();
    auto loopHeader = loopSummary->getHeader();
    auto loopPreHeader = loopSummary->getPreHeader();
    auto preheaderClone = task->getCloneOfOriginalBasicBlock(loopPreHeader);
    auto headerClone = task->getCloneOfOriginalBasicBlock(loopHeader);
    auto allIVInfo = LDI->getInductionVariableManager();

  
    // Hook up preheader to header to enable induction variable manipulation
   
    IRBuilder<> entryBuilder(task->getEntry());
    auto temporaryBrToLoop = entryBuilder.CreateBr(headerClone);
    entryBuilder.SetInsertPoint(temporaryBrToLoop);

  
    // Generate PHI to track progress on the current chunk
    auto chunkCounterType = task->chunkSizeArg->getType();
    auto chunkPHI = IVUtility::createChunkPHI(preheaderClone, headerClone, chunkCounterType, task->chunkSizeArg);

  
    // Collect clones of step size deriving values for all induction variables
    // of the top level loop

    auto clonedStepSizeMap = this->cloneIVStepValueComputation(LDI, 0, entryBuilder);

    // Determine start value of the IV for the task
    // core_start: original_start + original_step_size * core_id * chunk_size
    for (auto ivInfo : allIVInfo->getInductionVariables(*loopSummary)) {
        auto startOfIV = this->fetchClone(ivInfo->getStartValue());
        auto stepOfIV = clonedStepSizeMap.at(ivInfo);
        auto ivPHI = cast<PHINode>(fetchClone(ivInfo->getLoopEntryPHI()));

        auto nthCoreOffset = entryBuilder.CreateMul(
        stepOfIV,
        entryBuilder.CreateZExtOrTrunc(
            entryBuilder.CreateMul(task->coreArg, task->chunkSizeArg, "coreIdx_X_chunkSize"),
            stepOfIV->getType()
        ),
        "stepSize_X_coreIdx_X_chunkSize"
        );

        auto offsetStartValue = IVUtility::offsetIVPHI(preheaderClone, ivPHI, startOfIV, nthCoreOffset);
        ivPHI->setIncomingValueForBlock(preheaderClone, offsetStartValue);
    }

    
    // Determine additional step size from the beginning of the next core's chunk
    // to the start of this core's next chunk
    // chunk_step_size: original_step_size * (num_cores - 1) * chunk_size
    
    for (auto ivInfo : allIVInfo->getInductionVariables(*loopSummary)) {
        auto stepOfIV = clonedStepSizeMap.at(ivInfo);
        auto ivPHI = cast<PHINode>(fetchClone(ivInfo->getLoopEntryPHI()));
        auto onesValueForChunking = ConstantInt::get(chunkCounterType, 1);
        auto chunkStepSize = entryBuilder.CreateMul(
        stepOfIV,
        entryBuilder.CreateZExtOrTrunc(
            entryBuilder.CreateMul(
            entryBuilder.CreateSub(task->numCoresArg, onesValueForChunking, "numCoresMinus1"),
            task->chunkSizeArg,
            "numCoresMinus1_X_chunkSize"
            ),
            stepOfIV->getType()
        ),
        "stepSizeToNextChunk"
        );

        IVUtility::chunkInductionVariablePHI(preheaderClone, ivPHI, chunkPHI, chunkStepSize);
    }

    
    // The exit condition needs to be made non-strict to catch iterating past it
    auto loopGoverningIVAttr = LDI->getLoopGoverningIVAttribution();
    LoopGoverningIVUtility ivUtility(loopGoverningIVAttr->getInductionVariable(), *loopGoverningIVAttr);
    auto cmpInst = cast<CmpInst>(task->getCloneOfOriginalInstruction(loopGoverningIVAttr->getHeaderCmpInst()));
    auto brInst = cast<BranchInst>(task->getCloneOfOriginalInstruction(loopGoverningIVAttr->getHeaderBrInst()));
    auto basicBlockToJumpToWhenTheLoopEnds = task->getLastBlock(0);
    ivUtility.updateConditionAndBranchToCatchIteratingPastExitValue(cmpInst, brInst, basicBlockToJumpToWhenTheLoopEnds);
    auto updatedCmpInst = cmpInst;

    // The exit condition value does not need to be computed each iteration
    // and so the value's derivation can be hoisted into the preheader
    // Instructions which the PDG states are independent can include PHI nodes
    // Assert that any PHIs are invariant. Hoist one of those values (if instructions) to the preheader.

    auto exitConditionValue = fetchClone(loopGoverningIVAttr->getHeaderCmpInstConditionValue());
    if (auto exitConditionInst = dyn_cast<Instruction>(exitConditionValue)) {
        auto &derivation = ivUtility.getConditionValueDerivation();
        for (auto I : derivation) {
        assert(invariantManager->isLoopInvariant(I)
            && "DOALL exit condition value is not derived from loop invariant values!");

      
        //Fetch the clone of @I
        auto cloneI = task->getCloneOfOriginalInstruction(I);

        if (auto clonePHI = dyn_cast<PHINode>(cloneI)) {
            auto usedValue = clonePHI->getIncomingValue(0);
            clonePHI->replaceAllUsesWith(usedValue);
            clonePHI->eraseFromParent();
            cloneI = dyn_cast<Instruction>(usedValue);
            if (!cloneI) continue;
        }

            cloneI->removeFromParent();
            entryBuilder.Insert(cloneI);
        }

        exitConditionInst->removeFromParent();
        entryBuilder.Insert(exitConditionInst);
    }

    /*
    * Identify any instructions in the header that are NOT sensitive to the number of times they execute:
    * 1) IV instructions, including the comparison and branch of the loop governing IV
    * 2) The PHI used to chunk iterations 
    * 3) Any PHIs of reducible variables
    * 4) Any loop invariant instructions that belong to independent-execution SCCs
    */
    std::set<Instruction *> repeatableInstructions;

	/*
	 * Collect (1) by iterating the InductionVariableManager
	 */
    auto sccManager = LDI->getSCCManager();
    auto sccdag = sccManager->getSCCDAG();
    for (auto ivInfo : allIVInfo->getInductionVariables(*loopSummary)) {
        for (auto I : ivInfo->getAllInstructions()) {
            repeatableInstructions.insert(task->getCloneOfOriginalInstruction(I));
        }
    }
    repeatableInstructions.insert(cmpInst);
    repeatableInstructions.insert(brInst);

	/*
	 * Collect (2)
	 */
    repeatableInstructions.insert(chunkPHI);

	/*
	 * Collect (3) by identifying all reducible SCCs
	 */
    auto nonDOALLSCCs = sccManager->getSCCsWithLoopCarriedDataDependencies();
    for (auto scc : nonDOALLSCCs) {
        auto sccInfo = sccManager->getSCCAttrs(scc);
        if (!sccInfo->canExecuteReducibly()) continue;

        for (auto nodePair : scc->getInternalNodePairs()) {
        auto value = nodePair.first;
        auto inst = cast<Instruction>(value);
        if (inst->getParent() != loopHeader) continue;

        auto instClone = task->getCloneOfOriginalInstruction(inst);
        repeatableInstructions.insert(instClone);
        }

    }

	/*
	 * Collect (4) by identifying header instructions belonging to independent SCCs that are loop invariant
	 */
    for (auto &I : *loopHeader) {
            auto scc = sccdag->sccOfValue(&I);
        auto sccInfo = sccManager->getSCCAttrs(scc);
            if (!sccInfo->canExecuteIndependently()) continue;

        auto isInvariant = invariantManager->isLoopInvariant(&I);
        if (!isInvariant) continue;

            repeatableInstructions.insert(task->getCloneOfOriginalInstruction(&I));
    }

    bool requiresConditionBeforeEnteringHeader = false;
    for (auto &I : *headerClone) {
        if (repeatableInstructions.find(&I) == repeatableInstructions.end()) {
        requiresConditionBeforeEnteringHeader = true;
        break;
        }
    }

    if (requiresConditionBeforeEnteringHeader) {
        auto &loopGoverningIV = loopGoverningIVAttr->getInductionVariable();
        auto loopGoverningPHI = task->getCloneOfOriginalInstruction(loopGoverningIV.getLoopEntryPHI());
        auto stepSize = clonedStepSizeMap.at(&loopGoverningIV);

        
        // In each latch, assert that the previous iteration would have executed
        for (auto latch : loopSummary->getLatches()) {
            BasicBlock *cloneLatch = task->getCloneOfOriginalBasicBlock(latch);
            // cloneLatch->print(errs() << "Addressing latch:\n");
            auto latchTerminator = cloneLatch->getTerminator();
            latchTerminator->eraseFromParent();
            IRBuilder<> latchBuilder(cloneLatch);

            auto currentIVValue = cast<PHINode>(loopGoverningPHI)->getIncomingValueForBlock(cloneLatch);
            auto prevIterationValue = latchBuilder.CreateSub(currentIVValue, stepSize);
            auto clonedCmpInst = updatedCmpInst->clone();
            clonedCmpInst->replaceUsesOfWith(loopGoverningPHI, prevIterationValue);
            latchBuilder.Insert(clonedCmpInst);
            latchBuilder.CreateCondBr(clonedCmpInst, task->getLastBlock(0), headerClone);
        }

        
        // In the preheader, assert that either the first iteration is being executed OR
        // that the previous iteration would have executed. The reason we must also check
        // if this is the first iteration is if the IV condition is such that <= 1
        // iteration would ever occur
        
        auto preheaderTerminator = preheaderClone->getTerminator();
        preheaderTerminator->eraseFromParent();
        IRBuilder<> preheaderBuilder(preheaderClone);
        auto offsetStartValue = cast<PHINode>(loopGoverningPHI)->getIncomingValueForBlock(preheaderClone);
        auto prevIterationValue = preheaderBuilder.CreateSub(offsetStartValue, stepSize);

        auto clonedExitCmpInst = updatedCmpInst->clone();
        clonedExitCmpInst->replaceUsesOfWith(loopGoverningPHI, prevIterationValue);
        preheaderBuilder.Insert(clonedExitCmpInst);
        auto startValue = fetchClone(loopGoverningIV.getStartValue());
        auto isNotFirstIteration = preheaderBuilder.CreateICmpNE(offsetStartValue, startValue);
        preheaderBuilder.CreateCondBr(
        preheaderBuilder.CreateAnd(isNotFirstIteration, clonedExitCmpInst),
        task->getExit(),
        headerClone
        );
    }
}

void DOALL::addChunkFunctionExecutionAsiderOriginalLoop(LoopDependenceInfo *LDI, Function *loopFunction, Master * cat) {

}

Value * DOALL::fetchClone(Value * original) const {
    auto task = this->tasks[0];
    if (isa<ConstantData>(original)) return original;

    if (task->isAnOriginalLiveIn(original)){
        return task->getCloneOfOriginalLiveIn(original);
    }

    assert(isa<Instruction>(original));
    auto iClone = task->getCloneOfOriginalInstruction(cast<Instruction>(original));
    assert(iClone != nullptr);
    return iClone;
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
        task->removeLiveIn(allocaLoc);

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
void DOALL::adjustDataFlowToUseClones(Instruction * cloneInst, int taskIndex) {

}

void DOALL::setReducableVarsToBeginAtIdentifyValue(LoopDependenceInfo * LDI, int taskIndex) {
    //fetch the task
    auto task = this->tasks[taskIndex];

    auto loopStructure = LDI->getLoopStructure();
    auto loopHeader = loopStructure->getHeader();
    auto loopPreHeader = loopStructure->getPreHeader();
    auto headerClone = task->getCloneOfOriginalBasicBlock(loopHeader);
    auto preHeaderClone = task->getCloneOfOriginalBasicBlock(loopPreHeader);

    //iterate over live-out variables
    for (auto envIndex : LDI->loopEnviroment->getEnvIndicesOfLiveOutVars()) {
        //check if the current live-out variable can be reduced
        auto isThisLiveOutVarReducable = this->envBuilder->isReduced(envIndex);
        if (!isThisLiveOutVarReducable) continue;

        //fetch the instruction that produces the live-out varialbes
        auto producer = LDI->loopEnviroment->producerAT(envIndex);
        PHINode * loopEntryProducerPHI = this->fetchLoopEntryPHIOfProducer(LDI, producer);

        //fetch the related instruction of the producer that has been created(cloned) and stored in the parallelized version of the loop
        auto producerClone = cast<PHINode>(task->getCloneOfOriginalInstruction(loopEntryProducerPHI));

        //fetch the cloned pre-header index
        auto incomingIndex = producerClone->getBasicBlockIndex(preHeaderClone);
        assert(incomingIndex != -1);

        //fetch the identify constant for the operation reduced
        //"0" is the identify for "+" accumulator
        auto identifyV = this->getIdentityValueForEnvValue(LDI, incomingIndex, loopEntryProducerPHI->getType());

        //set the initial value for the private variable
        producerClone->setIncomingValue(incomingIndex, identifyV);

    }

}

void DOALL::rewireLoopToIterateChunks(LoopDependenceInfo * LDI) {

}

void DOALL::generateCodeToStoreLiveOutVars(LoopDependenceInfo * LDI, int taskIndex) {
    //fetch the task
    auto task = this->tasks[taskIndex];

    //create a builder that points to the entry point of the function executed by the task
    auto entryBlock = task->getEntry();
    auto entryTerminator = entryBlock->getTerminator();
    IRBuilder<> entryBuilder(entryTerminator);

    auto& taskFunction = *task->getTaskBody();
    DominatorTree taskDT(taskFunction);
    PostDominatorTree taskPDT(taskFunction);
    DominatorSummary taskDS(taskDT, taskPDT);

    // Iterate over live-out variables and inject stores at the end of the execution of the function of the task to propagate the new live-out values back to the caller of the parallelized loop.
    
    auto envUser = this->envBuilder->getUser(taskIndex);
    for (auto envIndex : envUser->getEnvIndicesOfLiveOutVars()) {

        // Fetch the producer of the current live-out variable.
        // Fetch the clones of the producer. If none are specified in the one-to-many mapping,
        // assume the direct cloning of the producer is the only clone
        auto producer = (Instruction*)LDI->loopEnviroment->producerAT(envIndex);
        if (!task->doesOriginalLiveOutHaveManyClones(producer)) {
            auto singleProducerClone = task->getCloneOfOriginalInstruction(producer);
            task->addLiveOut(producer, singleProducerClone);
        }
        auto producerClones = task->getClonesOfOriginalLiveOut(producer);

        // Create GEP access of the single, or reducable, environment variable
        auto envType = producer->getType();
        auto isReduced = this->envBuilder->isReduced(envIndex);
        if (isReduced) {
            envUser->createReducableEnvPtr(entryBuilder, envIndex, envType, this->numOfTaskInstantces, task->getTaskInstanceID());
        } else {
            envUser->createEnvPtr(entryBuilder, envIndex, envType);
        }
        auto envPtr = envUser->getEnvPtr(envIndex);
 
        // If the variable is reducable, store the identity as the initial value
        if (isReduced) {

            // Fetch the operator of the accumulator instruction for this reducable variable
            // Store the identity value of the operator
            auto identityV = this->getIdentityValueForEnvValue(LDI, envIndex, envType);
            entryBuilder.CreateStore(identityV, envPtr);
        }

        
        // Inject store instructions to propagate live-out values back to the caller of the parallelized loop.
        for (auto producerClone : producerClones) {
            auto insertBBs = this->determineLatestPointsToInsertLiveOutStore(LDI, taskIndex, producerClone, isReduced, taskDS);
            for (auto BB : insertBBs) {
                auto producerValueToStore = isReduced
                ? this->fetchOrCreatePHIForIntermediateProducerValueOfReducibleLiveOutVariable(LDI, taskIndex, envIndex, BB, taskDS)
                : producerClone;

                IRBuilder<> liveOutBuilder(BB);
                auto store = (StoreInst*)liveOutBuilder.CreateStore(producerValueToStore, envPtr);
                store->removeFromParent();
                store->insertBefore(BB->getTerminator());
            }
        }
    }
}

void DOALL::addChunkFunctionExecutionAsideOriginalLoop(LoopDependenceInfo * LDI, Function * f, Master& master) {
    // Create the environment.
    this->allocateEnvironmentArray(LDI);
    this->populateLiveInEnvironment(LDI);

    // Fetch the pointer to the environment
    auto envPtr = envBuilder->getEnvArrayInt8Ptr();

    // Fetch the number of cores
    auto numCores = ConstantInt::get(master.int64ptr, LDI->getMaxCoreNumber());

    // Fetch the chunk size
    auto chunkSize = ConstantInt::get(master.int64ptr, LDI->DOALLChunkSize);

    // Call the function that incudes the parallelized loop.
    IRBuilder<> doallBuilder(this->entryPointOfParallelizedLoop);
    auto doallCallInst = doallBuilder.CreateCall(this->taskDispatcher, ArrayRef<Value *>({
        tasks[0]->getTaskBody(),
        envPtr,
        numCores,
        chunkSize
    }));
    auto numThreadsUsed = doallBuilder.CreateExtractValue(doallCallInst, (uint64_t)0);

    /*
    * Propagate the last value of live-out variables to the code outside the parallelized loop.
    */
    auto latestBBAfterDOALLCall = this->propagateLiveOutEnvironment(LDI, numThreadsUsed);

    /*
    * Jump to the unique successor of the loop.
    */
    IRBuilder<> afterDOALLBuilder{latestBBAfterDOALLCall};
    afterDOALLBuilder.CreateBr(this->exitPointOfParallelizedLoop);
}

PHINode * DOALL::fetchLoopEntryPHIOfProducer(LoopDependenceInfo * LDI, Value * producer) {
    // Fetch the SCC manager
    auto sccManager = LDI->getSCCManager();

    auto sccdag = sccManager->getSCCDAG();
    auto producerSCC = sccdag->sccOfValue(producer);

    auto sccInfo = sccManager->getSCCAttrs(producerSCC);
    auto reducibleVariable = sccInfo->getSingleLoopCarriedVariable();
    assert(reducibleVariable != nullptr);

    PHINode *headerProducerPHI = reducibleVariable->getLoopEntryPHIForValueOfVariable(producer);
    assert(headerProducerPHI != nullptr &&
        "The reducible variable should be described by a single PHI in the header");
    return headerProducerPHI;
}

Value * DOALL::getIdentityValueForEnvValue(LoopDependenceInfo * LDI, int environmentIndex, Type* typeForValue) {
    
    // Fetch the SCC manager
    auto sccManager = LDI->getSCCManager();

    // Fetch the producer of new values of the current environment variable
    auto producer = LDI->loopEnviroment->producerAT(environmentIndex);

    // Fetch the SCC that this producer belongs to
    auto producerSCC = sccManager->getSCCDAG()->sccOfValue(producer);
    assert(producerSCC != nullptr && "The environment value doesn't belong to a loop SCC");

    // Fetch the attributes about the producer SCC
    auto sccAttrs = sccManager->getSCCAttrs(producerSCC);
    assert(sccAttrs->numberOfAccumulators() > 0 && "The environment value isn't accumulated!");

    // Fetch the accumulator.
    auto firstAccumI = *(sccAttrs->getAccumulators().begin());

    // Fetch the identity.
    auto identityValue = sccManager->accumOpInfo.generateIdentityFor(
        firstAccumI,
        typeForValue
    );

    return identityValue;
}

std::set<BasicBlock *> DOALL::determineLatestPointsToInsertLiveOutStore (
        LoopDependenceInfo *LDI,
        int taskIndex,
        Instruction *liveOut,
        bool isReduced,
        DominatorSummary &taskDS
)  {
    //fetch the task
    auto task = this->tasks[taskIndex];

    // Fetch the header
    auto loopSummary = LDI->getLoopStructure();
    auto liveOutBlock = liveOut->getParent();

    // Insert stores in loop exit blocks
    // If the live out is reducible, it is fine that the live out value does not dominate the exit
    // as some other intermediate is guaranteed to
    std::set<BasicBlock *> insertPoints;
    for (auto BB : loopSummary->getLoopExitBasicBlocks()) {
        auto cloneBB = task->getCloneOfOriginalBasicBlock(BB);
        auto liveOutDominatesExit = taskDS.DT.dominates(liveOutBlock, cloneBB);
        if (!isReduced && !liveOutDominatesExit) continue;
        insertPoints.insert(cloneBB);
    }

    // If the parallelization scheme introduced other loop exiting blocks,
    // and this live out is reducible, we must store the latest intermediate value for them
    if (isReduced) {
        for (auto predecessor : predecessors(task->getExit())) {
        if (predecessor == task->getEntry()) continue;
        insertPoints.insert(predecessor);
        }
    }

    // If no exit block is dominated by the live out, the scheme is doing
    // short-circuiting logic of some sort on the loop's execution. State the live out's
    // block itself as a safe-guard.
    if (insertPoints.empty()) {
        insertPoints.insert(liveOut->getParent());
    }

    return insertPoints;
}

Instruction * DOALL::fetchOrCreatePHIForIntermediateProducerValueOfReducibleLiveOutVariable (
    LoopDependenceInfo *LDI, 
    int taskIndex,
    int envIndex,
    BasicBlock *insertBasicBlock,
    DominatorSummary &taskDS
) {
    //fetch the scc manager
    auto sccManager = LDI->getSCCManager();

    //fetch the task
    auto task = this->tasks[taskIndex];
    auto& DT = taskDS.DT;
    auto& PDT = taskDS.PDT;

    //fetch all clones of intermediate values of the producer
    auto producer = (Instruction *)LDI->loopEnviroment->producerAT(envIndex);
    auto producerSCC = sccManager->getSCCDAG()->sccOfValue(producer);

    std::set<Instruction *> intermediateValues{};
    for (auto originalPHI : sccManager->getSCCAttrs(producerSCC)->getPHIs()) {
        intermediateValues.insert(task->getCloneOfOriginalInstruction(originalPHI));
    }

    for (auto originalInst : sccManager->getSCCAttrs(producerSCC)->getAccumulators()) {
        intermediateValues.insert(task->getCloneOfOriginalInstruction(originalInst));
    }

    //if in the insert block there already exists a single intermediate
    //return it
    Instruction * lastIntermediateAtInsertBlock = nullptr;
    for (auto intermediateValue : intermediateValues) {
        if (intermediateValue->getParent() != insertBasicBlock) continue;
        if (lastIntermediateAtInsertBlock &&
        DT.dominates(intermediateValue, lastIntermediateAtInsertBlock)) continue;
        lastIntermediateAtInsertBlock = intermediateValue;
    }
    if (lastIntermediateAtInsertBlock) return lastIntermediateAtInsertBlock;

    //produce PHI at the insert point
    IRBuilder<> builder(insertBasicBlock->getFirstNonPHIOrDbgOrLifetime());
    auto producerType = producer->getType();
    auto phiNode = builder.CreatePHI(producerType, pred_size(insertBasicBlock));

    //fetch all PHI node basic block predecessors
    // determine all intermediate values dominating each predecessor
    // determine the intermediate value of this set that dominates no other intermediates in the set
    for (auto predIter = pred_begin(insertBasicBlock); predIter != pred_end(insertBasicBlock); ++predIter) {
        auto predecessor = *predIter;

        std::unordered_set<Instruction *> dominatingValues{};
        for (auto intermediateValue : intermediateValues) {
            auto intermediateBlock = intermediateValue->getParent();
            if (DT.dominates(intermediateBlock, predecessor)) {
                dominatingValues.insert(intermediateValue);
            }
        }

        assert(dominatingValues.size() > 0);

        std::unordered_set<Instruction *> lastDominatingValues{};
        for (auto value : dominatingValues) {
            bool isDominatingOthers = false;
            for (auto otherValue : dominatingValues) {
                if (value == otherValue) continue;
                if (!DT.dominates(value, otherValue)) continue;
                isDominatingOthers = true;
                break;
            }

            if (isDominatingOthers) continue;
            lastDominatingValues.insert(value);
        }

        assert(lastDominatingValues.size() == 1);

        auto lastDominatingIntermediateValue = *lastDominatingValues.begin();

        auto predecessorTerminator = predecessor->getTerminator();
        IRBuilder<> builderAtValue(predecessorTerminator);

        auto correctlyTypedValue = this->castToCorrectReducibleType(
            builderAtValue, lastDominatingIntermediateValue, producer->getType()
        );
        phiNode->addIncoming(correctlyTypedValue, predecessor);
    }

    return phiNode;
}

std::unordered_map<InductionVariable *, Value *> DOALL::cloneIVStepValueComputation(
    LoopDependenceInfo * LDI,
    int taskIndex,
    IRBuilder<>& insertBlock
) {
    //fetch the task
    auto task = this->tasks[taskIndex];

    //fetch loop info
    auto loopStructure = LDI->getLoopStructure();
    auto allIVInfo = LDI->getInductionVariableManager();
    std::unordered_map<InductionVariable *, Value *> clonedStepSizeMap;

    //clone each IV's step value described by the inductionVariable class
    for (auto ivInfo : allIVInfo->getInductionVariables(*loopStructure)) {
        //if the step value is constant or a value present in the original loop, use its clone
        auto singleComputedValue = ivInfo->getSingleComputedStepValue();
        if (singleComputedValue) {
            Value * clonedStepValue = nullptr;
            if (isa<ConstantData>(singleComputedValue)) {
                clonedStepValue = singleComputedValue;
            } else if (task->isAnOriginalLiveIn(singleComputedValue)) {
                clonedStepValue = task->getCloneOfOriginalLiveIn(singleComputedValue);
            } else if (auto singleComputeStepInt = dyn_cast<Instruction>(singleComputedValue)) {
                clonedStepValue = task->getCloneOfOriginalInstruction(singleComputeStepInt);
            }

            if (clonedStepValue) {
                clonedStepSizeMap.insert(std::make_pair(ivInfo, clonedStepValue));
                continue;
            }
        }

        //the step size is a composite SCEV
        //fetch its instruction expansion, cloning into the entry block of the function
        auto expandedInsts = ivInfo->getComputationOfStepValue();
        assert(expandedInsts.size() > 0);
        for (auto expandedInst : expandedInsts) {
            auto clonedInst = expandedInst->clone();
            task->addInstruction(expandedInst, clonedInst);
            insertBlock.Insert(clonedInst);
        }

        //wire the instructions in the expandsion to use the cloned values
        for (auto expandedInst : expandedInsts) {
            this->adjustDataFlowToUseClones(task->getCloneOfOriginalInstruction(expandedInst), 0);
        }
        auto clonedStepValue = task->getCloneOfOriginalInstruction(expandedInsts.back());
        clonedStepSizeMap.insert(std::make_pair(ivInfo, clonedStepValue));
    }
    this->adjustStepValueOfPointerTypeIVToReflectPointerArithmetic(clonedStepSizeMap, insertBlock);

    return clonedStepSizeMap;
}

Value * DOALL::castToCorrectReducibleType(IRBuilder<>& builder, Value * value, Type* targetType) {
    auto valueType = value->getType();
    if (valueType == targetType) return value;

    if (valueType->isIntegerTy() && targetType->isIntegerTy()) {
        return builder.CreateBitCast(value, targetType);
    } else if (valueType->isIntegerTy() && targetType->isFloatingPointTy()) {
        return builder.CreateSIToFP(value, targetType);
    } else if (valueType->isFloatingPointTy() && targetType->isIntegerTy()) {
        return builder.CreateFPToSI(value, targetType);
    } else if (valueType->isFloatingPointTy() && targetType->isFloatingPointTy()) {
        return builder.CreateFPCast(value, targetType);
    } else {
        assert(false && "Cannot cast to non-reduciable type");
    }
    return nullptr;
}

void DOALL::adjustStepValueOfPointerTypeIVToReflectPointerArithmetic (
std::unordered_map<InductionVariable *, Value *> clonedStepValueMap,
IRBuilder<> &insertBlock) {
    //TODO:
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

void DOALL::allocateEnvironmentArray(LoopDependenceInfo * LDI) {
//TODO:
}

void populateLiveInEnvironment(LoopDependenceInfo * LDI) {
    //TODO:
}

BasicBlock * DOALL::propagateLiveOutEnvironment (LoopDependenceInfo *LDI, Value *numberOfThreadsExecuted) {

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