#include "DecisionMaker.h"
#include "Utils.h"

#include "llvm/Analysis/CallGraph.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/ADT/SCCIterator.h"
#include "llvm/Analysis/CallGraphSCCPass.h"
#include "llvm/Support/raw_ostream.h"

#include <deque>

char DecisionMaker::ID = 0;

static RegisterPass<DecisionMaker> X("MakeDecision", "Make the decision of where to join can gain most profit and find DOALL");

DecisionMaker::DecisionMaker() : ModulePass{ID} {

}

DecisionMaker::~DecisionMaker() {
    allJoinPoints.clear();
    profitableJoinPoints.clear();
    funcToBeSpawned.clear();
    funcStatusMap.clear();
    safeCheckToBeMergedGroup.clear();
}

void DecisionMaker::releaseMemory() {
    allJoinPoints.clear();
    profitableJoinPoints.clear();
    funcToBeSpawned.clear();
    funcStatusMap.clear();
    safeCheckToBeMergedGroup.clear();
}

void DecisionMaker::getAnalysisUsage(AnalysisUsage &AU) const {
    //AU.addRequired<IdentifyPass>();
    AU.addRequired<PDGAnalysis>();
    AU.addRequired<LoopInfo>();
    AU.addRequired<CallGraph>();
    AU.addRequired<ScalarEvolution>();
    AU.setPreservesAll();

}

bool DecisionMaker::runOnModule(Module &M) {
    errs() << "runOnModule DecisionMaker...\n";
    //find alljoinpoints
    PDGAnalysis& PDGAna = getAnalysis<PDGAnalysis>();
    //auto& identity = getAnalysis<IdentifyPass>();
    CallGraph& CG = getAnalysis<CallGraph>();
    scc_iterator<CallGraph*> CGI = llvm::scc_begin(&CG);
    CallGraphSCC CurSCC(&CGI);//{ &CGI };

    //walk the callgraph in bottom-up SCC order
    while (!CGI.isAtEnd()) {
        std::vector<CallGraphNode*> &NodeVec = *CGI;
        CurSCC.initialize(&NodeVec[0], &NodeVec[0] + NodeVec.size());
        processSCCForJoinPoints(PDGAna.getPDG(), CurSCC);
        errs() << "DecisionMaker-59\n";
        processSCCForFuncStatusMap(CurSCC);
        errs() << "DecisionMaker-60\n";
        ++CGI;
    }

    errs() << "-----print safe check group----\n";
    for (auto groupPair : this->safeCheckToBeMergedGroup) {
        errs() << "---vvvv---direction: " << groupPair.second << "\n";

        for (auto group : groupPair.first) {
            errs() << "~~CallInst: " << *group << "\n";
        }
    }

    errs() << "-----print all join points------\n";
    

    //findAllProfitableJoinPoints
    for (auto callPair : allJoinPoints) { // safecheck : set of joinPoints
        //for each CallInst and joinpoints pair
        //get safecheckcost
        uint64_t safeCheckCost = getSafeCheckCost(callPair.first);
        errs() << "SafeCheck: " << *callPair.first << "\n";
        //get spawnable cost
        uint64_t spawnableCost = getSpawnableCost();

        Function * safeCheckFunc = callPair.first->getParent()->getParent();
        //get cost between safecheck and joinpoint
        for (auto joinInst : callPair.second) {
            //uint64_t safeCheckBetweenJoinPointCost = getSafeCheckBetweenJoinPointCost(*safeCheckFunc, callPair.first, joinInst/*, getAnalysis<LoopInfo>(*safeCheckFunc), getAnalysis<ScalarEvolution>(*safeCheckFunc)*/);
            
            //if ((safeCheckBetweenJoinPointCost > spawnableCost || safeCheckCost > spawnableCost)) {
                //if doesn't satisfy this condition, we will erase the join point
                //callPair.second.erase(joinInst);

                //if satisfy this condition, then we think this join point is profitable
                //and insert into set
                errs() << "joinP: " << *joinInst << "\n";
                profitableJoinPoints[callPair.first].insert(joinInst);
                funcToBeSpawned.insert(callPair.first->getCalledFunction());
            //}
        }
        
    }

    // LoopInfo& LI = getAnalysis<LoopInfo>();
    // errs() << "LI : " << &LI << "\n";


    // TODO: find DOALL
    return false;
}   

