#include "LoopFreeTask.h"

LoopFreeTask::LoopFreeTask(uint32_t id, Module * m) : loopFreeSeed{std::random_device{}()} {
    this->ID = id;
    this->M = m;
    this->subID = 0;
}

void LoopFreeTask::setSafeCheckCodesForOneTask(std::unordered_set<Instruction *> insts) {
    this->safeCheckCodeForOneTask = insts;
}

void LoopFreeTask::setInfo(std::unordered_map<Instruction *, std::set<Instruction *>> safeCheckBody, std::unordered_map<Instruction *, std::set<Instruction *>> joinPoints,
std::unordered_map<Instruction *, std::set<Instruction *>> range) {
    this->safeCheckInstsInNonLoopBody = safeCheckBody;
    this->safeCheckCallInstJoinPoints = joinPoints;
    this->safeCheckInstsMoveRange = range;
}

void LoopFreeTask::setJoinPoint(Instruction * taskJP) {
    this->taskJoinPoint = taskJP;
}

void LoopFreeTask::setTargetBB(BasicBlock * BB) {
    this->targetBB = BB;
}

std::vector<Instruction *> LoopFreeTask::enumerateAndChooseMax() {
    //enumerate all combination
    std::vector<std::vector<Instruction *>> lastRes;

    std::vector<std::vector<Instruction *>> input;

    std::vector<Instruction *> res;
    if (this->safeCheckCodeForOneTask.size() == 0) return res;

    

    //construct input 
    std::vector<Instruction *> safeCheckVec;
    for (auto call : this->safeCheckCodeForOneTask) {
        std::vector<Instruction *> locs;
        std::set<Instruction *> range = this->safeCheckInstsMoveRange.at(call);
        for (auto loc : range) {
            locs.push_back(loc);
        }

        input.push_back(locs);
        safeCheckVec.push_back(call);
    }
    this->safeCheckVector = safeCheckVec;
    if (this->safeCheckCodeForOneTask.size() == 1) {
        for (auto item : input[0]) {
            std::vector<Instruction *> tmp;
            tmp.push_back(item);
            lastRes.push_back(tmp);
        }
        // for (auto loc : range) {
        //     uint32_t scCost = getSafeCheckCost(inst);
        //     uint32_t oCost = getOriginalCost(loc, this->taskJoinPoint);
        //     uint32_t profit = scCost > oCost? oCost - getSpawnableCost() : scCost - getSpawnableCost();
        //     if (profit > maxprofit) {
        //         maxprofit = profit;
        //         res[0] = loc;
        //     }
        // }
        // return res;
    } else {
        for (auto item : input[0]) {
            std::vector<Instruction *> tmp;
            tmp.push_back(item);
            lastRes.push_back(tmp);
        }

        for (int i = 1; i < input.size(); i++) {
            std::vector<Instruction *> right = input[i];

            //join lastRes with right
            std::vector<std::vector<Instruction *>> tmpLastRes;
            for (auto vec : lastRes) {
                for (auto item : right) {
                    std::vector<Instruction *> tmpVec(vec);
                    tmpVec.push_back(item);
                    tmpLastRes.push_back(tmpVec);
                }
            }

            lastRes = tmpLastRes;
        }
    }

    //choose the max profit
    uint32_t maxprofit = 0;
    for (int i = 0 ; i < lastRes.size(); i++) { // [loc1, loc2, ]
        std::vector<Instruction *> vec = lastRes[i];
        uint32_t profit = 0;
        Instruction * lastLoc = nullptr;
        for (int j = 0; j < vec.size(); j++) { // loc
            Instruction * loc = vec[j];
            uint32_t scCost = getSafeCheckCost(safeCheckVec[j]);
            uint32_t oCost = getOriginalCost(loc, this->taskJoinPoint);
            
            profit += scCost > oCost? oCost - getSpawnableCost() : scCost - getSpawnableCost();
            if (lastLoc == loc) {
                profit += getSpawnableCost();
            } else {
                lastLoc = loc;
            }
        }

        if (profit > maxprofit) {
            maxprofit = profit;
            res = vec;
        }
    }

    return res;

}

