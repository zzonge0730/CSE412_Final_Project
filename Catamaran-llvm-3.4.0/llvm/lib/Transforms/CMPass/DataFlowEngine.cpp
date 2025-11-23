#include "DataFlowEngine.h"

#include "llvm/Support/CFG.h"

#include <unordered_set>
#include <unordered_map>
#include <list>

DataFlowEngine::DataFlowEngine() {}

DataFlowResult * DataFlowEngine::applyForward(
    Function * f, 
    std::function<void (Instruction *, DataFlowResult *)> computeGEN,
    std::function<void (Instruction *, DataFlowResult *)> computeKILL,
    std::function<void (Instruction *inst, std::set<Value *>& IN)> initializeIN,
    std::function<void (Instruction *inst, std::set<Value *>& OUT)> initializeOUT,
    std::function<void (Instruction *inst, std::set<Value *>& IN, Instruction *predecessor, DataFlowResult * df)> computeIN,
    std::function<void (Instruction *inst, std::set<Value *>& OUT, DataFlowResult *df)> computeOUT) {
        //define the customization
        auto appendBB = [](std::list<BasicBlock *> &worklist, BasicBlock *bb) {
            worklist.push_back(bb);
        };

        auto getFirstInst = [](BasicBlock *bb) -> Instruction * {
            return &*bb->begin();
        };

        auto getLastInst = [](BasicBlock *bb) -> Instruction * {
            return &*bb->end();
        };

        //run the pass
        auto dfRes = this->applyCustomizableForwardAnalysis(
            f, computeGEN, computeKILL, initializeIN, initializeOUT,
            computeIN, computeOUT, appendBB, getFirstInst, getLastInst);

        return dfRes;
}

DataFlowResult * DataFlowEngine::applyForward(
    Function * f,
    std::function<void (Instruction *, DataFlowResult *)> computeGEN,
    std::function<void (Instruction *inst, std::set<Value *>& IN)> initializeIN,
    std::function<void (Instruction *inst, std::set<Value *>& OUT)> initializeOUT,
    std::function<void (Instruction *inst, std::set<Value *>& IN, Instruction *predecessor, DataFlowResult * df)> computeIN,
    std::function<void (Instruction *inst, std::set<Value *>& OUT, DataFlowResult *df)> computeOUT) {
        //define an empty kill set
        auto computeKILL = [](Instruction *, DataFlowResult *) {
            return;
        };

        //run data-flow analysis 
        auto dfRes = this->applyForward(f, computeGEN, computeKILL, initializeIN, initializeOUT, computeIN, computeOUT);
        return dfRes;
}