std::set<Instruction*> DecisionMaker::findAllJoinPoints(PDG * pdg, CallInst *CI, Function &F) {
    std::set<Instruction*> points;
    std::set<Instruction*> truePoints;
    BasicBlock * spawnableBlock = CI->getParent();
    //use CI to lookup in pdg to find the true dependence
    // read after write --- use after define RAW
    //iterator all edges in pdg

    // judge : fromNode == CI ? add toNode to setPoints
    for (auto edge : pdg->getEdges()) {
        if (edge->dataDepToString() == "RAW") {
            auto fromNodeT = edge->getOutgoingNode()->getT();
            auto toNodeT = edge->getIncomingNode()->getT();

            if (cast<Instruction>(CI) == cast<Instruction>(fromNodeT)) {
                errs() << "findAllJoinP---From: " << *cast<Instruction>(fromNodeT) << "\n";
                errs() << "findAllJoinP---To: " << *cast<Instruction>(toNodeT) << "\n";
                if (fromNodeT != toNodeT) {
                    points.insert(cast<Instruction>(toNodeT));
                }
                
                //from the the CI's parent block, to traverse the succ block, to find the join point
                //judge whether toNodeT is in the current basic block
                
            }
        }
    }

    std::deque<BasicBlock *> blocksToExplore;
    std::set<BasicBlock *> exploredBlocks;

    blocksToExplore.push_back(spawnableBlock);

    auto addBlocks = [&](BasicBlock *bb) {blocksToExplore.push_back(bb);};

    std::for_each(succ_begin(spawnableBlock), succ_end(spawnableBlock), addBlocks);

    while (!blocksToExplore.empty()) {
        auto *curBlock = blocksToExplore.front();
        blocksToExplore.pop_front();

        if (exploredBlocks.count(curBlock) > 0) {
            errs() << "The Block has alreadly been explored...\n";
            continue;
        }

        //if has join point is in this blocks
        bool hasFindJoinPoint = false;
        for (Instruction &I : *curBlock) {
            if (points.count(&I) > 0) {
                errs() << "find one join point...\n";
                truePoints.insert(&I);
                hasFindJoinPoint = true;
            }
        }
        if (!hasFindJoinPoint) {
            if (curBlock->getTerminator()->getNumSuccessors() > 0) {
                errs() << "No join point, adding successors to blocksToExplore\n";
                std::for_each(succ_begin(curBlock), succ_end(curBlock), addBlocks);
            } else {
                errs() << "No join point, adding terminator\n";
                truePoints.insert(curBlock->getTerminator());
            }

        }

        exploredBlocks.insert(curBlock);
    }

    // if (points.size() == 0) { //there is no join point from pdg
    //     if (spawnableBlock->getTerminator()->getNumSuccessors() == 0) {
    //         points.insert(spawnableBlock->getTerminator());//insert join point before ending block
    //         //return points;
    //     }
    // }

    for (auto trueP : truePoints) {
        errs() << "TrueP: " << *trueP << "\n";
    }

    return truePoints;
}

