; Test IR file for LLVM 17 Catamaran pass testing
; Simulates SoftBoundCETS metadata check functions

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Declare SoftBoundCETS metadata check functions (stubs for testing)
declare void @__softboundcets_spatial_load_dereference_check(i8*, i8*, i8*, i64)
declare void @__softboundcets_temporal_load_dereference_check(i8*, i64, i8*, i8*)
declare void @__softboundcets_spatial_store_dereference_check(i8*, i8*, i8*, i64)
declare void @__softboundcets_temporal_store_dereference_check(i8*, i64, i8*, i8*)

define i32 @main(i32 %argc, i8** %argv) {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %ptr1 = alloca i8*, align 8
  %ptr2 = alloca i8*, align 8
  %base1 = alloca i8*, align 8
  %bound1 = alloca i8*, align 8
  %key1 = alloca i64, align 8
  %lock1 = alloca i8*, align 8
  
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  
  ; Simulate some metadata checks that should be parallelized
  %val1 = load i8*, i8** %ptr1, align 8
  %base_val1 = load i8*, i8** %base1, align 8
  %bound_val1 = load i8*, i8** %bound1, align 8
  %key_val1 = load i64, i64* %key1, align 8
  %lock_val1 = load i8*, i8** %lock1, align 8
  
  ; These calls should be identified by LoopFreeTask
  call void @__softboundcets_spatial_load_dereference_check(i8* %base_val1, i8* %bound_val1, i8* %val1, i64 1)
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock_val1, i64 %key_val1, i8* %base_val1, i8* %bound_val1)
  
  %val2 = load i8*, i8** %ptr2, align 8
  %base_val2 = load i8*, i8** %base1, align 8
  %bound_val2 = load i8*, i8** %bound1, align 8
  %key_val2 = load i64, i64* %key1, align 8
  %lock_val2 = load i8*, i8** %lock1, align 8
  
  ; More independent checks that can be parallelized
  call void @__softboundcets_spatial_load_dereference_check(i8* %base_val2, i8* %bound_val2, i8* %val2, i64 1)
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock_val2, i64 %key_val2, i8* %base_val2, i8* %bound_val2)
  
  ; Store check
  call void @__softboundcets_spatial_store_dereference_check(i8* %base_val1, i8* %bound_val1, i8* %val1, i64 1)
  
  ret i32 0
}

