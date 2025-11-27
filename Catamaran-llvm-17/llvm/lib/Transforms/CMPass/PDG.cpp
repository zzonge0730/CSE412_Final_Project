#include "PDG.h"
#include "Utils.h"
#include <algorithm>
#include <assert.h>
// LLVM 14: cl::opt를 사용하지 않으므로 CommandLine.h 불필요
// #include "llvm/Support/CommandLine.h"

using namespace llvm;

// LLVM 14: cl::opt는 전역 생성자에서 충돌을 일으킬 수 있으므로 비활성화
// static cl::opt<bool> MCSelected("movec", cl::ZeroOrMore, cl::Hidden, cl::desc("Specify the PDG for MoveC"));
static bool MCSelected = false; // 임시로 false로 설정

PDG::PDG(Module &M) {
    // int count = 0;
    // Function* entryFunc = nullptr;
    for (auto &F : M) {
        if (F.isDeclaration()) continue;
        // LLVM 14: StringRef → string 변환
        if (movecLibFunction.count(F.getName().str())) continue;
        if (softboundcetsLibFunction.count(F.getName().str())) continue;
        //filter movec lib function  and movec wrapperfunction
        // StringRef funcName = F.getName();
        // if (funcName.startswith("_RV_") && (!funcName.equals("_RV_main"))) {
        //     continue;
        // }
        addNodesOf(F);
        // if (count == 0) entryFunc = &F;
        // count++;
    }
    //set the etnry node
    //"main" for asan and ubsan
    //"softboundcets_pseudo_main" for softboundcets
    //"main" for movec
    
    // LLVM 14: cl::opt를 비활성화했으므로 직접 값 사용
    auto mainF = MCSelected ? M.getFunction("main") : M.getFunction("softboundcets_pseudo_main");
    // auto mainF = M.getFunction("main");

    if (mainF == nullptr) {
        // Try to find any function as fallback
        for (auto &F : M) {
            if (!F.isDeclaration() && !F.empty()) {
                mainF = &F;
                break;
            }
        }
    }
    
    if (mainF == nullptr) {
        assert(false && "No main function found");
        return;
    }
    // Ensure main function nodes are added (in case it was filtered out)
    // Double-check: if main function nodes are not in map, add them explicitly
    if (mainF && !mainF->empty()) {
        auto bbIt = mainF->begin();
        if (bbIt != mainF->end()) {
            auto &firstBB = *bbIt;
            if (!firstBB.empty()) {
                auto instIt = firstBB.begin();
                if (instIt != firstBB.end()) {
                    auto entryInst = &*instIt;
                    if (entryInst && internalNodeMap.find(entryInst) == internalNodeMap.end()) {
                        // Main function was filtered out or not added - add it now
                        addNodesOf(*mainF);
                    }
                    // Verify node exists after adding
                    if (entryInst && internalNodeMap.find(entryInst) == internalNodeMap.end()) {
                        // Still not found - try _RV_main as entry point
                        auto rvMainF = M.getFunction("_RV_main");
                        if (rvMainF && !rvMainF->empty()) {
                            auto rvBbIt = rvMainF->begin();
                            if (rvBbIt != rvMainF->end()) {
                                auto &rvFirstBB = *rvBbIt;
                                if (!rvFirstBB.empty()) {
                                    auto rvInstIt = rvFirstBB.begin();
                                    if (rvInstIt != rvFirstBB.end()) {
                                        auto rvEntryInst = &*rvInstIt;
                                        if (rvEntryInst && internalNodeMap.find(rvEntryInst) == internalNodeMap.end()) {
                                            addNodesOf(*rvMainF);
                                        }
                                        // Use _RV_main as entry point
                                        this->setEntryPointAt(*rvMainF);
                                        return;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // if (mainF == nullptr) {
    //     errs() << "mainF is null, name: " << entryFunc->getName() << "\n";
    //     this->setEntryPointAt(*entryFunc);
    // } else {
    //     errs() << "mainF is not null...\n";
    //     this->setEntryPointAt(*mainF);
    // }
    this->setEntryPointAt(*mainF);
    for (auto edge : this->getEdges()) {
        assert(!edge->isLoopCarriedDependence() && "Flag was already set");
    }
}

PDG::PDG(Function &F) {
    addNodesOf(F);
    setEntryPointAt(F);
}

PDG::PDG(Loop *loop) {
    //create a node per instruction within loops of LI(loopinfo) only
    for (auto bbi = loop->block_begin(); bbi != loop->block_end(); bbi++) {
        for (auto &I : **bbi) {
            this->addNode(cast<Value>(&I), true);//inclusion = true;
        }
    }

    //set the entry node
    auto bbBegin = *(loop->block_begin());
    this->entryNode = this->internalNodeMap[&*(bbBegin->begin())];
    assert(this->entryNode != nullptr);
}

PDG::PDG(std::vector<Value *> &values) {
    for (auto &n : values) {
        this->addNode(n, true);//inclusion = true;
    }

    //set the entry node
    this->entryNode = this->internalNodeMap[*(values.begin())];
    assert(this->entryNode != nullptr);
}

PDG::PDG() {
}

void PDG::addNodesOf(Function &F) {
    // for (auto &arg : F.args()) {
    //     addNode(cast<Value>(&arg), true);//inclusion = true
    // }
    //---zyy---
    for (Function::arg_iterator arg_it = F.arg_begin(); arg_it != F.arg_end(); ++arg_it) {
        addNode(cast<Value>(&*arg_it), true);
    }

    for (auto &BB : F) {
        for (auto &I : BB) {
            addNode(cast<Value>(&I), true);//inclusion = true
        }
    }
}

void PDG::setEntryPointAt(Function &F) {
    // Helper function to safely get entry node from a function
    auto getEntryNodeFromFunction = [this](Function *Func) -> DGNode<Value> * {
        if (!Func || Func->empty()) {
            return nullptr;
        }
        
        auto bbIt = Func->begin();
        if (bbIt == Func->end()) {
            return nullptr;
        }
        
        auto &firstBB = *bbIt;
        if (firstBB.empty()) {
            return nullptr;
        }
        
        auto instIt = firstBB.begin();
        if (instIt == firstBB.end()) {
            return nullptr;
        }
        
        Value *entryInst = &*instIt;
        if (!entryInst) {
            return nullptr;
        }
        
        // Ensure nodes of this function are added first
        // Check if any instruction from this function is in the graph
        bool hasNodes = false;
        for (auto &BB : *Func) {
            for (auto &I : BB) {
                if (this->isInGraph(&I)) {
                    hasNodes = true;
                    break;
                }
            }
            if (hasNodes) break;
        }
        
        if (!hasNodes) {
            this->addNodesOf(*Func);
        }
        
        // Now try to find the entry node using direct map access
        // Use isInGraph first to avoid potential segfault in find()
        if (this->isInGraph(entryInst)) {
            // Node exists, use fetchNode which is safer
            return this->fetchNode(entryInst);
        }
        
        return nullptr;
    };
    
    // Try to get entry node from the given function
    entryNode = getEntryNodeFromFunction(&F);
    if (entryNode != nullptr) {
        return;
    }
    
    // Function F doesn't have a valid entry point - try _RV_main
    Module *M = F.getParent();
    if (M) {
        auto rvMainF = M->getFunction("_RV_main");
        if (rvMainF) {
            entryNode = getEntryNodeFromFunction(rvMainF);
            if (entryNode != nullptr) {
                return;
            }
        }
        
        // Try any function in the module
        for (auto &Func : *M) {
            if (Func.isDeclaration() || Func.empty()) continue;
            entryNode = getEntryNodeFromFunction(&Func);
            if (entryNode != nullptr) {
                return;
            }
        }
    }
    
    // No valid entry point found
    assert(false && "No valid entry point found in any function");
    entryNode = nullptr;
}

DGEdge<Value> * PDG::addEdge(Value * from, Value * to){
    return this->DG<Value>::addEdge(from, to);
}

PDG * PDG::createFunctionSubgraph(Function &F) {
    if (F.empty()) return nullptr;

    auto funcPDG = new PDG(F);
    //recreate all edges connected to internal nodes of function
    copyEdgesInto(funcPDG, true);//linkToExternal = true
    for (auto edge : funcPDG->getEdges()){
        assert(!edge->isLoopCarriedDependence() && "Flag was already set");
    }
    return funcPDG;
}

PDG * PDG::createLoopsSubgraph(Loop * loop) {
    //create a node per instruction within loops of loopinfo only
    auto loopsPDG = new PDG(loop);
    //recreate all edges connected to internal nodes of loop
   copyEdgesInto(loopsPDG, true);//linkToExternal = true
   
   return loopsPDG;
}

PDG * PDG::createSubgraphFromValues(std::vector<Value *> &valueList, bool linkToExternal) {
    return createSubgraphFromValues(valueList, linkToExternal, {});
}

PDG * PDG::createSubgraphFromValues(std::vector<Value *> &valueList, bool linkToExternal, std::unordered_set<DGEdge<Value> *> edgesToIgnore){
    if (valueList.empty()) return nullptr;
    auto newPDG = new PDG(valueList);

    copyEdgesInto(newPDG, linkToExternal, edgesToIgnore);

    return newPDG;
}

void PDG::copyEdgesInto(PDG * pdg, bool linkToExternal) {
    copyEdgesInto(pdg, linkToExternal, {});
}

void PDG::copyEdgesInto(PDG * pdg, bool linkToExternal, std::unordered_set<DGEdge<Value> *> const & edgesToIgnore) {
    for (auto *oldEdge : allEdges) {
        if (edgesToIgnore.find(oldEdge) != edgesToIgnore.end()) continue;

        auto nodePair = oldEdge->getNodePair();
        auto fromT = nodePair.first->getT();
        auto toT = nodePair.second->getT();

        //check whether edge belongs to nodes within function F
        auto fromInclusion = pdg->isInternalNode(fromT);
        auto toInclusion = pdg->isInternalNode(toT);
        if (!fromInclusion && !toInclusion) continue;
        if(!linkToExternal &&(!fromInclusion || !toInclusion)) continue;

        //create appropriate external nodes and associate edge to them
        auto newFromNode = pdg->isInGraph(fromT) ? pdg->fetchNode(fromT) : pdg->addNode(fromT, fromInclusion); 
        auto toFromNode = pdg->isInGraph(toT) ? pdg->fetchNode(toT) : pdg->addNode(toT, toInclusion);

        // copy edge to match properties
        if (oldEdge == nullptr) continue;
        pdg->copyAddEdge(*oldEdge);
    }
}

uint64_t PDG::getNumberOfInstructionsIncluded(void) const {
    return this->numInternalNodes();
}

uint64_t PDG::getNumberOfDependencesBetweenInstructions(void) const {
    return this->numEdges();
}

std::unordered_set<DGEdge<Value> *> PDG::getDependences(Value *from, Value *to) {
    //fetch the nodes
    auto srcNode = this->fetchNode(from);
    auto dstNode = this->fetchNode(to);
    if (!srcNode || !dstNode) {
        return {};
    }

    //fetch the dependences
    auto edgeSet = this->fetchEdges(srcNode, dstNode);

    return edgeSet;
}

PDG::~PDG() {
    for (auto *edge : allEdges) {
        if (edge) delete edge;
    }
    for (auto *node : allNodes) {
        if (node) delete node;
    }
}

bool PDG::iteratorOverDependencesFrom(
    Value *from, bool ctrl, bool mem, bool reg, bool seq, 
    std::function<bool (Value *to, DGEdge<Value> *dependence)> functionToInvokePerDependence
) {
    //fetch the node in the PDG
    auto pdgNode = this->fetchNode(from);
    if (pdgNode == nullptr) return false;

    //iterate over the edges of the node
    for (auto edgeIt = pdgNode->begin_outgoing_edges(); edgeIt != pdgNode->end_outgoing_edges(); edgeIt++){
        auto edge = *edgeIt;
        auto destValue = edge->getIncomingT();
        //check if this is a control dependence
        if (ctrl && edge->isControlDependence()) {
            if(functionToInvokePerDependence(destValue, edge)) {
                return true;
            }
            continue;
        }

        //check if this is a memory dependence
        if (mem && edge->isMemoryDependence()) {
            if (functionToInvokePerDependence(destValue, edge)) {
                 return true;
            }
            continue;
        }       

        //check if this is a sequence dependence
        // if (seq && edge->isSequenceDependence()) {
        //     if (functionToInvokePerDependence(destValue, edge)) {
        //         return true;
        //     }
        //     continue;
        // }
       
        //check if this is a register dependence
        if (reg && !edge->isMemoryDependence() && !edge->isControlDependence()){
            assert(edge->getDataDependenceType() != DG_DATA_NONE);
            if (functionToInvokePerDependence(destValue, edge)) {
                return true;
            }
            continue;     
        }     
    }
    return false;
}

bool PDG::iteratorOverDependencesTo(
    Value *to, bool ctrl, bool mem, bool reg, bool seq, 
    std::function<bool (Value *from, DGEdge<Value> *dependence)> functionToInvokePerDependence
) {
    //fetch the node in the PDG
    auto pdgNode = this->fetchNode(to);
    if (pdgNode == nullptr) return false;

    //iterate over the edges of the node
    for (auto edgeIt = pdgNode->begin_incoming_edges(); edgeIt != pdgNode->end_incoming_edges(); edgeIt++){
        //fetch the destination value
        auto edge = *edgeIt;
        auto srcValue = edge->getOutgoingT();

        //check if this is a contrl dependence
        if (ctrl && edge->isControlDependence()) {
            if (functionToInvokePerDependence(srcValue, edge)) {
                return true;
            }
            continue;
        }

        //check if this is a memory dependence
        if (mem && edge->isMemoryDependence()) {
             if (functionToInvokePerDependence(srcValue, edge)) {
                  return true;
             }
             continue;
        }

        //check if this is a sequence dependence
        // if (seq && edge->isSequenceDependence()) {
        //     if (functionToInvokePerDependence(srcValue, edge)) {
        //         return true;
        //     }
        //     continue;
        // }

        //check if this is a register dependence
        if (reg && !edge->isMemoryDependence() && !edge->isControlDependence()) {
            assert(edge->getDataDependenceType() != DG_DATA_NONE);
            if (functionToInvokePerDependence(srcValue, edge)) {
                return true;
            }
            continue;
        }
    }
    return false;
}

std::vector<Value *> PDG::getSortedValues(void) {
    std::vector<Value *> sortedValues;
    //fetch all nodes
    auto nodes = this->getNodes();
    //create a sorted set of values
    for (auto node : nodes) {
        auto v = node->getT();
        sortedValues.push_back(v);
    }
    std::sort(sortedValues.begin(), sortedValues.end());//--zyy--add
    return sortedValues;
}

std::vector<DGEdge<Value> *> PDG::getSortedDependences(void) {
    std::vector<DGEdge<Value> *> sortedDep;
    //fetech all edges
    auto edges = this->getEdges();
    for (auto edge : edges) {
        assert(edge != nullptr);
        sortedDep.push_back(edge);
    }
    //sort
    auto sortingFunction = [](DGEdge<Value> *d1, DGEdge<Value> *d2) -> bool {
        assert(d1 != nullptr);
        assert(d2 != nullptr);
        
        auto src1 = d1->getOutgoingT();
        auto src2 = d2->getOutgoingT();
        assert(src1 != nullptr);
        assert(src2 != nullptr);
        if (src1 < src2) return true;
        if (src1 > src2) return false;
        assert(src1 == src2);

        auto dst1 = d1->getIncomingT();
        auto dst2 = d2->getIncomingT();
        assert(dst1 != nullptr);
        assert(dst2 != nullptr);
        if (dst1 < dst2) return true;
        if (dst1 > dst2) return false;
        assert(dst1 == dst2);
     
        return false;
    };
    std::sort(sortedDep.begin(), sortedDep.end(), sortingFunction);
    return sortedDep;
}