void DecisionMaker::processSCCForJoinPoints(PDG * pdg, CallGraphSCC &SCC) {
    for (CallGraphSCC::iterator node = SCC.begin(), End = SCC.end(); node != End; ++node) {
        Function * func = (*node)->getFunction();
        if (func == nullptr || func == NULL || func->isDeclaration()) {
            errs() << "DM::processSCCForJoinPoints, func is null or declaration...\n";
            continue;
        }

        errs() << "DM:: func is "<< func->getName() << "...\n";
        for (BasicBlock &BB : *func) {
            CallInst * lastCallInst = nullptr;
            std::set<CallInst *> safeCheckGroup;
            uint32_t direction = 2; // 2 - init, 0 - move forward, 1- move backward, 3 - stand
            uint32_t downUpCornerCase = 0; // flag = downUpCornerCase << 2 + direction; decode , direction = xx & 0x0000 0003, cornerCase = (flag >> 2 );
            for (Instruction &I : BB) {
                if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                    if (IsSafeCheckCall(CI)) {
                        //use pdg to get the corresponding join point
                        std::set<Instruction*> joinpoints = findAllJoinPoints(pdg, CI, *func);
                        allJoinPoints.emplace_back(CI, joinpoints);
                        errs() << "Decision::CI is: " << *CI << "\n";
                        if (lastCallInst == nullptr) {
                            safeCheckGroup.insert(CI);
                        } else {
                            errs() << "Decision::lastCallInst is: " << *lastCallInst << "\n";
                            uint32_t newDirection = getDirection(pdg, *func, lastCallInst, CI); // dependence analysis
                            errs() << "DecisionMaker::direction: " << direction << ", newDirection: " << newDirection << ", safeCheckGroupSize: " << safeCheckGroup.size() << "\n";
                            uint32_t betweenCost = getSafeCheckBetweenSafeChecktCost(*func, lastCallInst, CI);
                            uint64_t safeCheckCostLast = getSafeCheckCost(lastCallInst);
                            uint64_t safeCheckCostCur = getSafeCheckCost(CI);
                            if (direction != 2) { // 0 1 3
                                if (newDirection == direction) { // 0-0, 1-1, 3-3
                                    if (newDirection != 3) {//0-0, 1-1
                                        if (true /*merge safecheck is profitable*/) {
                                            safeCheckGroup.insert(CI);
                                            continue;
                                        }
                                    } else { //3-3
                                        safeCheckToBeMergedGroup.push_back(make_pair(safeCheckGroup, direction));
                                        safeCheckGroup.clear();
                                        safeCheckGroup.insert(CI);
                                    }

                                } else { // newDirection != direction 0-1, 1-0, 0-3,3-0, 1-3,3-1
                                    //may be more aggressive approach
                                    if (newDirection == 3) {//3-0, 3-1
                                        
                                        safeCheckToBeMergedGroup.push_back(make_pair(safeCheckGroup, downUpCornerCase << 2 + direction));
                                        safeCheckGroup.clear();
                                        safeCheckGroup.insert(CI);
                                        direction = newDirection;
                                        downUpCornerCase = 0;
                                    } else if (newDirection == 0) { // 0-3, 0-1
                                        if (direction == 3) {
                                            safeCheckGroup.insert(CI);
                                            direction = newDirection;
                                            continue;
                                        } else if (direction == 1) { //special case
                                            downUpCornerCase = safeCheckGroup.size();
                                            safeCheckGroup.insert(CI);
                                            direction = newDirection;
                                            continue;
                                        }
                                    } else if (newDirection == 1) { // 1-3, 1-0
                                        if (direction == 3) {
                                            safeCheckGroup.insert(CI);
                                            direction = newDirection;
                                            continue;
                                        } else if (direction == 0) {
                                            safeCheckToBeMergedGroup.push_back(make_pair(safeCheckGroup, downUpCornerCase << 2 + direction));
                                            safeCheckGroup.clear();
                                            safeCheckGroup.insert(CI);
                                            direction = newDirection;
                                            downUpCornerCase = 0;
                                        }
                                    }


                                }
                            } else { // direction == 2
                                if (newDirection == 3) {
                                    safeCheckToBeMergedGroup.push_back(make_pair(safeCheckGroup, downUpCornerCase << 2 + newDirection));
                                    safeCheckGroup.clear();
                                    safeCheckGroup.insert(CI);
                                    direction = 2;
                                } else {
                                    direction = newDirection;
                                    safeCheckGroup.insert(CI);
                                }
                                
                            }

                        }


                        lastCallInst = CI;
                    }
                }
            }
            if (safeCheckGroup.size() != 0) {
                if (downUpCornerCase == 0) safeCheckToBeMergedGroup.push_back(make_pair(safeCheckGroup, direction));
                else safeCheckToBeMergedGroup.push_back(make_pair(safeCheckGroup, downUpCornerCase << 2 + direction));
            }
            
        }

    }
}


