; ModuleID = '2mm-safec.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__softboundcets_trie_entry_t = type { i8*, i8*, i64, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@__softboundcets_shadow_stack_ptr = external global i64*
@.str = private unnamed_addr constant [12 x i8] c"arg_no >= 0\00", align 1
@.str1 = private unnamed_addr constant [18 x i8] c"./softboundcets.h\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_load_base_shadow_stack = private unnamed_addr constant [50 x i8] c"void *__softboundcets_load_base_shadow_stack(int)\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_load_bound_shadow_stack = private unnamed_addr constant [51 x i8] c"void *__softboundcets_load_bound_shadow_stack(int)\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_load_key_shadow_stack = private unnamed_addr constant [50 x i8] c"size_t __softboundcets_load_key_shadow_stack(int)\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_load_lock_shadow_stack = private unnamed_addr constant [50 x i8] c"void *__softboundcets_load_lock_shadow_stack(int)\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_store_base_shadow_stack = private unnamed_addr constant [58 x i8] c"void __softboundcets_store_base_shadow_stack(void *, int)\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_store_bound_shadow_stack = private unnamed_addr constant [59 x i8] c"void __softboundcets_store_bound_shadow_stack(void *, int)\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_store_key_shadow_stack = private unnamed_addr constant [57 x i8] c"void __softboundcets_store_key_shadow_stack(size_t, int)\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_store_lock_shadow_stack = private unnamed_addr constant [58 x i8] c"void __softboundcets_store_lock_shadow_stack(void *, int)\00", align 1
@.str2 = private unnamed_addr constant [71 x i8] c"(read_value >=0 && read_value <= __SOFTBOUNDCETS_SHADOW_STACK_ENTRIES)\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_deallocate_shadow_stack_space = private unnamed_addr constant [53 x i8] c"void __softboundcets_deallocate_shadow_stack_space()\00", align 1
@.str3 = private unnamed_addr constant [14 x i8] c"calling abort\00", align 1
@.str4 = private unnamed_addr constant [59 x i8] c"[introspect_metadata]ptr=%p, base=%p, bound=%p, arg_no=%d\0A\00", align 1
@__softboundcets_trie_primary_table = external global %struct.__softboundcets_trie_entry_t**
@.str5 = private unnamed_addr constant [68 x i8] c"dest_secondary_index < __SOFTBOUNDCETS_TRIE_SECONDARY_TABLE_ENTRIES\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_copy_metadata = private unnamed_addr constant [59 x i8] c"void __softboundcets_copy_metadata(void *, void *, size_t)\00", align 1
@.str6 = private unnamed_addr constant [68 x i8] c"from_secondary_index < __SOFTBOUNDCETS_TRIE_SECONDARY_TABLE_ENTRIES\00", align 1
@.str7 = private unnamed_addr constant [38 x i8] c"In LDC, base=%zx, bound=%zx, ptr=%zx\0A\00", align 1
@.str8 = private unnamed_addr constant [86 x i8] c"In Store Dereference Check, base=%p, bound=%p, ptr=%p, size_of_type=%zx, ptr+size=%p\0A\00", align 1
@.str9 = private unnamed_addr constant [13 x i8] c"not handled\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"trie_secondary_table != NULL\00", align 1
@__PRETTY_FUNCTION__.__softboundcets_metadata_store = private unnamed_addr constant [76 x i8] c"void __softboundcets_metadata_store(void *, void *, void *, size_t, void *)\00", align 1
@.str11 = private unnamed_addr constant [57 x i8] c"[TLDC] Key mismatch key = %zx, *lock=%zx, next_ptr =%zx\0A\00", align 1
@__softboundcets_lock_next_location = external global i64*
@.str12 = private unnamed_addr constant [43 x i8] c"[TSDC] Key mismatch, key = %zx, *lock=%zx\0A\00", align 1
@__softboundcets_stack_temporal_space_begin = external global i64*
@__softboundcets_lock_new_location = external global i64*
@__softboundcets_key_id_counter = external global i64
@__softboundcets_global_lock = external global i64*
@stderr = external global %struct._IO_FILE*
@.str13 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str15 = private unnamed_addr constant [4 x i8] c"tmp\00", align 1
@.str16 = private unnamed_addr constant [31 x i8] c"../../examples/2mm/2mm-safec.c\00", align 1
@.str17 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str18 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str19 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str20 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str21 = private unnamed_addr constant [14 x i8] c"load_base_1_0\00", align 1
@.str22 = private unnamed_addr constant [14 x i8] c"load_base_2_1\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 65535, void ()* @__softboundcets_global_init }]

; Function Attrs: nounwind uwtable
define internal void @__softboundcets_global_init() #0 {
  call void @__softboundcets_init()
  call void @__softboundcets_stub()
  ret void
}

declare void @__softboundcets_init() #1

declare void @__softboundcets_stub() #1

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_allocate_shadow_stack_space(i32 %num_pointer_args) #2 {
  %1 = alloca i32, align 4
  %prev_stack_size_ptr = alloca i64*, align 8
  %prev_stack_size = alloca i64, align 8
  %current_stack_size_ptr = alloca i64*, align 8
  %size = alloca i64, align 8
  store i32 %num_pointer_args, i32* %1, align 4
  %2 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %3 = getelementptr inbounds i64* %2, i64 1
  store i64* %3, i64** %prev_stack_size_ptr, align 8
  %4 = load i64** %prev_stack_size_ptr, align 8
  %5 = load i64* %4, align 8
  store i64 %5, i64* %prev_stack_size, align 8
  %6 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %7 = load i64* %prev_stack_size, align 8
  %8 = getelementptr inbounds i64* %6, i64 %7
  %9 = getelementptr inbounds i64* %8, i64 2
  store i64* %9, i64** @__softboundcets_shadow_stack_ptr, align 8
  %10 = load i64* %prev_stack_size, align 8
  %11 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  store i64 %10, i64* %11, align 8
  %12 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %13 = getelementptr inbounds i64* %12, i64 1
  store i64* %13, i64** %current_stack_size_ptr, align 8
  %14 = load i32* %1, align 4
  %15 = mul nsw i32 %14, 4
  %16 = sext i32 %15 to i64
  store i64 %16, i64* %size, align 8
  %17 = load i64* %size, align 8
  %18 = load i64** %current_stack_size_ptr, align 8
  store i64 %17, i64* %18, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak i8* @__softboundcets_load_base_shadow_stack(i32 %arg_no) #2 {
  %1 = alloca i32, align 4
  %count = alloca i64, align 8
  %base_ptr = alloca i64*, align 8
  %base = alloca i8*, align 8
  store i32 %arg_no, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %7

