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

            // Create BasicBlocks for NULL check
            Function *ParentFunc = this->whereToInsertFunc->getParent()->getParent();
            BasicBlock *HeadBB = this->whereToInsertFunc->getParent();
            BasicBlock *CopyBB = BasicBlock::Create(ctx, "meta.copy", ParentFunc);
            BasicBlock *DummyBB = BasicBlock::Create(ctx, "meta.dummy", ParentFunc);
            BasicBlock *MergeBB = BasicBlock::Create(ctx, "meta.merge", ParentFunc);

            // Move all instructions after whereToInsertFunc to MergeBB
            // This is tricky because we are inserting in the middle.
            // Instead, simpler approach: Split the current block
            BasicBlock *RestBB = HeadBB->splitBasicBlock(this->whereToInsertFunc, "spawn_args_cont");
            
            // Now HeadBB ends with a branch to RestBB. We need to replace it.
            HeadBB->getTerminator()->eraseFromParent();
            MergeBB->getTerminator()->eraseFromParent(); // Remove default return if any (not needed as we link blocks)
            // Actually splitBasicBlock adds an unconditional branch. 
            // But MergeBB is new. 
            // Let's refine: 
            // 1. Split block at insertion point. Old block is HeadBB, new is RestBB.
            // 2. HeadBB will contain the NULL check branching to CopyBB or DummyBB.
            // 3. CopyBB and DummyBB will branch to RestBB (MergeBB is effectively RestBB).
            
            // Re-plan:
            // HeadBB (ends with NULL check) -> CopyBB / DummyBB
            // CopyBB -> RestBB
            // DummyBB -> RestBB
            
            // 1. NULL Check in HeadBB
            Value *isNull = new ICmpInst(HeadBB, CmpInst::ICMP_EQ, liveIn, 
                                         Constant::getNullValue(liveIn->getType()), "is_meta_null");
            
            BranchInst::Create(DummyBB, CopyBB, isNull, HeadBB);
            
            // 2. DummyBB: Store Zero
            Constant *NullStruct = ConstantAggregateZero::get(structType);
            new StoreInst(NullStruct, slotPtrCast, DummyBB);
            BranchInst::Create(RestBB, DummyBB);
            
            // 3. CopyBB: Load and Store
            LoadInst *structVal = new LoadInst(structType, liveIn, "meta.load", CopyBB);
            new StoreInst(structVal, slotPtrCast, CopyBB);
            BranchInst::Create(RestBB, CopyBB);
            
            // Update insertion point for next iteration
            // The split moved whereToInsertFunc to the start of RestBB.
            // So we continue inserting before it in RestBB.
            // But wait, 'slotPtrCast' was defined in HeadBB (before split) or we need to be careful.
            // slotPtrCast is used in DummyBB and CopyBB. It must dominate them.
            // Since we defined it before splitting, it is in HeadBB, so it dominates. Correct.
            
            // However, splitBasicBlock moves everything AFTER the split point to new block.
            // We need slotPtrCast to be BEFORE the split.
            // current code:
            //   Create envMalloc (in HeadBB)
            //   Loop...
            //     Create slotPtrCast (we are here) -> This instruction is currently inserted at 'whereToInsertFunc'
            //     Split block AT 'whereToInsertFunc'
            //     -> slotPtrCast will be in RestBB? No, split happens at iterator.
            
            // To be safe, we should explicitly ensure slotPtrCast is in HeadBB.
            // 'this->whereToInsertFunc' is our cursor. 
            // Instructions created with it as insertBefore are placed *before* it.
            // So if we split *at* whereToInsertFunc, the new instructions stay in HeadBB.
            // The 'whereToInsertFunc' itself moves to RestBB.
            
            // So flow is:
            // 1. Create instructions up to NULL check. They are in HeadBB.
            // 2. Split block at whereToInsertFunc. 
            //    HeadBB now contains everything up to just before whereToInsertFunc.
            //    RestBB starts with whereToInsertFunc.
            // 3. Remove the unconditional branch at end of HeadBB (added by split).
            // 4. Insert conditional branch in HeadBB.
            // 5. Populate CopyBB and DummyBB.
            // 6. Link them to RestBB.
            
            // Correct.
            
            currentOffset += DL.getTypeAllocSize(structType);
        }

