#ifndef LOOPITERATIONDOMAINSPACEANALYSIS_H
#define LOOPITERATIONDOMAINSPACEANALYSIS_H

#include "LoopSummary.h"
#include "InductionVariables.h"
#include "ScalarEvolutionDelinearization.h"

#include "llvm/Analysis/ScalarEvolution.h"

class LoopIterationDomainSpaceAnalysis {
    public:
      LoopIterationDomainSpaceAnalysis (
        LoopSummary &loops,
        InductionVariableManager &ivManager,
        ScalarEvolution &SE
      ) ;

      LoopIterationDomainSpaceAnalysis () = delete ;

      ~LoopIterationDomainSpaceAnalysis () ;


      bool areInstructionsAccessingDisjointMemoryLocationsBetweenIterations (
        Instruction *from,
        Instruction *to
      ) const ;

    private:

      /*
       * Long-lived references
       */
      LoopSummary &loops;
      InductionVariableManager &ivManager;

      /*
       * Associate SCEVs with all IV instructions matching that evolution
       */
      std::unordered_map<const SCEV *, std::unordered_set<Instruction *>> ivInstructionsBySCEV;
      std::unordered_map<const SCEV *, std::unordered_set<Instruction *>> derivedInstructionsFromIVsBySCEV;
      std::unordered_map<Instruction *, InductionVariable *> ivsByInstruction;

      void indexIVInstructionSCEVs (ScalarEvolution &SE) ;

      class MemoryAccessSpace {
        public:
        
        MemoryAccessSpace (Instruction *memoryAccessor) ;

        /*
         * Instruction accessing memory, such as IntToPtrInst or GetElementPtrInst
         * NOTE: We look for instructions, as Value alone isn't helpful for domain space analysis
         */
        Instruction *memoryAccessor;
        const SCEV *memoryAccessorSCEV;

        /*
         * For linear spaces, track each dimension's access SCEVs
         */
        SmallVector<const SCEV *, 4> subscripts;
        SmallVector<const SCEV *, 4> sizes;
        const SCEV *elementSize;

        /*
         * Track the instruction and the IV corresponding to each subscript
         * This instruction may either be
         * 1) directly represented by the IV's SCEV: {0,+,1}
         * 2) derived from that IV's SCEV, for example: ({0,+,1} + 3) * 2
         */
        SmallVector<std::pair<Instruction *, InductionVariable *>, 4> subscriptIVs;

      };

      /*
       * For memory accessing instructions with pointer operands that are known linear SCEVs,
       * track the access space for the instruction
       */
      //std::unordered_set<std::unique_ptr<MemoryAccessSpace>> accessSpaces;
      std::unordered_set<MemoryAccessSpace *> accessSpaces;
      std::unordered_map<Instruction *, MemoryAccessSpace *> accessSpaceByInstruction;

      void computeMemoryAccessSpace (ScalarEvolution &SE) ;
      void identifyIVForMemoryAccessSubscripts (ScalarEvolution &SE) ;

      /*
       * Cache memory access spaces with certain properties
       */
      std::unordered_set<MemoryAccessSpace *> nonOverlappingAccessesBetweenIterations;

      void identifyNonOverlappingAccessesBetweenIterationsAcrossOneLoopInvocation (ScalarEvolution &SE) ;

      bool isMemoryAccessSpaceEquivalentForTopLoopIVSubscript (MemoryAccessSpace *space1, MemoryAccessSpace *space2) const ;

      bool isOneToOneFunctionOnIV(LoopStructure *LS, InductionVariable *IV, Instruction *derivedInstruction) ;

      bool isInnerDimensionSubscriptsBounded (ScalarEvolution &SE, MemoryAccessSpace *space) ;


  };

#endif