uint64_t DecisionMaker::getSafeCheckCost(CallInst * SafeCheck) {
    uint32_t cost = 0u;
    Function * func = SafeCheck->getFunction();
    //judge whether func is in funcStatusMap
    if (funcStatusMap.count(func) != 0) {
        FuncStatus status = funcStatusMap[func];
        if (status.isSafeCheck) {
            return status.totalCost;
        } else {
            errs() << "func: " << func->getName() << " is not SafeCheck...\n";
        }

    } else {
        errs() << "func: " << func->getName() << " is not in the status map...\n";
    }

    return cost;
}

uint64_t DecisionMaker::getSpawnableCost() {
    //TODO: need to be more accurate
    return 100u;
}

uint64_t DecisionMaker::getSafeCheckBetweenJoinPointCost(Function &F, CallInst * safecheck, Instruction * joinInst/*, LoopInfo &LI, ScalarEvolution &SE*/) {
    uint64_t cost = 0u;

    //find block
    BasicBlock * spawnableBlock = safecheck->getParent();
    BasicBlock * endBlock = joinInst->getParent();

    bool startInst = false;
    bool endInst = false;
    for (BasicBlock &BB : F) {
        uint32_t bbInst = 0;

        for (Instruction &I : BB) {

            if (cast<Instruction>(safecheck) == &I) {
                startInst = true;
            }
            
            if (startInst) {
                if (auto *ci = dyn_cast<CallInst>(&I)) {
                    //look funcStatusMap
                    //getCalledFunction();
                    Function * calledF = ci->getCalledFunction();
                    bbInst += getFuncStatus(*calledF)->totalCost;
                } else {
                    bbInst++;
                }
            }
                        
            if (joinInst == &I) {
                endInst = true;
                break;
            }
        }

        // if (Loop *L = LI.getLoopFor(&BB)) {
        //     uint32_t tripC = SE.getSmallConstantTripCount(L, nullptr);//nullptr maybe &BB
        //     if (tripC > 0) {
        //         bbInst *= tripC;
        //     }
        // }

        cost += bbInst;

        if (endInst) {
            break;
        }

        
    }

    return cost;
}

