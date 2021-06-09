// This files used to generate custom program dependency graph
#ifndef PDG_H
#define PDG_H

#include "DGBase.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/Module.h"

#include <vector>
#include <unordered_set>
#include <functional>

using namespace llvm;
class PDG : public DG<Value>{
public:
    PDG();

    PDG(Module &M);

    PDG(Function &F);

    //add all instructions included in the loop only
    PDG(Loop *loop);

    //add only the instructions given as parameter
    PDG(std::vector<Value *> &values);

    //return the number of instructions included in the PDG
    uint64_t getNumberOfInstructionsIncluded(void) const;

    //return the number of dependences of the PDG including dependences that connect instructions outside the PDG
    uint64_t getNumberOfDependencesBetweenInstructions(void) const;

    //get the dependences between two values/instructions
    std::unordered_set<DGEdge<Value> *> getDependences(Value * v1, Value *v2);

    //Iterator: iterate over the instructions that depend on fromValue until funcToInvokePerDep returns true or
    // there is no other dependence to iterate.
    // This means there is an edge from fromValue to toValue of the type specified by the other parameters
    // For each of this edge , the function funcToInvokePerDep is invoked
    // This function returns true if the iterator ends earlier
    // It returns false otherwise.
    bool iteratorOverDependencesFrom(Value *from, bool ctrlDep, bool memDep, bool regDep, bool seqDep,
    std::function<bool (Value *to, DGEdge<Value> *dependence)> funcToInvokePerDep);

    bool iteratorOverDependencesTo(Value *to, bool ctrlDep, bool memDep, bool regDep, bool seqDep,
    std::function<bool (Value *from, DGEdge<Value> *dependence)> funcToInvokePerDep);

    //add the edge from "from" to "to" to the PDG
    DGEdge<Value> * addEdge (Value * from, Value * to);    

    // create program dependence subgraphs
    PDG * createFunctionSubgraph(Function &f);

    PDG * createLoopsSubgraph(Loop * l);

    PDG * createSubgraphFromValues(std::vector<Value *> &valueList, bool linkToExternal);

    PDG * createSubgraphFromValues(std::vector<Value *> &valueList, bool linkToExternal,
    std::unordered_set<DGEdge<Value> *> edgesToIgnore);

    std::vector<Value *> getSortedValues(void);

    std::vector<DGEdge<Value> *> getSortedDependences(void);

    ~PDG();

protected:
    void addNodesOf(Function &F);

    void setEntryPointAt(Function &F);

    void copyEdgesInto(PDG *newPDG, bool linkToExternal);

    void copyEdgesInto(PDG *newPDG, bool linkToExternal, std::unordered_set<DGEdge<Value> *> const & edgesToIgnore);


};

#endif