; <label>:5                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 267, i8* getelementptr inbounds ([50 x i8]* @__PRETTY_FUNCTION__.__softboundcets_load_base_shadow_stack, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = load i32* %1, align 4
  %9 = mul nsw i32 %8, 4
  %10 = add nsw i32 2, %9
  %11 = add nsw i32 %10, 0
  %12 = sext i32 %11 to i64
  store i64 %12, i64* %count, align 8
  %13 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %14 = load i64* %count, align 8
  %15 = getelementptr inbounds i64* %13, i64 %14
  store i64* %15, i64** %base_ptr, align 8
  %16 = load i64** %base_ptr, align 8
  %17 = bitcast i64* %16 to i8**
  %18 = load i8** %17, align 8
  store i8* %18, i8** %base, align 8
  %19 = load i8** %base, align 8
  ret i8* %19
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: alwaysinline nounwind uwtable
define weak i8* @__softboundcets_load_bound_shadow_stack(i32 %arg_no) #2 {
  %1 = alloca i32, align 4
  %count = alloca i64, align 8
  %bound_ptr = alloca i64*, align 8
  %bound = alloca i8*, align 8
  store i32 %arg_no, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %7

; <label>:5                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 276, i8* getelementptr inbounds ([51 x i8]* @__PRETTY_FUNCTION__.__softboundcets_load_bound_shadow_stack, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = load i32* %1, align 4
  %9 = mul nsw i32 %8, 4
  %10 = add nsw i32 2, %9
  %11 = add nsw i32 %10, 1
  %12 = sext i32 %11 to i64
  store i64 %12, i64* %count, align 8
  %13 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %14 = load i64* %count, align 8
  %15 = getelementptr inbounds i64* %13, i64 %14
  store i64* %15, i64** %bound_ptr, align 8
  %16 = load i64** %bound_ptr, align 8
  %17 = bitcast i64* %16 to i8**
  %18 = load i8** %17, align 8
  store i8* %18, i8** %bound, align 8
  %19 = load i8** %bound, align 8
  ret i8* %19
}

; Function Attrs: alwaysinline nounwind uwtable
define weak i64 @__softboundcets_load_key_shadow_stack(i32 %arg_no) #2 {
  %1 = alloca i32, align 4
  %count = alloca i64, align 8
  %key_ptr = alloca i64*, align 8
  %key = alloca i64, align 8
  store i32 %arg_no, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %7

; <label>:5                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 286, i8* getelementptr inbounds ([50 x i8]* @__PRETTY_FUNCTION__.__softboundcets_load_key_shadow_stack, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = load i32* %1, align 4
  %9 = mul nsw i32 %8, 4
  %10 = add nsw i32 2, %9
  %11 = add nsw i32 %10, 2
  %12 = sext i32 %11 to i64
  store i64 %12, i64* %count, align 8
  %13 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %14 = load i64* %count, align 8
  %15 = getelementptr inbounds i64* %13, i64 %14
  store i64* %15, i64** %key_ptr, align 8
  %16 = load i64** %key_ptr, align 8
  %17 = load i64* %16, align 8
  store i64 %17, i64* %key, align 8
  %18 = load i64* %key, align 8
  ret i64 %18
}

; Function Attrs: alwaysinline nounwind uwtable
define weak i8* @__softboundcets_load_lock_shadow_stack(i32 %arg_no) #2 {
  %1 = alloca i32, align 4
  %count = alloca i64, align 8
  %lock_ptr = alloca i64*, align 8
  %lock = alloca i8*, align 8
  store i32 %arg_no, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %7

; <label>:5                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 295, i8* getelementptr inbounds ([50 x i8]* @__PRETTY_FUNCTION__.__softboundcets_load_lock_shadow_stack, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = load i32* %1, align 4
  %9 = mul nsw i32 %8, 4
  %10 = add nsw i32 2, %9
  %11 = add nsw i32 %10, 3
  %12 = sext i32 %11 to i64
  store i64 %12, i64* %count, align 8
  %13 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %14 = load i64* %count, align 8
  %15 = getelementptr inbounds i64* %13, i64 %14
  store i64* %15, i64** %lock_ptr, align 8
  %16 = load i64** %lock_ptr, align 8
  %17 = bitcast i64* %16 to i8**
  %18 = load i8** %17, align 8
  store i8* %18, i8** %lock, align 8
  %19 = load i8** %lock, align 8
  ret i8* %19
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_store_base_shadow_stack(i8* %base, i32 %arg_no) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %count = alloca i64, align 8
  %base_ptr = alloca i8**, align 8
  store i8* %base, i8** %1, align 8
  store i32 %arg_no, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp sge i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 304, i8* getelementptr inbounds ([58 x i8]* @__PRETTY_FUNCTION__.__softboundcets_store_base_shadow_stack, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = load i32* %2, align 4
  %10 = mul nsw i32 %9, 4
  %11 = add nsw i32 2, %10
  %12 = add nsw i32 %11, 0
  %13 = sext i32 %12 to i64
  store i64 %13, i64* %count, align 8
  %14 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %15 = load i64* %count, align 8
  %16 = getelementptr inbounds i64* %14, i64 %15
  %17 = bitcast i64* %16 to i8**
  store i8** %17, i8*** %base_ptr, align 8
  %18 = load i8** %1, align 8
  %19 = load i8*** %base_ptr, align 8
  store i8* %18, i8** %19, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_store_bound_shadow_stack(i8* %bound, i32 %arg_no) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %count = alloca i64, align 8
  %bound_ptr = alloca i8**, align 8
  store i8* %bound, i8** %1, align 8
  store i32 %arg_no, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp sge i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 314, i8* getelementptr inbounds ([59 x i8]* @__PRETTY_FUNCTION__.__softboundcets_store_bound_shadow_stack, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = load i32* %2, align 4
  %10 = mul nsw i32 %9, 4
  %11 = add nsw i32 2, %10
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  store i64 %13, i64* %count, align 8
  %14 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %15 = load i64* %count, align 8
  %16 = getelementptr inbounds i64* %14, i64 %15
  %17 = bitcast i64* %16 to i8**
  store i8** %17, i8*** %bound_ptr, align 8
  %18 = load i8** %1, align 8
  %19 = load i8*** %bound_ptr, align 8
  store i8* %18, i8** %19, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_store_key_shadow_stack(i64 %key, i32 %arg_no) #2 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  %count = alloca i64, align 8
  %key_ptr = alloca i64*, align 8
  store i64 %key, i64* %1, align 8
  store i32 %arg_no, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp sge i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 322, i8* getelementptr inbounds ([57 x i8]* @__PRETTY_FUNCTION__.__softboundcets_store_key_shadow_stack, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = load i32* %2, align 4
  %10 = mul nsw i32 %9, 4
  %11 = add nsw i32 2, %10
  %12 = add nsw i32 %11, 2
  %13 = sext i32 %12 to i64
  store i64 %13, i64* %count, align 8
  %14 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %15 = load i64* %count, align 8
  %16 = getelementptr inbounds i64* %14, i64 %15
  store i64* %16, i64** %key_ptr, align 8
  %17 = load i64* %1, align 8
  %18 = load i64** %key_ptr, align 8
  store i64 %17, i64* %18, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_store_lock_shadow_stack(i8* %lock, i32 %arg_no) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %count = alloca i64, align 8
  %lock_ptr = alloca i8**, align 8
  store i8* %lock, i8** %1, align 8
  store i32 %arg_no, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp sge i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 332, i8* getelementptr inbounds ([58 x i8]* @__PRETTY_FUNCTION__.__softboundcets_store_lock_shadow_stack, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = load i32* %2, align 4
  %10 = mul nsw i32 %9, 4
  %11 = add nsw i32 2, %10
  %12 = add nsw i32 %11, 3
  %13 = sext i32 %12 to i64
  store i64 %13, i64* %count, align 8
  %14 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %15 = load i64* %count, align 8
  %16 = getelementptr inbounds i64* %14, i64 %15
  %17 = bitcast i64* %16 to i8**
  store i8** %17, i8*** %lock_ptr, align 8
  %18 = load i8** %1, align 8
  %19 = load i8*** %lock_ptr, align 8
  store i8* %18, i8** %19, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_deallocate_shadow_stack_space() #2 {
  %reserved_space_ptr = alloca i64*, align 8
  %read_value = alloca i64, align 8
  %1 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  store i64* %1, i64** %reserved_space_ptr, align 8
  %2 = load i64** %reserved_space_ptr, align 8
  %3 = load i64* %2, align 8
  store i64 %3, i64* %read_value, align 8
  %4 = load i64* %read_value, align 8
  %5 = icmp uge i64 %4, 0
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %0
  %7 = load i64* %read_value, align 8
  %8 = icmp ule i64 %7, 4096
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %6
  br label %12

; <label>:10                                      ; preds = %6, %0
  call void @__assert_fail(i8* getelementptr inbounds ([71 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 345, i8* getelementptr inbounds ([53 x i8]* @__PRETTY_FUNCTION__.__softboundcets_deallocate_shadow_stack_space, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %12

; <label>:12                                      ; preds = %11, %9
  %13 = load i64** @__softboundcets_shadow_stack_ptr, align 8
  %14 = load i64* %read_value, align 8
  %15 = sub i64 0, %14
  %16 = getelementptr inbounds i64* %13, i64 %15
  %17 = getelementptr inbounds i64* %16, i64 -2
  store i64* %17, i64** @__softboundcets_shadow_stack_ptr, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak %struct.__softboundcets_trie_entry_t* @__softboundcets_trie_allocate() #2 {
  %secondary_entry = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %length = alloca i64, align 8
  store i64 134217728, i64* %length, align 8
  %1 = load i64* %length, align 8
  %2 = call i8* @__softboundcets_safe_mmap(i8* null, i64 %1, i32 3, i32 16418, i32 -1, i64 0)
  %3 = bitcast i8* %2 to %struct.__softboundcets_trie_entry_t*
  store %struct.__softboundcets_trie_entry_t* %3, %struct.__softboundcets_trie_entry_t** %secondary_entry, align 8
  %4 = load %struct.__softboundcets_trie_entry_t** %secondary_entry, align 8
  ret %struct.__softboundcets_trie_entry_t* %4
}

declare i8* @__softboundcets_safe_mmap(i8*, i64, i32, i32, i32, i64) #1

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_dummy() #2 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str3, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_introspect_metadata(i8* %ptr, i8* %base, i8* %bound, i32 %arg_no) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %ptr, i8** %1, align 8
  store i8* %base, i8** %2, align 8
  store i8* %bound, i8** %3, align 8
  store i32 %arg_no, i32* %4, align 4
  %5 = load i8** %1, align 8
  %6 = load i8** %2, align 8
  %7 = load i8** %3, align 8
  %8 = load i32* %4, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str4, i32 0, i32 0), i8* %5, i8* %6, i8* %7, i32 %8)
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_copy_metadata(i8* %dest, i8* %from, i64 %size) #2 {
  %secondary_entry.i7 = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %length.i8 = alloca i64, align 8
  %secondary_entry.i5 = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %length.i6 = alloca i64, align 8
  %secondary_entry.i = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %length.i = alloca i64, align 8
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %dest_ptr = alloca i64, align 8
  %dest_ptr_end = alloca i64, align 8
  %from_ptr = alloca i64, align 8
  %from_ptr_end = alloca i64, align 8
  %trie_secondary_table_dest_begin = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %trie_secondary_table_from_begin = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %dest_primary_index_begin = alloca i64, align 8
  %dest_primary_index_end = alloca i64, align 8
  %from_primary_index_begin = alloca i64, align 8
  %from_primary_index_end = alloca i64, align 8
  %from_sizet = alloca i64, align 8
  %dest_sizet = alloca i64, align 8
  %trie_size = alloca i64, align 8
  %index = alloca i64, align 8
  %temp_from_pindex = alloca i64, align 8
  %temp_to_pindex = alloca i64, align 8
  %dest_secondary_index = alloca i64, align 8
  %from_secondary_index = alloca i64, align 8
  %temp_from_strie = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %temp_to_strie = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %dest_entry_ptr = alloca i8*, align 8
  %from_entry_ptr = alloca i8*, align 8
  %dest_secondary_index1 = alloca i64, align 8
  %from_secondary_index2 = alloca i64, align 8
  %dest_entry_ptr3 = alloca i8*, align 8
  %from_entry_ptr4 = alloca i8*, align 8
  store i8* %dest, i8** %1, align 8
  store i8* %from, i8** %2, align 8
  store i64 %size, i64* %3, align 8
  %4 = load i8** %1, align 8
  %5 = ptrtoint i8* %4 to i64
  store i64 %5, i64* %dest_ptr, align 8
  %6 = load i64* %dest_ptr, align 8
  %7 = load i64* %3, align 8
  %8 = add i64 %6, %7
  store i64 %8, i64* %dest_ptr_end, align 8
  %9 = load i8** %2, align 8
  %10 = ptrtoint i8* %9 to i64
  store i64 %10, i64* %from_ptr, align 8
  %11 = load i64* %from_ptr, align 8
  %12 = load i64* %3, align 8
  %13 = add i64 %11, %12
  store i64 %13, i64* %from_ptr_end, align 8
  %14 = load i64* %from_ptr, align 8
  %15 = urem i64 %14, 8
  %16 = icmp ne i64 %15, 0
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %0
  br label %163

; <label>:18                                      ; preds = %0
  %19 = load i64* %dest_ptr, align 8
  %20 = lshr i64 %19, 25
  store i64 %20, i64* %dest_primary_index_begin, align 8
  %21 = load i64* %dest_ptr_end, align 8
  %22 = lshr i64 %21, 25
  store i64 %22, i64* %dest_primary_index_end, align 8
  %23 = load i64* %from_ptr, align 8
  %24 = lshr i64 %23, 25
  store i64 %24, i64* %from_primary_index_begin, align 8
  %25 = load i64* %from_ptr_end, align 8
  %26 = lshr i64 %25, 25
  store i64 %26, i64* %from_primary_index_end, align 8
  %27 = load i64* %from_primary_index_begin, align 8
  %28 = load i64* %from_primary_index_end, align 8
  %29 = icmp ne i64 %27, %28
  br i1 %29, label %34, label %30

; <label>:30                                      ; preds = %18
  %31 = load i64* %dest_primary_index_begin, align 8
  %32 = load i64* %dest_primary_index_end, align 8
  %33 = icmp ne i64 %31, %32
  br i1 %33, label %34, label %107

; <label>:34                                      ; preds = %30, %18
  %35 = load i64* %from_ptr, align 8
  store i64 %35, i64* %from_sizet, align 8
  %36 = load i64* %dest_ptr, align 8
  store i64 %36, i64* %dest_sizet, align 8
  %37 = load i64* %3, align 8
  store i64 %37, i64* %trie_size, align 8
  store i64 0, i64* %index, align 8
  store i64 0, i64* %index, align 8
  br label %38

; <label>:38                                      ; preds = %103, %34
  %39 = load i64* %index, align 8
  %40 = load i64* %trie_size, align 8
  %41 = icmp ult i64 %39, %40
  br i1 %41, label %42, label %106

; <label>:42                                      ; preds = %38
  %43 = load i64* %from_sizet, align 8
  %44 = load i64* %index, align 8
  %45 = add i64 %43, %44
  %46 = lshr i64 %45, 25
  store i64 %46, i64* %temp_from_pindex, align 8
  %47 = load i64* %dest_sizet, align 8
  %48 = load i64* %index, align 8
  %49 = add i64 %47, %48
  %50 = lshr i64 %49, 25
  store i64 %50, i64* %temp_to_pindex, align 8
  %51 = load i64* %dest_sizet, align 8
  %52 = load i64* %index, align 8
  %53 = add i64 %51, %52
  %54 = lshr i64 %53, 3
  %55 = and i64 %54, 4194303
  store i64 %55, i64* %dest_secondary_index, align 8
  %56 = load i64* %from_sizet, align 8
  %57 = load i64* %index, align 8
  %58 = add i64 %56, %57
  %59 = lshr i64 %58, 3
  %60 = and i64 %59, 4194303
  store i64 %60, i64* %from_secondary_index, align 8
  %61 = load i64* %temp_from_pindex, align 8
  %62 = load %struct.__softboundcets_trie_entry_t*** @__softboundcets_trie_primary_table, align 8
  %63 = getelementptr inbounds %struct.__softboundcets_trie_entry_t** %62, i64 %61
  %64 = load %struct.__softboundcets_trie_entry_t** %63, align 8
  store %struct.__softboundcets_trie_entry_t* %64, %struct.__softboundcets_trie_entry_t** %temp_from_strie, align 8
  %65 = load %struct.__softboundcets_trie_entry_t** %temp_from_strie, align 8
  %66 = icmp eq %struct.__softboundcets_trie_entry_t* %65, null
  br i1 %66, label %67, label %76

; <label>:67                                      ; preds = %42
  store i64 134217728, i64* %length.i, align 8
  %68 = load i64* %length.i, align 8
  %69 = call i8* @__softboundcets_safe_mmap(i8* null, i64 %68, i32 3, i32 16418, i32 -1, i64 0) #4
  %70 = bitcast i8* %69 to %struct.__softboundcets_trie_entry_t*
  store %struct.__softboundcets_trie_entry_t* %70, %struct.__softboundcets_trie_entry_t** %secondary_entry.i, align 8
  %71 = load %struct.__softboundcets_trie_entry_t** %secondary_entry.i, align 8
  store %struct.__softboundcets_trie_entry_t* %71, %struct.__softboundcets_trie_entry_t** %temp_from_strie, align 8
  %72 = load %struct.__softboundcets_trie_entry_t** %temp_from_strie, align 8
  %73 = load i64* %temp_from_pindex, align 8
  %74 = load %struct.__softboundcets_trie_entry_t*** @__softboundcets_trie_primary_table, align 8
  %75 = getelementptr inbounds %struct.__softboundcets_trie_entry_t** %74, i64 %73
  store %struct.__softboundcets_trie_entry_t* %72, %struct.__softboundcets_trie_entry_t** %75, align 8
  br label %76

; <label>:76                                      ; preds = %67, %42
  %77 = load i64* %temp_to_pindex, align 8
  %78 = load %struct.__softboundcets_trie_entry_t*** @__softboundcets_trie_primary_table, align 8
  %79 = getelementptr inbounds %struct.__softboundcets_trie_entry_t** %78, i64 %77
  %80 = load %struct.__softboundcets_trie_entry_t** %79, align 8
  store %struct.__softboundcets_trie_entry_t* %80, %struct.__softboundcets_trie_entry_t** %temp_to_strie, align 8
  %81 = load %struct.__softboundcets_trie_entry_t** %temp_to_strie, align 8
  %82 = icmp eq %struct.__softboundcets_trie_entry_t* %81, null
  br i1 %82, label %83, label %92

; <label>:83                                      ; preds = %76
  store i64 134217728, i64* %length.i6, align 8
  %84 = load i64* %length.i6, align 8
  %85 = call i8* @__softboundcets_safe_mmap(i8* null, i64 %84, i32 3, i32 16418, i32 -1, i64 0) #4
  %86 = bitcast i8* %85 to %struct.__softboundcets_trie_entry_t*
  store %struct.__softboundcets_trie_entry_t* %86, %struct.__softboundcets_trie_entry_t** %secondary_entry.i5, align 8
  %87 = load %struct.__softboundcets_trie_entry_t** %secondary_entry.i5, align 8
  store %struct.__softboundcets_trie_entry_t* %87, %struct.__softboundcets_trie_entry_t** %temp_to_strie, align 8
  %88 = load %struct.__softboundcets_trie_entry_t** %temp_to_strie, align 8
  %89 = load i64* %temp_to_pindex, align 8
  %90 = load %struct.__softboundcets_trie_entry_t*** @__softboundcets_trie_primary_table, align 8
  %91 = getelementptr inbounds %struct.__softboundcets_trie_entry_t** %90, i64 %89
  store %struct.__softboundcets_trie_entry_t* %88, %struct.__softboundcets_trie_entry_t** %91, align 8
  br label %92

; <label>:92                                      ; preds = %83, %76
  %93 = load i64* %dest_secondary_index, align 8
  %94 = load %struct.__softboundcets_trie_entry_t** %temp_to_strie, align 8
  %95 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %94, i64 %93
  %96 = bitcast %struct.__softboundcets_trie_entry_t* %95 to i8*
  store i8* %96, i8** %dest_entry_ptr, align 8
  %97 = load i64* %from_secondary_index, align 8
  %98 = load %struct.__softboundcets_trie_entry_t** %temp_from_strie, align 8
  %99 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %98, i64 %97
  %100 = bitcast %struct.__softboundcets_trie_entry_t* %99 to i8*
  store i8* %100, i8** %from_entry_ptr, align 8
  %101 = load i8** %dest_entry_ptr, align 8
  %102 = load i8** %from_entry_ptr, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %101, i8* %102, i64 32, i32 1, i1 false)
  br label %103

; <label>:103                                     ; preds = %92
  %104 = load i64* %index, align 8
  %105 = add i64 %104, 8
  store i64 %105, i64* %index, align 8
  br label %38

; <label>:106                                     ; preds = %38
  br label %163

; <label>:107                                     ; preds = %30
  %108 = load i64* %dest_primary_index_begin, align 8
  %109 = load %struct.__softboundcets_trie_entry_t*** @__softboundcets_trie_primary_table, align 8
  %110 = getelementptr inbounds %struct.__softboundcets_trie_entry_t** %109, i64 %108
  %111 = load %struct.__softboundcets_trie_entry_t** %110, align 8
  store %struct.__softboundcets_trie_entry_t* %111, %struct.__softboundcets_trie_entry_t** %trie_secondary_table_dest_begin, align 8
  %112 = load i64* %from_primary_index_begin, align 8
  %113 = load %struct.__softboundcets_trie_entry_t*** @__softboundcets_trie_primary_table, align 8
  %114 = getelementptr inbounds %struct.__softboundcets_trie_entry_t** %113, i64 %112
  %115 = load %struct.__softboundcets_trie_entry_t** %114, align 8
  store %struct.__softboundcets_trie_entry_t* %115, %struct.__softboundcets_trie_entry_t** %trie_secondary_table_from_begin, align 8
  %116 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table_from_begin, align 8
  %117 = icmp eq %struct.__softboundcets_trie_entry_t* %116, null
  br i1 %117, label %118, label %119

; <label>:118                                     ; preds = %107
  br label %163

; <label>:119                                     ; preds = %107
  %120 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table_dest_begin, align 8
  %121 = icmp eq %struct.__softboundcets_trie_entry_t* %120, null
  br i1 %121, label %122, label %131

; <label>:122                                     ; preds = %119
  store i64 134217728, i64* %length.i8, align 8
  %123 = load i64* %length.i8, align 8
  %124 = call i8* @__softboundcets_safe_mmap(i8* null, i64 %123, i32 3, i32 16418, i32 -1, i64 0) #4
  %125 = bitcast i8* %124 to %struct.__softboundcets_trie_entry_t*
  store %struct.__softboundcets_trie_entry_t* %125, %struct.__softboundcets_trie_entry_t** %secondary_entry.i7, align 8
  %126 = load %struct.__softboundcets_trie_entry_t** %secondary_entry.i7, align 8
  store %struct.__softboundcets_trie_entry_t* %126, %struct.__softboundcets_trie_entry_t** %trie_secondary_table_dest_begin, align 8
  %127 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table_dest_begin, align 8
  %128 = load i64* %dest_primary_index_begin, align 8
  %129 = load %struct.__softboundcets_trie_entry_t*** @__softboundcets_trie_primary_table, align 8
  %130 = getelementptr inbounds %struct.__softboundcets_trie_entry_t** %129, i64 %128
  store %struct.__softboundcets_trie_entry_t* %127, %struct.__softboundcets_trie_entry_t** %130, align 8
  br label %131

; <label>:131                                     ; preds = %122, %119
  %132 = load i64* %dest_ptr, align 8
  %133 = lshr i64 %132, 3
  %134 = and i64 %133, 4194303
  store i64 %134, i64* %dest_secondary_index1, align 8
  %135 = load i64* %from_ptr, align 8
  %136 = lshr i64 %135, 3
  %137 = and i64 %136, 4194303
  store i64 %137, i64* %from_secondary_index2, align 8
  %138 = load i64* %dest_secondary_index1, align 8
  %139 = icmp ult i64 %138, 4194304
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %131
  br label %143

; <label>:141                                     ; preds = %131
  call void @__assert_fail(i8* getelementptr inbounds ([68 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 486, i8* getelementptr inbounds ([59 x i8]* @__PRETTY_FUNCTION__.__softboundcets_copy_metadata, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %143

; <label>:143                                     ; preds = %142, %140
  %144 = load i64* %from_secondary_index2, align 8
  %145 = icmp ult i64 %144, 4194304
  br i1 %145, label %146, label %147

; <label>:146                                     ; preds = %143
  br label %149

; <label>:147                                     ; preds = %143
  call void @__assert_fail(i8* getelementptr inbounds ([68 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 487, i8* getelementptr inbounds ([59 x i8]* @__PRETTY_FUNCTION__.__softboundcets_copy_metadata, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %149

; <label>:149                                     ; preds = %148, %146
  %150 = load i64* %dest_secondary_index1, align 8
  %151 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table_dest_begin, align 8
  %152 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %151, i64 %150
  %153 = bitcast %struct.__softboundcets_trie_entry_t* %152 to i8*
  store i8* %153, i8** %dest_entry_ptr3, align 8
  %154 = load i64* %from_secondary_index2, align 8
  %155 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table_from_begin, align 8
  %156 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %155, i64 %154
  %157 = bitcast %struct.__softboundcets_trie_entry_t* %156 to i8*
  store i8* %157, i8** %from_entry_ptr4, align 8
  %158 = load i8** %dest_entry_ptr3, align 8
  %159 = load i8** %from_entry_ptr4, align 8
  %160 = load i64* %3, align 8
  %161 = lshr i64 %160, 3
  %162 = mul i64 32, %161
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %158, i8* %159, i64 %162, i32 1, i1 false)
  br label %163

; <label>:163                                     ; preds = %149, %118, %106, %17
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_shrink_bounds(i8* %new_base, i8* %new_bound, i8* %old_base, i8* %old_bound, i8** %base_alloca, i8** %bound_alloca) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8**, align 8
  %6 = alloca i8**, align 8
  store i8* %new_base, i8** %1, align 8
  store i8* %new_bound, i8** %2, align 8
  store i8* %old_base, i8** %3, align 8
  store i8* %old_bound, i8** %4, align 8
  store i8** %base_alloca, i8*** %5, align 8
  store i8** %bound_alloca, i8*** %6, align 8
  %7 = load i8** %1, align 8
  %8 = load i8** %3, align 8
  %9 = icmp ult i8* %7, %8
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %0
  %11 = load i8** %3, align 8
  br label %14

; <label>:12                                      ; preds = %0
  %13 = load i8** %1, align 8
  br label %14

; <label>:14                                      ; preds = %12, %10
  %15 = phi i8* [ %11, %10 ], [ %13, %12 ]
  %16 = load i8*** %5, align 8
  store i8* %15, i8** %16, align 8
  %17 = load i8** %2, align 8
  %18 = load i8** %4, align 8
  %19 = icmp ugt i8* %17, %18
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %14
  %21 = load i8** %4, align 8
  br label %24

; <label>:22                                      ; preds = %14
  %23 = load i8** %2, align 8
  br label %24

; <label>:24                                      ; preds = %22, %20
  %25 = phi i8* [ %21, %20 ], [ %23, %22 ]
  %26 = load i8*** %6, align 8
  store i8* %25, i8** %26, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_spatial_call_dereference_check(i8* %base, i8* %bound, i8* %ptr) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %base, i8** %1, align 8
  store i8* %bound, i8** %2, align 8
  store i8* %ptr, i8** %3, align 8
  %4 = load i8** %1, align 8
  %5 = load i8** %2, align 8
  %6 = icmp ne i8* %4, %5
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %0
  %8 = load i8** %3, align 8
  %9 = load i8** %1, align 8
  %10 = icmp ne i8* %8, %9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %7
  call void (...)* @__softboundcets_abort() #9
  unreachable

; <label>:12                                      ; preds = %7, %0
  ret void
}

; Function Attrs: noreturn
declare void @__softboundcets_abort(...) #5

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_spatial_load_dereference_check(i8* %base, i8* %bound, i8* %ptr, i64 %size_of_type) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %base, i8** %1, align 8
  store i8* %bound, i8** %2, align 8
  store i8* %ptr, i8** %3, align 8
  store i64 %size_of_type, i64* %4, align 8
  %5 = load i8** %3, align 8
  %6 = load i8** %1, align 8
  %7 = icmp ult i8* %5, %6
  br i1 %7, label %14, label %8

; <label>:8                                       ; preds = %0
  %9 = load i8** %3, align 8
  %10 = load i64* %4, align 8
  %11 = getelementptr inbounds i8* %9, i64 %10
  %12 = load i8** %2, align 8
  %13 = icmp ugt i8* %11, %12
  br i1 %13, label %14, label %18

; <label>:14                                      ; preds = %8, %0
  %15 = load i8** %1, align 8
  %16 = load i8** %2, align 8
  %17 = load i8** %3, align 8
  call void (i8*, ...)* @__softboundcets_printf(i8* getelementptr inbounds ([38 x i8]* @.str7, i32 0, i32 0), i8* %15, i8* %16, i8* %17)
  call void (...)* @__softboundcets_abort() #9
  unreachable

; <label>:18                                      ; preds = %8
  ret void
}

declare void @__softboundcets_printf(i8*, ...) #1

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_spatial_store_dereference_check(i8* %base, i8* %bound, i8* %ptr, i64 %size_of_type) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %base, i8** %1, align 8
  store i8* %bound, i8** %2, align 8
  store i8* %ptr, i8** %3, align 8
  store i64 %size_of_type, i64* %4, align 8
  %5 = load i8** %3, align 8
  %6 = load i8** %1, align 8
  %7 = icmp ult i8* %5, %6
  br i1 %7, label %14, label %8

; <label>:8                                       ; preds = %0
  %9 = load i8** %3, align 8
  %10 = load i64* %4, align 8
  %11 = getelementptr inbounds i8* %9, i64 %10
  %12 = load i8** %2, align 8
  %13 = icmp ugt i8* %11, %12
  br i1 %13, label %14, label %22

; <label>:14                                      ; preds = %8, %0
  %15 = load i8** %1, align 8
  %16 = load i8** %2, align 8
  %17 = load i8** %3, align 8
  %18 = load i64* %4, align 8
  %19 = load i8** %3, align 8
  %20 = load i64* %4, align 8
  %21 = getelementptr inbounds i8* %19, i64 %20
  call void (i8*, ...)* @__softboundcets_printf(i8* getelementptr inbounds ([86 x i8]* @.str8, i32 0, i32 0), i8* %15, i8* %16, i8* %17, i64 %18, i8* %21)
  call void (...)* @__softboundcets_abort() #9
  unreachable

; <label>:22                                      ; preds = %8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_memcopy_check(i8* %dest, i8* %src, i64 %size, i8* %dest_base, i8* %dest_bound, i8* %src_base, i8* %src_bound, i64 %dest_key, i8* %dest_lock, i64 %src_key, i8* %src_lock) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i8*, align 8
  store i8* %dest, i8** %1, align 8
  store i8* %src, i8** %2, align 8
  store i64 %size, i64* %3, align 8
  store i8* %dest_base, i8** %4, align 8
  store i8* %dest_bound, i8** %5, align 8
  store i8* %src_base, i8** %6, align 8
  store i8* %src_bound, i8** %7, align 8
  store i64 %dest_key, i64* %8, align 8
  store i8* %dest_lock, i8** %9, align 8
  store i64 %src_key, i64* %10, align 8
  store i8* %src_lock, i8** %11, align 8
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str9, i32 0, i32 0))
  call void (...)* @__softboundcets_abort() #9
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_memset_check(i8* %dest, i64 %size, i8* %dest_base, i8* %dest_bound, i64 %dest_key, i8* %dest_lock) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  store i8* %dest, i8** %1, align 8
  store i64 %size, i64* %2, align 8
  store i8* %dest_base, i8** %3, align 8
  store i8* %dest_bound, i8** %4, align 8
  store i64 %dest_key, i64* %5, align 8
  store i8* %dest_lock, i8** %6, align 8
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str9, i32 0, i32 0))
  call void (...)* @__softboundcets_abort() #9
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_metadata_store(i8* %addr_of_ptr, i8* %base, i8* %bound, i64 %key, i8* %lock) #2 {
  %secondary_entry.i = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %length.i = alloca i64, align 8
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %ptr = alloca i64, align 8
  %primary_index = alloca i64, align 8
  %trie_secondary_table = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %secondary_index = alloca i64, align 8
  %entry_ptr = alloca %struct.__softboundcets_trie_entry_t*, align 8
  store i8* %addr_of_ptr, i8** %1, align 8
  store i8* %base, i8** %2, align 8
  store i8* %bound, i8** %3, align 8
  store i64 %key, i64* %4, align 8
  store i8* %lock, i8** %5, align 8
  %6 = load i8** %1, align 8
  %7 = ptrtoint i8* %6 to i64
  store i64 %7, i64* %ptr, align 8
  %8 = load i64* %ptr, align 8
  %9 = lshr i64 %8, 25
  store i64 %9, i64* %primary_index, align 8
  %10 = load i64* %primary_index, align 8
  %11 = load %struct.__softboundcets_trie_entry_t*** @__softboundcets_trie_primary_table, align 8
  %12 = getelementptr inbounds %struct.__softboundcets_trie_entry_t** %11, i64 %10
  %13 = load %struct.__softboundcets_trie_entry_t** %12, align 8
  store %struct.__softboundcets_trie_entry_t* %13, %struct.__softboundcets_trie_entry_t** %trie_secondary_table, align 8
  %14 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table, align 8
  %15 = icmp eq %struct.__softboundcets_trie_entry_t* %14, null
  br i1 %15, label %16, label %25

; <label>:16                                      ; preds = %0
  store i64 134217728, i64* %length.i, align 8
  %17 = load i64* %length.i, align 8
  %18 = call i8* @__softboundcets_safe_mmap(i8* null, i64 %17, i32 3, i32 16418, i32 -1, i64 0) #4
  %19 = bitcast i8* %18 to %struct.__softboundcets_trie_entry_t*
  store %struct.__softboundcets_trie_entry_t* %19, %struct.__softboundcets_trie_entry_t** %secondary_entry.i, align 8
  %20 = load %struct.__softboundcets_trie_entry_t** %secondary_entry.i, align 8
  store %struct.__softboundcets_trie_entry_t* %20, %struct.__softboundcets_trie_entry_t** %trie_secondary_table, align 8
  %21 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table, align 8
  %22 = load i64* %primary_index, align 8
  %23 = load %struct.__softboundcets_trie_entry_t*** @__softboundcets_trie_primary_table, align 8
  %24 = getelementptr inbounds %struct.__softboundcets_trie_entry_t** %23, i64 %22
  store %struct.__softboundcets_trie_entry_t* %21, %struct.__softboundcets_trie_entry_t** %24, align 8
  br label %25

; <label>:25                                      ; preds = %16, %0
  %26 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table, align 8
  %27 = icmp ne %struct.__softboundcets_trie_entry_t* %26, null
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  br label %31

; <label>:29                                      ; preds = %25
  call void @__assert_fail(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0), i32 778, i8* getelementptr inbounds ([76 x i8]* @__PRETTY_FUNCTION__.__softboundcets_metadata_store, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %31

; <label>:31                                      ; preds = %30, %28
  %32 = load i64* %ptr, align 8
  %33 = lshr i64 %32, 3
  %34 = and i64 %33, 4194303
  store i64 %34, i64* %secondary_index, align 8
  %35 = load i64* %secondary_index, align 8
  %36 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table, align 8
  %37 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %36, i64 %35
  store %struct.__softboundcets_trie_entry_t* %37, %struct.__softboundcets_trie_entry_t** %entry_ptr, align 8
  %38 = load i8** %2, align 8
  %39 = load %struct.__softboundcets_trie_entry_t** %entry_ptr, align 8
  %40 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %39, i32 0, i32 0
  store i8* %38, i8** %40, align 8
  %41 = load i8** %3, align 8
  %42 = load %struct.__softboundcets_trie_entry_t** %entry_ptr, align 8
  %43 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %42, i32 0, i32 1
  store i8* %41, i8** %43, align 8
  %44 = load i64* %4, align 8
  %45 = load %struct.__softboundcets_trie_entry_t** %entry_ptr, align 8
  %46 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %45, i32 0, i32 2
  store i64 %44, i64* %46, align 8
  %47 = load i8** %5, align 8
  %48 = load %struct.__softboundcets_trie_entry_t** %entry_ptr, align 8
  %49 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %48, i32 0, i32 3
  store i8* %47, i8** %49, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_metadata_load(i8* %addr_of_ptr, i8** %base, i8** %bound, i64* %key, i8** %lock) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i8**, align 8
  %3 = alloca i8**, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i8**, align 8
  %ptr = alloca i64, align 8
  %trie_secondary_table = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %primary_index = alloca i64, align 8
  %secondary_index = alloca i64, align 8
  %entry_ptr = alloca %struct.__softboundcets_trie_entry_t*, align 8
  store i8* %addr_of_ptr, i8** %1, align 8
  store i8** %base, i8*** %2, align 8
  store i8** %bound, i8*** %3, align 8
  store i64* %key, i64** %4, align 8
  store i8** %lock, i8*** %5, align 8
  %6 = load i8** %1, align 8
  %7 = ptrtoint i8* %6 to i64
  store i64 %7, i64* %ptr, align 8
  %8 = load i64* %ptr, align 8
  %9 = lshr i64 %8, 25
  store i64 %9, i64* %primary_index, align 8
  %10 = load i64* %primary_index, align 8
  %11 = load %struct.__softboundcets_trie_entry_t*** @__softboundcets_trie_primary_table, align 8
  %12 = getelementptr inbounds %struct.__softboundcets_trie_entry_t** %11, i64 %10
  %13 = load %struct.__softboundcets_trie_entry_t** %12, align 8
  store %struct.__softboundcets_trie_entry_t* %13, %struct.__softboundcets_trie_entry_t** %trie_secondary_table, align 8
  %14 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table, align 8
  %15 = icmp eq %struct.__softboundcets_trie_entry_t* %14, null
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %0
  %17 = load i8*** %2, align 8
  store i8* null, i8** %17, align 8
  %18 = load i8*** %3, align 8
  store i8* null, i8** %18, align 8
  %19 = load i64** %4, align 8
  store i64 0, i64* %19, align 8
  %20 = load i8*** %5, align 8
  %21 = bitcast i8** %20 to i64*
  store i64 0, i64* %21, align 8
  br label %45

; <label>:22                                      ; preds = %0
  %23 = load i64* %ptr, align 8
  %24 = lshr i64 %23, 3
  %25 = and i64 %24, 4194303
  store i64 %25, i64* %secondary_index, align 8
  %26 = load i64* %secondary_index, align 8
  %27 = load %struct.__softboundcets_trie_entry_t** %trie_secondary_table, align 8
  %28 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %27, i64 %26
  store %struct.__softboundcets_trie_entry_t* %28, %struct.__softboundcets_trie_entry_t** %entry_ptr, align 8
  %29 = load %struct.__softboundcets_trie_entry_t** %entry_ptr, align 8
  %30 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %29, i32 0, i32 0
  %31 = load i8** %30, align 8
  %32 = load i8*** %2, align 8
  store i8* %31, i8** %32, align 8
  %33 = load %struct.__softboundcets_trie_entry_t** %entry_ptr, align 8
  %34 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %33, i32 0, i32 1
  %35 = load i8** %34, align 8
  %36 = load i8*** %3, align 8
  store i8* %35, i8** %36, align 8
  %37 = load %struct.__softboundcets_trie_entry_t** %entry_ptr, align 8
  %38 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %37, i32 0, i32 2
  %39 = load i64* %38, align 8
  %40 = load i64** %4, align 8
  store i64 %39, i64* %40, align 8
  %41 = load %struct.__softboundcets_trie_entry_t** %entry_ptr, align 8
  %42 = getelementptr inbounds %struct.__softboundcets_trie_entry_t* %41, i32 0, i32 3
  %43 = load i8** %42, align 8
  %44 = load i8*** %5, align 8
  store i8* %43, i8** %44, align 8
  br label %45

; <label>:45                                      ; preds = %22, %16
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_temporal_load_dereference_check(i8* %pointer_lock, i64 %key) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %temp = alloca i64, align 8
  store i8* %pointer_lock, i8** %1, align 8
  store i64 %key, i64* %2, align 8
  %3 = load i8** %1, align 8
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  store i64 %5, i64* %temp, align 8
  %6 = load i64* %temp, align 8
  %7 = load i64* %2, align 8
  %8 = icmp ne i64 %6, %7
  br i1 %8, label %9, label %13

; <label>:9                                       ; preds = %0
  %10 = load i64* %2, align 8
  %11 = load i64* %temp, align 8
  %12 = load i64** @__softboundcets_lock_next_location, align 8
  call void (i8*, ...)* @__softboundcets_printf(i8* getelementptr inbounds ([57 x i8]* @.str11, i32 0, i32 0), i64 %10, i64 %11, i64* %12)
  call void (...)* @__softboundcets_abort() #9
  unreachable

; <label>:13                                      ; preds = %0
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_temporal_store_dereference_check(i8* %pointer_lock, i64 %key) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %temp = alloca i64, align 8
  store i8* %pointer_lock, i8** %1, align 8
  store i64 %key, i64* %2, align 8
  %3 = load i8** %1, align 8
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  store i64 %5, i64* %temp, align 8
  %6 = load i64* %temp, align 8
  %7 = load i64* %2, align 8
  %8 = icmp ne i64 %6, %7
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %0
  %10 = load i64* %2, align 8
  %11 = load i64* %temp, align 8
  call void (i8*, ...)* @__softboundcets_printf(i8* getelementptr inbounds ([43 x i8]* @.str12, i32 0, i32 0), i64 %10, i64 %11)
  call void (...)* @__softboundcets_abort() #9
  unreachable

; <label>:12                                      ; preds = %0
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_stack_memory_deallocation(i64 %ptr_key) #2 {
  %1 = alloca i64, align 8
  store i64 %ptr_key, i64* %1, align 8
  %2 = load i64** @__softboundcets_stack_temporal_space_begin, align 8
  %3 = getelementptr inbounds i64* %2, i32 -1
  store i64* %3, i64** @__softboundcets_stack_temporal_space_begin, align 8
  %4 = load i64** @__softboundcets_stack_temporal_space_begin, align 8
  store i64 0, i64* %4, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_memory_deallocation(i8* %ptr_lock, i64 %ptr_key) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  store i8* %ptr_lock, i8** %1, align 8
  store i64 %ptr_key, i64* %2, align 8
  %3 = load i8** %1, align 8
  %4 = bitcast i8* %3 to i64*
  store i64 0, i64* %4, align 8
  %5 = load i64** @__softboundcets_lock_next_location, align 8
  %6 = bitcast i64* %5 to i8*
  %7 = load i8** %1, align 8
  %8 = bitcast i8* %7 to i8**
  store i8* %6, i8** %8, align 8
  %9 = load i8** %1, align 8
  %10 = bitcast i8* %9 to i64*
  store i64* %10, i64** @__softboundcets_lock_next_location, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak i8* @__softboundcets_allocate_lock_location() #2 {
  %1 = alloca i8*, align 8
  %temp = alloca i8*, align 8
  store i8* null, i8** %temp, align 8
  %2 = load i64** @__softboundcets_lock_next_location, align 8
  %3 = icmp eq i64* %2, null
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = load i64** @__softboundcets_lock_new_location, align 8
  %6 = getelementptr inbounds i64* %5, i32 1
  store i64* %6, i64** @__softboundcets_lock_new_location, align 8
  %7 = bitcast i64* %5 to i8*
  store i8* %7, i8** %1
  br label %16

; <label>:8                                       ; preds = %0
  %9 = load i64** @__softboundcets_lock_next_location, align 8
  %10 = bitcast i64* %9 to i8*
  store i8* %10, i8** %temp, align 8
  %11 = load i64** @__softboundcets_lock_next_location, align 8
  %12 = bitcast i64* %11 to i8**
  %13 = load i8** %12, align 8
  %14 = bitcast i8* %13 to i64*
  store i64* %14, i64** @__softboundcets_lock_next_location, align 8
  %15 = load i8** %temp, align 8
  store i8* %15, i8** %1
  br label %16

; <label>:16                                      ; preds = %8, %4
  %17 = load i8** %1
  ret i8* %17
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_allocation_secondary_trie_allocate_range(i8* %initial_ptr, i64 %size) #2 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %addr_of_ptr = alloca i8*, align 8
  %start_addr_of_ptr = alloca i64, align 8
  %start_primary_index = alloca i64, align 8
  %end_addr_of_ptr = alloca i64, align 8
  %end_primary_index = alloca i64, align 8
  store i8* %initial_ptr, i8** %1, align 8
  store i64 %size, i64* %2, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_allocation_secondary_trie_allocate(i8* %addr_of_ptr) #2 {
  %1 = alloca i8*, align 8
  %ptr = alloca i64, align 8
  %primary_index = alloca i64, align 8
  %trie_secondary_table = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %trie_secondary_table_second_entry = alloca %struct.__softboundcets_trie_entry_t*, align 8
  store i8* %addr_of_ptr, i8** %1, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_stack_memory_allocation(i8** %ptr_lock, i64* %ptr_key) #2 {
  %1 = alloca i8**, align 8
  %2 = alloca i64*, align 8
  %temp_id = alloca i64, align 8
  store i8** %ptr_lock, i8*** %1, align 8
  store i64* %ptr_key, i64** %2, align 8
  %3 = load i64* @__softboundcets_key_id_counter, align 8
  %4 = add i64 %3, 1
  store i64 %4, i64* @__softboundcets_key_id_counter, align 8
  store i64 %3, i64* %temp_id, align 8
  %5 = load i64** @__softboundcets_stack_temporal_space_begin, align 8
  %6 = getelementptr inbounds i64* %5, i32 1
  store i64* %6, i64** @__softboundcets_stack_temporal_space_begin, align 8
  %7 = load i8*** %1, align 8
  %8 = bitcast i8** %7 to i64**
  store i64* %5, i64** %8, align 8
  %9 = load i64* %temp_id, align 8
  %10 = load i64** %2, align 8
  store i64 %9, i64* %10, align 8
  %11 = load i64* %temp_id, align 8
  %12 = load i8*** %1, align 8
  %13 = bitcast i8** %12 to i64**
  %14 = load i64** %13, align 8
  store i64 %11, i64* %14, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_memory_allocation(i8* %ptr, i8** %ptr_lock, i64* %ptr_key) #2 {
  %1 = alloca i64, align 8
  %2 = alloca i8*, align 8
  %counter.i = alloca i64, align 8
  %3 = alloca i8*, align 8
  %ptr.i = alloca i64, align 8
  %primary_index.i = alloca i64, align 8
  %trie_secondary_table.i = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %trie_secondary_table_second_entry.i = alloca %struct.__softboundcets_trie_entry_t*, align 8
  %4 = alloca i8*, align 8
  %temp.i = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i64*, align 8
  %temp_id = alloca i64, align 8
  store i8* %ptr, i8** %5, align 8
  store i8** %ptr_lock, i8*** %6, align 8
  store i64* %ptr_key, i64** %7, align 8
  %8 = load i64* @__softboundcets_key_id_counter, align 8
  %9 = add i64 %8, 1
  store i64 %9, i64* @__softboundcets_key_id_counter, align 8
  store i64 %8, i64* %temp_id, align 8
  store i8* null, i8** %temp.i, align 8
  %10 = load i64** @__softboundcets_lock_next_location, align 8
  %11 = icmp eq i64* %10, null
  br i1 %11, label %12, label %16

; <label>:12                                      ; preds = %0
  %13 = load i64** @__softboundcets_lock_new_location, align 8
  %14 = getelementptr inbounds i64* %13, i32 1
  store i64* %14, i64** @__softboundcets_lock_new_location, align 8
  %15 = bitcast i64* %13 to i8*
  store i8* %15, i8** %4
  br label %__softboundcets_allocate_lock_location.exit

; <label>:16                                      ; preds = %0
  %17 = load i64** @__softboundcets_lock_next_location, align 8
  %18 = bitcast i64* %17 to i8*
  store i8* %18, i8** %temp.i, align 8
  %19 = load i64** @__softboundcets_lock_next_location, align 8
  %20 = bitcast i64* %19 to i8**
  %21 = load i8** %20, align 8
  %22 = bitcast i8* %21 to i64*
  store i64* %22, i64** @__softboundcets_lock_next_location, align 8
  %23 = load i8** %temp.i, align 8
  store i8* %23, i8** %4
  br label %__softboundcets_allocate_lock_location.exit

__softboundcets_allocate_lock_location.exit:      ; preds = %12, %16
  %24 = load i8** %4
  %25 = bitcast i8* %24 to i64*
  %26 = load i8*** %6, align 8
  %27 = bitcast i8** %26 to i64**
  store i64* %25, i64** %27, align 8
  %28 = load i64* %temp_id, align 8
  %29 = load i64** %7, align 8
  store i64 %28, i64* %29, align 8
  %30 = load i64* %temp_id, align 8
  %31 = load i8*** %6, align 8
  %32 = bitcast i8** %31 to i64**
  %33 = load i64** %32, align 8
  store i64 %30, i64* %33, align 8
  %34 = load i64* %temp_id, align 8
  %35 = load i8** %5, align 8
  store i64 %34, i64* %1, align 8
  store i8* %35, i8** %2, align 8
  %36 = load i8** %5, align 8
  store i8* %36, i8** %3, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_add_to_free_map(i64 %ptr_key, i8* %ptr) #2 {
  %1 = alloca i64, align 8
  %2 = alloca i8*, align 8
  %counter = alloca i64, align 8
  store i64 %ptr_key, i64* %1, align 8
  store i8* %ptr, i8** %2, align 8
  ret void
}

; Function Attrs: alwaysinline nounwind uwtable
define weak i8* @__softboundcets_get_global_lock() #2 {
  %1 = load i64** @__softboundcets_global_lock, align 8
  %2 = bitcast i64* %1 to i8*
  ret i8* %2
}

; Function Attrs: alwaysinline nounwind uwtable
define weak void @__softboundcets_check_remove_from_free_map(i64 %ptr_key, i8* %ptr) #2 {
  %1 = alloca i64, align 8
  %2 = alloca i8*, align 8
  %counter = alloca i64, align 8
  store i64 %ptr_key, i64* %1, align 8
  store i8* %ptr, i8** %2, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @softboundcets_pseudo_main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %dump_code = alloca i32, align 4
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %nl = alloca i32, align 4
  %alpha = alloca double, align 8
  %alphaptr = alloca double*, align 8
  %beta = alloca double, align 8
  %betaptr = alloca double*, align 8
  %tmp = alloca double*, align 8
  %A = alloca double*, align 8
  %B = alloca double*, align 8
  %C = alloca double*, align 8
  %D = alloca double*, align 8
  %alphaptr_base_0 = alloca i8*, align 8
  %alphaptr_bound_0 = alloca i8*, align 8
  %betaptr_base_1 = alloca i8*, align 8
  %betaptr_bound_1 = alloca i8*, align 8
  store i32 %argc, i32* %1, align 4
  store i8** %argv, i8*** %2, align 8
  %3 = load i8*** %2, align 8
  %4 = getelementptr inbounds i8** %3, i64 1
  %5 = load i8** %4, align 8
  %6 = call i32 @atoi(i8* %5) #10
  store i32 %6, i32* %dump_code, align 4
  %7 = load i8*** %2, align 8
  %8 = getelementptr inbounds i8** %7, i64 2
  %9 = load i8** %8, align 8
  %10 = call i32 @atoi(i8* %9) #10
  store i32 %10, i32* %ni, align 4
  %11 = load i8*** %2, align 8
  %12 = getelementptr inbounds i8** %11, i64 3
  %13 = load i8** %12, align 8
  %14 = call i32 @atoi(i8* %13) #10
  store i32 %14, i32* %nj, align 4
  %15 = load i8*** %2, align 8
  %16 = getelementptr inbounds i8** %15, i64 4
  %17 = load i8** %16, align 8
  %18 = call i32 @atoi(i8* %17) #10
  store i32 %18, i32* %nk, align 4
  %19 = load i8*** %2, align 8
  %20 = getelementptr inbounds i8** %19, i64 5
  %21 = load i8** %20, align 8
  %22 = call i32 @atoi(i8* %21) #10
  store i32 %22, i32* %nl, align 4
  store double* %alpha, double** %alphaptr, align 8
  %23 = bitcast double** %alphaptr to i8*
  %24 = bitcast double* %alpha to i8*
  %25 = getelementptr inbounds double* %alpha, i64 1
  %26 = bitcast double* %25 to i8*
  call void @_safeC_metadata_update(i8* %23, i8* %24, i8* %26)
  store double* %beta, double** %betaptr, align 8
  %27 = bitcast double** %betaptr to i8*
  %28 = bitcast double* %beta to i8*
  %29 = getelementptr inbounds double* %beta, i64 1
  %30 = bitcast double* %29 to i8*
  call void @_safeC_metadata_update(i8* %27, i8* %28, i8* %30)
  %31 = load i32* %ni, align 4
  %32 = zext i32 %31 to i64
  %33 = load i32* %nj, align 4
  %34 = zext i32 %33 to i64
  %35 = load i32* %ni, align 4
  %36 = zext i32 %35 to i64
  %37 = load i32* %nj, align 4
  %38 = zext i32 %37 to i64
  %39 = load i32* %ni, align 4
  %40 = load i32* %nj, align 4
  %41 = mul nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = mul i64 %42, 8
  %44 = call noalias i8* @malloc(i64 %43) #4
  %45 = bitcast i8* %44 to double*
  store double* %45, double** %tmp, align 8
  %46 = load i32* %ni, align 4
  %47 = zext i32 %46 to i64
  %48 = load i32* %nk, align 4
  %49 = zext i32 %48 to i64
  %50 = load i32* %ni, align 4
  %51 = zext i32 %50 to i64
  %52 = load i32* %nk, align 4
  %53 = zext i32 %52 to i64
  %54 = load i32* %ni, align 4
  %55 = load i32* %nk, align 4
  %56 = mul nsw i32 %54, %55
  %57 = sext i32 %56 to i64
  %58 = mul i64 %57, 8
  %59 = call noalias i8* @malloc(i64 %58) #4
  %60 = bitcast i8* %59 to double*
  store double* %60, double** %A, align 8
  %61 = load i32* %nk, align 4
  %62 = zext i32 %61 to i64
  %63 = load i32* %nj, align 4
  %64 = zext i32 %63 to i64
  %65 = load i32* %nk, align 4
  %66 = zext i32 %65 to i64
  %67 = load i32* %nj, align 4
  %68 = zext i32 %67 to i64
  %69 = load i32* %nk, align 4
  %70 = load i32* %nj, align 4
  %71 = mul nsw i32 %69, %70
  %72 = sext i32 %71 to i64
  %73 = mul i64 %72, 8
  %74 = call noalias i8* @malloc(i64 %73) #4
  %75 = bitcast i8* %74 to double*
  store double* %75, double** %B, align 8
  %76 = load i32* %nl, align 4
  %77 = zext i32 %76 to i64
  %78 = load i32* %nj, align 4
  %79 = zext i32 %78 to i64
  %80 = load i32* %nl, align 4
  %81 = zext i32 %80 to i64
  %82 = load i32* %nj, align 4
  %83 = zext i32 %82 to i64
  %84 = load i32* %nl, align 4
  %85 = load i32* %nj, align 4
  %86 = mul nsw i32 %84, %85
  %87 = sext i32 %86 to i64
  %88 = mul i64 %87, 8
  %89 = call noalias i8* @malloc(i64 %88) #4
  %90 = bitcast i8* %89 to double*
  store double* %90, double** %C, align 8
  %91 = load i32* %ni, align 4
  %92 = zext i32 %91 to i64
  %93 = load i32* %nl, align 4
  %94 = zext i32 %93 to i64
  %95 = load i32* %ni, align 4
  %96 = zext i32 %95 to i64
  %97 = load i32* %nl, align 4
  %98 = zext i32 %97 to i64
  %99 = load i32* %ni, align 4
  %100 = load i32* %nl, align 4
  %101 = mul nsw i32 %99, %100
  %102 = sext i32 %101 to i64
  %103 = mul i64 %102, 8
  %104 = call noalias i8* @malloc(i64 %103) #4
  %105 = bitcast i8* %104 to double*
  store double* %105, double** %D, align 8
  call void @_safeC_allocate_shadow_stack_space(i32 6)
  %106 = bitcast double** %alphaptr to i8*
  call void @_safeC_metadata_lookup_base_bound(i8* %106, i8** %alphaptr_base_0, i8** %alphaptr_bound_0)
  %107 = load i8** %alphaptr_base_0, align 8
  call void @_safeC_shadow_stack_store_base(i8* %107, i32 1)
  %108 = load i8** %alphaptr_bound_0, align 8
  call void @_safeC_shadow_stack_store_bound(i8* %108, i32 1)
  %109 = bitcast double** %betaptr to i8*
  call void @_safeC_metadata_lookup_base_bound(i8* %109, i8** %betaptr_base_1, i8** %betaptr_bound_1)
  %110 = load i8** %betaptr_base_1, align 8
  call void @_safeC_shadow_stack_store_base(i8* %110, i32 2)
  %111 = load i8** %betaptr_bound_1, align 8
  call void @_safeC_shadow_stack_store_bound(i8* %111, i32 2)
  %112 = load double** %A, align 8
  %113 = bitcast double* %112 to i8*
  call void @_safeC_shadow_stack_store_base(i8* %113, i32 3)
  %114 = load double** %A, align 8
  %115 = load i32* %ni, align 4
  %116 = load i32* %nk, align 4
  %117 = mul nsw i32 %115, %116
  %118 = sext i32 %117 to i64
  %119 = mul nuw i64 %47, %49
  %120 = mul nsw i64 %118, %119
  %121 = getelementptr inbounds double* %114, i64 %120
  %122 = bitcast double* %121 to i8*
  call void @_safeC_shadow_stack_store_bound(i8* %122, i32 3)
  %123 = load double** %B, align 8
  %124 = bitcast double* %123 to i8*
  call void @_safeC_shadow_stack_store_base(i8* %124, i32 4)
  %125 = load double** %B, align 8
  %126 = load i32* %nk, align 4
  %127 = load i32* %nj, align 4
  %128 = mul nsw i32 %126, %127
  %129 = sext i32 %128 to i64
  %130 = mul nuw i64 %62, %64
  %131 = mul nsw i64 %129, %130
  %132 = getelementptr inbounds double* %125, i64 %131
  %133 = bitcast double* %132 to i8*
  call void @_safeC_shadow_stack_store_bound(i8* %133, i32 4)
  %134 = load double** %C, align 8
  %135 = bitcast double* %134 to i8*
  call void @_safeC_shadow_stack_store_base(i8* %135, i32 5)
  %136 = load double** %C, align 8
  %137 = load i32* %nl, align 4
  %138 = load i32* %nj, align 4
  %139 = mul nsw i32 %137, %138
  %140 = sext i32 %139 to i64
  %141 = mul nuw i64 %77, %79
  %142 = mul nsw i64 %140, %141
  %143 = getelementptr inbounds double* %136, i64 %142
  %144 = bitcast double* %143 to i8*
  call void @_safeC_shadow_stack_store_bound(i8* %144, i32 5)
  %145 = load double** %D, align 8
  %146 = bitcast double* %145 to i8*
  call void @_safeC_shadow_stack_store_base(i8* %146, i32 6)
  %147 = load double** %D, align 8
  %148 = load i32* %ni, align 4
  %149 = load i32* %nl, align 4
  %150 = mul nsw i32 %148, %149
  %151 = sext i32 %150 to i64
  %152 = mul nuw i64 %92, %94
  %153 = mul nsw i64 %151, %152
  %154 = getelementptr inbounds double* %147, i64 %153
  %155 = bitcast double* %154 to i8*
  call void @_safeC_shadow_stack_store_bound(i8* %155, i32 6)
  %156 = load i32* %ni, align 4
  %157 = load i32* %nj, align 4
  %158 = load i32* %nk, align 4
  %159 = load i32* %nl, align 4
  %160 = load double** %alphaptr, align 8
  %161 = load double** %betaptr, align 8
  %162 = load double** %A, align 8
  %163 = load double** %B, align 8
  %164 = load double** %C, align 8
  %165 = load double** %D, align 8
  call void @init_array(i32 %156, i32 %157, i32 %158, i32 %159, double* %160, double* %161, double* %162, double* %163, double* %164, double* %165)
  call void (...)* @_safeC_deallocate_shadow_stack_space()
  call void @_safeC_allocate_shadow_stack_space(i32 5)
  %166 = load double** %tmp, align 8
  %167 = bitcast double* %166 to i8*
  call void @_safeC_shadow_stack_store_base(i8* %167, i32 1)
  %168 = load double** %tmp, align 8
  %169 = load i32* %ni, align 4
  %170 = load i32* %nj, align 4
  %171 = mul nsw i32 %169, %170
  %172 = sext i32 %171 to i64
  %173 = mul nuw i64 %32, %34
  %174 = mul nsw i64 %172, %173
  %175 = getelementptr inbounds double* %168, i64 %174
  %176 = bitcast double* %175 to i8*
  call void @_safeC_shadow_stack_store_bound(i8* %176, i32 1)
  %177 = load double** %A, align 8
  %178 = bitcast double* %177 to i8*
  call void @_safeC_shadow_stack_store_base(i8* %178, i32 2)
  %179 = load double** %A, align 8
  %180 = load i32* %ni, align 4
  %181 = load i32* %nk, align 4
  %182 = mul nsw i32 %180, %181
  %183 = sext i32 %182 to i64
  %184 = mul nuw i64 %47, %49
  %185 = mul nsw i64 %183, %184
  %186 = getelementptr inbounds double* %179, i64 %185
  %187 = bitcast double* %186 to i8*
  call void @_safeC_shadow_stack_store_bound(i8* %187, i32 2)
  %188 = load double** %B, align 8
  %189 = bitcast double* %188 to i8*
  call void @_safeC_shadow_stack_store_base(i8* %189, i32 3)
  %190 = load double** %B, align 8
  %191 = load i32* %nk, align 4
  %192 = load i32* %nj, align 4
  %193 = mul nsw i32 %191, %192
  %194 = sext i32 %193 to i64
  %195 = mul nuw i64 %62, %64
  %196 = mul nsw i64 %194, %195
  %197 = getelementptr inbounds double* %190, i64 %196
  %198 = bitcast double* %197 to i8*
  call void @_safeC_shadow_stack_store_bound(i8* %198, i32 3)
  %199 = load double** %C, align 8
  %200 = bitcast double* %199 to i8*
  call void @_safeC_shadow_stack_store_base(i8* %200, i32 4)
  %201 = load double** %C, align 8
  %202 = load i32* %nl, align 4
  %203 = load i32* %nj, align 4
  %204 = mul nsw i32 %202, %203
  %205 = sext i32 %204 to i64
  %206 = mul nuw i64 %77, %79
  %207 = mul nsw i64 %205, %206
  %208 = getelementptr inbounds double* %201, i64 %207
  %209 = bitcast double* %208 to i8*
  call void @_safeC_shadow_stack_store_bound(i8* %209, i32 4)
  %210 = load double** %D, align 8
  %211 = bitcast double* %210 to i8*
  call void @_safeC_shadow_stack_store_base(i8* %211, i32 5)
  %212 = load double** %D, align 8
  %213 = load i32* %ni, align 4
  %214 = load i32* %nl, align 4
  %215 = mul nsw i32 %213, %214
  %216 = sext i32 %215 to i64
  %217 = mul nuw i64 %92, %94
  %218 = mul nsw i64 %216, %217
  %219 = getelementptr inbounds double* %212, i64 %218
  %220 = bitcast double* %219 to i8*
  call void @_safeC_shadow_stack_store_bound(i8* %220, i32 5)
  %221 = load i32* %ni, align 4
  %222 = load i32* %nj, align 4
  %223 = load i32* %nk, align 4
  %224 = load i32* %nl, align 4
  %225 = load double* %alpha, align 8
  %226 = load double* %beta, align 8
  %227 = load double** %tmp, align 8
  %228 = load double** %A, align 8
  %229 = load double** %B, align 8
  %230 = load double** %C, align 8
  %231 = load double** %D, align 8
  call void @kernel_2mm(i32 %221, i32 %222, i32 %223, i32 %224, double %225, double %226, double* %227, double* %228, double* %229, double* %230, double* %231)
  call void (...)* @_safeC_deallocate_shadow_stack_space()
  %232 = load i32* %dump_code, align 4
  %233 = icmp eq i32 %232, 1
  br i1 %233, label %234, label %238

; <label>:234                                     ; preds = %0
  %235 = load i32* %ni, align 4
  %236 = load i32* %nl, align 4
  %237 = load double** %D, align 8
  call void @print_array(i32 %235, i32 %236, double* %237)
  br label %238

; <label>:238                                     ; preds = %234, %0
  %239 = load double** %tmp, align 8
  %240 = bitcast double* %239 to i8*
  call void @free(i8* %240) #4
  %241 = load double** %A, align 8
  %242 = bitcast double* %241 to i8*
  call void @free(i8* %242) #4
  %243 = load double** %B, align 8
  %244 = bitcast double* %243 to i8*
  call void @free(i8* %244) #4
  %245 = load double** %C, align 8
  %246 = bitcast double* %245 to i8*
  call void @free(i8* %246) #4
  %247 = load double** %D, align 8
  %248 = bitcast double* %247 to i8*
  call void @free(i8* %248) #4
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #6

declare void @_safeC_metadata_update(i8*, i8*, i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #7

declare void @_safeC_allocate_shadow_stack_space(i32) #1

declare void @_safeC_metadata_lookup_base_bound(i8*, i8**, i8**) #1

declare void @_safeC_shadow_stack_store_base(i8*, i32) #1

declare void @_safeC_shadow_stack_store_bound(i8*, i32) #1

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* %alpha, double* %beta, double* %A, double* %B, double* %C, double* %D) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca double*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %load_base_1_0 = alloca i8*, align 8
  %load_bound_1_0 = alloca i8*, align 8
  %load_base_2_1 = alloca i8*, align 8
  %load_bound_2_1 = alloca i8*, align 8
  store i32 %ni, i32* %1, align 4
  store i32 %nj, i32* %2, align 4
  store i32 %nk, i32* %3, align 4
  store i32 %nl, i32* %4, align 4
  store double* %alpha, double** %5, align 8
  store double* %beta, double** %6, align 8
  store double* %A, double** %7, align 8
  store double* %B, double** %8, align 8
  store double* %C, double** %9, align 8
  store double* %D, double** %10, align 8
  %11 = load i32* %1, align 4
  %12 = zext i32 %11 to i64
  %13 = load i32* %4, align 4
  %14 = zext i32 %13 to i64
  %15 = load i32* %3, align 4
  %16 = zext i32 %15 to i64
  %17 = load i32* %2, align 4
  %18 = zext i32 %17 to i64
  %19 = load i32* %4, align 4
  %20 = zext i32 %19 to i64
  %21 = load i32* %2, align 4
  %22 = zext i32 %21 to i64
  %23 = load i32* %1, align 4
  %24 = zext i32 %23 to i64
  %25 = load i32* %4, align 4
  %26 = zext i32 %25 to i64
  %27 = call i8* @_safeC_shadow_stack_load_base(i32 1)
  store i8* %27, i8** %load_base_1_0, align 8
  %28 = call i8* @_safeC_shadow_stack_load_bound(i32 1)
  store i8* %28, i8** %load_bound_1_0, align 8
  %29 = load double** %5, align 8
  %30 = bitcast double* %29 to i8*
  %31 = load i8** %load_base_1_0, align 8
  %32 = load i8** %load_bound_1_0, align 8
  call void @_safeC_spatial_check(i8* %30, i8* %31, i8* %32, i32 8, i8* getelementptr inbounds ([14 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 27, i32 2, i32 8)
  %33 = bitcast double** %5 to i8*
  %34 = load i8** %load_base_1_0, align 8
  %35 = load i8** %load_bound_1_0, align 8
  call void @_safeC_metadata_update(i8* %33, i8* %34, i8* %35)
  %36 = load double** %5, align 8
  store double 3.241200e+04, double* %36, align 8
  %37 = call i8* @_safeC_shadow_stack_load_base(i32 2)
  store i8* %37, i8** %load_base_2_1, align 8
  %38 = call i8* @_safeC_shadow_stack_load_bound(i32 2)
  store i8* %38, i8** %load_bound_2_1, align 8
  %39 = load double** %6, align 8
  %40 = bitcast double* %39 to i8*
  %41 = load i8** %load_base_2_1, align 8
  %42 = load i8** %load_bound_2_1, align 8
  call void @_safeC_spatial_check(i8* %40, i8* %41, i8* %42, i32 8, i8* getelementptr inbounds ([14 x i8]* @.str22, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 28, i32 2, i32 7)
  %43 = bitcast double** %6 to i8*
  %44 = load i8** %load_base_2_1, align 8
  %45 = load i8** %load_bound_2_1, align 8
  call void @_safeC_metadata_update(i8* %43, i8* %44, i8* %45)
  %46 = load double** %6, align 8
  store double 2.123000e+03, double* %46, align 8
  store i32 0, i32* %i, align 4
  br label %47

; <label>:47                                      ; preds = %90, %0
  %48 = load i32* %i, align 4
  %49 = load i32* %1, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %93

; <label>:51                                      ; preds = %47
  store i32 0, i32* %j, align 4
  br label %52

; <label>:52                                      ; preds = %86, %51
  %53 = load i32* %j, align 4
  %54 = load i32* %3, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %89

; <label>:56                                      ; preds = %52
  %57 = load i32* %i, align 4
  %58 = load i32* %1, align 4
  %59 = mul nsw i32 %57, %58
  %60 = load i32* %j, align 4
  %61 = add nsw i32 %59, %60
  %62 = load double** %7, align 8
  %63 = load i32* %1, align 4
  %64 = load i32* %4, align 4
  %65 = mul nsw i32 %63, %64
  %66 = sext i32 %65 to i64
  %67 = mul nsw i64 %66, %14
  %68 = getelementptr inbounds double* %62, i64 %67
  %69 = ptrtoint double* %68 to i32
  call void @_safeC_spatial_check_array2(i32 %61, i32 0, i32 %69, i8* getelementptr inbounds ([2 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 31, i32 6, i32 13)
  %70 = load i32* %i, align 4
  %71 = sitofp i32 %70 to double
  %72 = load i32* %j, align 4
  %73 = sitofp i32 %72 to double
  %74 = fmul double %71, %73
  %75 = load i32* %1, align 4
  %76 = sitofp i32 %75 to double
  %77 = fdiv double %74, %76
  %78 = load i32* %j, align 4
  %79 = sext i32 %78 to i64
  %80 = load i32* %i, align 4
  %81 = sext i32 %80 to i64
  %82 = load double** %7, align 8
  %83 = mul nsw i64 %81, %14
  %84 = getelementptr inbounds double* %82, i64 %83
  %85 = getelementptr inbounds double* %84, i64 %79
  store double %77, double* %85, align 8
  br label %86

; <label>:86                                      ; preds = %56
  %87 = load i32* %j, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %j, align 4
  br label %52

; <label>:89                                      ; preds = %52
  br label %90

; <label>:90                                      ; preds = %89
  %91 = load i32* %i, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %i, align 4
  br label %47

; <label>:93                                      ; preds = %47
  store i32 0, i32* %i, align 4
  br label %94

; <label>:94                                      ; preds = %138, %93
  %95 = load i32* %i, align 4
  %96 = load i32* %3, align 4
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %98, label %141

; <label>:98                                      ; preds = %94
  store i32 0, i32* %j, align 4
  br label %99

; <label>:99                                      ; preds = %134, %98
  %100 = load i32* %j, align 4
  %101 = load i32* %2, align 4
  %102 = icmp slt i32 %100, %101
  br i1 %102, label %103, label %137

; <label>:103                                     ; preds = %99
  %104 = load i32* %i, align 4
  %105 = load i32* %3, align 4
  %106 = mul nsw i32 %104, %105
  %107 = load i32* %j, align 4
  %108 = add nsw i32 %106, %107
  %109 = load double** %8, align 8
  %110 = load i32* %3, align 4
  %111 = load i32* %2, align 4
  %112 = mul nsw i32 %110, %111
  %113 = sext i32 %112 to i64
  %114 = mul nsw i64 %113, %18
  %115 = getelementptr inbounds double* %109, i64 %114
  %116 = ptrtoint double* %115 to i32
  call void @_safeC_spatial_check_array2(i32 %108, i32 0, i32 %116, i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 38, i32 6, i32 13)
  %117 = load i32* %i, align 4
  %118 = sitofp i32 %117 to double
  %119 = load i32* %j, align 4
  %120 = add nsw i32 %119, 1
  %121 = sitofp i32 %120 to double
  %122 = fmul double %118, %121
  %123 = load i32* %2, align 4
  %124 = sitofp i32 %123 to double
  %125 = fdiv double %122, %124
  %126 = load i32* %j, align 4
  %127 = sext i32 %126 to i64
  %128 = load i32* %i, align 4
  %129 = sext i32 %128 to i64
  %130 = load double** %8, align 8
  %131 = mul nsw i64 %129, %18
  %132 = getelementptr inbounds double* %130, i64 %131
  %133 = getelementptr inbounds double* %132, i64 %127
  store double %125, double* %133, align 8
  br label %134

; <label>:134                                     ; preds = %103
  %135 = load i32* %j, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, i32* %j, align 4
  br label %99

; <label>:137                                     ; preds = %99
  br label %138

; <label>:138                                     ; preds = %137
  %139 = load i32* %i, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %i, align 4
  br label %94

; <label>:141                                     ; preds = %94
  store i32 0, i32* %i, align 4
  br label %142

; <label>:142                                     ; preds = %186, %141
  %143 = load i32* %i, align 4
  %144 = load i32* %4, align 4
  %145 = icmp slt i32 %143, %144
  br i1 %145, label %146, label %189

; <label>:146                                     ; preds = %142
  store i32 0, i32* %j, align 4
  br label %147

; <label>:147                                     ; preds = %182, %146
  %148 = load i32* %j, align 4
  %149 = load i32* %2, align 4
  %150 = icmp slt i32 %148, %149
  br i1 %150, label %151, label %185

; <label>:151                                     ; preds = %147
  %152 = load i32* %i, align 4
  %153 = load i32* %4, align 4
  %154 = mul nsw i32 %152, %153
  %155 = load i32* %j, align 4
  %156 = add nsw i32 %154, %155
  %157 = load double** %9, align 8
  %158 = load i32* %4, align 4
  %159 = load i32* %2, align 4
  %160 = mul nsw i32 %158, %159
  %161 = sext i32 %160 to i64
  %162 = mul nsw i64 %161, %22
  %163 = getelementptr inbounds double* %157, i64 %162
  %164 = ptrtoint double* %163 to i32
  call void @_safeC_spatial_check_array2(i32 %156, i32 0, i32 %164, i8* getelementptr inbounds ([2 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 45, i32 6, i32 13)
  %165 = load i32* %i, align 4
  %166 = sitofp i32 %165 to double
  %167 = load i32* %j, align 4
  %168 = add nsw i32 %167, 3
  %169 = sitofp i32 %168 to double
  %170 = fmul double %166, %169
  %171 = load i32* %4, align 4
  %172 = sitofp i32 %171 to double
  %173 = fdiv double %170, %172
  %174 = load i32* %j, align 4
  %175 = sext i32 %174 to i64
  %176 = load i32* %i, align 4
  %177 = sext i32 %176 to i64
  %178 = load double** %9, align 8
  %179 = mul nsw i64 %177, %22
  %180 = getelementptr inbounds double* %178, i64 %179
  %181 = getelementptr inbounds double* %180, i64 %175
  store double %173, double* %181, align 8
  br label %182

; <label>:182                                     ; preds = %151
  %183 = load i32* %j, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, i32* %j, align 4
  br label %147

; <label>:185                                     ; preds = %147
  br label %186

; <label>:186                                     ; preds = %185
  %187 = load i32* %i, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* %i, align 4
  br label %142

; <label>:189                                     ; preds = %142
  store i32 0, i32* %i, align 4
  br label %190

; <label>:190                                     ; preds = %234, %189
  %191 = load i32* %i, align 4
  %192 = load i32* %1, align 4
  %193 = icmp slt i32 %191, %192
  br i1 %193, label %194, label %237

; <label>:194                                     ; preds = %190
  store i32 0, i32* %j, align 4
  br label %195

; <label>:195                                     ; preds = %230, %194
  %196 = load i32* %j, align 4
  %197 = load i32* %4, align 4
  %198 = icmp slt i32 %196, %197
  br i1 %198, label %199, label %233

; <label>:199                                     ; preds = %195
  %200 = load i32* %i, align 4
  %201 = load i32* %1, align 4
  %202 = mul nsw i32 %200, %201
  %203 = load i32* %j, align 4
  %204 = add nsw i32 %202, %203
  %205 = load double** %10, align 8
  %206 = load i32* %1, align 4
  %207 = load i32* %4, align 4
  %208 = mul nsw i32 %206, %207
  %209 = sext i32 %208 to i64
  %210 = mul nsw i64 %209, %26
  %211 = getelementptr inbounds double* %205, i64 %210
  %212 = ptrtoint double* %211 to i32
  call void @_safeC_spatial_check_array2(i32 %204, i32 0, i32 %212, i8* getelementptr inbounds ([2 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 52, i32 6, i32 13)
  %213 = load i32* %i, align 4
  %214 = sitofp i32 %213 to double
  %215 = load i32* %j, align 4
  %216 = add nsw i32 %215, 2
  %217 = sitofp i32 %216 to double
  %218 = fmul double %214, %217
  %219 = load i32* %3, align 4
  %220 = sitofp i32 %219 to double
  %221 = fdiv double %218, %220
  %222 = load i32* %j, align 4
  %223 = sext i32 %222 to i64
  %224 = load i32* %i, align 4
  %225 = sext i32 %224 to i64
  %226 = load double** %10, align 8
  %227 = mul nsw i64 %225, %26
  %228 = getelementptr inbounds double* %226, i64 %227
  %229 = getelementptr inbounds double* %228, i64 %223
  store double %221, double* %229, align 8
  br label %230

; <label>:230                                     ; preds = %199
  %231 = load i32* %j, align 4
  %232 = add nsw i32 %231, 1
  store i32 %232, i32* %j, align 4
  br label %195

; <label>:233                                     ; preds = %195
  br label %234

; <label>:234                                     ; preds = %233
  %235 = load i32* %i, align 4
  %236 = add nsw i32 %235, 1
  store i32 %236, i32* %i, align 4
  br label %190

; <label>:237                                     ; preds = %190
  ret void
}

declare void @_safeC_deallocate_shadow_stack_space(...) #1

; Function Attrs: nounwind uwtable
define internal void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, double* %tmp, double* %A, double* %B, double* %C, double* %D) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %alphaTmp = alloca double, align 8
  %tmptmp = alloca double, align 8
  %ctmp = alloca double, align 8
  store i32 %ni, i32* %1, align 4
  store i32 %nj, i32* %2, align 4
  store i32 %nk, i32* %3, align 4
  store i32 %nl, i32* %4, align 4
  store double %alpha, double* %5, align 8
  store double %beta, double* %6, align 8
  store double* %tmp, double** %7, align 8
  store double* %A, double** %8, align 8
  store double* %B, double** %9, align 8
  store double* %C, double** %10, align 8
  store double* %D, double** %11, align 8
  %12 = load i32* %1, align 4
  %13 = zext i32 %12 to i64
  %14 = load i32* %2, align 4
  %15 = zext i32 %14 to i64
  %16 = load i32* %1, align 4
  %17 = zext i32 %16 to i64
  %18 = load i32* %3, align 4
  %19 = zext i32 %18 to i64
  %20 = load i32* %3, align 4
  %21 = zext i32 %20 to i64
  %22 = load i32* %2, align 4
  %23 = zext i32 %22 to i64
  %24 = load i32* %4, align 4
  %25 = zext i32 %24 to i64
  %26 = load i32* %2, align 4
  %27 = zext i32 %26 to i64
  %28 = load i32* %1, align 4
  %29 = zext i32 %28 to i64
  %30 = load i32* %4, align 4
  %31 = zext i32 %30 to i64
  store i32 0, i32* %i, align 4
  br label %32

; <label>:32                                      ; preds = %149, %0
  %33 = load i32* %i, align 4
  %34 = load i32* %1, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %152

; <label>:36                                      ; preds = %32
  store i32 0, i32* %j, align 4
  br label %37

; <label>:37                                      ; preds = %145, %36
  %38 = load i32* %j, align 4
  %39 = load i32* %2, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %148

; <label>:41                                      ; preds = %37
  %42 = load i32* %i, align 4
  %43 = load i32* %1, align 4
  %44 = mul nsw i32 %42, %43
  %45 = load i32* %j, align 4
  %46 = add nsw i32 %44, %45
  %47 = load double** %7, align 8
  %48 = load i32* %1, align 4
  %49 = load i32* %2, align 4
  %50 = mul nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = mul nsw i64 %51, %15
  %53 = getelementptr inbounds double* %47, i64 %52
  %54 = ptrtoint double* %53 to i32
  call void @_safeC_spatial_check_array2(i32 %46, i32 0, i32 %54, i8* getelementptr inbounds ([4 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 96, i32 6, i32 15)
  %55 = load i32* %j, align 4
  %56 = sext i32 %55 to i64
  %57 = load i32* %i, align 4
  %58 = sext i32 %57 to i64
  %59 = load double** %7, align 8
  %60 = mul nsw i64 %58, %15
  %61 = getelementptr inbounds double* %59, i64 %60
  %62 = getelementptr inbounds double* %61, i64 %56
  store double 0.000000e+00, double* %62, align 8
  store i32 0, i32* %k, align 4
  br label %63

; <label>:63                                      ; preds = %141, %41
  %64 = load i32* %k, align 4
  %65 = load i32* %3, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %144

; <label>:67                                      ; preds = %63
  %68 = load double* %5, align 8
  store double %68, double* %alphaTmp, align 8
  %69 = load i32* %i, align 4
  %70 = load i32* %1, align 4
  %71 = mul nsw i32 %69, %70
  %72 = load i32* %k, align 4
  %73 = add nsw i32 %71, %72
  %74 = load double** %8, align 8
  %75 = load i32* %1, align 4
  %76 = load i32* %3, align 4
  %77 = mul nsw i32 %75, %76
  %78 = sext i32 %77 to i64
  %79 = mul nsw i64 %78, %19
  %80 = getelementptr inbounds double* %74, i64 %79
  %81 = ptrtoint double* %80 to i32
  call void @_safeC_spatial_check_array2(i32 %73, i32 0, i32 %81, i8* getelementptr inbounds ([2 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 100, i32 18, i32 23)
  %82 = load i32* %k, align 4
  %83 = sext i32 %82 to i64
  %84 = load i32* %i, align 4
  %85 = sext i32 %84 to i64
  %86 = load double** %8, align 8
  %87 = mul nsw i64 %85, %19
  %88 = getelementptr inbounds double* %86, i64 %87
  %89 = getelementptr inbounds double* %88, i64 %83
  %90 = load double* %89, align 8
  %91 = load double* %alphaTmp, align 8
  %92 = fmul double %91, %90
  store double %92, double* %alphaTmp, align 8
  %93 = load i32* %k, align 4
  %94 = load i32* %3, align 4
  %95 = mul nsw i32 %93, %94
  %96 = load i32* %j, align 4
  %97 = add nsw i32 %95, %96
  %98 = load double** %9, align 8
  %99 = load i32* %3, align 4
  %100 = load i32* %2, align 4
  %101 = mul nsw i32 %99, %100
  %102 = sext i32 %101 to i64
  %103 = mul nsw i64 %102, %23
  %104 = getelementptr inbounds double* %98, i64 %103
  %105 = ptrtoint double* %104 to i32
  call void @_safeC_spatial_check_array2(i32 %97, i32 0, i32 %105, i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 101, i32 18, i32 23)
  %106 = load i32* %j, align 4
  %107 = sext i32 %106 to i64
  %108 = load i32* %k, align 4
  %109 = sext i32 %108 to i64
  %110 = load double** %9, align 8
  %111 = mul nsw i64 %109, %23
  %112 = getelementptr inbounds double* %110, i64 %111
  %113 = getelementptr inbounds double* %112, i64 %107
  %114 = load double* %113, align 8
  %115 = load double* %alphaTmp, align 8
  %116 = fmul double %115, %114
  store double %116, double* %alphaTmp, align 8
  %117 = load i32* %i, align 4
  %118 = load i32* %1, align 4
  %119 = mul nsw i32 %117, %118
  %120 = load i32* %j, align 4
  %121 = add nsw i32 %119, %120
  %122 = load double** %7, align 8
  %123 = load i32* %1, align 4
  %124 = load i32* %2, align 4
  %125 = mul nsw i32 %123, %124
  %126 = sext i32 %125 to i64
  %127 = mul nsw i64 %126, %15
  %128 = getelementptr inbounds double* %122, i64 %127
  %129 = ptrtoint double* %128 to i32
  call void @_safeC_spatial_check_array2(i32 %121, i32 0, i32 %129, i8* getelementptr inbounds ([4 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 102, i32 6, i32 15)
  %130 = load double* %alphaTmp, align 8
  %131 = load i32* %j, align 4
  %132 = sext i32 %131 to i64
  %133 = load i32* %i, align 4
  %134 = sext i32 %133 to i64
  %135 = load double** %7, align 8
  %136 = mul nsw i64 %134, %15
  %137 = getelementptr inbounds double* %135, i64 %136
  %138 = getelementptr inbounds double* %137, i64 %132
  %139 = load double* %138, align 8
  %140 = fadd double %139, %130
  store double %140, double* %138, align 8
  br label %141

; <label>:141                                     ; preds = %67
  %142 = load i32* %k, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %k, align 4
  br label %63

; <label>:144                                     ; preds = %63
  br label %145

; <label>:145                                     ; preds = %144
  %146 = load i32* %j, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, i32* %j, align 4
  br label %37

; <label>:148                                     ; preds = %37
  br label %149

; <label>:149                                     ; preds = %148
  %150 = load i32* %i, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %i, align 4
  br label %32

; <label>:152                                     ; preds = %32
  store i32 0, i32* %i, align 4
  br label %153

; <label>:153                                     ; preds = %270, %152
  %154 = load i32* %i, align 4
  %155 = load i32* %1, align 4
  %156 = icmp slt i32 %154, %155
  br i1 %156, label %157, label %273

; <label>:157                                     ; preds = %153
  store i32 0, i32* %j, align 4
  br label %158

; <label>:158                                     ; preds = %266, %157
  %159 = load i32* %j, align 4
  %160 = load i32* %4, align 4
  %161 = icmp slt i32 %159, %160
  br i1 %161, label %162, label %269

; <label>:162                                     ; preds = %158
  %163 = load i32* %i, align 4
  %164 = load i32* %1, align 4
  %165 = mul nsw i32 %163, %164
  %166 = load i32* %j, align 4
  %167 = add nsw i32 %165, %166
  %168 = load double** %11, align 8
  %169 = load i32* %1, align 4
  %170 = load i32* %4, align 4
  %171 = mul nsw i32 %169, %170
  %172 = sext i32 %171 to i64
  %173 = mul nsw i64 %172, %31
  %174 = getelementptr inbounds double* %168, i64 %173
  %175 = ptrtoint double* %174 to i32
  call void @_safeC_spatial_check_array2(i32 %167, i32 0, i32 %175, i8* getelementptr inbounds ([2 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 110, i32 6, i32 13)
  %176 = load double* %6, align 8
  %177 = load i32* %j, align 4
  %178 = sext i32 %177 to i64
  %179 = load i32* %i, align 4
  %180 = sext i32 %179 to i64
  %181 = load double** %11, align 8
  %182 = mul nsw i64 %180, %31
  %183 = getelementptr inbounds double* %181, i64 %182
  %184 = getelementptr inbounds double* %183, i64 %178
  %185 = load double* %184, align 8
  %186 = fmul double %185, %176
  store double %186, double* %184, align 8
  store i32 0, i32* %k, align 4
  br label %187

; <label>:187                                     ; preds = %262, %162
  %188 = load i32* %k, align 4
  %189 = load i32* %2, align 4
  %190 = icmp slt i32 %188, %189
  br i1 %190, label %191, label %265

; <label>:191                                     ; preds = %187
  %192 = load i32* %i, align 4
  %193 = load i32* %1, align 4
  %194 = mul nsw i32 %192, %193
  %195 = load i32* %k, align 4
  %196 = add nsw i32 %194, %195
  %197 = load double** %7, align 8
  %198 = load i32* %1, align 4
  %199 = load i32* %2, align 4
  %200 = mul nsw i32 %198, %199
  %201 = sext i32 %200 to i64
  %202 = mul nsw i64 %201, %15
  %203 = getelementptr inbounds double* %197, i64 %202
  %204 = ptrtoint double* %203 to i32
  call void @_safeC_spatial_check_array2(i32 %196, i32 0, i32 %204, i8* getelementptr inbounds ([4 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 114, i32 17, i32 24)
  %205 = load i32* %k, align 4
  %206 = sext i32 %205 to i64
  %207 = load i32* %i, align 4
  %208 = sext i32 %207 to i64
  %209 = load double** %7, align 8
  %210 = mul nsw i64 %208, %15
  %211 = getelementptr inbounds double* %209, i64 %210
  %212 = getelementptr inbounds double* %211, i64 %206
  %213 = load double* %212, align 8
  store double %213, double* %tmptmp, align 8
  %214 = load i32* %k, align 4
  %215 = load i32* %4, align 4
  %216 = mul nsw i32 %214, %215
  %217 = load i32* %j, align 4
  %218 = add nsw i32 %216, %217
  %219 = load double** %10, align 8
  %220 = load i32* %4, align 4
  %221 = load i32* %2, align 4
  %222 = mul nsw i32 %220, %221
  %223 = sext i32 %222 to i64
  %224 = mul nsw i64 %223, %27
  %225 = getelementptr inbounds double* %219, i64 %224
  %226 = ptrtoint double* %225 to i32
  call void @_safeC_spatial_check_array2(i32 %218, i32 0, i32 %226, i8* getelementptr inbounds ([2 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 115, i32 15, i32 20)
  %227 = load i32* %j, align 4
  %228 = sext i32 %227 to i64
  %229 = load i32* %k, align 4
  %230 = sext i32 %229 to i64
  %231 = load double** %10, align 8
  %232 = mul nsw i64 %230, %27
  %233 = getelementptr inbounds double* %231, i64 %232
  %234 = getelementptr inbounds double* %233, i64 %228
  %235 = load double* %234, align 8
  store double %235, double* %ctmp, align 8
  %236 = load i32* %i, align 4
  %237 = load i32* %1, align 4
  %238 = mul nsw i32 %236, %237
  %239 = load i32* %j, align 4
  %240 = add nsw i32 %238, %239
  %241 = load double** %11, align 8
  %242 = load i32* %1, align 4
  %243 = load i32* %4, align 4
  %244 = mul nsw i32 %242, %243
  %245 = sext i32 %244 to i64
  %246 = mul nsw i64 %245, %31
  %247 = getelementptr inbounds double* %241, i64 %246
  %248 = ptrtoint double* %247 to i32
  call void @_safeC_spatial_check_array2(i32 %240, i32 0, i32 %248, i8* getelementptr inbounds ([2 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 116, i32 8, i32 15)
  %249 = load double* %tmptmp, align 8
  %250 = load double* %ctmp, align 8
  %251 = fmul double %249, %250
  %252 = load i32* %j, align 4
  %253 = sext i32 %252 to i64
  %254 = load i32* %i, align 4
  %255 = sext i32 %254 to i64
  %256 = load double** %11, align 8
  %257 = mul nsw i64 %255, %31
  %258 = getelementptr inbounds double* %256, i64 %257
  %259 = getelementptr inbounds double* %258, i64 %253
  %260 = load double* %259, align 8
  %261 = fadd double %260, %251
  store double %261, double* %259, align 8
  br label %262

; <label>:262                                     ; preds = %191
  %263 = load i32* %k, align 4
  %264 = add nsw i32 %263, 1
  store i32 %264, i32* %k, align 4
  br label %187

; <label>:265                                     ; preds = %187
  br label %266

; <label>:266                                     ; preds = %265
  %267 = load i32* %j, align 4
  %268 = add nsw i32 %267, 1
  store i32 %268, i32* %j, align 4
  br label %158

; <label>:269                                     ; preds = %158
  br label %270

; <label>:270                                     ; preds = %269
  %271 = load i32* %i, align 4
  %272 = add nsw i32 %271, 1
  store i32 %272, i32* %i, align 4
  br label %153

; <label>:273                                     ; preds = %153
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, double* %D) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %1, align 4
  store i32 %nl, i32* %2, align 4
  store double* %D, double** %3, align 8
  %4 = load i32* %1, align 4
  %5 = zext i32 %4 to i64
  %6 = load i32* %2, align 4
  %7 = zext i32 %6 to i64
  store i32 0, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %44, %0
  %9 = load i32* %i, align 4
  %10 = load i32* %1, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %47

; <label>:12                                      ; preds = %8
  store i32 0, i32* %j, align 4
  br label %13

; <label>:13                                      ; preds = %40, %12
  %14 = load i32* %j, align 4
  %15 = load i32* %2, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %43

; <label>:17                                      ; preds = %13
  %18 = load %struct._IO_FILE** @stderr, align 8
  %19 = load i32* %j, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = load double** %3, align 8
  %24 = mul nsw i64 %22, %7
  %25 = getelementptr inbounds double* %23, i64 %24
  %26 = getelementptr inbounds double* %25, i64 %20
  %27 = load double* %26, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8]* @.str13, i32 0, i32 0), double %27)
  %29 = load i32* %i, align 4
  %30 = load i32* %1, align 4
  %31 = mul nsw i32 %29, %30
  %32 = load i32* %j, align 4
  %33 = add nsw i32 %31, %32
  %34 = srem i32 %33, 20
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %39

; <label>:36                                      ; preds = %17
  %37 = load %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([2 x i8]* @.str14, i32 0, i32 0))
  br label %39

; <label>:39                                      ; preds = %36, %17
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load i32* %j, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %j, align 4
  br label %13

; <label>:43                                      ; preds = %13
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %8

; <label>:47                                      ; preds = %8
  %48 = load %struct._IO_FILE** @stderr, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([2 x i8]* @.str14, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #7

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare void @_safeC_spatial_check_array2(i32, i32, i32, i8*, i8*, i32, i32, i32) #1

declare i8* @_safeC_shadow_stack_load_base(i32) #1

declare i8* @_safeC_shadow_stack_load_bound(i32) #1

declare void @_safeC_spatial_check(i8*, i8*, i8*, i32, i8*, i8*, i32, i32, i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { alwaysinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }
attributes #9 = { noreturn }
attributes #10 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 "}
