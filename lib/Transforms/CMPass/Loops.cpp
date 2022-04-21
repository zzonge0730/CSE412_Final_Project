#include "Loops.h"

#define SafeC 1

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

    // for (auto loopS : *loopStructures) {
    //     errs() << "----loopStructure----\n";
    //     std::string str;
    //     raw_string_ostream ros(str);
    //     loopS->print(ros);
    //     ros.flush();
    //     errs() << str << "\n";

    // }

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

    Constant * joinFunc = generateJoinFunc();

    std::unordered_set<BasicBlock *> allLoopBasicBlocks;

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
        //get max nestinglevel
        
        // std::set<uint32_t> levelSet;
        std::unordered_set<BasicBlock *> loopPreHeaders;
        std::unordered_set<BasicBlock *> loopLatchBBs;
        for (auto loop : loopsToParallelize) {
            loopPreHeaders.insert(loop->getLoopStructure()->getPreHeader());
            loopLatchBBs.insert(loop->getLoopStructure()->getLatches().begin(), loop->getLoopStructure()->getLatches().end());
        }
        // uint32_t maxNestingLevel = *--levelSet.end();

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
            // auto safe = true;
            // for (auto BB : ls->getBasicBlocks()) {
            //     if (modifiedBBs[BB]) {
            //         safe = false;
            //         break;
            //     }
            // }

            auto loopID = ls->getID();
            // if (!safe) {
            //     errs() << "Parallelizer: LoopID:" << loopID << "cannot be parallelized because one of its parent has been parallelized already...\n";
            //     continue;
            // }

            //print loop PDG
            
            // errs() << "loopID: " << loopID << " 's pdg: " <<"\n";
            // std::string loopStr;
            // raw_string_ostream loopRos(loopStr);
            // loopPDG->print(loopRos);
            // loopRos.flush();
            // errs() << loopStr << "\n";
            errs() << "----------------\n";



            //determine whether the curret loop should be paralleled
            //for now, we only consider the outer most loop
            //that's to say, the nest level  is 1
            if (ls->getNestingLevel() == 1) {
                // PDG * wholePdg = this->pdgAnalysis->getPDG();
                PDG * loopPDG = loop->getLoopPDG();
                Function * loopFunc = ls->getFunction();
                PDG * loopFuncPDG = this->pdgAnalysis->getFunctionPDG(*loopFunc);
                
                for (auto BB : ls->getBasicBlocks()) {
                    // errs() << "---BB: " << *BB << "\n";
                    allLoopBasicBlocks.insert(BB);
                }


                // for (auto BB : ls->getLoopExitBasicBlocks()) {
                //     errs() << "---exit: " << *BB <<"\n";
                // }

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
                BasicBlock * loopPreHeader = ls->getPreHeader();
                //record where to insert the loop function
                Instruction * whereToInsertFunc = loopPreHeader->getTerminator();
                BasicBlock * loopHeader = ls->getHeader();
                errs() << "whereToInsertFunc Before: " << *whereToInsertFunc << "\n";
                task->setWhereToInsertFunc(whereToInsertFunc);

                //set join func
                task->setJoinFunc(joinFunc);
                //set join Points, before return this function there should be join points for each parallel loop
                std::unordered_set<Instruction *> joinPoints;
                for (BasicBlock& BB : *loopHeader->getParent()) {
                    for (Instruction& inst : BB) {
                        if (isa<ReturnInst>(&inst)) {    
                            joinPoints.insert(&(*(BB.getFirstInsertionPt())));
                        }
                    }
                }
                task->setJoinPoints(joinPoints);


                //copy loop header
                task->setLoopHeader(loopHeader);
                


                
                std::unordered_map<Value *, Value *> liveInInitVal;
                std::unordered_map<Value *, std::unordered_set<Instruction *>> bitcastLiveInVarRelated;
                // get liveIn Vars
                for (auto envIndex : loop->loopEnviroment->getEnvIndicesOfLiveInVars()) {
                    loop->loopEnviroment->producerAT(envIndex)->print(errs()
                    << "LiveIn Loop env, producer:\t");
                    errs() << "\n";
                    task->addLiveInVar(loop->loopEnviroment->producerAT(envIndex));

                    // analysis which variable we can't simply used in the new loop func
                    // and need further alloca a block of extra memory and init it
                    Value * liveIn = loop->loopEnviroment->producerAT(envIndex);
                    // for (auto subedge : wholePdg->getEdges()) {
                    //old
                    // for (auto subedge : loopFuncPDG->getEdges()) {
                    //     auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                    //     auto toNodeSubT = subedge->getIncomingNode()->getT();

                    //     if (cast<Instruction>(fromNodeSubT) == cast<Instruction>(liveIn) ) {
                    //         if (subedge->isMustDependence() && subedge->dataDepToString() == "RAW") {
                    //             if (isa<StoreInst>(cast<Instruction>(toNodeSubT)) && ls->isIncluded(cast<Instruction>(toNodeSubT))) {
                    //                 // means this liveInVar need alloca memory
                    //                 errs() << "liveIn: " << *liveIn << " need alloca memory.\n";
                    //                 liveInInitVal[liveIn] = nullptr; 
                    //             }
                    //         }
                    //     }
                    // }

                    //new: more effective way to get the needed val, instead of naively traverse
                    //fetch the DGNode
                    auto fromNode = loopFuncPDG->fetchNode(liveIn);
                    if (fromNode != nullptr) {
                        for (auto &edge : fromNode->getOutgoingEdges()) {
                            if (edge->isMustDependence() && edge->dataDepToString()=="RAW") {
                                auto toNode = cast<Instruction>(edge->getIncomingNode()->getT());
                                if (isa<StoreInst>(toNode) && ls->isIncluded(toNode)) {
                                    liveInInitVal[liveIn] = nullptr; 
                                }
                            }
                        }
                    }


                    if (isa<BitCastInst>(cast<Instruction>(liveIn))) {
                        bitcastLiveInVarRelated[liveIn] = {};
                    }
                }
                
                for (auto pair : liveInInitVal) {
                    StoreInst * theLastStoreInst = nullptr;
                    //old
                    // for (auto subedge : wholePdg->getEdges()) {
                    // for (auto subedge : loopFuncPDG->getEdges()) {    
                    //     auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                    //     auto toNodeSubT = subedge->getIncomingNode()->getT();

                    //     if (cast<Instruction>(fromNodeSubT) == cast<Instruction>(pair.first) ) {
                    //         if (subedge->isMustDependence() && subedge->dataDepToString() == "RAW") {
                    //             if (isa<StoreInst>(cast<Instruction>(toNodeSubT)) && !ls->isIncluded(cast<Instruction>(toNodeSubT))) { // 
                    //                 // means this liveInVar need init value
                    //                 Value * storeVal = cast<StoreInst>(toNodeSubT)->getOperand(0);
                    //                 // find the last toNodeSubT happens before wheretoInsertFunc
                    //                 // and not in loopLatch BB
                    //                 if (instHappensBefore(cast<StoreInst>(toNodeSubT), whereToInsertFunc) && 
                    //                 loopPreHeaders.count(cast<StoreInst>(toNodeSubT)->getParent()) > 0) {
                    //                     if (theLastStoreInst == nullptr) {
                    //                         theLastStoreInst = cast<StoreInst>(toNodeSubT);
                    //                         liveInInitVal[pair.first] = storeVal;
                    //                     } else {
                    //                         if (!instHappensBefore(cast<StoreInst>(toNodeSubT), theLastStoreInst)) {
                    //                             theLastStoreInst = cast<StoreInst>(toNodeSubT);
                    //                             liveInInitVal[pair.first] = storeVal;
                    //                         }
                    //                     }
                                        
                    //                 }
                    //             }
                    //         }
                    //     }
                    // }
                    //new more effective
                    auto fromNode = loopFuncPDG->fetchNode(pair.first);
                    if (fromNode != nullptr) {
                        for (auto &edge : fromNode->getOutgoingEdges()) {
                            if (edge->isMustDependence() && edge->dataDepToString()=="RAW") {
                                auto toNode = cast<Instruction>(edge->getIncomingNode()->getT());
                                if (isa<StoreInst>(toNode) && !ls->isIncluded(toNode)) {
                                    StoreInst * toNodeStoreInst = cast<StoreInst>(toNode);
                                    Value * storeVal = toNodeStoreInst->getOperand(0);
                                    if (instHappensBefore(toNodeStoreInst, whereToInsertFunc) && 
                                    loopPreHeaders.count(toNodeStoreInst->getParent()) > 0) {
                                        if (theLastStoreInst == nullptr) {
                                            theLastStoreInst = toNodeStoreInst;
                                            liveInInitVal[pair.first] = storeVal;
                                        } else {
                                            if (!instHappensBefore(toNodeStoreInst, theLastStoreInst)) {
                                                theLastStoreInst = toNodeStoreInst;
                                                liveInInitVal[pair.first] = storeVal;
                                            }
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }


                //print liveInInitVal
                for (auto pair : liveInInitVal) {
                    errs() << "liveIn: " << *pair.first << ", store init val: " << *pair.second << "\n";
                }
                // if (needVariableInitLiveInVars.size() != 0) {
                //     delete task;
                //     errs() << "this task we can not handle...\n";
                //     continue;
                // }

                task->setLiveInInitVal(liveInInitVal);

                errs() << "setLiveInInitVal...\n";
                // analysis liveInVars relations
                for (auto pair : bitcastLiveInVarRelated) {
                    std::unordered_set<Instruction *> workListForBitcast{cast<Instruction>(pair.first)};
                    std::unordered_set<Instruction *> related{};
                    while(!workListForBitcast.empty()) {
                        Instruction * inst = *workListForBitcast.begin();
                        workListForBitcast.erase(inst);
                        //old
                        // for (auto subedge : wholePdg->getEdges()) {
                        // for (auto subedge : loopFuncPDG->getEdges()) {
                        //     auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                        //     auto toNodeSubT = subedge->getIncomingNode()->getT();

                        //     if (cast<Instruction>(toNodeSubT) == inst ) {
                        //         if (subedge->isMustDependence() && subedge->dataDepToString() == "RAW") {
                        //             if (related.count(cast<Instruction>(fromNodeSubT)) <= 0 && !ls->isIncluded(cast<Instruction>(fromNodeSubT))) {
                        //                 workListForBitcast.insert(cast<Instruction>(fromNodeSubT));
                        //                 related.insert(cast<Instruction>(fromNodeSubT));
                        //             }
                        //         }
                        //     }
                        // }

                        //new more effective
                        auto toNode = loopFuncPDG->fetchNode(inst);
                        if (toNode != nullptr) {
                            for (auto &edge : toNode->getIncomingEdges()) {
                                if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                    auto fromNode = cast<Instruction>(edge->getOutgoingNode()->getT());
                                    if (related.count(fromNode) <= 0 && !ls->isIncluded(fromNode)) {
                                        workListForBitcast.insert(fromNode);
                                        related.insert(fromNode);
                                    }
                                }
                            }
                        }
                    }
                    bitcastLiveInVarRelated[pair.first] = related;
                }
                // for (auto pair : bitcastLiveInVarRelated) {
                //     errs() << "bitcastliveIn: " << *pair.first << "\n";
                //     for (auto inst : pair.second) {
                //         errs() << "relatedInst: " << *inst << "\n";
                //     }
                // }
                task->setBitCastLiveInVarRelated(bitcastLiveInVarRelated);
                errs() << "setBitCastLiveInVarRelated...\n";


                std::vector<Instruction *> safecheckCallInst;
                std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsInLoopBody;
                std::unordered_map<Instruction *, std::set<Instruction *>> allInstsToOneCallInstInLoopBody;
                std::unordered_set<BasicBlock *> loopBody = ls->getLoopBody();
                //need orderedBasicBlocks
                // std::unordered_map<BasicBlock *, std::vector<BasicBlock *>> loopBodyBasicBlock;
                
                std::unordered_set<Instruction *> customedFunRelatedCodeInLoop;
                bool relatedFlag = false;
                for (auto BB : ls->orderedBBs) {
                    for (auto& I : *BB) {
                        if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                            Function * calledFunc = CI->getCalledFunction();
                            if (calledFunc == nullptr) continue; // !! could return null if the call is an indirect call through a function pointer
                            StringRef callName = calledFunc->getName();
                            // errs() << "call: " << callName << "\n";
                            #if SafeC
                            if (callName.startswith("_safeC_shadow_stack_store_bound")) {
                                relatedFlag = true;
                            }
                            if (callName.startswith("_safeC_deallocate_shadow_stack_space")) {
                                customedFunRelatedCodeInLoop.insert(&I);
                                relatedFlag = false;
                            }
                            #else
                            if (callName.startswith("__softboundcets_allocate_shadow_stack_space")) {
                                relatedFlag = true;
                            }
                            if (callName.startswith("__softboundcets_deallocate_shadow_stack_space")) {
                                customedFunRelatedCodeInLoop.insert(&I);
                                relatedFlag = false;
                            }
                            #endif
                            if (relatedFlag) {
                                customedFunRelatedCodeInLoop.insert(&I);
                            }
                        }
                    }
                }
                // for (auto inst : customedFunRelatedCodeInLoop) {
                //     errs() << "codeFunRelatedInst: " << *inst << "\n";
                // }

                std::unordered_set<Instruction *> workListForCustFunCode(customedFunRelatedCodeInLoop.begin(), customedFunRelatedCodeInLoop.end());
                while (!workListForCustFunCode.empty()) {
                    Instruction * inst = *workListForCustFunCode.begin();
                    workListForCustFunCode.erase(inst);
                    //old
                    // for (auto edge : loopPDG->getEdges()) {
                    //     Instruction * fromNodeInst = cast<Instruction>(edge->getOutgoingNode()->getT());
                    //     Instruction * toNodeInst = cast<Instruction>(edge->getIncomingNode()->getT());

                    //     if (toNodeInst == inst) {
                    //         if (edge->isMustDependence() && 
                    //         edge->dataDepToString() == "RAW") {
                    //             if (customedFunRelatedCodeInLoop.count(fromNodeInst) <= 0 && ls->isIncluded(fromNodeInst)) {
                    //                 workListForCustFunCode.insert(fromNodeInst);
                    //                 customedFunRelatedCodeInLoop.insert(fromNodeInst);
                    //             }
                                
                    //         }
                    //     }

                    //     if (fromNodeInst == inst) {
                    //         if (edge->isMustDependence() && 
                    //         edge->dataDepToString() == "RAW") {
                    //             if (customedFunRelatedCodeInLoop.count(toNodeInst) <= 0 && ls->isIncluded(toNodeInst)) {
                    //                 workListForCustFunCode.insert(toNodeInst);
                    //                 customedFunRelatedCodeInLoop.insert(toNodeInst);
                    //             }
                                
                    //         }   
                    //     }
                    // }
                    //new more effective
                    auto node = loopPDG->fetchNode(inst);
                    if (node != nullptr) {
                        //as toNode
                        for (auto &edge : node->getIncomingEdges()) {
                            if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                auto fromNode = cast<Instruction>(edge->getOutgoingNode()->getT());
                                if (customedFunRelatedCodeInLoop.count(fromNode) <= 0 && ls->isIncluded(fromNode)) {
                                    workListForCustFunCode.insert(fromNode);
                                    customedFunRelatedCodeInLoop.insert(fromNode);
                                }
                            }
                        }

                        //as fromNode
                        for (auto &edge : node->getOutgoingEdges()) {
                            if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                auto toNode = cast<Instruction>(edge->getIncomingNode()->getT());
                                if (customedFunRelatedCodeInLoop.count(toNode) <= 0 && ls->isIncluded(toNode)) {
                                    workListForCustFunCode.insert(toNode);
                                    customedFunRelatedCodeInLoop.insert(toNode);
                                }
                            }
                        }
                    }
                    
                }
                // for (auto inst : customedFunRelatedCodeInLoop) {
                //     errs() << "codeFunRelatedInst111: " << *inst << "\n";
                // }
                errs() << "----customedFunRelatedCodeInLoop----\n";
                // cal safeCheckCallInst, safeCheckInstsInLoopBody, allInstsToOneCallInstInLoopBody, 
                // std::unordered_set<Instruction *> cmpInstRelated;
                std::unordered_set<Instruction *> brInstRelated;
                bool giveUpFlag = false; // 

                // std::srand(std::time(0)); //seed
                std::unordered_set<Instruction *> safecheckCallInstDoNotInLoopBody;
                bool coinFlag = true;
                int countCoin = 0;
                for (auto body : loopBody) {
                    // errs() << "loopBody: " << *body << "\n";
                    // Function * F = body->getParent();
                    // if (!F->getName().equals("LBM_performStreamCollide")) continue;
                    //TODO: try to balance loop
                    countCoin = 0;
                    // int coin = std::rand() % 100;
                    // if (coin >=0 && coin <=49 ) coinFlag = true;
                    for (auto& I : *body) {
                        if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                            #if SafeC
                            if (IsSafeCheckCallForSafeC(CI)) {
                                if (countCoin < 1 && IsIntraTaskConsideredForSafeC(CI)) { // 1 for safec-2mm
                                    safecheckCallInstDoNotInLoopBody.insert(&I);
                                    countCoin++;   
                                }
                                
                                
                                safecheckCallInst.push_back(&I);
                                //SafeCheckSet.insert(&I);
                                
                            }
                            if (IsSafeCheckCallStoreForSafeC(CI)) {
                                giveUpFlag = true;
                            }
                            #else
                            if (IsSafeCheckCall(CI)) {
                                if (countCoin < 0 && IsIntraTaskConsideredForSB(CI)) {// 4 for sb-2mm
                                    safecheckCallInstDoNotInLoopBody.insert(&I);
                                    countCoin++;   
                                }
                                
                                
                                safecheckCallInst.push_back(&I);
                                //SafeCheckSet.insert(&I);
                                
                            }
                            if (IsSafeCheckCallStore(CI)) {
                                giveUpFlag = true;
                            }
                            #endif
                        }

                        // if (CmpInst *cmpInst = dyn_cast<CmpInst>(&I)) {
                        //     cmpInstRelated.insert(&I);
                        // }

                        if (BranchInst * brInst = dyn_cast<BranchInst>(&I)) {
                            brInstRelated.insert(&I);
                        }
                    }
                    // if (countCoin >= 4) coinFlag = false;
                    // else coinFlag = true;
                }

                // if there is no safecheck call inst , don't do that 
                if (giveUpFlag) {
                    delete task;
                    errs() << "this task we can not handle, because of metadata_store...\n";
                    continue;
                }
                
                // std::unordered_set<Instruction *> workListForCmpInstRelated(cmpInstRelated.begin(), cmpInstRelated.end());
                std::unordered_set<Instruction *> workListForBrInstRelated(brInstRelated.begin(), brInstRelated.end());
                // while (!workListForCmpInstRelated.empty()) {
                while (!workListForBrInstRelated.empty()) {
                    // Instruction * inst = *workListForCmpInstRelated.begin();
                    // workListForCmpInstRelated.erase(inst);
                    Instruction * inst = *workListForBrInstRelated.begin();
                    workListForBrInstRelated.erase(inst);
                    //old
                    // for (auto edge : loopPDG->getEdges()) {
                    //     Instruction * fromNodeInst = cast<Instruction>(edge->getOutgoingNode()->getT());
                    //     Instruction * toNodeInst = cast<Instruction>(edge->getIncomingNode()->getT());
                    //     if (toNodeInst == inst) {
                    //         if (edge->isMustDependence() && 
                    //         edge->dataDepToString() == "RAW") {
                    //             // if (cmpInstRelated.count(fromNodeInst) <= 0
                    //             // && ls->isIncluded(fromNodeInst) && (fromNodeInst->getParent() == inst->getParent())) {
                    //             //     cmpInstRelated.insert(fromNodeInst);
                    //             //     workListForCmpInstRelated.insert(fromNodeInst);
                    //             // }
                    //             if (brInstRelated.count(fromNodeInst) <= 0
                    //             && ls->isIncluded(fromNodeInst) && (fromNodeInst->getParent() == inst->getParent())) {
                    //                 brInstRelated.insert(fromNodeInst);
                    //                 workListForBrInstRelated.insert(fromNodeInst);
                    //             }
                    //         }
                    //     }
                    //     if (fromNodeInst == inst) {
                    //         if (edge->isMustDependence() && 
                    //         edge->dataDepToString() == "RAW") {
                    //             // if (cmpInstRelated.count(toNodeInst) <= 0
                    //             // && ls->isIncluded(toNodeInst) && (toNodeInst->getParent() == inst->getParent())) {
                    //             //     cmpInstRelated.insert(toNodeInst);
                    //             //     workListForCmpInstRelated.insert(toNodeInst);
                    //             // }
                    //             if (brInstRelated.count(toNodeInst) <= 0
                    //             && ls->isIncluded(toNodeInst) && (toNodeInst->getParent() == inst->getParent())) {
                    //                 brInstRelated.insert(toNodeInst);
                    //                 workListForBrInstRelated.insert(toNodeInst);
                    //             }
                    //         }
                    //     }
                    // }
                    //new more effective
                    auto node = loopPDG->fetchNode(inst);
                    if (node != nullptr) {
                        //as toNode
                        for (auto &edge : node->getIncomingEdges()) {
                            if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                auto fromNode = cast<Instruction>(edge->getOutgoingNode()->getT());
                                if (brInstRelated.count(fromNode) <= 0 && ls->isIncluded(fromNode) && (fromNode->getParent() == inst->getParent())) {
                                    brInstRelated.insert(fromNode);
                                    workListForBrInstRelated.insert(fromNode);
                                }
                            }
                        }

                        //as fromNode
                        for (auto &edge : node->getOutgoingEdges()) {
                            if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                auto toNode = cast<Instruction>(edge->getIncomingNode()->getT());
                                if (brInstRelated.count(toNode) <= 0 && ls->isIncluded(toNode) && (toNode->getParent() == inst->getParent())) {
                                    brInstRelated.insert(toNode);
                                    workListForBrInstRelated.insert(toNode);
                                }
                            }
                        }
                    }

                }
                // for (auto inst : cmpInstRelated) {
                //     errs() << "cmpInstRelate: " << *inst << "\n";
                // }
                // for (auto inst : brInstRelated) {
                //     errs() << "brInstRelate: " << *inst << "\n";
                // }
                errs() << "^^^^^brInstRelate^^^^^\n";
                for (auto callInst : safecheckCallInst) {
                    std::set<Instruction *> safeCheckInsts;
                    // std::set<Instruction *> workList; // for %base.load call_metadata_load and so on
                    // to: callInst
                    //from : 
                    // for (auto subedge : wholePdg->getEdges()) { //wholePdg can be replaced with loopPDG
                    //old
                    // for (auto subedge : loopPDG->getEdges()) {    
                    //     auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                    //     auto toNodeSubT = subedge->getIncomingNode()->getT();

                    //     if (cast<Instruction>(toNodeSubT) == callInst) {
                    //         if (subedge->isMustDependence() && 
                    //         subedge->dataDepToString() == "RAW") {
                    //             // if is a liveInvars no need to be added
                    //             if (loop->loopEnviroment->isLiveIn(fromNodeSubT)) {
                    //                 errs() << "--- " << *cast<Instruction>(fromNodeSubT) << " -is liveIn...\n";
                    //             } else {
                                    
                    //                 if (safeCheckInsts.count(cast<Instruction>(fromNodeSubT)) <= 0 && ls->isIncluded(cast<Instruction>(fromNodeSubT))) {
                    //                     safeCheckInsts.insert(cast<Instruction>(fromNodeSubT));
                    //                     // if (isa<LoadInst>(cast<Instruction>(fromNodeSubT))) { // %base.load = load xxx
                    //                     //     workList.insert(cast<Instruction>(fromNodeSubT));
                    //                     // }
                    //                 }
                                    
                    //             }
                                
                    //         }
                    //     }
                    // }

                    //new more effective
                    auto toNode = loopPDG->fetchNode(callInst);
                    if (toNode != nullptr) {
                        for (auto &edge : toNode->getIncomingEdges()) {
                            if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                auto fromNodeT = edge->getOutgoingNode()->getT();
                                auto fromNode = cast<Instruction>(fromNodeT);
                                if (loop->loopEnviroment->isLiveIn(fromNodeT)) {
                                    errs() << "--- " << *fromNode << " -is liveIn...\n";
                                } else {
                                    if (safeCheckInsts.count(fromNode) <= 0  && ls->isIncluded(fromNode)) {
                                        safeCheckInsts.insert(fromNode);
                                    }
                                }
                                
                            }
                        }
                    }


                    safeCheckInstsInLoopBody[callInst] = safeCheckInsts;

                    std::set<Instruction *> worklistForOriginalCodes;
                    std::set<Instruction *> allInstsToOneCall(safeCheckInsts.begin(), safeCheckInsts.end());
                    for (auto inst : safeCheckInsts) {
                        // for (auto subedge : wholePdg->getEdges()) { // wholePdg can be replaced with loopPDG
                        //old
                        // for (auto subedge : loopPDG->getEdges()) {    
                        //     auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                        //     auto toNodeSubT = subedge->getIncomingNode()->getT();

                        //     if (cast<Instruction>(toNodeSubT) == inst) {
                        //         if (subedge->isMustDependence() && 
                        //         subedge->dataDepToString() == "RAW") {
                        //             // if is a liveInvars no need to be added
                        //             if (loop->loopEnviroment->isLiveIn(fromNodeSubT)) { 
                        //                 errs() << "^^^ " << *cast<Instruction>(fromNodeSubT) << " -is liveIn...\n";
                        //             } else {
                        //                 if (allInstsToOneCall.count(cast<Instruction>(fromNodeSubT)) <= 0 && ls->isIncluded(cast<Instruction>(fromNodeSubT))) {
                        //                     allInstsToOneCall.insert(cast<Instruction>(fromNodeSubT));
                        //                     worklistForOriginalCodes.insert(cast<Instruction>(fromNodeSubT));
                        //                 }
                                            
                        //             }                                
                        //         }
                        //     }
                        // }

                        //new more effective
                        auto toNode = loopPDG->fetchNode(inst);
                        if (toNode != nullptr) {
                            for (auto &edge : toNode->getIncomingEdges()) {
                                if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                    auto fromNodeT = edge->getOutgoingNode()->getT();
                                    auto fromNode = cast<Instruction>(fromNodeT);
                                    if (loop->loopEnviroment->isLiveIn(fromNodeT)) {
                                        errs() << "^^^ " << *fromNode << " -is liveIn...\n";
                                    } else {
                                        if (allInstsToOneCall.count(fromNode) <= 0 && ls->isIncluded(fromNode)) {
                                            allInstsToOneCall.insert(fromNode);
                                            worklistForOriginalCodes.insert(fromNode);
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }

                    while (!worklistForOriginalCodes.empty()) {
                        Instruction * inst = *worklistForOriginalCodes.begin();
                        worklistForOriginalCodes.erase(inst);
                        // for (auto subedge : wholePdg->getEdges()) {// wholePdg can be replaced with loopPDG
                        //old
                        // for (auto subedge : loopPDG->getEdges()) {
                        //     auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                        //     auto toNodeSubT = subedge->getIncomingNode()->getT();

                        //     if (cast<Instruction>(toNodeSubT) == inst) {
                        //         if (subedge->isMustDependence() && 
                        //         subedge->dataDepToString() == "RAW") {
                        //             // if is a liveInvars no need to be added
                        //             if (loop->loopEnviroment->isLiveIn(fromNodeSubT)) { 
                        //                 errs() << "*** " << *cast<Instruction>(fromNodeSubT) << " -is liveIn...\n";
                        //             } else {
                        //                 if ( allInstsToOneCall.count(cast<Instruction>(fromNodeSubT)) <= 0 && ls->isIncluded(cast<Instruction>(fromNodeSubT))) {
                        //                     allInstsToOneCall.insert(cast<Instruction>(fromNodeSubT));
                        //                     worklistForOriginalCodes.insert(cast<Instruction>(fromNodeSubT));
                        //                 }
                        //             }                                
                        //         }
                        //     }
                        // }

                        //new more effective
                        auto toNode = loopPDG->fetchNode(inst);
                        if (toNode != nullptr) {
                            for (auto &edge : toNode->getIncomingEdges()) {
                                if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                    auto fromNodeT = edge->getOutgoingNode()->getT();
                                    auto fromNode = cast<Instruction>(fromNodeT);
                                    if (loop->loopEnviroment->isLiveIn(fromNodeT)) {
                                        errs() << "*** " << *fromNode << " -is liveIn...\n";
                                    } else {
                                        if (allInstsToOneCall.count(fromNode) <= 0 && ls->isIncluded(fromNode)) {
                                            allInstsToOneCall.insert(fromNode);
                                            worklistForOriginalCodes.insert(fromNode);
                                        }
                                    }
                                    
                                }
                            }
                        }


                    }

                    allInstsToOneCallInstInLoopBody[callInst] = allInstsToOneCall;
                }
                errs() << "^^^^^522^^^^^\n";
                //print some info for debugging
                // std::unordered_map<Instruction*, std::set<Instruction *>>::const_iterator iter11;
                // for (iter11 = safeCheckInstsInLoopBody.begin(); iter11 != safeCheckInstsInLoopBody.end(); ++iter11) {
                    
                //     for (auto I : iter11->second) {
                //         errs() << *I <<"\n";
                //     }
                //     errs() << "--A-" << *(iter11->first) << " has : " << iter11->second.size() << "\n";
                // }
                // errs() << "^^^^^safeCheckInstsInLoopBodyBeforeRemoved^^^^^\n";
                // std::unordered_map<Instruction*, std::set<Instruction *>>::const_iterator iter21;
                // for (iter21 = allInstsToOneCallInstInLoopBody.begin(); iter21 != allInstsToOneCallInstInLoopBody.end(); ++iter21) {
                    
                //     for (auto I : iter21->second) {
                //         errs() << *I <<"\n";
                //     }
                //     errs() << "--B-" << *(iter21->first) << " has : " << iter21->second.size() << "\n";
                // }
                // errs() << "^^^^^allInstsToOneCallInstInLoopBodyBeforeRemoved^^^^^\n";
                // for (auto inst : customedFunRelatedCodeInLoop) {
                //     errs() << "CustFunInst: " << *inst << "\n";
                // }
                
                //cal safeCheckInstsInLoopBody - customedFuncRelatedCode
                //cal allInstsToOneCallInstInLoopBody - customedFuncRelateCode
                std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsInLoopBodyFinal;
                std::unordered_map<Instruction *, std::set<Instruction *>> allInstsToOneCallInstInLoopBodyFinal;
                for (auto pair : safeCheckInstsInLoopBody) {
                    bool removed = false;
                    for (auto I : pair.second) {
                        for (auto inst : customedFunRelatedCodeInLoop) {
                            // errs() << "inst: " << *inst << "\n";
                            // errs() << "I: " << *I << "\n";
                            if (inst == I || inst == pair.first) {
                                errs() << "removed...\n";
                                removed = true;
                            }
                        }
                    }
                    if (!removed) {
                        // errs() << "-428-\n";
                        // safeCheckInstsInLoopBody.erase(pair.first);
                        safeCheckInstsInLoopBodyFinal[pair.first] = pair.second;
                    }
                }
                errs() << "^^^^^433^^^^^\n";

                
                // std::vector<Value *> needVariableInitLiveInVars;
                // for (auto pair : liveInInitVal) {
                //     if (!pair.second) {
                //         // if there is load statement in loop body
                //         // we also not consider
                //         for (auto instpair : allInstsToOneCallInstInLoopBody) {
                //             for (auto I : instpair.second) {
                //                 for (auto useIt = pair.first->use_begin(); useIt != pair.first->use_end(); ++useIt) {
                //                     Instruction * inst = dyn_cast<Instruction>(*useIt);
                //                     if (inst == I && isa<LoadInst>(I)) {
                //                         needVariableInitLiveInVars.push_back(pair.first);
                                        
                //                     }
                //                 }
                //             }
                //         }

                //     } else if (isa<Constant>(pair.second)) {

                //     } else {
                //         needVariableInitLiveInVars.push_back(pair.first);
                //     }
                // }

                // if (needVariableInitLiveInVars.size() != 0) {
                //     delete task;
                //     errs() << "this task we can not handle...\n";
                //     continue;
                // }

                // std::unordered_map<Instruction *, std::set<Instruction *>> notToParallelCodes;
                for (auto pair : allInstsToOneCallInstInLoopBody) {
                    bool removed = false;
                    for (auto I : pair.second) {
                        for (auto inst : customedFunRelatedCodeInLoop) {
                            if (inst == I || inst == pair.first) {
                                removed = true;
                            }
                        }
                    }

                    // if (CallInst * CI =dyn_cast<CallInst>(pair.first)) {
                        
                    //     if (IsSafeCheckCall(CI)) {
                    //         for (auto I : pair.second) {
                    //             for (auto specialLiveIn : needVariableInitLiveInVars) {
                    //                 for (auto useIt = specialLiveIn->use_begin(); useIt != specialLiveIn->use_end(); ++useIt) {
                    //                     Instruction * inst = dyn_cast<Instruction>(*useIt);
                    //                     if (inst == I) {
                    //                         removed = true;
                    //                         //record this information 
                    //                         // errs() << "644--: " << *pair.first << "\n";
                                            
                    //                         notToParallelCodes[pair.first] = pair.second;
                    //                     }
                    //                 }
                    //             }
                    //         }
                    //     }
                    // }
                    //corner case, if there is no related inst for this customed func
                    if (pair.second.size() == 0) {
                        for (auto inst : customedFunRelatedCodeInLoop) {
                            if (inst == pair.first) {
                                removed = true;
                            }
                        }
                    }

                    if (!removed) {
                        // errs() << "-441-\n";
                        // allInstsToOneCallInstInLoopBody.erase(pair.first);
                        allInstsToOneCallInstInLoopBodyFinal[pair.first] = pair.second;
                    }
                }
                
                errs() << "^^^^^customedFunRelatedCodeInLoop^^^^^\n";

                // if there is no safecheck call inst , don't do that 
                if (allInstsToOneCallInstInLoopBodyFinal.size() == 0 || 
                safeCheckInstsInLoopBodyFinal.size() == 0 || safecheckCallInst.size() == safecheckCallInstDoNotInLoopBody.size()) {
                    delete task;
                    errs() << "this task we can not handle, because of non safe call inst...\n";
                    continue;
                }

                // get safeCheckInstsInLoopBody (Call + bitcast + load alloca...etc)
                // get allInstsToOneCallInLoopBody (Call + bitcast + load alloca... + original code(load,store,etc))
                std::unordered_set<Instruction*> notInLoopBody;
                for (auto instcall : safecheckCallInstDoNotInLoopBody) {
                    errs() << "instcall: " << *instcall << "\n";
                    for (auto interninst : allInstsToOneCallInstInLoopBodyFinal.at(instcall)) {
                        if (loopLatchBBs.count(interninst->getParent()) != 0) {
                            continue;
                        }
                        errs() << "interninst: " << *interninst << "\n";
                        notInLoopBody.insert(interninst);
                    }
                    notInLoopBody.insert(instcall);
                }
                task->setSafeCheckInstsNoInLoopBody(notInLoopBody);
                task->setSafeCheckInstsInLoopBody(safeCheckInstsInLoopBodyFinal);
                task->setAllInstsToOneCallInstInLoopBody(allInstsToOneCallInstInLoopBodyFinal);
                task->setOldLoopBody(loopBody);
                // task->setCmpInstRelated(cmpInstRelated);
                task->setBrInstRelated(brInstRelated);
                // task->setDoNotParallelCodes(notToParallelCodes);

                

                task->setLDI(loop);
                //push task into looptask
                loopTasks.push_back(task);

                //print some info for debugging
                // std::unordered_map<Instruction*, std::set<Instruction *>>::const_iterator iter1;
                // for (iter1 = safeCheckInstsInLoopBodyFinal.begin(); iter1 != safeCheckInstsInLoopBodyFinal.end(); ++iter1) {
                //     errs() << "--AA: " << *(iter1->first) << " has : " << iter1->second.size() << "\n";
                //     for (auto I : iter1->second) {
                //         errs() << *I <<"\n";
                //     }
                // }
                // errs() << "^^^^^safeCheckInstsInLoopBodyAfterRemoved^^^^^\n";
                // std::unordered_map<Instruction*, std::set<Instruction *>>::const_iterator iter2;
                // for (iter2 = allInstsToOneCallInstInLoopBodyFinal.begin(); iter2 != allInstsToOneCallInstInLoopBodyFinal.end(); ++iter2) {
                //     errs() << "--BB: " << *(iter2->first) << " has : " << iter2->second.size() << "\n";
                //     for (auto I : iter2->second) {
                //         // if (isa<LoadInst>(I)) errs() << "Inst: " << *I << ", Op0 Type: " << *cast<LoadInst>(I)->getOperand(0)->getPointerElementType() << "\n";
                //         errs() << *I <<"\n";
                //     }
                // }
                // errs() << "^^^^^allInstsToOneCallInstInLoopBodyAfterRemoved^^^^^\n";
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
            // if (true) {
            //     errs() << "Parallelizer: Loop " << loopID << " has been parallelized.\n";
            //     modified = true;
            //     for (auto bb : ls->getBasicBlocks()) {
            //         modifiedBBs[bb] = true;
            //     }
            // }
        }




        //free the memory
        // for (auto loop : loopsToParallelize) {
        //     if (loop) delete loop;
        // }

    }

    // std::vector<LoopFreeTask *> loopFreeTasks;
    // uint32_t id = 0;
    // //TODO: loop free opt
    // // get non loop basic blocks
    // for (Function& F : *this->program) {
    //     if (F.isDeclaration() || F.isIntrinsic() || F.empty()) continue;
    //     if (F.getName().startswith("_spawn_loop_func_") || F.getName().startswith("_loop_func_") ) continue;
    //     //get each functionPDG
    //     PDG * functionPDG = new PDG(F);

    //     std::vector<Instruction *> safeCheckCallInstInNonLoopBody;
    //     //safecheck - safecheckRelatedCode - 
    //     //safechecks - Loc[xx, xx, xx]
    //     std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsInNonLoopBody;
    //     std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckCallInstJoinPoints;
    //     std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsMoveRange;
    //     for (BasicBlock& BB : F) {
    //         if (allLoopBasicBlocks.count(&BB) > 0) continue;
    //         // determine each safecheck 
    //         for (Instruction& I : BB) {
    //             if (CallInst *CI = dyn_cast<CallInst>(&I)) {
    //                 if (IsSafeCheckCallForLoopFree(CI)) {
    //                     safeCheckCallInstInNonLoopBody.push_back(&I);
    //                 }
    //             }
    //         }
    //     }

    //     //get safecheck related codes , joinpoints and locs
    //     for (auto callInst : safeCheckCallInstInNonLoopBody) {
    //         std::set<Instruction *> safeCheckRelatedInsts;
    //         std::set<Instruction *> joinpoints;
    //         for (auto subedge : functionPDG->getEdges()) {
    //             auto fromNodeSubT = subedge->getOutgoingNode()->getT();
    //             auto toNodeSubT = subedge->getIncomingNode()->getT();

    //             if (cast<Instruction>(toNodeSubT) == callInst) {
    //                 if (subedge->isMustDependence() && subedge->dataDepToString() == "RAW") {
    //                     if (safeCheckRelatedInsts.count(cast<Instruction>(fromNodeSubT)) <= 0 && 
    //                     callInst->getParent() == cast<Instruction>(fromNodeSubT)->getParent()) {
    //                         safeCheckRelatedInsts.insert(cast<Instruction>(fromNodeSubT));
    //                     }
    //                 }
    //             }

    //             if (cast<Instruction>(fromNodeSubT) == callInst &&
    //             subedge->dataDepToString() == "RAW") {
    //                 if (fromNodeSubT != toNodeSubT) {
    //                     joinpoints.insert(cast<Instruction>(toNodeSubT));
    //                 }
    //             }
    //         }
            
    //         safeCheckInstsInNonLoopBody[callInst] = safeCheckRelatedInsts;
    //         safeCheckCallInstJoinPoints[callInst] = joinpoints;

    //         //joinpoints means the farthest location, if it is null, the join point is the last instruction of a function
    //         //find the the forward most location
    //         std::set<Instruction *> locs; // if it is null, the forward most is the entry point (should judge whether is a call or bitcast inst)
    //         for (auto inst : safeCheckRelatedInsts) {
                
    //             for (auto subedge : functionPDG->getEdges()) {
    //                 auto from = cast<Instruction>(subedge->getOutgoingNode()->getT());
    //                 auto to = cast<Instruction>(subedge->getIncomingNode()->getT());

    //                 if (to == inst) {
    //                     if (subedge->isMustDependence() && subedge->dataDepToString() == "RAW" &&
    //                     from->getParent() == inst->getParent()) {
    //                         locs.insert(from);
    //                     }
    //                 }
    //             }

    //             if (isa<CallInst>(inst)) { //maybe __softboundcets_load_lock_shadow_stack or other like
    //                 locs.insert(inst);
    //             }

    //         }
    //         safeCheckInstsMoveRange[callInst] = locs;
    //     }

    //     //create the loop free task, and set some info
    //     for (BasicBlock& BB : F) {
    //         if (allLoopBasicBlocks.count(&BB) > 0) continue;

    //         Insturction * taskJoinPoint = nullptr;
    //         std::unordered_set<Instruction * > safeCheckCodeForOneTask;

    //         for (Instruction& I : BB) {
    //             if (CallInst *CI = dyn_cast<CallInst>(&I)) {
    //                 if (IsSafeCheckCallForLoopFree(CI)) {
    //                     if (taskJoinPoint == nullptr) {
    //                         std::set<Instruction *> joinpoints = safeCheckCallInstJoinPoints.at(&I);
    //                         if (joinpoints.size() == 0) {
    //                             taskJoinPoint = BB.getTerminator();
    //                         } else {
    //                             bool flag = false;
    //                             for (auto joinp : joinpoints) {
    //                                 if (joinp->getParent() == &BB) {
    //                                     taskJoinPoint = joinp;
    //                                     flag = true;
    //                                 }
    //                             }
    //                             if (!flag) taskJoinPoint = BB.getTerminator();
    //                         }
    //                         safeCheckCodeForOneTask.insert(&I);
    //                     } else {
    //                         if (instHappensBefore(&I, taskJoinPoint)) {
    //                             std::set<Instruction *> joinpoints = safeCheckCallInstJoinPoints.at(&I);
    //                             if (joinpoints.size() == 0) {
    //                                 taskJoinPoint = BB.getTerminator();
    //                             } else {
    //                                 bool flag = false;
    //                                 for (auto joinp : joinpoints) {
    //                                     if (joinp->getParent() == &BB) {
    //                                         if (!instHappensBefore(joinp, taskJoinPoint)) {
    //                                             taskJoinPoint = joinp;
    //                                         }
    //                                         flag = true;
    //                                     }
    //                                 }
    //                                 if (!flag) {
    //                                     taskJoinPoint = BB.getTerminator();
    //                                 }
    //                             }
    //                             safeCheckCodeForOneTask.insert(&I);
    //                         } else {
    //                             //a new task
    //                             LoopFreeTask *loopFreeTask = new LoopFreeTask(id++, this->program);
    //                             loopFreeTask->setSafeCheckCodes(safeCheckCodeForOneTask);
    //                             loopFreeTask->setInfo( safeCheckInstsInNonLoopBody,
    //                             safeCheckCallInstJoinPoints, safeCheckInstsMoveRange);
    //                             loopFreeTask->setJoinPoint(taskJoinPoint);
    //                             loopFreeTask->setTargetBB(&BB);
        //             loopFreeTask->setJoinFunc(joinFunc);
    //                             loopFreeTasks.push_back(loopFreeTask);
    //                             safeCheckCodeForOneTask.clear();

    //                             std::set<Instruction *> joinpoints = safeCheckCallInstJoinPoints.at(&I);
    //                             if (joinpoints.size() == 0) {
    //                                 taskJoinPoint = BB.getTerminator();
    //                             } else {
    //                                 bool flag = false;
    //                                 for (auto joinp : joinpoints) {
    //                                     if (joinp->getParent() == &BB) {
    //                                         if (!instHappensBefore(joinp, taskJoinPoint)) {
    //                                             taskJoinPoint = joinp;
    //                                         }
    //                                         flag = true;
    //                                     }
    //                                 }
    //                                 if (!flag) {
    //                                     taskJoinPoint = BB.getTerminator();
    //                                 }
    //                             }
    //                             safeCheckCodeForOneTask.insert(&I);
    //                         }
    //                     }
    //                 }
    //             }
    //         }

    //         if (safeCheckCodeForOneTask.size() != 0) {
    //             //a new task
    //             LoopFreeTask *loopFreeTask = new LoopFreeTask(id++, this->program);
    //             loopFreeTask->setSafeCheckCodesForOneTask(safeCheckCodeForOneTask);
    //             loopFreeTask->setInfo(safeCheckCallInstJoinPoints, safeCheckInstsMoveRange);
    //             loopFreeTask->setTargetBB(&BB);
    //             loopFreeTask->setJoinPoint(BB.getTerminator());
    //             loopFreeTask->setJoinFunc(joinFunc);
    //             loopFreeTasks.push_back(loopFreeTask);
    //         }

    //     }

    // }


    // transform those loopTasks
    for (auto task : loopTasks) {
        errs() << "---naive task: " << "\n";
        // task->transform();
        task->splitLoop();
        errs() << "---final task: " << "\n";
    }

    //transform those loopFree tasks
    // for (auto t : loopFreeTasks) {
    //     t->transform(); // enumerate all combinators and choose the max profit one
    // }

    //erase original safe check codes in original loop
    for (auto task : loopTasks) {
        task->eraseSafeCheckCodes();
    }

    // for (auto t : loopFreeTasks) {
    //     t->eraseSafeCheckCodes();
    // }

    errs() << "Final module: \n";
    errs() << *this->program << "\n";
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
        // SmallVector<BasicBlock *, 10> exits;
        // llvmLoop->getExitBlocks(exits);
        // errs() << "exitB size: " << exits.size() << "\n";
        // if (exits.empty()) return false;
        //if there is one bb which has no successor, then the loop is not considered
        // std::unordered_set<BasicBlock *> bodyBBs;
        // for (auto BBIt = llvmLoop->block_begin(); BBIt != llvmLoop->block_end(); ++BBIt) {
        //     bodyBBs.insert(*BBIt);
        // }
        // for (auto bb : exits) {
        //     errs() << "--bb: " << *bb << "\n";
        //     // int hasSuccs = std::distance(succ_begin(bb), succ_end(bb));
        //     if (bodyBBs.count(bb) > 0) {
        //         errs() << "--1075--\n";
        //         return false;
        //     }
        // }

        errs() << "--1079--\n";
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

        //require that all terminators in the loop are branches
        auto ls = ldi->getLoopStructure();
        bool nonConsider = false;
        for (auto BB : ls->getBasicBlocks()) {
            auto branch = dyn_cast<BranchInst>(BB->getTerminator());
            if (!branch) {
                nonConsider = true;
            }
        }
        if (nonConsider) {
            errs() << "LoopId: " << ls->getID() << " not Consider...\n";
            errs() << "LoopHeader: " << *ls->getHeader() << "\n";
            continue;
        }

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

bool Loops::instHappensBefore(Instruction * inst, Instruction * final) {
    Function * parentFunc = final->getParent()->getParent();
    bool flag = false;
    for (BasicBlock& BB : *parentFunc) {
        for (Instruction& I : BB) {
            if (inst == &I) {
                flag = true;
            }
            if (final == &I) {
                if (flag) {
                    return true;
                } else {
                    return false;
                }
            }
        }
    }
}

Constant * Loops::generateJoinFunc() {
    LLVMContext& ctx = this->program->getContext();
    Type * ty = Type::getInt32Ty(ctx);
    FunctionType * joinFuncType = FunctionType::get(Type::getVoidTy(ctx), ty, false);
    Constant * join = this->program->getOrInsertFunction("_Z4joinj", joinFuncType);
    return join;
}
