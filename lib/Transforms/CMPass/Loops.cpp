#include "Loops.h"

char Loops::ID = 0;

static RegisterPass<Loops> X("Loops", "Find and Get Loops in the program");

Loops::Loops() : ModulePass{ID} {

}

Loops::~Loops() {

}

void Loops::getAnalysisUsage(AnalysisUsage &AU) const {

    AU.addRequired<PDGAnalysis>();

    AU.addRequired<PostDominatorTree>(); // 
    AU.addRequired<DominatorTree>();

    AU.addRequired<LoopInfo>();
    AU.addRequired<CallGraph>();
    AU.addRequired<ScalarEvolution>();
    AU.setPreservesAll();

}

bool Loops::runOnModule(Module &M) {

    this->program = &M;
    this->pdgAnalysis = &getAnalysis<PDGAnalysis>();
    
    std::vector<LoopStructure *> * loopStructures = this->getLoopStructures();

    if (loopStructures->size() == 0) {
        errs() << "There is no loop to consider...\n";
        delete loopStructures;
        return false;
    }

    for (auto loopS : *loopStructures) {
        errs() << "----loopStructure----\n";
        std::string str;
        raw_string_ostream ros(str);
        loopS->print(ros);
        ros.flush();
        errs() << str << "\n";

    }

    //generate the nesting forest
    auto forest = this->organizeLoopsInTheirNestingForest(*loopStructures);
    delete loopStructures;

    //print the loops
    auto trees = forest->getTrees();
    for (auto treeIt = trees.rbegin(); treeIt != trees.rend(); ++treeIt) {
        // errs() << "print tree: " << &tree << "\n";
        // auto loopStructure = tree->getLoop();
        // auto loopID = loopStructure->getID();
        auto loopS = (*treeIt)->getLoop();
        auto loopI = loopS->getID();
        auto loopFunction = loopS->getFunction();
        auto loopHeader = loopS->getHeader();
        errs() << "printHeader& : " << &loopHeader << "\n";

        std::string prefix{"Parallelizer:    "};
        // for (auto i = 1; i < treeLevel; i++) {
        //     prefix.append("    ");
        // }

        errs() << prefix << "ID: " << loopI << "(" << ")\n";
        errs() << prefix << "    Function: " << loopFunction->getName() << "\n";
        errs() << prefix << "    Loop: " << *loopHeader->getFirstNonPHI() << "\n";
        errs() << prefix << "    LoopHeader: " << *loopHeader << "\n";
        errs() << prefix << "    Loop nesting level: " <<  loopS->getNestingLevel() << "\n";

        // auto printTree = [](StayConnectedNestedLoopForestNode *n, uint32_t treeLevel) {
        //     auto loopS = n->getLoop();
        //     auto loopI = loopS->getID();
        //     auto loopFunction = loopS->getFunction();
        //     auto loopHeader = loopS->getHeader();
        //     errs() << "printHeader& : " << &loopHeader << "\n";

        //     std::string prefix{"Parallelizer:    "};
        //     for (auto i = 1; i < treeLevel; i++) {
        //         prefix.append("    ");
        //     }

        //     errs() << prefix << "ID: " << loopI << "(" << treeLevel << ")\n";
        //     errs() << prefix << "    Function: " << loopFunction->getName() << "\n";
        //     errs() << prefix << "    Loop: " << *loopHeader->getFirstNonPHI() << "\n";
        //     errs() << prefix << "    LoopHeader: " << *loopHeader << "\n";
        //     errs() << prefix << "    Loop nesting level: " <<  loopS->getNestingLevel() << "\n";

        //     return false;
        // };
        // tree->visitPreOrder(printTree);
    }

    // DOALL doall(M);

    //parallelize the loop we selected, from outermost to the inner ones
    bool modified = false;
    std::unordered_map<BasicBlock *, bool> modifiedBBs{};
    std::vector<DOALLTask *> loopTasks;
    errs() << "tree size: " << forest->getTrees().size() << "\n";
    for (auto treeIt = trees.rbegin(); treeIt != trees.rend(); ++treeIt) {
        //select the loop to parallelize
        // errs() << "tree: " << &tree << "\n";
        auto loopsToParallelize = this->selectTheOrderOfLoopsToParallelize(*treeIt); 
        errs() << "loops size: " << loopsToParallelize.size() << "\n";
        //parallelize the loops
        for (auto loop : loopsToParallelize) {
            //check if we can parallelize the loop
            auto ls = loop->getLoopStructure();

            // errs() << "----loopStructure By sort----\n";
            // std::string str;
            // raw_string_ostream ros(str);
            // ls->print(ros);
            // ros.flush();
            // errs() << str << "\n";
            auto safe = true;
            for (auto BB : ls->getBasicBlocks()) {
                if (modifiedBBs[BB]) {
                    safe = false;
                    break;
                }
            }
            auto loopID = ls->getID();
            if (!safe) {
                errs() << "Parallelizer: LoopID:" << loopID << "cannot be parallelized because one of its parent has been parallelized already...\n";
                continue;
            }

            //parallelize the current loop
            // auto loopIsParallelized = this->parallelizeLoop(loop, doall);


            //determine whether the curret loop should be paralleled
            //for now, we only consider the outer most loop
            //that's to say, the nest level  is 1
            if (ls->getNestingLevel() == 1) {
                //define the signature of the task
                //should be modified later on, may be dynamically decided
                auto& ctx = this->program->getContext();
                auto int8 = IntegerType::get(ctx, 8);
                auto int64 = IntegerType::get(ctx, 64);
                Type * types[] = {PointerType::getUnqual(int8),
                    int64, int64, int64};
                auto funcArgTyeps = ArrayRef<Type*>(types);
                FunctionType * funcType = FunctionType::get(Type::getVoidTy(ctx), funcArgTyeps, false);
                
                //create a task
                DOALLTask * task = new DOALLTask(loopID, funcType, this->program);
                PDG * wholePdg = this->pdgAnalysis->getPDG();
                std::unordered_map<Value *, Value *> liveInInitVal;
                // get liveIn Vars
                for (auto envIndex : loop->loopEnviroment->getEnvIndicesOfLiveInVars()) {
                    loop->loopEnviroment->producerAT(envIndex)->print(errs()
                    << "LiveIn Loop env, producer:\t");
                    errs() << "\n";
                    task->addLiveInVar(loop->loopEnviroment->producerAT(envIndex));

                    // analysis which variable we can't simply used in the new loop func
                    // and need further alloca a block of extra memory and init it
                    Value * liveIn = loop->loopEnviroment->producerAT(envIndex);
                    for (auto subedge : wholePdg->getEdges()) {
                        auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                        auto toNodeSubT = subedge->getIncomingNode()->getT();

                        if (cast<Instruction>(fromNodeSubT) == cast<Instruction>(liveIn) ) {
                            if (subedge->isMustDependence() && subedge->dataDepToString() == "RAW") {
                                if (isa<StoreInst>(cast<Instruction>(toNodeSubT)) && ls->isIncluded(cast<Instruction>(toNodeSubT))) {
                                    // means this liveInVar need alloca memory
                                    errs() << "liveIn: " << *liveIn << " need alloca memory.\n";
                                    liveInInitVal[liveIn] = nullptr; 
                                }
                            }
                        }
                    }
                }
                for (auto pair : liveInInitVal) {
                    for (auto subedge : wholePdg->getEdges()) {
                        auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                        auto toNodeSubT = subedge->getIncomingNode()->getT();

                        if (cast<Instruction>(fromNodeSubT) == cast<Instruction>(pair.first) ) {
                            if (subedge->isMustDependence() && subedge->dataDepToString() == "RAW") {
                                if (isa<StoreInst>(cast<Instruction>(toNodeSubT)) && !ls->isIncluded(cast<Instruction>(toNodeSubT))) {
                                    // means this liveInVar need init value
                                    liveInInitVal[pair.first] = cast<StoreInst>(toNodeSubT)->getOperand(0); 
                                }
                            }
                        }
                    }
                }
                //print liveInInitVal
                for (auto pair : liveInInitVal) {
                    errs() << "liveIn: " << *pair.first << ", store init val: " << *pair.second << "\n";
                }
                task->setLiveInInitVal(liveInInitVal);


                BasicBlock * loopPreHeader = ls->getPreHeader();
                //record where to insert the loop function
                Instruction * whereToInsertFunc = loopPreHeader->getTerminator();
                BasicBlock * loopHeader = ls->getHeader();
                errs() << "whereToInsertFunc Before: " << *whereToInsertFunc << "\n";
                task->setWhereToInsertFunc(whereToInsertFunc);
                //copy loop header
                task->setLoopHeader(loopHeader);
                if (ls->getLatches().size() == 1) {
                    // copy loop latch
                    task->setLoopLatch(*ls->getLatches().begin());
                } else {
                    errs() << "some thing wrong in loop latch...\n";
                }

                // get safeCheckCallInstInLoopBody
                std::vector<Instruction *> safecheckCallInst;
                std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsInLoopBody;
                std::unordered_map<Instruction *, std::set<Instruction *>> allInstsToOneCallInstInLoopBody;
                std::unordered_set<BasicBlock *> loopBody = ls->getLoopBody();

                
                
                for (auto body : loopBody) {
                    for (auto& I : *body) {
                        if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                            if (IsSafeCheckCall(CI)) {
                                safecheckCallInst.push_back(&I);
                                //SafeCheckSet.insert(&I);
                            }
                        }
                    }
                }
                
                for (auto callInst : safecheckCallInst) {
                    std::set<Instruction *> safeCheckInsts;
                    std::set<Instruction *> workList; // for %base.load call_metadata_load and so on
                    // to: callInst
                    //from : 
                    for (auto subedge : wholePdg->getEdges()) {
                        auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                        auto toNodeSubT = subedge->getIncomingNode()->getT();

                        if (cast<Instruction>(toNodeSubT) == callInst) {
                            if (subedge->isMustDependence() && 
                            subedge->dataDepToString() == "RAW") {
                                // if is a liveInvars no need to be added
                                if (loop->loopEnviroment->isLiveIn(fromNodeSubT)) {
                                    errs() << "--- " << *cast<Instruction>(fromNodeSubT) << " -is liveIn...\n";
                                } else {
                                    // TODO: judge is inside the loop 
                                    safeCheckInsts.insert(cast<Instruction>(fromNodeSubT));
                                    if (isa<LoadInst>(cast<Instruction>(fromNodeSubT))) { // %base.load = load xxx
                                        workList.insert(cast<Instruction>(fromNodeSubT));
                                    }
                                }
                                
                            }
                        }
                    }

                    // while(!worklist.empty()) {
                    //     Instruction * inst = *
                    // }
                    safeCheckInstsInLoopBody[callInst] = safeCheckInsts;

                    std::set<Instruction *> worklistForOriginalCodes;
                    std::set<Instruction *> allInstsToOneCall(safeCheckInsts.begin(), safeCheckInsts.end());
                    for (auto inst : safeCheckInsts) {
                        for (auto subedge : wholePdg->getEdges()) {
                            auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                            auto toNodeSubT = subedge->getIncomingNode()->getT();

                            if (cast<Instruction>(toNodeSubT) == inst) {
                                if (subedge->isMustDependence() && 
                                subedge->dataDepToString() == "RAW") {
                                    // if is a liveInvars no need to be added
                                    if (loop->loopEnviroment->isLiveIn(fromNodeSubT)) { 
                                        errs() << "^^^ " << *cast<Instruction>(fromNodeSubT) << " -is liveIn...\n";
                                    } else {
                                        // TODO: judge is inside the loop 
                                        allInstsToOneCall.insert(cast<Instruction>(fromNodeSubT));
                                        worklistForOriginalCodes.insert(cast<Instruction>(fromNodeSubT));
                                    }                                
                                }
                            }
                        }
                    }

                    while (!worklistForOriginalCodes.empty()) {
                        Instruction * inst = *worklistForOriginalCodes.begin();
                        worklistForOriginalCodes.erase(inst);
                        for (auto subedge : wholePdg->getEdges()) {
                            auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                            auto toNodeSubT = subedge->getIncomingNode()->getT();

                            if (cast<Instruction>(toNodeSubT) == inst) {
                                if (subedge->isMustDependence() && 
                                subedge->dataDepToString() == "RAW") {
                                    // if is a liveInvars no need to be added
                                    if (loop->loopEnviroment->isLiveIn(fromNodeSubT)) { 
                                        errs() << "*** " << *cast<Instruction>(fromNodeSubT) << " -is liveIn...\n";
                                    } else {
                                        // TODO: judge is inside the loop 
                                        allInstsToOneCall.insert(cast<Instruction>(fromNodeSubT));
                                        worklistForOriginalCodes.insert(cast<Instruction>(fromNodeSubT));
                                    }                                
                                }
                            }
                        }

                    }

                    allInstsToOneCallInstInLoopBody[callInst] = allInstsToOneCall;
                }



                // get safeCheckInstsInLoopBody (Call + bitcast + load alloca...etc)
                // get allInstsToOneCallInLoopBody (Call + bitcast + load alloca... + original code(load,store,etc))
                task->setSafeCheckCallInstsInLoopBody(safecheckCallInst);
                task->setSafeCheckInstsInLoopBody(safeCheckInstsInLoopBody);
                task->setAllInstsToOneCallInstInLoopBody(allInstsToOneCallInstInLoopBody);

                

                //push task into looptask
                loopTasks.push_back(task);

                //print some info for debugging
                std::unordered_map<Instruction*, std::set<Instruction *>>::const_iterator iter1;
                for (iter1 = safeCheckInstsInLoopBody.begin(); iter1 != safeCheckInstsInLoopBody.end(); ++iter1) {
                    errs() << *(iter1->first) << " has : " << iter1->second.size() << "\n";
                    for (auto I : iter1->second) {
                        errs() << *I <<"\n";
                    }
                }
                errs() << "^^^^^safeCheckInstsInLoopBody^^^^^\n";
                std::unordered_map<Instruction*, std::set<Instruction *>>::const_iterator iter2;
                for (iter2 = allInstsToOneCallInstInLoopBody.begin(); iter2 != allInstsToOneCallInstInLoopBody.end(); ++iter2) {
                    errs() << *(iter2->first) << " has : " << iter2->second.size() << "\n";
                    for (auto I : iter2->second) {
                        errs() << *I <<"\n";
                    }
                }
                errs() << "^^^^^allInstsToOneCallInstInLoopBody^^^^^\n";
            }


            // for (auto envIndex : loop->loopEnviroment->getEnvIndicesOfLiveOutVars()) {
            //     loop->loopEnviroment->producerAT(envIndex)->print(errs()
            //     << "Post Loop env " << count++ << ", producer:\t");
            //     errs() << "\n";
            // }

            
            // handle loop body --- remove the rendundant basicblock in loop latch



            //determine where to insert this function

            // create this function

            //insert this function

            //handle br relation between basicblocks


            //keep track of the parallelization
            if (true) {
                errs() << "Parallelizer: Loop " << loopID << " has been parallelized.\n";
                modified = true;
                for (auto bb : ls->getBasicBlocks()) {
                    modifiedBBs[bb] = true;
                }
            }
        }




        //free the memory
        // for (auto loop : loopsToParallelize) {
        //     if (loop) delete loop;
        // }

    }

    // transform those loopTasks
    for (auto task : loopTasks) {
        errs() << "---naive task: " << "\n";
        task->transform();
        errs() << "---final task: " << "\n";
    }

    //erase original safe check codes in original loop
    for (auto task : loopTasks) {
        task->eraseSafeCheckCodes();
    }


    errs() << "Loops::runOnModule...before return\n";
    return false;
}

