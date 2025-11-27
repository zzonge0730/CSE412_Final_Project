        // Pack metadata structs with deep copy
        for (auto &pair : metadataLiveIns) {
            Value *liveIn = pair.first;
            Type *structType = pair.second;
            
            // Calculate slot pointer with byte offset
            Value *offsetVal = ConstantInt::get(Type::getInt64Ty(ctx), currentOffset);
            Value *slotPtr = GetElementPtrInst::Create(Type::getInt8Ty(ctx), envMalloc, 
                {offsetVal}, "cm_spawn_slot_meta_ptr", this->whereToInsertFunc);
            
            // Cast to struct pointer type for store
            BitCastInst *slotPtrCast = new BitCastInst(slotPtr, 
                PointerType::get(structType, 0), "cm_spawn_slot_meta", this->whereToInsertFunc);

            // Handle NULL metadata pointer:
            // If liveIn (metadata pointer) is NULL, store a dummy (zeroed) struct.
            // Otherwise, load from the pointer and store (deep copy).
            
            // 1. Split the basic block to insert control flow
            BasicBlock *HeadBB = this->whereToInsertFunc->getParent();
            Function *ParentFunc = HeadBB->getParent();
            BasicBlock *RestBB = HeadBB->splitBasicBlock(this->whereToInsertFunc, "spawn_args_cont");
            
            // 2. Create Copy and Dummy blocks
            BasicBlock *CopyBB = BasicBlock::Create(ctx, "meta.copy", ParentFunc, RestBB);
            BasicBlock *DummyBB = BasicBlock::Create(ctx, "meta.dummy", ParentFunc, RestBB);
            
            // 3. Setup NULL check branching in HeadBB
            // Remove the unconditional branch created by splitBasicBlock
            HeadBB->getTerminator()->eraseFromParent();
            
            Value *isNull = new ICmpInst(*HeadBB, CmpInst::ICMP_EQ, liveIn, 
                                         Constant::getNullValue(liveIn->getType()), "is_meta_null");
            BranchInst::Create(DummyBB, CopyBB, isNull, HeadBB);
            
            // 4. Populate DummyBB: Store zeroed struct
            Constant *NullStruct = ConstantAggregateZero::get(structType);
            new StoreInst(NullStruct, slotPtrCast, DummyBB);
            BranchInst::Create(RestBB, DummyBB);
            
            // 5. Populate CopyBB: Load and Store (Deep Copy)
            LoadInst *structVal = new LoadInst(structType, liveIn, "meta.load", CopyBB);
            new StoreInst(structVal, slotPtrCast, CopyBB);
            BranchInst::Create(RestBB, CopyBB);
            
            currentOffset += DL.getTypeAllocSize(structType);
        }

