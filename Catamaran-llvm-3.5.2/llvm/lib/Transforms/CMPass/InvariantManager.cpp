 #include "InvariantManager.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/User.h"

InvariantManager::InvariantManager(LoopStructure * loopS, PDG * loopPDG) : ls{loopS} {
    //check every instruction of the loop
    for (auto inst : loopS->getInstructions()) {
        //check if it is loop invariant according to the loop structure
        if (loopS->isLoopInvariant(inst)) {
            //inst is a loop invariant
            this->invariants.insert(inst);
            continue;
        }
    }

    //traverse the dependence graph to identify loop invariants the loopstructure conservatively
    InvarianceChecker checker{loopS, loopPDG, this->invariants};
    return;
}



bool InvariantManager::isLoopInvariant(Value * value) const {
    //if the value is not an instruction, then it's an invariant
    if (!isa<Instruction>(value)) {
        return true;
    }
    auto inst = cast<Instruction>(value);

    //if the instruction is outside the loop, then it's a loop invariant
    if (!this->ls->isIncluded(inst)) {
        return true;
    }

    if (this->invariants.find(inst) != this->invariants.end()) {
        return true;
    }

    return false;

}

std::unordered_set<Instruction *> InvariantManager::getLoopInstructionThatAreLoopInvariants(void) const {
    return this->invariants;
}

InvariantManager::InvarianceChecker::InvarianceChecker(LoopStructure * loop, PDG * loopPDG, std::unordered_set<Instruction *>& invariants) 
: loop {loop}, loopPDG{loopPDG}, invariants{invariants}{
    //check all instructions
    for (auto inst : loop->getInstructions()) {
        //since we will rely on data dependencies to identify loop invariants
        //we exclude instruction that are involved in control dependencies.
        //This means we will never identify loop invariant branches.
        //this limitation can be avoided by generalizing the next algorithm
        if (inst->isTerminator()) {
            continue;
        }

        // memory allocators and deallocators cannot be invariants
        if (auto callInst = dyn_cast<CallInst>(inst)) {
            if (isAllocator(callInst) ||isDeallocator(callInst)) {
                this->notInvariants.insert(inst);
                continue;
            }
        }

        //since we iterate over data dependencies that are loop values
        //and a PHI may be comprised of constants, 
        //we must explicitly check that all PHI incoming values are equivalent
        auto isPHI = false;
        if (auto phi = dyn_cast<PHINode>(inst)) {
            isPHI = true;
            if (!arePHIIncomingValuesEquivalent(phi)) {
                continue;
            }
        }

        //skip instructions that have already been analyzed and categorized
        if (this->invariants.find(inst) != this->invariants.end()) {
            continue;
        }
        if (this->notInvariants.find(inst) != this->notInvariants.end()) {
            continue;
        }

        this->dependencyValuesBeingChecked.clear();
        this->dependencyValuesBeingChecked.insert(inst);

        if (isPHI) {
            this->invariants.insert(inst);
        }

        auto isEvolving = [this](Value *toValue, DGEdge<Value> *dep) {
            return this->isEvolvingValue(toValue, dep);
        };
        auto canEvolve = loopPDG->iteratorOverDependencesTo(inst, false, true, true, false, isEvolving);

        //check if the instruction is a call to a library function
        if (auto callInst = dyn_cast<CallInst>(inst)) {
            auto callee = callInst->getCalledFunction();
            if (callee != nullptr && callee->empty()) {
                //the instruction is a call to a library function
            
                if (!PDGAnalysis::isTheLibraryFunctionPure(callee)) {
                    canEvolve = true;
                }
            }
        }
        //categorize the instruction
        if (canEvolve) {
            this->invariants.erase(inst);
            this->notInvariants.insert(inst);
        } else {
            this->invariants.insert(inst);
        }
    }


}