void LoopFreeTask::transform() {
    std::vector<Instruction *> maxProfitRes = this->enumerateAndChooseMax();
    if (maxProfitRes.size() == 0) return;

    Instruction * lastLoc = nullptr;
    std::vector<Instruction *> groupedSafeChecks;
    for (int i = 0; i < maxProfitRes.size(); i++) {
        Instruction * loc = maxProfitRes[i];
        if (lastLoc == nullptr) {
            lastLoc = loc;
            groupedSafeChecks.push_back(this->safeCheckVector[i]);
        } else {
            if (lastLoc == loc) { // can be merged
                //
                groupedSafeChecks.push_back(this->safeCheckVector[i]);
            } else {
                SafeCheckTobeMerged(std::make_pair(groupedSafeChecks, loc));
                groupedSafeChecks.clear();
                lastLoc = loc;
                groupedSafeChecks.push_back(this->safeCheckVector[i]);
            }
        }
    }
    if (groupedSafeChecks.size() != 0) {
        SafeCheckTobeMerged(std::make_pair(groupedSafeChecks, this->safeCheckVector.back()));
    }

    
}

void LoopFreeTask::eraseSafeCheckCodes() {
    if (this->safeCheckCodeForOneTask.size() == 0) return;

    //erase safeCheckCodeForOneTask
    for (auto inst : this->safeCheckCodeForOneTask) {
        inst->eraseFromParent();
    }

}

void SafeCheckTobeMerged(std::pair<std::vector<Instruction *>, Instruction *> groupedSafeCheckAndLocToInsert) {
    LLVMContext& ctx = this->M->getContext();
    std::vector<Instruction *> checksGroup = groupedSafeCheckAndLocToInsert.first;
    Instruction * locToInsertBefore = groupedSafeCheckAndLocToInsert.second;

    std::vector<Type *> wrapperFuncArgs;
    std::vector<Function *> checkFuncVec;

    std::string wrapperFuncName = "_spawn_loop_free_func_" + std::to_string(this->ID) + "_" + std::to_string(this->subID++);

    uint32_t totalNumArgs = 0;
    for (auto check : checksGroup) {
        CallInst * call = cast<CallInst>(check);
        Function * fun = call->getCalledFunction();

        auto& funcArgListTmp = fun->getArgumentList();
        totalNumArgs += funcArgListTmp.size();

        checkFuncVec.push_back(fun);
    }

    wrapperFuncArgs.reserve(totalNumArgs);
    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(ctx));
    for (int i = 0; i < totalNumArgs; i++) {
        wrapperFuncArgs.push_back(voidStarTy);
    }

    FunctionType * wrapperFuncType = FunctionType::get(Type::getVoidTy(ctx), wrapperFuncArgs, false);

    Function * wrapperFunc = cast<Function>(Function::Create(wrapperFuncType, Function::InternalLinkage, wrapperFuncName, this->M));
    BasicBlock * entryBB = BasicBlock::Create(ctx, "entry", wrapperFunc);

    auto& wrapperFuncArgList = wrapperFunc->getArgumentList();
    auto wrapperFuncArgListIt = wrapperFuncArgList.begin();

    for (int idx = 0; idx < checkFuncVec.size(); idx++) {
        auto& funcArgList = checkFuncVec[idx]->getArgumentList();
        std::vector<Value *> groupedCastArgs;
        for (auto argListIt = funcArgList.begin(); argListIt != funcArgList.end(); ++argListIt, ++wrapperFuncArgListIt) {
            Type * tmpType = argListIt->getType();

            if (tmpType->isPointerTy()) {
                BitCastInst * bitcast = new BitCastInst(&*wrapperFuncArgListIt, tmpType, "", entryBB);
                groupedCastArgs.push_back(bitcast);     
            } else {
                BitCastInst * bitcast = new BitCastInst(&*wrapperFuncArgListIt, PointerType::getUnqual(tmpType), "", entryBB);
                LoadInst * load = new LoadInst(bitcast, "", entryBB);
                groupedCastArgs.push_back(load);     
            }
        }

        CallInst * callInst = CallInst::Create(checkFuncVec[idx], groupedCastArgs, "", entryBB);

    }

    ReturnInst::Create(ctx, nullptr, entryBB);
    genCtorForSpawn(wrapperFunc);

    errs() << "loop-free wrapperFunc: " << *wrapperFunc << "\n";

    //create thread

    std::vector<Value *> needArgs = genSpawnArgs(checksGroup, wrapperFunc);
    errs() << "needArgSize: " << needArgs.size() << "\n";
    if (needArgs.size() != totalNumArgs + 2) {
        errs() << ">>>Num of NeedArgs is wrong...\n";
    }

    auto ctorIt = this->ctors.find(totalNumArgs);
    if (ctorIt == this->ctors.end()) {
        errs() << ">>> No Spawnable ctor in ctors...\n";
    }
    if (cast<Function>(ctorIt->second)->getArgumentList().size() != needArgs.size()) {
        errs() << ">>>wrong ctor in ctors..., wrong args size...\n";
    }

    CallInst::Create(ctorIt->second, needArgs, "", locToInsertBefore);
    
    //put join points
    Value * id = needArgs[0]; 
    CallInst::Create(this->joinFunc, id, "", this->taskJoinPoint);



}