Function * Loops::getEntryFunction(void) const {
    return this->program->getFunction("softboundcets_pseudo_main");//"main"
}

std::vector<LoopStructure *> * Loops::getLoopStructures(void) {
    auto allLoops = new std::vector<LoopStructure *> ();

    auto mainFunction = this->getEntryFunction();
    assert(mainFunction != nullptr);
    auto functions = this->getModuleFunctionsReachableFrom(this->program, mainFunction);

    //check if we should filter out loops

    //append loops of each function
    auto nextLoopIndex = 0;
    for (auto func : *functions) {
        if (func->empty()) continue;
        if (func->isDeclaration()) continue;

        auto& LI = getAnalysis<LoopInfo>(*func);
        if (std::distance(LI.begin(), LI.end()) == 0) continue;

        //fetch the function dependence graph
        // auto funDG = this->getFunctionDependenceGraph(func);

        //fetch the post dominators and scalar evolutions
        // auto DS = this->getDominators(func);
        // auto& SE = getAnalysis<ScalarEvolution>(*func);

        //fetch all loops of the current function
        // auto loops = LI.getLoopsInPreorder();
        auto loops = LI.getLoopsInfoBaseLoopsInPreorder();

        for (auto loop : loops) {
            auto currentLoopIndex = nextLoopIndex++;
            auto loopStructure = new LoopStructure(loop);
            auto loopHeader = loopStructure->getHeader();

            allLoops->push_back(loopStructure);
            this->loopHeaderToLoopIndexMap.insert(std::make_pair(loopHeader, currentLoopIndex));

        }
    }
    delete functions;
    return allLoops;
}
std::vector<LoopStructure *> * Loops::getLoopStructures(Function * func) {
    //check if the function has loops
    auto allLoops = new std::vector<LoopStructure *>();
    //---zyy, may be should check fun is a declration or not
    auto& LI = getAnalysis<LoopInfo>(*func);

    if (std::distance(LI.begin(), LI.end()) == 0) {
        return allLoops;
    }

    //fetch all loops of the current function
    // auto loops = LI.getLoopsInPreorder();
    auto loops = LI.getLoopsInfoBaseLoopsInPreorder();
    for (auto loop : loops) {
        //check if the loop is hot enough
        auto loopStructure = new LoopStructure(loop);
        //at this time 2021.7.5 , we assume that each loop is a hot loop. Optimize later
        allLoops->push_back(loopStructure);
    }

    return allLoops;
}

