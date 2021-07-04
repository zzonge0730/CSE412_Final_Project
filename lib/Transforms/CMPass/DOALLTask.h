#ifndef DOALLTASK_H
#define DOALLTASK_H


#include "SCCDAGAttrs.h"

class DOALLTask {
public:
    DOALLTask(uint32_t ID, FunctionType * funcType, Module& M);

    uint32_t getID(void) const;



private:
    uint32_t ID;
    Function * F;

};

#endif