void LoopFreeTask::genCtorForSpawn(Function * wrapperFunc) {
    LLVMContext& ctx = this->M->getContext();
    uint32_t baseArgsForCtorSpawn = 2;
    std::vector<Type *> ctorSig(baseArgsForCtorSpawn);
    ctorSig[0] = Type::getInt32Ty(ctx);

    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(ctx));

    std::string s0 = "_Z5spawnjPFv";
    std::string s1 = "P";
    std::string s2 = "v";
    std::string s3 = "E";
    std::string s4 = "S_";
    std::string s5 = "";
    std::string deltaS2 = "S_";
    std::string deltaS4 = "S_";

    std::vector<Type *> ctorArgs;
    std::string ctorName = s0 + s2 + s3 + s5;

    
    for (int t = 0; t <= wrapperFunc->getArgumentList().size(); ++t) {
        if (t == wrapperFunc->getArgumentList().size()) {
            ctorSig[1] = PointerType::getUnqual(FunctionType::get(Type::getVoidTy(ctx), ctorArgs, false));
            FunctionType * ctorTy = FunctionType::get(Type::getVoidTy(ctx), ctorSig, false);
            this->ctors[t] = this->M->getOrInsertFunction(ctorName, ctorTy);
        }

        ctorSig.push_back(voidStarTy);
        //extend the name
        s2 += ( t == 0 ? "" : deltaS2);
        s4 += ( t == 0 ? "" : deltaS4);

        ctorName = s0 + s1 + s2 + s3 + s4 + s5;
        ctorArgs.push_back(voidStarTy);
    }
}
std::vector<Value *> LoopFreeTask::genSpawnArgs(std::vector<Instruction *> checksGroup, Function * wrapperFunc) {
    LLVMContext& ctx = this->M->getContext();
    Type * voidStarTy = PointerType::getUnqual(Type::getInt8Ty(ctx));

    std::vector<Value *> args{ConstantInt::get(Type::getInt32Ty(ctx), std::uniform_int_distribution<uint32_t>{}(this->loopSeed)), wrapperFunc};

    for (int ind = 0; ind < checksGroup.size(); ind++) {
        CallInst * curCI = cast<CallInst>(checksGroup[ind]);
        for (int j = 0; j < curCI->getNumArgOperands(); j++) {
            Value * arg = curCI->getArgOperand(j);
            Type * argTy = arg->getType();
            Value * castArg;
            if (argTy->isPointerTy()) {
                castArg = arg;
            } else {
                castArg = new AllocaInst(argTy, "zyarg_", curCI);
                new StoreInst(arg, castArg, curCI);
            }
            BitCastInst * bcInst = new BitCastInst(castArg, voidStarTy, "zybc_", curCI);

            args.push_back(bcInst);
        }
    }
    return args;
}