std::vector<Function *> * Loops::getModuleFunctionsReachableFrom(Module * M, Function * startingPoint) {
    auto functions = new std::vector<Function*>();
    auto &callGraph = getAnalysis<CallGraph>();

    // Compute the set of functions reachable from the starting point.
    std::set<Function *> funcSet ;
    std::queue<Function *> funcToTraverse;
    funcToTraverse.push(startingPoint);
    while (!funcToTraverse.empty()) {
        auto func = funcToTraverse.front();
        funcToTraverse.pop();
        if (funcSet.find(func) != funcSet.end()) continue;
        funcSet.insert(func);

        auto funcCGNode = callGraph[func];
        for (auto &callRecord : make_range(funcCGNode->begin(), funcCGNode->end())) {
            auto F = callRecord.second->getFunction();
            if (!F) {
                continue ;
            }
            if (F->empty()) {
                continue;
            }
            funcToTraverse.push(F);
        }
    }

    for (auto &f : *M){
        if (funcSet.find(&f) == funcSet.end()){
            continue ;
        }
        functions->push_back(&f);
    }

    auto compareFunctions = [] (Function *f1, Function *f2) -> bool {
        auto f1Name = f1->getName();
        auto f2Name = f2->getName();
        return (f1Name.compare(f2Name) < 0) ? true : false;
    };

    std::sort(functions->begin(), functions->end(), compareFunctions);

    return functions;
}

