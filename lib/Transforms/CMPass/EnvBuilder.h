#ifndef ENVBUILDER_H
#define ENVBUILDER_H

#include "LoopEnvironment.h"
#include "llvm/IR/IRBuilder.h"

class EnvUserBuilder {
public:
EnvUserBuilder ();
~EnvUserBuilder ();

void setEnvArray (Value *envArr) { this->envArray = envArr; }
void createEnvPtr (IRBuilder<> b, int envIndex, Type *type);
void createReducableEnvPtr (
    IRBuilder<> b,
    int envIndex,
    Type *type,
    int reducerCount,
    Value *reducerIndV
);

void addLiveInIndex (int ind) { liveInInds.insert(ind); }
void addLiveOutIndex (int ind) { liveOutInds.insert(ind); }

iterator_range<std::set<int>::iterator> getEnvIndicesOfLiveInVars() { 
    return make_range(liveInInds.begin(), liveInInds.end());
}
iterator_range<std::set<int>::iterator> getEnvIndicesOfLiveOutVars() { 
    return make_range(liveOutInds.begin(), liveOutInds.end());
}

Instruction *getEnvPtr (int ind) { return envIndexToPtr[ind]; }

private:
Value *envArray;

    /*
        * Maps from environment index to load/stores
        */
std::unordered_map<int, Instruction *> envIndexToPtr;
std::set<int> liveInInds;
std::set<int> liveOutInds;
};

class EnvBuilder {
public:
EnvBuilder (llvm::LLVMContext &CXT);
~EnvBuilder ();

/*
    * Create environment users and designate variable types
    */
void createEnvUsers (int numUsers);
void createEnvVariables (
    std::vector<Type *> &varTypes,
    std::set<int> &singleVarIndices,
    std::set<int> &reducableVarIndices,
    int reducerCount
);
void addVariableToEnvironment (uint64_t varIndex, Type *varType);

/*
    * Generate code to create environment array/variable allocations
    */
void generateEnvArray (IRBuilder<> builder);
void generateEnvVariables (IRBuilder<>);

/*
    * Reduce live out variables given binary operators to reduce
    * with and initial values to start at
    */
BasicBlock * reduceLiveOutVariables (
    BasicBlock *bb,
    IRBuilder<>,
    std::unordered_map<int, int> &reducableBinaryOps,
    std::unordered_map<int, Value *> &initialValues,
    Value *numberOfThreadsExecuted
);

/*
    * As all users of the environment konw its structure,
    *  pass around the equivalent of a void pointer
    */
Value *getEnvArrayInt8Ptr () ;
Value *getEnvArray () ;
ArrayType *getEnvArrayTy () { return envArrayType; }

EnvUserBuilder *getUser (int user) { return envUsers[user]; }
int getNumUsers () { return envUsers.size(); }

Value *getEnvVar (int ind) ;
Value *getAccumulatedReducableEnvVar (int ind) ;
Value *getReducableEnvVar (int ind, int reducerInd) ;
bool isReduced (int ind) ;

private:

/*
    * The environment array, owned by this builder
    */
LLVMContext &CXT;
Value *envArray;
Value *envArrayInt8Ptr;

/*
    * The environment variable types and their allocations
    */
int envSize;
ArrayType *envArrayType;
std::vector<Type *> envTypes;
std::unordered_map<int, Value *> envIndexToVar;
std::unordered_map<int, Value *> envIndexToAccumulatedReducableVar;
std::unordered_map<int, std::vector<Value *>> envIndexToReducableVar;
std::unordered_map<int, AllocaInst *> envIndexToVectorOfReducableVar;
int numReducers;

/*
    * Information on a specific user (a function, stage, chunk, etc...)
    */
std::vector<EnvUserBuilder *> envUsers;
};

#endif