bool InvariantManager::InvarianceChecker::isEvolvingValue(Value * toValue, DGEdge<Value> *dep) {
    //check if tovalue is an instruction
    if (!isa<Instruction>(toValue)) {
        return false;
    }

    auto toInst = cast<Instruction>(toValue);

    //if the instuction is not included in the loop
    //then we can skip this dependence
    if (!loop->isIncluded(toInst)) {
        return false;
    }

    //store instructions may produce side effects
    //currently conservative
    if (isa<StoreInst>(toValue)) {
        return true;
    }

    //the instruction is included in the loop

    //memory allocators and deallocators cannot be invariants
    if (auto callInst = dyn_cast<CallInst>(toInst)) {
        if (isAllocator(callInst) || isDeallocator(callInst)) return true;
    }

    //if the instruction is a memory dependence, the value may evolve
    if (dep->isMemoryDependence()) {
        return true;
    }

    //check if the values of PHI are equivalent
    //if they are not, the PHI controls which value to use and
    // is NOT loop invariant
    auto isPHI = false;
    if (auto phi = dyn_cast<PHINode>(toInst)) {
        isPHI = true;
        if (!arePHIIncomingValuesEquivalent(phi)) {
            return true;
        }
    }

    //toInst is part of the loop
    //need to check if toInst is a loop invariant
    if (this->invariants.find(toInst) != this->invariants.end()) {
        return false;
    }
    if (this->notInvariants.find(toInst) != this->notInvariants.end()) {
        return true;
    }

    //if this instruction is a PHI, we claim that it is invariant so should its equivalent
    //values only have a data dependence on it, the correctly claim they are invariant instead
    //of conservatively claiming variance due the cycle
    if (isPHI) {
        invariants.insert(toInst);
    }

    //A cycle has occurred in our dependece graph traversal.
    //the cycle may evolve
    if (this->dependencyValuesBeingChecked.find(toInst) != this->dependencyValuesBeingChecked.end()) {
        return true;
    }

    this->dependencyValuesBeingChecked.insert(toInst);

    auto isEvolving = [this](Value * toValue, DGEdge<Value> *dep) {
        return this->isEvolvingValue(toValue, dep);
    };

    auto canEvolve = loopPDG->iteratorOverDependencesTo(toInst, false, true, true, false, isEvolving);
    if (canEvolve) {
        this->invariants.erase(toInst);
        this->notInvariants.insert(toInst);
    } else {
        this->invariants.insert(toInst);
    }

    return canEvolve;
}


bool InvariantManager::InvarianceChecker::arePHIIncomingValuesEquivalent(PHINode* phi) {
    std::unordered_set<Value *> incomingValues{};
    //for (auto& incomingUse : phi->incoming_values()) {
    for (User::op_iterator OpIt = phi->op_begin(); OpIt != phi->op_end(); ++OpIt ) {
        auto incomingValue = (*OpIt).get();
        incomingValues.insert(incomingValue); 
    }

    if (incomingValues.size() == 0) return false;

    //if all incoming value are strictly the same value, this set will be one element
    if (incomingValues.size() == 1) return true;

    //check if all incoming values are strictly equivalent
    Value * singleUniqueValue = *incomingValues.begin();
    for (auto incomingValue : incomingValues) {
        if (incomingValue == singleUniqueValue) continue;
        singleUniqueValue = nullptr;
        break;
    }
    if (singleUniqueValue) return true;

    // if all incoming values are loads of the same global,
    // we consider this equivalent
    //Whether these loads are loop invariant is up to checks on the dependence graph
    GlobalValue *singleGlobalLoaded = nullptr;
    for (auto incomingValue : incomingValues) {
        if (auto load = dyn_cast<LoadInst>(incomingValue)) {
            auto loadedValue = load->getPointerOperand();
            if (auto global = dyn_cast<GlobalValue>(loadedValue)) {
                if (singleGlobalLoaded == nullptr || singleGlobalLoaded == global) {
                    singleGlobalLoaded = global;
                    continue;
                }
            }
        }

        singleGlobalLoaded = nullptr;
        break;
    }

    if (singleGlobalLoaded != nullptr) return true;

    return false;
}