PDG * Loops::getFunctionDependenceGraph(Function * func) {
    return this->pdgAnalysis->getFunctionPDG(*func);
}

StayConnectedNestedLoopForest * Loops::organizeLoopsInTheirNestingForest(std::vector<LoopStructure *> const & loops) {
    //compute the dominators
    std::unordered_map<Function *, DominatorSummary *> doms{};
    for (auto loop : loops) {
        auto fun = loop->getFunction();
        if (doms.find(fun) != doms.end() ) {
            continue;
        }
        doms[fun] = this->getDominators(fun);
    }

    //compute the forest
    auto nestedLooForest = new StayConnectedNestedLoopForest(loops, doms);

    //free the memory
    for (auto pair : doms) {
        delete pair.second;
    }

    return nestedLooForest;
}


DominatorSummary * Loops::getDominators(Function * f) {
    auto& DT = getAnalysis<DominatorTree>(*f);
    auto& PDT = getAnalysis<PostDominatorTree>(*f);

    auto ds = new DominatorSummary(DT, PDT);
    return ds;
}

std::vector<LoopDependenceInfo *> Loops::selectTheOrderOfLoopsToParallelize(StayConnectedNestedLoopForestNode * tree) {

    std::vector<LoopDependenceInfo *> selectedLoops{};


    /*
    * Compute the amount of time that can be saved by a parallelization technique per loop.
    */
    std::map<LoopDependenceInfo *, uint64_t> timeSavedLoops;
    auto selector = [this, &timeSavedLoops](StayConnectedNestedLoopForestNode *n, uint32_t treeLevel) -> bool {

      /*
       * Fetch the loop.
       */
        auto ls = n->getLoop();
          //fetch related information
        auto header = ls->getHeader();
        if (header == nullptr) errs() << "---308\n";
        auto function = header->getParent();
        errs() << "selector func: " << function->getName() << "\n";
        auto funcPDG = this->getFunctionDependenceGraph(function);
        auto DS = this->getDominators(function);

        auto& LI = getAnalysis<LoopInfo>(*function);
        auto& SE = getAnalysis<ScalarEvolution>(*function);
        errs() << "Header& : " << &header << "\n";
        auto llvmLoop = LI.getLoopFor(header);

        //check of loopIndex provided is within bounds
        errs() << "selector 282---\n";
        if (funcPDG == nullptr || llvmLoop == nullptr || &SE == nullptr || &LI == nullptr) {
            errs() << "there is a null ptr...\n";
        }
        auto ldi = new LoopDependenceInfo(funcPDG, llvmLoop, *DS, SE);

        delete DS;

        timeSavedLoops[ldi] = 0;

      return false;
    };
    tree->visitPreOrder(selector);

    errs() << "timeSafedLoops Size: " << timeSavedLoops.size() << "\n";
    /*
     * Filter out loops that should not be parallelized.
     */
    for (auto loopPair : timeSavedLoops){

      /*
       * Fetch the loop.
       */
      auto ldi = loopPair.first;

      /*
       * Compute the total amount of time saved by parallelizing this loop.
       */
      
      /*
       * Check if the time saved is enough.
       */

      /*
       * The loop is worth parallelizing it.
       *
       * Add it.
       */
      selectedLoops.push_back(ldi);
    }

    /*
     * Sort the loops depending on the amount of time that can be saved by a parallelization technique.
     */
    auto compareOperator = [&timeSavedLoops](LoopDependenceInfo *l1, LoopDependenceInfo *l2){
    //   auto s1 = timeSavedLoops[l1];
    //   auto s2 = timeSavedLoops[l2];
    //   if (s1 != s2){
    //     return s1 > s2;
    //   }

      /*
       * The loops have the same saved time.
       * Sort them by nesting level.
       */
      auto l1LS = l1->getLoopStructure();
      auto l2LS = l2->getLoopStructure();
      return l1LS->getNestingLevel() < l2LS->getNestingLevel();
    };
    std::sort(selectedLoops.begin(), selectedLoops.end(), compareOperator);

    errs() << "Parallelizer: LoopSelector: End\n";

    return selectedLoops;
}

