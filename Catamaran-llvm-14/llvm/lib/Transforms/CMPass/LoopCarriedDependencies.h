#ifndef LOOPCARRIEDDEPENDENCE_H
#define LOOPCARRIEDDEPENDENCE_H

#include "PDG.h"
#include "DGBase.h"
#include "LoopSummary.h"
#include "LoopStructure.h"
#include "DominatorSummary.h"
#include "SCCDAG.h"

#include <set>


class LoopCarriedDependencies {
public:
    static void setLoopCarriedDependencies (const LoopSummary &LIS, const DominatorSummary &DS, PDG &dgForLoops) ;

    static std::set<DGEdge<Value> *> getLoopCarriedDependenciesForLoop (const LoopStructure &LS, const LoopSummary &LIS, PDG &LoopDG) ;
    static std::set<DGEdge<Value> *> getLoopCarriedDependenciesForLoop (const LoopStructure &LS, const LoopSummary &LIS, SCCDAG &sccdag);

private:
    static LoopStructure * getLoopOfLCD(const LoopSummary &LIS, const DominatorSummary &DS, DGEdge<Value> *edge) ;

    static bool canBasicBlockReachHeaderBeforeOther (const LoopStructure &LS, BasicBlock *I, BasicBlock *J) ;

};
#endif