void DecisionMaker::processSCCForFuncStatusMap(CallGraphSCC &SCC) {
    for (CallGraphSCC::iterator node = SCC.begin(), End = SCC.end(); node != End; ++node) {
        Function * func = (*node)->getFunction();
        if (func == nullptr || func == NULL) {
            errs() << "DecisionMaker::processSCCForFuncStatusMap, func is null or declaration...\n";
            continue;
        }
        //getAnalysis<ScalarEvolution>();
        // errs() << "DecisionMaker-274\n";
        FuncStatus stats = calculateFuncStatus(*func/*, getAnalysis<LoopInfo>(*func), getAnalysis<ScalarEvolution>(*func)*/);
        // errs() << "DecisionMaker-276\n";
        stats.totalCost = stats.numOfInst;
        for (auto& fun : stats.numofFuncCalls) {
            if (fun.first->isDeclaration()) {
                if (IsSafeCheckFun(fun.first->getName())) {
                    //---zyy---total cost 10 / 20 / 40?
                    stats.totalCost += 20;
                } else {
                    //total cost  = 0;
                    ;
                }
            } else {
                if (fun.first->isIntrinsic()) {
                    //total cost 30 ?
                    //---zyy---
                    stats.totalCost += 10;
                } else {
                    if (FuncStatus *calledStats = getFuncStatus(*fun.first)) {
                        stats.totalCost += (calledStats->totalCost * fun.second);
                    }
                }
            }
        }
        stats.isSafeCheck = (IsSafeCheckFun(func->getName()) ? true : false);
        funcStatusMap[func] = std::move(stats);
    }


    //handle all self-recursive and mutally-recursive calls
    std::map<Function *, uint32_t> extraRecursiveCost;
    for (CallGraphSCC::iterator node = SCC.begin(), End = SCC.end(); node != End; ++node) {
        //check that this isn't a "fake node"
        Function * caller = (*node)->getFunction();
        if (!caller) continue;

        FuncStatus * funcS = getFuncStatus(*caller);
        std::map<Function *, uint32_t> funcCalled = funcS->numofFuncCalls;


        for (CallGraphSCC::iterator calleeNode = SCC.begin(), calleeNodeEnd = SCC.end(); calleeNode != calleeNodeEnd; ++calleeNode) {
            Function * callee = (*calleeNode)->getFunction();
            if (!callee) continue;

            auto calleeIter = funcCalled.find(callee);
            if (calleeIter != funcCalled.end()) {
                extraRecursiveCost[caller] += (getFuncStatus(*calleeIter->first)->totalCost * calleeIter->second);
            }
        }
    }

    for (auto& rf : extraRecursiveCost) {
        getFuncStatus(*rf.first)->totalCost += rf.second;
    }

}

FuncStatus DecisionMaker::calculateFuncStatus(Function &F/*, LoopInfo &LI, ScalarEvolution &SE*/) {
    // errs() << "DecisionMaker-333\n";
    FuncStatus stats{};
    for (BasicBlock &BB : F) {
        uint64_t bbInst = 0u;
        uint64_t bbEmittingInst = 0u;
        uint64_t bbMemAccesses = 0u;
        std::map<Function *, uint32_t> bbFuncCalls;
        for (Instruction &I : BB) {
            bbInst++;
            if (IsEmittingInst(I)) bbEmittingInst++;
            if (IsMemAccessInst(I)) bbMemAccesses++;
            if (CallInst * CI = dyn_cast<CallInst>(&I)) {
                ++bbFuncCalls[CI->getCalledFunction()];
            }
        }

        //if the BB is inside a loop, multiply instruction by the trip count
        // if (Loop * L = LI.getLoopFor(&BB)) {
        //     //---zyy--- nullptr may should be &BB ??
        //     uint32_t tripCount = SE.getSmallConstantTripCount(L, nullptr);
        //     errs() << "tripCount: " << tripCount << " is the tripCount for this BB\n";
        //     if (tripCount > 0u) {
        //         bbInst *= tripCount;
        //         bbEmittingInst *= tripCount;
        //         bbMemAccesses *= tripCount;
        //         for (auto& f : bbFuncCalls) {
        //             f.second *= tripCount;
        //         }
        //     }
        // }

        stats.numOfInst += bbInst;
        stats.numOfEmittingInst += bbEmittingInst;
        stats.numOfMemAccess += bbMemAccesses;
        for (auto& fun : bbFuncCalls) {
            stats.numofFuncCalls[fun.first] += fun.second;
        }
    }

    return stats;
}

FuncStatus * DecisionMaker::getFuncStatus(Function &F) {
    auto it = funcStatusMap.find(&F);
    return (it != funcStatusMap.end() ? &it->second : nullptr);
}

raw_ostream& FuncStatus::print(raw_ostream & O) const {
    O << "Num of Inst: " << numOfInst << "\n";
    O << "Num of EmittingInst: " << numOfEmittingInst << "\n";
    O << "Num of MemAccessInst: " << numOfMemAccess << "\n";
    O << "Total Cost: " << totalCost << "\n";
    O << "IsSafeCheck: " << isSafeCheck << "\n";
    for (auto& p : numofFuncCalls) {
        O << p.first->getName() << "() is called " << p.second << 
        (p.second >= 2? " times\n" : "time\n");
    }

    return O;
}