bool Loops::parallelizeLoop(LoopDependenceInfo * LDI, DOALL& doall) {
    assert(LDI != nullptr);

    //fetch the loop header
    auto loopStructure = LDI->getLoopStructure();
    auto loopHeader = loopStructure->getHeader();
    auto loopPreHeader = loopStructure->getPreHeader();

    //fetch the loop function
    auto loopFunc = loopStructure->getFunction();

    errs() << "ParallelizeLoop...\n";
    errs() << "ParallelizeLoop: Function = " << loopFunc->getName() << "\n";
    errs() << "ParallelizeLoop: LoopID: " << LDI->getID() << " loopStructureID: " << loopStructure->getID() << " = " << *loopHeader->getFirstNonPHI() << "\n";
    errs() << "ParallelizeLoop: Nesting Level = " << loopStructure->getNestingLevel() << "\n";
    errs() << "Parallelizer: Number of threads to extrac: "  << LDI->getMaxCoreNumber() << "\n";

    //parallelize the loop
    bool codeModified = false;
    if (doall.canBeAppliedToLoop(LDI)) {
        doall.reset();
        codeModified = doall.apply(LDI);
        errs() << "after doall apply...\n";
    }

    if (!codeModified) {
        errs() << "Parallelizer: Exit(no code midified)\n";
        return false;
    }

    //fetch the enviroment array where the exit block ID has been stored
    // Value * envArray = doall.getEnvArray();
    // assert(envArray != nullptr);

    // //fetch entry and exit point executed by the parallelized loop
    // BasicBlock * entryPoint = doall.getLoopEntryPoint();
    // BasicBlock * exitPoint = doall.getLoopExitPoint();
    // assert(entryPoint != nullptr && exitPoint != nullptr);



    // //the loop has been parallelized
    // //link the parallelized loop within the original functio that includes the sequentail loop
    // auto exitIndex = cast<Value>(ConstantInt::get(IntegerType::get(this->program->getContext(), 64), LDI->loopEnviroment->indexOfExitBlockTaken()));
    // auto loopExitBlocks = loopStructure->getLoopExitBasicBlocks();
    // this->linkTransformedLoopToOriginalFunction(
    //     loopFunc->getParent(),
    //     loopPreHeader,
    //     entryPoint,
    //     exitPoint,
    //     envArray,
    //     exitIndex,
    //     loopExitBlocks
    // );

    errs() << "final Module: " << *this->program << "\n";

    errs() << "parallelizeLoop: Exit\n";
    return true;
}