DataFlowResult * DataFlowEngine::applyBackward(
    Function *f,
    std::function<void (Instruction *, DataFlowResult *)> computeGEN,
    std::function<void (Instruction *, DataFlowResult *)> computeKILL,
    std::function<void (std::set<Value *>& IN, Instruction *inst, DataFlowResult *df)> computeIN,
    std::function<void (std::set<Value *> & OUT, Instruction *successor, DataFlowResult *df)> computeOUT) {
        //compute GENs and KILLs
        auto dfRes = new DataFlowResult{};
        computeGENAndKILL(f, computeGEN, computeKILL, dfRes);

        //compute IN and OUT
        //create the working list by adding all basic blocks to it
        std::unordered_set<BasicBlock *> computedOnceBB;
        std::list<BasicBlock *> workList;
        for (BasicBlock &BB : *f) {
            workList.push_front(&BB);// ~~backward~~so use push_front
        }
        // errs() << "DF--74\n";
        //compute INs and OUTs iteratively until the working list is empty.
        while(!workList.empty()) {
            //fetch a basic block that needs to be processed
            auto bb = workList.front();
            workList.pop_front();

            //fetch the last instruction of the current basic block
            auto inst = bb->getTerminator();

            //fetch IN, OUT, GEN, KILL
            auto &inSetOfInst = dfRes->IN(inst);
            auto &outSetOfInst = dfRes->OUT(inst);
            auto &genSetOfInst = dfRes->GEN(inst);
            auto &killSetOfInst = dfRes->KILL(inst);
            // errs() << "DF--89\n";
            //compute OUT
            for (succ_iterator I = succ_begin(bb); I != succ_end(bb); I++) {
                BasicBlock * BB = *I;
                //fetch the current successor of "inst"
                auto successorInst = &*BB->begin();

                //compute OUT[inst]
                computeOUT(outSetOfInst, successorInst, dfRes);
            }

            //compute IN
            int oldSize = inSetOfInst.size();
            computeIN(inSetOfInst, inst, dfRes);
            // errs() << "DF--103\n";
            //check if IN[Inst] changed
            int newSize = inSetOfInst.size();
            if (newSize > oldSize || computedOnceBB.find(bb) == computedOnceBB.end()) {
                //record that we have now computed this basic block
                computedOnceBB.insert(bb);
                // errs() << "DF--109\n";
                //propagate the new IN[inst] to the rest of the instructions of the current basic block
                BasicBlock::iterator iter(inst);
                // errs() << "DF--112\n";
                auto succI = cast<Instruction>(inst);
                // errs() << "DF--114\n";
                // if (bb == nullptr) errs() << "DF--115\n";
                // if (iter != bb->begin()) errs() << "DF--116\n";
                while (iter != bb->begin()) {
                    //move the iterator
                    // errs() << "DF--117\n";
                    iter--;
                    // errs() << "DF--118\n";
                    //fetch the current instruction
                    auto curInst = &*iter;
                    // errs() << "DF--119\n";
                    //compute OUT[curInst]
                    auto &outSetOfCurInst = dfRes->OUT(curInst);
                    computeOUT(outSetOfCurInst, succI, dfRes);

                    //compute IN[curInst]
                    auto &inSetOfCurInst = dfRes->IN(curInst);
                    computeIN(inSetOfCurInst, curInst, dfRes);
                    // errs() << "DF--127\n";
                    //update the successor
                    succI = curInst;
                }
                // errs() << "DF--131\n";
                //add predecessors of the current basic block to the working list
                for (pred_iterator predI = pred_begin(bb); predI != pred_end(bb); predI++) {
                    workList.push_back(*predI);
                }
            }
        }
        // errs() << "DF--138\n";

        return dfRes;
}


DataFlowResult * DataFlowEngine::applyBackward(
    Function *f,
    std::function<void (Instruction *, DataFlowResult *)> computeGEN,
    std::function<void (std::set<Value *>& IN, Instruction *inst, DataFlowResult *df)> computeIN,
    std::function<void (std::set<Value *> & OUT, Instruction *successor, DataFlowResult *df)> computeOUT) {
        //define an empty kill set
        auto computeKILL = [](Instruction *, DataFlowResult *) {
            return;
        };

        //run data-flow analysis
        auto dfRes = this->applyBackward(f, computeGEN, computeKILL, computeIN, computeOUT);
        return dfRes;
}

void DataFlowEngine::computeGENAndKILL(
    Function *f,
    std::function<void (Instruction *, DataFlowResult *)> computeGEN,
    std::function<void (Instruction *, DataFlowResult *)> computeKILL,
    DataFlowResult *df) {
        //compute GENs and KILLs
        for (BasicBlock &BB : *f) {
            for (Instruction &I : BB) {
                computeGEN(&I, df);
                computeKILL(&I, df);
            }
        }

}