std::map<CallInst *, std::set<Instruction *>> DecisionMaker::getProfitableJoinPoints() {
    return this->profitableJoinPoints;
}
std::set<Function*> DecisionMaker::getFuncToBeSpawned() {
    return this->funcToBeSpawned;
}

std::vector<std::pair<std::set<CallInst *>, uint32_t>> DecisionMaker::getSafeCheckToBeMergedGroup() {
    return this->safeCheckToBeMergedGroup;
}

// std::map<CallInst *, std::set<Instruction *>> DecisionMaker::getAllJoinPoints() {
//     return this->allJoinPoints;
// }

uint64_t DecisionMaker::getSafeCheckBetweenSafeChecktCost(Function & F, CallInst * lastCallInst, CallInst * CI) {
    return 1;
}
// uint64_t DecisionMaker::getSafeCheckCost(CallInst * lastCallInst) {
//     return 1;
// }


uint32_t DecisionMaker::getDirection(PDG * pdg, Function & F, CallInst * lastCallInst, CallInst * curCallInst) {

    // bool twoCallInstInPDG = false;
    // for (auto edge : pdg->getEdges()) {
    //     auto fromNodeT = edge->getOutgoingNode()->getT();
    //     auto toNodeT = edge->getIncomingNode()->getT();
    //     if (cast<Instruction>(lastCallInst) == cast<Instruction>(fromNodeT) && 
    //         cast<Instruction>(curCallInst) == cast<Instruction>(toNodeT)) {
    //             twoCallInstInPDG = true;
    //         if (edge->dataDepToString() == "RAW" ||
    //             edge->dataDepToString() == "WAR" || 
    //             edge->dataDepToString() == "WAW") {
    //                 errs() << "getDirection---From: " << *cast<Instruction>(fromNodeT) << "\n";
    //                 errs() << "getDirection---To: " << *cast<Instruction>(toNodeT) << "\n";

    //                 //need to determine the dependency between check code and original code
    //                 BasicBlock * curBB = lastCallInst->getParent();
    //                 if (curBB != curCallInst->getParent()) {
    //                     errs() << "ERROR, getDirection, lastCallInst and CurCallInst should be in the same basicblock...\n";
    //                 } else {
    //                     //in the same basic block
    //                     bool hasStart = false;
    //                     uint8_t direction = 2;
    //                     bool lastToInstDep = false;
    //                     bool instToCurDep = false;
    //                     for (Instruction& I : *curBB ) {
    //                         if (dyn_cast<Instruction>(curCallInst) == &I) {
    //                             break;
    //                         }

    //                         if (dyn_cast<Instruction>(lastCallInst) == &I) {
    //                             hasStart = true;
    //                         }

    //                         if (hasStart) {
    //                             //determine cur inst dependence with lastInst and curInst
    //                             for (auto subedge : pdg->getEdges()) {
    //                                 auto fromNodeSubT = subedge->getOutgoingNode()->getT();
    //                                 auto toNodeSubT = subedge->getIncomingNode()->getT();

    //                                 /*
    //                                 lastCallInst 1 - from 
    //                                 |
    //                                 (may be a dependence)
    //                                 |     
    //                                 inst         1 - to ; 2 - from
    //                                 |
    //                                 (may be a dependence)
    //                                 |
    //                                 curCallInst        2 - to
    //                                 */
    //                                 if (cast<Instruction>(lastCallInst) == cast<Instruction>(fromNodeSubT) &&
    //                                 cast<Instruction>(toNodeSubT) == &I) {
    //                                     if (subedge->dataDepToString() == "RAW" ||
    //                                         subedge->dataDepToString() == "WAR" ||
    //                                         subedge->dataDepToString() == "WAW") {
    //                                             //means the lastCallInst can not move backward
    //                                             lastToInstDep = true;
    //                                     }
    //                                 }

    //                                 if (cast<Instruction>(fromNodeSubT) == &I &&
    //                                 cast<Instruction>(curCallInst) == cast<Instruction>(toNodeSubT)) {
    //                                     if (subedge->dataDepToString() == "RAW" ||
    //                                         subedge->dataDepToString() == "WAR" ||
    //                                         subedge->dataDepToString() == "WAW") {
    //                                             instToCurDep = true;
    //                                     }
    //                                 }
    //                             }
    //                         }
    //                     }

    //                     if (lastToInstDep == false && instToCurDep == false) {
    //                         direction = 0;
    //                     } else if (lastToInstDep == false && instToCurDep == true) {
    //                         direction = 1;
    //                     } else if (lastToInstDep == true && instToCurDep == false) {
    //                         direction = 0;
    //                     } else { //lastToInstDep == true && instToCurDep == true
    //                         //we can't move any thing
    //                         direction = 3;
    //                     }
    //                     return direction;
    //                 }

    //         } else {
    //             errs() << "getDirection---From: " << *cast<Instruction>(fromNodeT) << "\n";
    //             errs() << "getDirection---To: " << *cast<Instruction>(toNodeT) << "\n";
    //             //no dependence 
    //             return 0;
    //         }
    //     }

    // }
    //if they are no in PDG
    // if (!twoCallInstInPDG) {
        BasicBlock * curBB = lastCallInst->getParent();
        if (curBB != curCallInst->getParent()) {
            errs() << "ERROR, getDirection, lastCallInst and CurCallInst should be in the same basicblock...\n";
            return 3;//don't move anything
        } else {
            //in the same basic block
            bool hasStart = false;
            uint32_t direction = 2;
            bool lastToInstDep = false;
            bool instToCurDep = false;
            for (Instruction& I : *curBB ) {
                if (dyn_cast<Instruction>(curCallInst) == &I) {
                    errs() << "getDirection: break...\n";
                    break;
                }

                if (dyn_cast<Instruction>(lastCallInst) == &I) {
                    hasStart = true;
                }

                if (hasStart) {
                    //determine cur inst dependence with lastInst and curInst
                    for (auto subedge : pdg->getEdges()) {
                        auto fromNodeSubT = subedge->getOutgoingNode()->getT();
                        auto toNodeSubT = subedge->getIncomingNode()->getT();

                        /*
                        lastCallInst 1 - from 
                        |
                        (may be a dependence)
                        |     
                        inst         1 - to ; 2 - from
                        |
                        (may be a dependence)
                        |
                        curCallInst        2 - to
                        */
                        if (cast<Instruction>(lastCallInst) == cast<Instruction>(fromNodeSubT) &&
                        cast<Instruction>(toNodeSubT) == &I) {
                            if ((subedge->dataDepToString() == "RAW" ||
                                subedge->dataDepToString() == "WAR" ||
                                subedge->dataDepToString() == "WAW")
                                && subedge->isMustDependence()) {
                                    //means the lastCallInst can not move backward
                                    lastToInstDep = true;
                            }
                        }

                        if (cast<Instruction>(fromNodeSubT) == &I &&
                        cast<Instruction>(curCallInst) == cast<Instruction>(toNodeSubT)) {
                            if ((subedge->dataDepToString() == "RAW" ||
                                subedge->dataDepToString() == "WAR" ||
                                subedge->dataDepToString() == "WAW")
                                && subedge->isMustDependence()) {
                                    instToCurDep = true;
                            }
                        }
                    }
                }
            }

            if (lastToInstDep == false && instToCurDep == false) {
                direction = 0;
            } else if (lastToInstDep == false && instToCurDep == true) {
                direction = 1;
            } else if (lastToInstDep == true && instToCurDep == false) {
                direction = 0;
            } else { //lastToInstDep == true && instToCurDep == true
                //we can't move any thing
                direction = 3;
            }
            errs() << "return direction: " << direction << "\n";
            return direction;
        }
    // }
    // return 0;

}