void Loops::linkTransformedLoopToOriginalFunction(
    Module * module,
    BasicBlock * originalPreHeader,
    BasicBlock * startOfParallelizeLoopInOriginalFunc,
    BasicBlock * endOfParallelizedLoopInOriginalFunc,
    Value * envArray,
    Value * envIndexForExitVariable,
    std::vector<BasicBlock*>& loopExitBlocks) {

    //create the global variable for the parallelized loop
    auto globalBool = new GlobalVariable(*module, IntegerType::get(this->program->getContext(), 32), /*isConstant*/  false, GlobalValue::ExternalLinkage, Constant::getNullValue(IntegerType::get(this->program->getContext(), 32)));
    auto const0 = ConstantInt::get(IntegerType::get(this->program->getContext(), 32), 0);
    auto const1 = ConstantInt::get(IntegerType::get(this->program->getContext(), 32), 1);

    //fetch the terminator of the prehead
    auto originalTerminator = originalPreHeader->getTerminator();

    //fetch the header of the original loop
    auto originalHeader = originalTerminator->getSuccessor(0);

    //check if another invocation of the loop is running in parallel
    IRBuilder<> loopSwitchBuilder(originalTerminator);
    auto globalLoad = loopSwitchBuilder.CreateLoad(globalBool);
    auto compareInstruction = loopSwitchBuilder.CreateICmpEQ(globalLoad, const0);
    loopSwitchBuilder.CreateCondBr(
        compareInstruction,
        startOfParallelizeLoopInOriginalFunc,
        originalHeader
    );
    originalTerminator->eraseFromParent();

    IRBuilder<> endBuilder(endOfParallelizedLoopInOriginalFunc);
    //load exit block environment variable and branch to the correct loop exit block
    if (loopExitBlocks.size() == 1) {
        endBuilder.CreateBr(loopExitBlocks[0]);
    } else {
        //compute how many values can fit in a cache line
        auto valuesInCacheLine = 64 / sizeof(int64_t); // getCachedLineBytes()
        auto exitEnvPtr = endBuilder.CreateInBoundsGEP(
            envArray, ArrayRef<Value*>({
                cast<Value>(ConstantInt::get(IntegerType::get(this->program->getContext(), 64), 0)), 
                endBuilder.CreateMul(envIndexForExitVariable, ConstantInt::get(IntegerType::get(this->program->getContext(), 64), valuesInCacheLine))
            })
        );
        auto exitEnvCast = endBuilder.CreateIntCast(endBuilder.CreateLoad(exitEnvPtr), IntegerType::get(this->program->getContext(), 32), /*isSigned*/ false);
        auto exitSwitch = endBuilder.CreateSwitch(exitEnvCast, loopExitBlocks[0]);
        for (int i = 1; i < loopExitBlocks.size(); i++) {
            exitSwitch->addCase(ConstantInt::get(IntegerType::get(this->program->getContext(), 32), i), loopExitBlocks[i]);
        }
    }

    //LCSSA constants need to be replicated for parallelized code path
    for (auto bb : loopExitBlocks) {
        for (auto& I : *bb) {
            if (auto phi = dyn_cast<PHINode>(&I)) {
                auto bbIndex = phi->getBasicBlockIndex(originalHeader);
                if (bbIndex == -1) {
                    continue;
                }
                auto val = phi->getIncomingValue(bbIndex);
                if (isa<Constant>(val)) {
                    phi->addIncoming(val, endOfParallelizedLoopInOriginalFunc);
                }
                continue;
            }
            break;
        }
    }

    //set/reset global variable so only one invocation of the loop is run in parallel at a time
    if (startOfParallelizeLoopInOriginalFunc == endOfParallelizedLoopInOriginalFunc) {
        endBuilder.SetInsertPoint(&*endOfParallelizedLoopInOriginalFunc->begin());
        endBuilder.CreateStore(const1, globalBool);
    } else {
        IRBuilder<> startBuilder(&*startOfParallelizeLoopInOriginalFunc->begin());
        startBuilder.CreateStore(const1, globalBool);
    }
    endBuilder.SetInsertPoint(endOfParallelizedLoopInOriginalFunc->getTerminator());
    endBuilder.CreateStore(const0, globalBool);


}



