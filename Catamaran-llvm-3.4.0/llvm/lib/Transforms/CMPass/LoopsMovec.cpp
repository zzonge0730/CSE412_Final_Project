#include "LoopsMovec.h"

#define ENABLELOOP 0

#define ENABLELOOPFREE 1

#define ZYYDEBUG 1

char LoopsMovec::ID = 0;

static RegisterPass<LoopsMovec> X("LoopsMovec", "Find and Get Loops in the program for Movec");

LoopsMovec::LoopsMovec() : ModulePass{ID} {
}

LoopsMovec::~LoopsMovec() {
}

void LoopsMovec::getAnalysisUsage(AnalysisUsage &AU) const {

    AU.addRequired<PDGAnalysis>();

    AU.addRequired<PostDominatorTree>(); // 
    AU.addRequired<DominatorTree>();

    AU.addRequired<LoopInfo>();
    AU.addRequired<CallGraph>();
    AU.addRequired<ScalarEvolution>();
    AU.setPreservesAll();

}

bool LoopsMovec::runOnModule(Module &M) {

    this->program = &M;
    this->pdgAnalysis = &getAnalysis<PDGAnalysis>();

    Constant * joinFunc = generateJoinFunc();

    

    #if ENABLELOOP

    std::vector<LoopStructure *> * loopStructures = this->getLoopStructures();
    //No loops need to consider
    if (loopStructures->size() == 0) {
        errs() << "There is no loop to consider...\n";
        delete loopStructures;
        return false;
    }

    //Print loop info
    /*
        for (auto loopS : *loopStructures) {
        errs() << "----loopStructure----\n";
        std::string str;
        raw_string_ostream ros(str);
        loopS->print(ros);
        ros.flush();
        errs() << str << "\n";
        }
    */

    //generate the nesting forest
    auto forest = this->organizeLoopsInTheirNestingForest(*loopStructures);
    delete loopStructures;

    //print the loops
    auto trees = forest->getTrees();
    for (auto treeIt = trees.rbegin(); treeIt != trees.rend(); ++treeIt) {
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
    }

    //Create Join Function Pointer
    

    //used to record all basic blocks belong to loops (identify loop code and non-loop code)
    std::unordered_set<BasicBlock *> allLoopBasicBlocks;

    //used to record the basicblock is modified by the loop parallelizer
    std::unordered_map<BasicBlock *, bool> modifiedBBs{};

    //used to store all loop tasks to be transformed
    std::vector<DOALLTask *> loopTasks;

    // errs() << "tree size: " << forest->getTrees().size() << "\n";
    //loop analysis
    //parallelize the loop we selected, from outermost to the inner ones, currently only the outermost
    for (auto treeIt = trees.rbegin(); treeIt != trees.rend(); ++treeIt) {
        //select the loop to parallelize
        auto loopsToParallelize = this->selectTheOrderOfLoopsToParallelize(*treeIt); 
        // errs() << "loops size: " << loopsToParallelize.size() << "\n";
        
        //store all loop preheaders
        std::unordered_set<BasicBlock *> loopPreHeaders;
        std::unordered_set<BasicBlock *> loopLatchBBs;
        for (auto loop : loopsToParallelize) {
            loopPreHeaders.insert(loop->getLoopStructure()->getPreHeader());
            loopLatchBBs.insert(loop->getLoopStructure()->getLatches().begin(), loop->getLoopStructure()->getLatches().end());
        }
        //parallelize the loops
        for (auto loop : loopsToParallelize) {
            //check if we can parallelize the loop
            auto ls = loop->getLoopStructure();
            auto lsF = ls->getFunction();
            //if loop function is movec wrapper func or lib func , filter
            StringRef nameF = lsF->getName();
            if (nameF.startswith("_RV_") && !nameF.equals("_RV_main")) {
                continue;
            }
            // errs() << "Do Parallel In Fun: " << nameF << "\n";

            auto loopID = ls->getID();
            // errs() << "----------------\n";
            //parallelize the current loop  
            //determine whether the curret loop should be paralleled
            //for now, we only consider the outer most loop
            //that's to say, the nest level  is 1
            if (ls->getNestingLevel() == 1) {
                // PDG * wholePdg = this->pdgAnalysis->getPDG();
                PDG * loopPDG = loop->getLoopPDG();
                Function * loopFunc = ls->getFunction();
                PDG * loopFuncPDG = this->pdgAnalysis->getFunctionPDG(*loopFunc);
                for (auto BB : ls->getBasicBlocks()) {
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
                // errs() << "whereToInsertFunc Before: " << *whereToInsertFunc << "\n";
                task->setWhereToInsertFunc(whereToInsertFunc);

                //set join func
                task->setJoinFunc(joinFunc);
                //set join Points, before return this function there should be join points for each parallel loop
                std::unordered_set<Instruction *> joinPoints;
                for (BasicBlock& BB : *loopHeader->getParent()) {
                    for (Instruction& inst : BB) {
                        if (isa<ReturnInst>(&inst)) {   
                            //TODO: some join points can be optimized 
                            joinPoints.insert(&(*(BB.getFirstInsertionPt())));
                        }
                    }
                }
                task->setJoinPoints(joinPoints);

                //copy loop header
                task->setLoopHeader(loopHeader);
                                
                // liveIn variables -- corresponds init value
                std::unordered_map<Value *, Value *> liveInInitVal;
                // bitcast Type live variables -- correspondings related instructions
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
                    
                    //new: more effective way to get the needed val, instead of naively traverse
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
                
                // to get the store value for the init value
                for (auto pair : liveInInitVal) {
                    StoreInst * theLastStoreInst = nullptr;

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
                // for (auto pair : liveInInitVal) {
                //     errs() << "liveIn: " << *pair.first << ", store init val: " << *pair.second << "\n";
                // }

                // if (needVariableInitLiveInVars.size() != 0) {
                //     delete task;
                //     errs() << "this task we can not handle...\n";
                //     continue;
                // }

                task->setLiveInInitVal(liveInInitVal);

                errs() << "setLiveInInitVal...\n";
                // analysis bitcast type liveInVars related instructions
                for (auto pair : bitcastLiveInVarRelated) {
                    std::unordered_set<Instruction *> workListForBitcast{cast<Instruction>(pair.first)};
                    std::unordered_set<Instruction *> related{};
                    while(!workListForBitcast.empty()) {
                        Instruction * inst = *workListForBitcast.begin();
                        workListForBitcast.erase(inst);

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


                // get safeCheckCallInstInLoopBody
                std::vector<Instruction *> safecheckCallInst;
                std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsInLoopBody;
                std::unordered_map<Instruction *, std::set<Instruction *>> allInstsToOneCallInstInLoopBody;
                std::unordered_set<BasicBlock *> loopBody = ls->getLoopBody();
                //need orderedBasicBlocks
                // std::unordered_map<BasicBlock *, std::vector<BasicBlock *>> loopBodyBasicBlock;
                
                // is movec wrapper func, not movec lib function
                std::unordered_set<Instruction *> customedFunRelatedCodeInLoop;
                for (auto BB : ls->orderedBBs) {
                    for (auto& I : *BB) {
                        if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                            Function * calledFunc = CI->getCalledFunction();
                            if (calledFunc == nullptr) continue; // !! could return null if the call is an indirect call through a function pointer
                            StringRef callName = calledFunc->getName();
                            // errs() << "call: " << callName << "\n";
                            if (callName.startswith("_RV_") && !isTheMovecLibraryFunction(calledFunc) && !callName.startswith("_RV_print")) {
                                customedFunRelatedCodeInLoop.insert(&I);
                            }

                        }
                    }
                }
                // for (auto inst : customedFunRelatedCodeInLoop) {
                //     errs() << "codeFunRelatedInst: " << *inst << "\n";
                // }

                //get related instructions for customized Functions
                std::unordered_set<Instruction *> workListForCustFunCode(customedFunRelatedCodeInLoop.begin(), customedFunRelatedCodeInLoop.end());
                while (!workListForCustFunCode.empty()) {
                    Instruction * inst = *workListForCustFunCode.begin();
                    workListForCustFunCode.erase(inst);
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

                // std::srand(std::time(0)); //seed
                std::unordered_set<Instruction *> safecheckCallInstDoNotInLoopBody;
                int countCoin = 0;
                bool tryGiveUpFlag = false; 
                //identify which safe checks need to be parallellized
                for (auto body : loopBody) {
                    // errs() << "loopBody: " << *body << "\n";
                    // bool flag = false;
                    // int coin = std::rand() % 100;
                    // if (coin >=0 && coin <=49 ) flag = true;
                    countCoin = 0;
                    for (auto& I : *body) {
                        if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                            
                            if (IsSafeCheckCallForMovec(CI)) {
                                if (countCoin < 3 && IsIntraTaskConsideredForMC(CI)) {
                                    safecheckCallInstDoNotInLoopBody.insert(&I);
                                    countCoin++;
                                }
                                // if (flag) 
                                safecheckCallInst.push_back(&I);
                                
                                //SafeCheckSet.insert(&I);
                            }

                            if (IsSafeCheckCallStoreForMC(CI)) {
                                tryGiveUpFlag = true;
                            }
                        }

                        // if (CmpInst *cmpInst = dyn_cast<CmpInst>(&I)) {
                        //     cmpInstRelated.insert(&I);
                        // }

                        if (BranchInst * brInst = dyn_cast<BranchInst>(&I)) {
                            brInstRelated.insert(&I);
                        }
                    }
                }

                if (tryGiveUpFlag) {
                    delete task;
                    errs() << "this task we can not handle, because of metadata_store...\n";
                    continue;
                }

                // get brInst related instructions
                // std::unordered_set<Instruction *> workListForCmpInstRelated(cmpInstRelated.begin(), cmpInstRelated.end());
                std::unordered_set<Instruction *> workListForBrInstRelated(brInstRelated.begin(), brInstRelated.end());
                // while (!workListForCmpInstRelated.empty()) {
                while (!workListForBrInstRelated.empty()) {
                    // Instruction * inst = *workListForCmpInstRelated.begin();
                    // workListForCmpInstRelated.erase(inst);
                    Instruction * inst = *workListForBrInstRelated.begin();
                    workListForBrInstRelated.erase(inst);

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

                //get safeCheck callInst related instructions
                //TODO: need optimized
                for (auto callInst : safecheckCallInst) {
                    std::set<Instruction *> safeCheckInsts;
                    // std::set<Instruction *> workList; // for %base.load call_metadata_load and so on

                    //new more effective
                    auto toNode = loopPDG->fetchNode(callInst);
                    if (toNode != nullptr) {
                        for (auto &edge : toNode->getIncomingEdges()) {
                            if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                auto fromNodeT = edge->getOutgoingNode()->getT();
                                auto fromNode = cast<Instruction>(fromNodeT);
                                if (loop->loopEnviroment->isLiveIn(fromNodeT)) {
                                    // errs() << "--- " << *fromNode << " -is liveIn...\n";
                                    ;
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
                        //new more effective
                        auto toNode = loopPDG->fetchNode(inst);
                        if (toNode != nullptr) {
                            for (auto &edge : toNode->getIncomingEdges()) {
                                if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                    auto fromNodeT = edge->getOutgoingNode()->getT();
                                    auto fromNode = cast<Instruction>(fromNodeT);
                                    if (loop->loopEnviroment->isLiveIn(fromNodeT)) {
                                        // errs() << "^^^ " << *fromNode << " -is liveIn...\n";
                                        ;
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
                        //new more effective
                        auto toNode = loopPDG->fetchNode(inst);
                        if (toNode != nullptr) {
                            for (auto &edge : toNode->getIncomingEdges()) {
                                if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                    auto fromNodeT = edge->getOutgoingNode()->getT();
                                    auto fromNode = cast<Instruction>(fromNodeT);
                                    if (loop->loopEnviroment->isLiveIn(fromNodeT)) {
                                        // errs() << "*** " << *fromNode << " -is liveIn...\n";
                                        ;
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
                // errs() << "^^^^^522^^^^^\n";
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
                //remove movec wrapper func, that's to way, we don't handle it
                for (auto pair : safeCheckInstsInLoopBody) {
                    bool removed = false;
                    for (auto I : pair.second) {
                        for (auto inst : customedFunRelatedCodeInLoop) {
                            // errs() << "inst: " << *inst << "\n";
                            // errs() << "I: " << *I << "\n";
                            if (inst == I || inst == pair.first) {
                                // errs() << "removed...\n";
                                removed = true;
                            }
                        }
                    }
                    if (pair.second.size() == 0) {
                        for (auto inst : customedFunRelatedCodeInLoop) {
                            if (inst == pair.first) {
                                // errs() << "removed...\n";
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
                // errs() << "^^^^^433^^^^^\n";

                //TODO: may not handle these unknown memory load...
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
                //     errs() << "this task we can not handle, because of unknown memory load...\n";
                //     continue;
                // }

                // std::unordered_map<Instruction *, std::set<Instruction *>> notToParallelCodes;
                //remove movec wrapper func, that's to way, we don't handle it
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

                //TODO: filter corner cases which are not able to be parallelized
                
                // if there is no safecheck call inst , don't do that 
                if (allInstsToOneCallInstInLoopBodyFinal.size() == 0 || 
                safeCheckInstsInLoopBodyFinal.size() == 0 || safecheckCallInst.size() == 0) {
                    delete task;
                    errs() << "this task we can not handle, because of non safe call inst...\n";
                    continue;
                }

                std::unordered_set<Instruction*> notInLoopBody;
                for (auto instcall : safecheckCallInstDoNotInLoopBody) {
                    // errs() << "instcall: " << *instcall << "\n";
                    for (auto interninst : allInstsToOneCallInstInLoopBodyFinal.at(instcall)) {
                        if (loopLatchBBs.count(interninst->getParent()) != 0) {
                            continue;
                        }
                        // errs() << "interninst: " << *interninst << "\n";
                        notInLoopBody.insert(interninst);
                    }
                    notInLoopBody.insert(instcall);
                }
                task->setSafeCheckInstsNoInLoopBody(notInLoopBody);


                // if there are some thread safe lib function in loop meta-operation codes, don't do that
                bool filterFlag = false;
                for (auto pair : allInstsToOneCallInstInLoopBodyFinal) {
                    for (auto inst : pair.second) {
                        if (CallInst * call = dyn_cast<CallInst>(inst)) {
                            Function * calledFunc = call->getCalledFunction();
                            if (calledFunc == nullptr) continue; // function pointer
                            StringRef calledFuncName = calledFunc->getName();
                            if (PDGAnalysis::isTheLibraryFunctionThreadSafe(calledFunc) ||
                            calledFuncName.startswith("_RV_sscanf_") || calledFuncName.startswith("_RV_printf_") || 
                            calledFuncName.startswith("_RV_fprintf")) {
                                filterFlag = true;
                                // errs() << "this task we can not handle, because of thread safe func-741...\n";
                                break;
                            }
                        }
                    }

                }

                for (auto inst : brInstRelated) {
                    if (CallInst * brCall = dyn_cast<CallInst>(inst)) {
                        Function * calledFunc = brCall->getCalledFunction();
                        
                        if (calledFunc == nullptr) continue; // function pointer
                        StringRef calledFuncName = calledFunc->getName();
                        if (PDGAnalysis::isTheLibraryFunctionThreadSafe(calledFunc) ||
                            calledFuncName.startswith("_RV_sscanf_") || calledFuncName.startswith("_RV_printf_") || 
                            calledFuncName.startswith("_RV_fprintf")) {
                            filterFlag = true;
                            // errs() << "this task we can not handle, because of thread safe func-755...\n";
                            break;
                        }
                    }

                    for (auto in : customedFunRelatedCodeInLoop) {
                        if (in == inst) {
                            filterFlag = true;
                            // errs() << "this task we can not handle, because of custom movec wrapper func-770...\n";
                            break;
                        }
                    }

                }

                if (filterFlag) {
                    delete task;
                    continue;
                }

                // get safeCheckInstsInLoopBody (Call + bitcast + load alloca...etc)
                // get allInstsToOneCallInLoopBody (Call + bitcast + load alloca... + original code(load,store,etc))
                // task->setSafeCheckCallInstsInLoopBody(safecheckCallInst);
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

            //keep track of the parallelization
            //     errs() << "Parallelizer: Loop " << loopID << " has been parallelized.\n";
            //     modified = true;
            //     for (auto bb : ls->getBasicBlocks()) {
            //         modifiedBBs[bb] = true;
            //     }
        }

        //free the memory
        // for (auto loop : loopsToParallelize) {
        //     if (loop) delete loop;
        // }

    }
    #endif

    #if ENABLELOOPFREE
    //determine basicblocks in loop code
    std::vector<LoopStructure *> * loopStructuresLF = this->getLoopStructures();
    std::unordered_set<BasicBlock *> allLoopBasicBlocksLF;
    
    //loop free opt
    //loop free analysis
    std::vector<LoopFreeTask *> loopFreeTasks;
    uint32_t loopFreeId = 0;
    
    if (loopStructuresLF->size() != 0) {
        auto forest = this->organizeLoopsInTheirNestingForest(*loopStructuresLF);
        delete loopStructuresLF;
        
        auto trees = forest->getTrees();
        for (auto treeIt = trees.rbegin(); treeIt != trees.rend(); ++treeIt) {
            //select the loop to parallelize
            auto loopsToParallelize = this->selectTheOrderOfLoopsToParallelize(*treeIt); 

            for (auto loop : loopsToParallelize) {
                auto ls = loop->getLoopStructure();
                for (auto BB : ls->getBasicBlocks()) {
                    allLoopBasicBlocksLF.insert(BB);
                }
            }
        }
    } else {
        delete loopStructuresLF;
    }


    
    std::vector<Function *> considerFunc;
    

    // get non loop basic blocks
    for (Function& F : *this->program) {
        if (F.isDeclaration() || F.isIntrinsic() || F.empty()) continue;
        if (movecLibFunction.count(F.getName())) continue;
        //get the functionPDG
        #if ZYYDEBUG
        errs() << "considering Func: " << F.getName() << "\n";
        considerFunc.push_back(&F);
        #endif
        PDG * funcPDG = this->pdgAnalysis->getFunctionPDG(F);

        
        //safecheck - safecheckRelatedCode - 
        //safechecks - Loc[xx, xx, xx]

        //get safeCheck in the non loop basicblocks
        for (BasicBlock& BB : F) {

            std::vector<Instruction *> safeCheckCallInstInNonLoopBody;
            std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsInNonLoopBody;
            std::unordered_map<Instruction *, Instruction *> safeCheckCallInstJoinPoint;
            std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckInstsMoveRange;
            
            // std::unordered_map<BasicBlock *, std::unordered_set<Instruction *>> safeCheckInNonLoopBB;

            if (allLoopBasicBlocksLF.count(&BB) > 0) continue;
            #if ZYYDEBUG
            errs() << "considering BB: " << BB << "\n";
            #endif
            // determine each safecheck 
            std::unordered_set<Instruction *> safeCheckNonLoop;
            for (Instruction& I : BB) {
                if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                    if (IsSafeCheckCallForLoopFree(CI)) {
                        safeCheckCallInstInNonLoopBody.push_back(&I);
                        safeCheckNonLoop.insert(&I);
                    }
                }
            }

            //if there is no safecheck inst in the bb, continue it
            if (safeCheckNonLoop.size() == 0) continue;

            // safeCheckInNonLoopBB[&BB] = safeCheckNonLoop;
        

            //get safecheck related codes , joinpoints and locs
            for (auto callInst : safeCheckCallInstInNonLoopBody) {
                std::set<Instruction *> safeCheckRelatedInsts;
                //set the default joint point to the end of the function
                Instruction * joinpoint = nullptr;
                for (BasicBlock& BB : *callInst->getParent()->getParent()) {
                    for (Instruction& inst : BB) {
                        if (isa<ReturnInst>(&inst)) {    
                            joinpoint = (&(*(BB.getFirstInsertionPt())));
                        }
                    }
                }
                //old
                // for (auto subedge : funcPDG->getEdges()) {
                //     auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                //     auto toNodeSubT = subedge->getIncomingNode()->getT();

                //     if (cast<Instruction>(toNodeSubT) == callInst) {
                //         if (subedge->isMustDependence() && subedge->dataDepToString() == "RAW") {
                //             if (safeCheckRelatedInsts.count(cast<Instruction>(fromNodeSubT)) <= 0 && 
                //             callInst->getParent() == cast<Instruction>(fromNodeSubT)->getParent()) {
                //                 safeCheckRelatedInsts.insert(cast<Instruction>(fromNodeSubT));
                //             }
                //         }
                //     }

                //     if (cast<Instruction>(fromNodeSubT) == callInst &&
                //     subedge->dataDepToString() == "RAW") {
                //         if (fromNodeSubT != toNodeSubT) {
                //             Instruction * toInst = cast<Instruction>(toNodeSubT);
                //             if (joinpoint == nullptr) joinpoint = toInst; 
                //             else {
                //                 //happens before check
                //                 if (instHappensBefore(toInst, joinpoint)) {
                //                     joinpoint = toInst;
                //                 }
                //             }
                            

                //         }
                //     }
                // }

                //new
                auto node = funcPDG->fetchNode(callInst);
                if (node != nullptr) {
                    //as toNode 
                    for (auto &edge : node->getIncomingEdges()) {
                        if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                            auto fromNode = cast<Instruction>(edge->getOutgoingNode()->getT());
                            if (safeCheckRelatedInsts.count(fromNode) <= 0 && 
                            callInst->getParent() == fromNode->getParent()) {
                                safeCheckRelatedInsts.insert(fromNode);
                            }
                        }
                    }

                    //as fromNode
                    for (auto &edge : node->getOutgoingEdges()) {
                        if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                            auto toNode = cast<Instruction>(edge->getIncomingNode()->getT());
                            if (joinpoint == nullptr) joinpoint = toNode; 
                            else {
                                //happens before check
                                if (instHappensBefore(toNode, joinpoint)) {
                                    joinpoint = toNode;
                                }
                            }
                        }
                    }
                }

                
                safeCheckInstsInNonLoopBody[callInst] = safeCheckRelatedInsts;
                safeCheckCallInstJoinPoint[callInst] = joinpoint;

                //joinpoints means the farthest location, if it is null, the join point is the last instruction of a function
                //find the the forward most location
                std::set<Instruction *> locs; // if it is null, the forward most is the entry point (should judge whether is a call or bitcast inst)
                for (auto inst : safeCheckRelatedInsts) {
                    
                    // for (auto subedge : funcPDG->getEdges()) {
                    //     auto from = cast<Instruction>(subedge->getOutgoingNode()->getT());
                    //     auto to = cast<Instruction>(subedge->getIncomingNode()->getT());

                    //     if (to == inst) {
                    //         if (subedge->isMustDependence() && subedge->dataDepToString() == "RAW" &&
                    //         from->getParent() == inst->getParent()) {
                    //             locs.insert(from);
                    //         }
                    //     }
                    // }
                    auto toNode = funcPDG->fetchNode(inst);
                    if (toNode != nullptr) {
                        for (auto &edge : toNode->getIncomingEdges()) {
                            if (edge->isMustDependence() && edge->dataDepToString() == "RAW") {
                                auto fromNode = cast<Instruction>(edge->getOutgoingNode()->getT());
                                locs.insert(fromNode);
                            }
                        }
                    }


                    if (isa<CallInst>(inst)) { //maybe __softboundcets_load_lock_shadow_stack or other like
                        locs.insert(inst);
                    }

                }
                safeCheckInstsMoveRange[callInst] = locs;
            }

            errs() << "--after get safecheck related codes , joinpoints and\n";

            // enumerate all tasks combinations for each basic block
            // calculate each combination cost
            // choose the min cost task combination and create the loop free task
            std::vector<Instruction*> vec;
            vec.assign(safeCheckNonLoop.begin(), safeCheckNonLoop.end());
            errs() << "vec size: " << vec.size() << "\n";
            std::vector<std::pair<Instruction*, Instruction*>> minCostPairVec = {};
            std::vector<std::vector<std::pair<Instruction*, Instruction*>>> vecvecPair;
            if (vec.size() <= 10) {
                //permutation all combinations and group two insts as one pair which can match the cost model to cal cost 
                do {
                    std::vector<std::pair<Instruction*, Instruction*>> vp;
                    for (int i = 0; i < vec.size(); i += 2) {
                        int j = i + 1;
                        if (j < vec.size()) {
                            vp.push_back(std::make_pair(vec[i], vec[j]));
                        } else {
                            vp.push_back(std::make_pair(vec[i], nullptr));
                        }
                    }
                    vecvecPair.push_back(vp);
                } while (next_permutation(vec.begin(), vec.end()));

                uint32_t minCost = calBaselineCostForMC(vec); // baseline no merge
                
                //cal cost and choose the minimal cost pair vec
                for (auto item : vecvecPair) {
                    uint32_t curCost = 0;
                    for (auto pair : item) {
                        curCost += calCost(pair, safeCheckCallInstJoinPoint);
                    }

                    if (curCost <= minCost) {
                        minCost = curCost;
                        minCostPairVec.assign(item.begin(), item.end());
                    }
                }
            }

            // A B C D E
            // AB means A merges back to B
            // BA means B merges forward to A
            //create loop free task
            //new lookfreetask object
            //set safecheck codes
            //set join points
            //
            #if ZYYDEBUG
            errs() << "---964---\n";
            #endif
            if (minCostPairVec.empty()) {//use baseline version
                // for (int i = 0; i < vec.size(); i++) {
                //     Instruction * curInst = vec[i];

                // }
                std::vector<Instruction*> instSet{vec};
                LoopFreeTask * lftask = new LoopFreeTask(loopFreeId++, this->program);
                lftask->setSafeCheckCodesForOneTask(instSet);
                
                Instruction * jpt = safeCheckCallInstJoinPoint.at(safeCheckCallInstInNonLoopBody[safeCheckCallInstInNonLoopBody.size()-1]);
                
                lftask->setJoinPoint(jpt);
                
                // std::set<Instruction*> relatedInsts = safeCheckInstsInNonLoopBody.at(safeCheckCallInstInNonLoopBody[safeCheckCallInstInNonLoopBody.size()-1]);
                lftask->setCreatePt(safeCheckCallInstInNonLoopBody[safeCheckCallInstInNonLoopBody.size()-1]);
                
                lftask->setJoinFunc(joinFunc);

                loopFreeTasks.push_back(lftask);

            } else {//use optimized version
                for (int i = 0; i < minCostPairVec.size(); i++) {
                    std::pair<Instruction*, Instruction*> curInstPair = minCostPairVec[i];
                    Instruction * instFirst = curInstPair.first;
                    Instruction * instSecond = curInstPair.second;// instSecond may be a nullptr
                    LoopFreeTask * lftasks = new LoopFreeTask(loopFreeId++, this->program);
                    if (instSecond != nullptr) {
                        std::vector<Instruction*> instSet{instFirst, instSecond};
                        
                        lftasks->setSafeCheckCodesForOneTask(instSet);
                        
                        Instruction * jpF = safeCheckCallInstJoinPoint.at(instFirst);
                        Instruction * jpS = safeCheckCallInstJoinPoint.at(instSecond);
                        if (instHappensBefore(jpF, jpS)) {
                            lftasks->setJoinPoint(jpF);
                        } else {
                            lftasks->setJoinPoint(jpS);
                        }

                        std::set<Instruction*> relatedInstsFirst = safeCheckInstsInNonLoopBody.at(instFirst);
                        std::set<Instruction*> relatedInstsSecond = safeCheckInstsInNonLoopBody.at(instSecond);
                        relatedInstsFirst.insert(relatedInstsSecond.begin(), relatedInstsSecond.end());
                        lftasks->setInfo(relatedInstsFirst);
                        
                        lftasks->setJoinFunc(joinFunc);
                        
                        if (instHappensBefore(instFirst, instSecond)) {
                            lftasks->setMergeDirection(1);
                        } else {
                            lftasks->setMergeDirection(2);
                        }
                        

                        
                    } else {//instSecond is a nullptr, create as baseline task
                        std::vector<Instruction*> instSet{instFirst};
                    
                        lftasks->setSafeCheckCodesForOneTask(instSet);
                    
                        Instruction * jpt = safeCheckCallInstJoinPoint.at(instFirst);
                    
                        lftasks->setJoinPoint(jpt);
                    
                        std::set<Instruction*> relatedInsts = safeCheckInstsInNonLoopBody.at(instFirst);
                        lftasks->setInfo(relatedInsts);
                        
                        lftasks->setJoinFunc(joinFunc);

                    }

                    loopFreeTasks.push_back(lftasks);
                }
            }

        }

    }
    #endif

    // transform those loopTasks
    #if ENABLELOOP
    for (auto task : loopTasks) {
        errs() << "---naive task: " << "\n";
        // task->transform();
        task->splitLoop();
        errs() << "---final task: " << "\n";
    }
    #endif

    //transform those loopFree tasks
    #if ENABLELOOPFREE
    for (auto t : loopFreeTasks) {
        t->transform();
    }
    #endif

    //erase original safe check codes in original loop
    
    #if ENABLELOOP
    for (auto task : loopTasks) {
        task->eraseSafeCheckCodes();
    }
    #endif

    #if ENABLELOOPFREE
    for (auto t : loopFreeTasks) {
        t->eraseSafeCheckCodes();
    }
    #endif


    // errs() << "Final module: \n";
    // errs() << *this->program << "\n";
    // for (Function& F: *this->program) {
    //     if (F.getName().equals("init_array")) {
    //         errs() << "init_array-----:\n";
    //         errs() << F << "\n";
    //     }
    // }
    errs() << "LoopsMovec::runOnModule...before return\n";
    return false;
}

Function * LoopsMovec::getEntryFunction(void) const {
    return this->program->getFunction("main");//"main"
    // _RV_main or main for MoveC
    // softboundcets_pseudo_main for softboundcets
}

std::vector<LoopStructure *> * LoopsMovec::getLoopStructures(void) {
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
std::vector<LoopStructure *> * LoopsMovec::getLoopStructures(Function * func) {
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

std::vector<Function *> * LoopsMovec::getModuleFunctionsReachableFrom(Module * M, Function * startingPoint) {
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

PDG * LoopsMovec::getFunctionDependenceGraph(Function * func) {
    return this->pdgAnalysis->getFunctionPDG(*func);
}

StayConnectedNestedLoopForest * LoopsMovec::organizeLoopsInTheirNestingForest(std::vector<LoopStructure *> const & loops) {
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


DominatorSummary * LoopsMovec::getDominators(Function * f) {
    auto& DT = getAnalysis<DominatorTree>(*f);
    auto& PDT = getAnalysis<PostDominatorTree>(*f);

    auto ds = new DominatorSummary(DT, PDT);
    return ds;
}

std::vector<LoopDependenceInfo *> LoopsMovec::selectTheOrderOfLoopsToParallelize(StayConnectedNestedLoopForestNode * tree) {

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
        // if (header == nullptr) errs() << "---308\n";
        auto function = header->getParent();
        // errs() << "selector func: " << function->getName() << "\n";
        auto funcPDG = this->getFunctionDependenceGraph(function);
        auto DS = this->getDominators(function);

        auto& LI = getAnalysis<LoopInfo>(*function);
        auto& SE = getAnalysis<ScalarEvolution>(*function);
        // errs() << "Header& : " << &header << "\n";
        auto llvmLoop = LI.getLoopFor(header);

        //check of loopIndex provided is within bounds
        // errs() << "selector 282---\n";
        // if (funcPDG == nullptr || llvmLoop == nullptr || &SE == nullptr || &LI == nullptr) {
        //     errs() << "there is a null ptr...\n";
        // }
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

        // errs() << "--1079--\n";
        auto ldi = new LoopDependenceInfo(funcPDG, llvmLoop, *DS, SE);

        delete DS;

        timeSavedLoops[ldi] = 0;

        return false;
    };
    tree->visitPreOrder(selector);

    // errs() << "timeSafedLoops Size: " << timeSavedLoops.size() << "\n";
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
            // errs() << "LoopHeader: " << *ls->getHeader() << "\n";
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

void LoopsMovec::linkTransformedLoopToOriginalFunction(
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

Constant * LoopsMovec::generateJoinFunc() {
    LLVMContext& ctx = this->program->getContext();
    Type * ty = Type::getInt32Ty(ctx);
    FunctionType * joinFuncType = FunctionType::get(Type::getVoidTy(ctx), ty, false);
    Constant * join = this->program->getOrInsertFunction("_Z4joinj", joinFuncType);
    return join;
}




bool LoopsMovec::isTheMovecLibraryFunction(Function * libF) {
    if (movecLibFunction.count(libF->getName())) {
        return true;
    }
    return false;
}

uint32_t LoopsMovec::calBaselineCostForMC(std::vector<Instruction*> safecheckInsts) {
    uint32_t res = 0;
    
    for (int i = 0; i < safecheckInsts.size(); i++) {
        Instruction * curInst = safecheckInsts[i];
        BasicBlock * curBB = curInst->getParent();

        uint32_t count = 0;
        uint32_t ts1 = 0;
        for (Instruction &inst : *curBB) {
            if (curInst == &inst) {
                ts1 = count;
            }
            if (CallInst * ci = dyn_cast<CallInst>(&inst)) {
                if (!IsSafeCheckCallForMovec(ci)) count += 100; //average function cost
            } else {
                if (IsMemAccessInst(inst)) {
                    count++;
                }
            }
        }
        res += std::max(count, ts1 + getSafeCheckCost(curInst) + getSpawnableCost());
    }

    return res;
}