DataFlowResult * DataFlowEngine::applyCustomizableForwardAnalysis(
    Function *f,
    std::function<void (Instruction *, DataFlowResult *)> computeGEN,
    std::function<void (Instruction *, DataFlowResult *)> computeKILL,
    std::function<void (Instruction *inst, std::set<Value *>& IN)> initializeIN,
    std::function<void (Instruction *inst, std::set<Value *>& OUT)> initializeOUT,
    std::function<void (Instruction *inst, std::set<Value *>& IN, Instruction *predecessor, DataFlowResult *df)> computeIN,
    std::function<void (Instruction *inst, std::set<Value *>& OUT, DataFlowResult *df)> computeOUT,
    std::function<void (std::list<BasicBlock *> &worklist, BasicBlock *bb)> appendBB,
    std::function<Instruction * (BasicBlock *bb)> getFirstInstruction,
    std::function<Instruction * (BasicBlock *bb)> getLastInstruction) {
        //init INs and OUTs
        auto dfRes = new DataFlowResult{};
        for (BasicBlock &BB : *f) {
            for (Instruction &I : BB) {
                auto& INset = dfRes->IN(&I);
                auto& OUTset = dfRes->OUT(&I);
                initializeIN(&I, INset);
                initializeOUT(&I, OUTset);
            }
        }
        
        //compute GENs and KILLs
        computeGENAndKILL(f, computeGEN, computeKILL, dfRes);

        //compute IN and OUT
        //create the worklist by adding all basic blocks to it
        std::list<BasicBlock *> workList;
        std::unordered_map<BasicBlock *, bool> workListContent;
        for (BasicBlock &BB : *f) {
            appendBB(workList, &BB);
            workListContent[&BB] = true;
        }

        //compute the INs and OUTs iteratively until the work list is empty
        std::unordered_map<Instruction *, bool> alreadyVisited;
        while (!workList.empty()) {
            //fetch a basic block that needs to be precessed
            auto bb = workList.front();
            assert(workListContent[bb] == true);

            //remove the basic block from the workList
            workList.pop_front();
            workListContent[bb] = false;

            //fetch the first instruction of the basic block
            auto inst = getFirstInstruction(bb);

            //fetch IN[inst], OUT[inst], GEN[inst], KILL[inst]
            auto &inSetOfInst = dfRes->IN(inst);
            auto &outSetOfInst = dfRes->OUT(inst);
            auto &genSetOfInst = dfRes->GEN(inst);
            auto &killSetOfInst = dfRes->KILL(inst);

            //compute the IN of the first instruction of the current basic block
            for (pred_iterator predI = pred_begin(bb); predI != pred_end(bb); predI++) {
                //workList.push_back(*predI);
                //fetch the current predecessor of "inst"
                auto predecessorInst = getLastInstruction(*predI);
                //compute IN[inst];
                computeIN(inst, inSetOfInst, predecessorInst, dfRes);
            }

            //compute OUT[inst]
            int oldSize = outSetOfInst.size();
            computeOUT(inst, outSetOfInst, dfRes);

            //check if the OUT of the first instruction of the current basic block changed
            if (!alreadyVisited[inst] || outSetOfInst.size() != oldSize) {
                alreadyVisited[inst] = true;

                //propagate the new OUT[inst] to the rest of the instructions of the current basic block
                BasicBlock::iterator iter(inst);
                auto predI = inst;
                iter++;
                while (iter != bb->end()) {
                    //fetch the current instruction
                    auto I = &*iter;
                    //compute IN[i]
                    auto &inSetOfI = dfRes->IN(I);
                    computeIN(I, inSetOfI, predI, dfRes);
                    //compute OUT[i]
                    auto &outSetOfI = dfRes->OUT(I);
                    computeOUT(I, outSetOfI, dfRes);
                    //update the predecessor
                    predI = I;
                    //move the iterator
                    iter++;
                }

                //add successors of the current basic block the work list
                for (succ_iterator succI = succ_begin(bb); succI != succ_end(bb); succI++) {
                    BasicBlock * succBB = *succI;
                    if (workListContent[succBB] == true) continue;
                    workList.push_back(succBB);
                    workListContent[succBB] = true;
                }
            }
        }

        return dfRes;
}






