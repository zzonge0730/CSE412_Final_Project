; ModuleID = '<stdin>'
source_filename = "../../examples/2mm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$asan.module_ctor = comdat any

$asan.module_dtor = comdat any

$.str.21576b91ab9b15712202e1b4a494877f = comdat any

@stderr = external local_unnamed_addr global ptr, align 8
@.str = internal constant { [8 x i8], [24 x i8] } { [8 x i8] c"%0.2lf \00", [24 x i8] zeroinitializer }, comdat($.str.21576b91ab9b15712202e1b4a494877f), align 32
@___asan_gen_ = private constant [21 x i8] c"../../examples/2mm.c\00", align 1
@___asan_gen_.2 = private unnamed_addr constant [5 x i8] c".str\00", align 1
@__asan_global_.str = private global { i64, i64, i64, i64, i64, i64, i64, i64 } { i64 ptrtoint (ptr @0 to i64), i64 8, i64 32, i64 ptrtoint (ptr @___asan_gen_.2 to i64), i64 ptrtoint (ptr @___asan_gen_ to i64), i64 0, i64 0, i64 -1 }, section "asan_globals", comdat($.str.21576b91ab9b15712202e1b4a494877f), !associated !0
@llvm.compiler.used = appending global [2 x ptr] [ptr @.str, ptr @__asan_global_.str], section "llvm.metadata"
@___asan_globals_registered = common hidden global i64 0
@__start_asan_globals = extern_weak hidden global i64
@__stop_asan_globals = extern_weak hidden global i64
@llvm.used = appending global [2 x ptr] [ptr @asan.module_ctor, ptr @asan.module_dtor], section "llvm.metadata"
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 1, ptr @asan.module_ctor, ptr @asan.module_ctor }]
@llvm.global_dtors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 1, ptr @asan.module_dtor, ptr @asan.module_dtor }]

@0 = private alias { [8 x i8], [24 x i8] }, ptr @.str

; Function Attrs: nounwind sanitize_address uwtable
define dso_local i32 @main(i32 noundef %argc, ptr nocapture noundef readonly %argv) local_unnamed_addr #0 {
entry:
  %arrayidx = getelementptr inbounds ptr, ptr %argv, i64 1
  %0 = ptrtoint ptr %arrayidx to i64
  %zyarg_12 = inttoptr i64 %0 to ptr
  %zybc_13 = bitcast ptr %zyarg_12 to ptr
  %lf_spawn_env14 = alloca [1 x ptr], align 8
  %lf_spawn_slot15 = getelementptr inbounds [1 x ptr], ptr %lf_spawn_env14, i32 0, i32 0
  store ptr %zybc_13, ptr %lf_spawn_slot15, align 8
  call void @_Z5spawnjPFvPvES_(i32 1223336752, ptr @_spawn_loop_free_func_2_0, ptr %lf_spawn_env14)
  call void @__asan_load8(i64 %0)
  %1 = load ptr, ptr %arrayidx, align 8, !tbaa !6
  %call.i = tail call i64 @strtol(ptr nocapture noundef nonnull %1, ptr noundef null, i32 noundef 10) #8
  %arrayidx1 = getelementptr inbounds ptr, ptr %argv, i64 2
  %2 = ptrtoint ptr %arrayidx1 to i64
  %zyarg_7 = inttoptr i64 %2 to ptr
  %zybc_8 = bitcast ptr %zyarg_7 to ptr
  call void @__asan_load8(i64 %2)
  %3 = load ptr, ptr %arrayidx1, align 8, !tbaa !6
  %call.i78 = tail call i64 @strtol(ptr nocapture noundef nonnull %3, ptr noundef null, i32 noundef 10) #8
  %conv.i79 = trunc i64 %call.i78 to i32
  %arrayidx3 = getelementptr inbounds ptr, ptr %argv, i64 3
  %4 = ptrtoint ptr %arrayidx3 to i64
  %zyarg_5 = inttoptr i64 %4 to ptr
  %zybc_6 = bitcast ptr %zyarg_5 to ptr
  %lf_spawn_env9 = alloca [2 x ptr], align 8
  %lf_spawn_slot10 = getelementptr inbounds [2 x ptr], ptr %lf_spawn_env9, i32 0, i32 0
  store ptr %zybc_6, ptr %lf_spawn_slot10, align 8
  %lf_spawn_slot11 = getelementptr inbounds [2 x ptr], ptr %lf_spawn_env9, i32 0, i32 1
  store ptr %zybc_8, ptr %lf_spawn_slot11, align 8
  call void @_Z5spawnjPFvPvES_(i32 -1378710521, ptr @_spawn_loop_free_func_1_0, ptr %lf_spawn_env9)
  call void @__asan_load8(i64 %4)
  %5 = load ptr, ptr %arrayidx3, align 8, !tbaa !6
  %call.i80 = tail call i64 @strtol(ptr nocapture noundef nonnull %5, ptr noundef null, i32 noundef 10) #8
  %conv.i81 = trunc i64 %call.i80 to i32
  %arrayidx5 = getelementptr inbounds ptr, ptr %argv, i64 4
  %6 = ptrtoint ptr %arrayidx5 to i64
  %zyarg_2 = inttoptr i64 %6 to ptr
  %zybc_3 = bitcast ptr %zyarg_2 to ptr
  call void @__asan_load8(i64 %6)
  %7 = load ptr, ptr %arrayidx5, align 8, !tbaa !6
  %call.i82 = tail call i64 @strtol(ptr nocapture noundef nonnull %7, ptr noundef null, i32 noundef 10) #8
  %conv.i83 = trunc i64 %call.i82 to i32
  %arrayidx7 = getelementptr inbounds ptr, ptr %argv, i64 5
  %8 = ptrtoint ptr %arrayidx7 to i64
  %zyarg_ = inttoptr i64 %8 to ptr
  %zybc_ = bitcast ptr %zyarg_ to ptr
  %lf_spawn_env = alloca [2 x ptr], align 8
  %lf_spawn_slot = getelementptr inbounds [2 x ptr], ptr %lf_spawn_env, i32 0, i32 0
  store ptr %zybc_, ptr %lf_spawn_slot, align 8
  %lf_spawn_slot4 = getelementptr inbounds [2 x ptr], ptr %lf_spawn_env, i32 0, i32 1
  store ptr %zybc_3, ptr %lf_spawn_slot4, align 8
  call void @_Z5spawnjPFvPvES_(i32 829358890, ptr @_spawn_loop_free_func_0_0, ptr %lf_spawn_env)
  call void @__asan_load8(i64 %8)
  %9 = load ptr, ptr %arrayidx7, align 8, !tbaa !6
  %call.i84 = tail call i64 @strtol(ptr nocapture noundef nonnull %9, ptr noundef null, i32 noundef 10) #8
  %conv.i85 = trunc i64 %call.i84 to i32
  %mul = shl i64 %call.i78, 32
  %sext = mul i64 %mul, %call.i80
  %mul9 = ashr exact i64 %sext, 29
  %call10 = tail call noalias ptr @malloc(i64 noundef %mul9) #9
  %mul11 = shl i64 %call.i78, 32
  %sext112 = mul i64 %mul11, %call.i82
  %mul13 = ashr exact i64 %sext112, 29
  %call14 = tail call noalias ptr @malloc(i64 noundef %mul13) #9
  %mul15 = shl i64 %call.i80, 32
  %sext113 = mul i64 %mul15, %call.i82
  %mul17 = ashr exact i64 %sext113, 29
  %call18 = tail call noalias ptr @malloc(i64 noundef %mul17) #9
  %mul19 = shl i64 %call.i80, 32
  %sext114 = mul i64 %mul19, %call.i84
  %mul21 = ashr exact i64 %sext114, 29
  %call22 = tail call noalias ptr @malloc(i64 noundef %mul21) #9
  %mul23 = shl i64 %call.i78, 32
  %sext115 = mul i64 %mul23, %call.i84
  %mul25 = ashr exact i64 %sext115, 29
  %call26 = tail call noalias ptr @malloc(i64 noundef %mul25) #9
  %10 = and i64 %call.i84, 4294967295
  %11 = and i64 %call.i80, 4294967295
  %cmp130.i = icmp sgt i32 %conv.i79, 0
  br i1 %cmp130.i, label %for.cond1.preheader.lr.ph.i, label %for.cond11.preheader.i

for.cond1.preheader.lr.ph.i:                      ; preds = %entry
  %cmp2128.i = icmp sgt i32 %conv.i83, 0
  %conv5.i = sitofp i32 %conv.i79 to double
  %wide.trip.count148.i = and i64 %call.i78, 4294967295
  %wide.trip.count.i = and i64 %call.i82, 4294967295
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc8.i, %for.cond1.preheader.lr.ph.i
  %indvars.iv145.i = phi i64 [ 0, %for.cond1.preheader.lr.ph.i ], [ %indvars.iv.next146.i, %for.inc8.i ]
  br i1 %cmp2128.i, label %for.body3.lr.ph.i, label %for.inc8.i

for.body3.lr.ph.i:                                ; preds = %for.cond1.preheader.i
  %12 = trunc i64 %indvars.iv145.i to i32
  %conv.i86 = sitofp i32 %12 to double
  %13 = mul nuw nsw i64 %indvars.iv145.i, %10
  %arrayidx.i = getelementptr inbounds double, ptr %call14, i64 %13
  br label %for.body3.i

for.cond11.preheader.i.loopexit:                  ; preds = %for.inc8.i
  br label %for.cond11.preheader.i

for.cond11.preheader.i:                           ; preds = %for.cond11.preheader.i.loopexit, %entry
  %cmp12134.i = icmp sgt i32 %conv.i83, 0
  br i1 %cmp12134.i, label %for.cond15.preheader.lr.ph.i, label %for.cond34.preheader.i

for.cond15.preheader.lr.ph.i:                     ; preds = %for.cond11.preheader.i
  %cmp16132.i = icmp sgt i32 %conv.i81, 0
  %conv22.i = sitofp i32 %conv.i81 to double
  %wide.trip.count158.i = and i64 %call.i82, 4294967295
  br label %for.cond15.preheader.i

for.body3.i:                                      ; preds = %for.body3.i, %for.body3.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body3.lr.ph.i ], [ %indvars.iv.next.i, %for.body3.i ]
  %14 = trunc i64 %indvars.iv.i to i32
  %conv4.i = sitofp i32 %14 to double
  %mul.i = fmul double %conv.i86, %conv4.i
  %div.i = fdiv double %mul.i, %conv5.i
  %arrayidx7.i = getelementptr inbounds double, ptr %arrayidx.i, i64 %indvars.iv.i
  %15 = ptrtoint ptr %arrayidx7.i to i64
  call void @__asan_store8(i64 %15)
  store double %div.i, ptr %arrayidx7.i, align 8, !tbaa !10
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, %wide.trip.count.i
  br i1 %exitcond.not.i, label %for.inc8.i.loopexit, label %for.body3.i, !llvm.loop !12

for.inc8.i.loopexit:                              ; preds = %for.body3.i
  br label %for.inc8.i

for.inc8.i:                                       ; preds = %for.inc8.i.loopexit, %for.cond1.preheader.i
  %indvars.iv.next146.i = add nuw nsw i64 %indvars.iv145.i, 1
  %exitcond149.not.i = icmp eq i64 %indvars.iv.next146.i, %wide.trip.count148.i
  br i1 %exitcond149.not.i, label %for.cond11.preheader.i.loopexit, label %for.cond1.preheader.i, !llvm.loop !15

for.cond15.preheader.i:                           ; preds = %for.inc31.i, %for.cond15.preheader.lr.ph.i
  %indvars.iv155.i = phi i64 [ 0, %for.cond15.preheader.lr.ph.i ], [ %indvars.iv.next156.i, %for.inc31.i ]
  br i1 %cmp16132.i, label %for.body18.lr.ph.i, label %for.inc31.i

for.body18.lr.ph.i:                               ; preds = %for.cond15.preheader.i
  %16 = trunc i64 %indvars.iv155.i to i32
  %conv19.i = sitofp i32 %16 to double
  %17 = mul nuw nsw i64 %indvars.iv155.i, %11
  %arrayidx25.i = getelementptr inbounds double, ptr %call18, i64 %17
  br label %for.body18.i

for.cond34.preheader.i.loopexit:                  ; preds = %for.inc31.i
  br label %for.cond34.preheader.i

for.cond34.preheader.i:                           ; preds = %for.cond34.preheader.i.loopexit, %for.cond11.preheader.i
  %cmp35138.i = icmp sgt i32 %conv.i85, 0
  br i1 %cmp35138.i, label %for.cond38.preheader.lr.ph.i, label %for.cond58.preheader.i

for.cond38.preheader.lr.ph.i:                     ; preds = %for.cond34.preheader.i
  %cmp39136.i = icmp sgt i32 %conv.i81, 0
  %conv46.i = sitofp i32 %conv.i85 to double
  br label %for.cond38.preheader.i

for.body18.i:                                     ; preds = %for.body18.i, %for.body18.lr.ph.i
  %indvars.iv150.i = phi i64 [ 0, %for.body18.lr.ph.i ], [ %indvars.iv.next151.i, %for.body18.i ]
  %indvars.iv.next151.i = add nuw nsw i64 %indvars.iv150.i, 1
  %18 = trunc i64 %indvars.iv.next151.i to i32
  %conv20.i = sitofp i32 %18 to double
  %mul21.i = fmul double %conv19.i, %conv20.i
  %div23.i = fdiv double %mul21.i, %conv22.i
  %arrayidx27.i = getelementptr inbounds double, ptr %arrayidx25.i, i64 %indvars.iv150.i
  %19 = ptrtoint ptr %arrayidx27.i to i64
  call void @__asan_store8(i64 %19)
  store double %div23.i, ptr %arrayidx27.i, align 8, !tbaa !10
  %exitcond154.not.i = icmp eq i64 %indvars.iv.next151.i, %11
  br i1 %exitcond154.not.i, label %for.inc31.i.loopexit, label %for.body18.i, !llvm.loop !16

for.inc31.i.loopexit:                             ; preds = %for.body18.i
  br label %for.inc31.i

for.inc31.i:                                      ; preds = %for.inc31.i.loopexit, %for.cond15.preheader.i
  %indvars.iv.next156.i = add nuw nsw i64 %indvars.iv155.i, 1
  %exitcond159.not.i = icmp eq i64 %indvars.iv.next156.i, %wide.trip.count158.i
  br i1 %exitcond159.not.i, label %for.cond34.preheader.i.loopexit, label %for.cond15.preheader.i, !llvm.loop !17

for.cond38.preheader.i:                           ; preds = %for.inc55.i, %for.cond38.preheader.lr.ph.i
  %indvars.iv166.i = phi i64 [ 0, %for.cond38.preheader.lr.ph.i ], [ %indvars.iv.next167.i, %for.inc55.i ]
  br i1 %cmp39136.i, label %for.body41.lr.ph.i, label %for.inc55.i

for.body41.lr.ph.i:                               ; preds = %for.cond38.preheader.i
  %20 = trunc i64 %indvars.iv166.i to i32
  %conv42.i = sitofp i32 %20 to double
  %21 = mul nuw nsw i64 %indvars.iv166.i, %11
  %arrayidx49.i = getelementptr inbounds double, ptr %call22, i64 %21
  br label %for.body41.i

for.cond58.preheader.i.loopexit:                  ; preds = %for.inc55.i
  br label %for.cond58.preheader.i

for.cond58.preheader.i:                           ; preds = %for.cond58.preheader.i.loopexit, %for.cond34.preheader.i
  br i1 %cmp130.i, label %for.cond62.preheader.lr.ph.i, label %init_array.exit

for.cond62.preheader.lr.ph.i:                     ; preds = %for.cond58.preheader.i
  %conv70.i = sitofp i32 %conv.i83 to double
  %wide.trip.count180.i = and i64 %call.i78, 4294967295
  br label %for.cond62.preheader.i

for.body41.i:                                     ; preds = %for.body41.i, %for.body41.lr.ph.i
  %indvars.iv160.i = phi i64 [ 0, %for.body41.lr.ph.i ], [ %indvars.iv.next161.i, %for.body41.i ]
  %22 = trunc i64 %indvars.iv160.i to i32
  %23 = add i32 %22, 3
  %conv44.i = sitofp i32 %23 to double
  %mul45.i = fmul double %conv42.i, %conv44.i
  %div47.i = fdiv double %mul45.i, %conv46.i
  %arrayidx51.i = getelementptr inbounds double, ptr %arrayidx49.i, i64 %indvars.iv160.i
  %24 = ptrtoint ptr %arrayidx51.i to i64
  call void @__asan_store8(i64 %24)
  store double %div47.i, ptr %arrayidx51.i, align 8, !tbaa !10
  %indvars.iv.next161.i = add nuw nsw i64 %indvars.iv160.i, 1
  %exitcond165.not.i = icmp eq i64 %indvars.iv.next161.i, %11
  br i1 %exitcond165.not.i, label %for.inc55.i.loopexit, label %for.body41.i, !llvm.loop !18

for.inc55.i.loopexit:                             ; preds = %for.body41.i
  br label %for.inc55.i

for.inc55.i:                                      ; preds = %for.inc55.i.loopexit, %for.cond38.preheader.i
  %indvars.iv.next167.i = add nuw nsw i64 %indvars.iv166.i, 1
  %exitcond170.not.i = icmp eq i64 %indvars.iv.next167.i, %10
  br i1 %exitcond170.not.i, label %for.cond58.preheader.i.loopexit, label %for.cond38.preheader.i, !llvm.loop !19

for.cond62.preheader.i:                           ; preds = %for.inc79.i, %for.cond62.preheader.lr.ph.i
  %indvars.iv177.i = phi i64 [ 0, %for.cond62.preheader.lr.ph.i ], [ %indvars.iv.next178.i, %for.inc79.i ]
  br i1 %cmp35138.i, label %for.body65.lr.ph.i, label %for.inc79.i

for.body65.lr.ph.i:                               ; preds = %for.cond62.preheader.i
  %25 = trunc i64 %indvars.iv177.i to i32
  %conv66.i = sitofp i32 %25 to double
  %26 = mul nuw nsw i64 %indvars.iv177.i, %10
  %arrayidx73.i = getelementptr inbounds double, ptr %call26, i64 %26
  br label %for.body65.i

for.body65.i:                                     ; preds = %for.body65.i, %for.body65.lr.ph.i
  %indvars.iv171.i = phi i64 [ 0, %for.body65.lr.ph.i ], [ %indvars.iv.next172.i, %for.body65.i ]
  %27 = trunc i64 %indvars.iv171.i to i32
  %28 = add i32 %27, 2
  %conv68.i = sitofp i32 %28 to double
  %mul69.i = fmul double %conv66.i, %conv68.i
  %div71.i = fdiv double %mul69.i, %conv70.i
  %arrayidx75.i = getelementptr inbounds double, ptr %arrayidx73.i, i64 %indvars.iv171.i
  %29 = ptrtoint ptr %arrayidx75.i to i64
  call void @__asan_store8(i64 %29)
  store double %div71.i, ptr %arrayidx75.i, align 8, !tbaa !10
  %indvars.iv.next172.i = add nuw nsw i64 %indvars.iv171.i, 1
  %exitcond176.not.i = icmp eq i64 %indvars.iv.next172.i, %10
  br i1 %exitcond176.not.i, label %for.inc79.i.loopexit, label %for.body65.i, !llvm.loop !20

for.inc79.i.loopexit:                             ; preds = %for.body65.i
  br label %for.inc79.i

for.inc79.i:                                      ; preds = %for.inc79.i.loopexit, %for.cond62.preheader.i
  %indvars.iv.next178.i = add nuw nsw i64 %indvars.iv177.i, 1
  %exitcond181.not.i = icmp eq i64 %indvars.iv.next178.i, %wide.trip.count180.i
  br i1 %exitcond181.not.i, label %init_array.exit.loopexit, label %for.cond62.preheader.i, !llvm.loop !21

init_array.exit.loopexit:                         ; preds = %for.inc79.i
  br label %init_array.exit

init_array.exit:                                  ; preds = %init_array.exit.loopexit, %for.cond58.preheader.i
  %30 = and i64 %call.i82, 4294967295
  br i1 %cmp130.i, label %for.cond1.preheader.lr.ph.i89, label %kernel_2mm.exit

for.cond1.preheader.lr.ph.i89:                    ; preds = %init_array.exit
  %cmp2106.i = icmp sgt i32 %conv.i81, 0
  %wide.trip.count127.i = and i64 %call.i78, 4294967295
  br label %for.cond1.preheader.i90

for.cond1.preheader.i90:                          ; preds = %for.inc25.i, %for.cond1.preheader.lr.ph.i89
  %indvars.iv124.i = phi i64 [ 0, %for.cond1.preheader.lr.ph.i89 ], [ %indvars.iv.next125.i, %for.inc25.i ]
  br i1 %cmp2106.i, label %for.body3.lr.ph.i91, label %for.inc25.i

for.body3.lr.ph.i91:                              ; preds = %for.cond1.preheader.i90
  %31 = mul nuw nsw i64 %indvars.iv124.i, %11
  %arrayidx.i92 = getelementptr inbounds double, ptr %call10, i64 %31
  %32 = mul nuw nsw i64 %indvars.iv124.i, %30
  %arrayidx10.i = getelementptr inbounds double, ptr %call14, i64 %32
  br label %for.body3.i93

for.cond28.preheader.i:                           ; preds = %for.inc25.i
  br i1 %cmp130.i, label %for.cond31.preheader.lr.ph.i, label %kernel_2mm.exit

for.cond31.preheader.lr.ph.i:                     ; preds = %for.cond28.preheader.i
  %cmp40112.i = icmp sgt i32 %conv.i81, 0
  %wide.trip.count142.i = and i64 %call.i78, 4294967295
  br label %for.cond31.preheader.i

for.body3.i93:                                    ; preds = %for.inc22.i, %for.body3.lr.ph.i91
  %indvars.iv119.i = phi i64 [ 0, %for.body3.lr.ph.i91 ], [ %indvars.iv.next120.i, %for.inc22.i ]
  %arrayidx5.i = getelementptr inbounds double, ptr %arrayidx.i92, i64 %indvars.iv119.i
  %33 = ptrtoint ptr %arrayidx5.i to i64
  call void @__asan_store8(i64 %33)
  store double 0.000000e+00, ptr %arrayidx5.i, align 8, !tbaa !10
  %invariant.gep.i = getelementptr inbounds double, ptr %call18, i64 %indvars.iv119.i
  br i1 %cmp12134.i, label %for.body8.i.preheader, label %for.inc22.i

for.body8.i.preheader:                            ; preds = %for.body3.i93
  br label %for.body8.i

for.body8.i:                                      ; preds = %for.body8.i.preheader, %for.body8.i
  %indvars.iv.i95 = phi i64 [ %indvars.iv.next.i97, %for.body8.i ], [ 0, %for.body8.i.preheader ]
  %34 = phi double [ %40, %for.body8.i ], [ 0.000000e+00, %for.body8.i.preheader ]
  %arrayidx12.i = getelementptr inbounds double, ptr %arrayidx10.i, i64 %indvars.iv.i95
  %35 = ptrtoint ptr %arrayidx12.i to i64
  call void @__asan_load8(i64 %35)
  %36 = load double, ptr %arrayidx12.i, align 8, !tbaa !10
  %mul.i96 = fmul double %36, 3.241200e+04
  %37 = mul nuw nsw i64 %indvars.iv.i95, %11
  %gep.i = getelementptr inbounds double, ptr %invariant.gep.i, i64 %37
  %38 = ptrtoint ptr %gep.i to i64
  call void @__asan_load8(i64 %38)
  %39 = load double, ptr %gep.i, align 8, !tbaa !10
  %40 = tail call double @llvm.fmuladd.f64(double %mul.i96, double %39, double %34)
  %indvars.iv.next.i97 = add nuw nsw i64 %indvars.iv.i95, 1
  %exitcond.not.i98 = icmp eq i64 %indvars.iv.next.i97, %30
  br i1 %exitcond.not.i98, label %for.inc22.i.loopexit, label %for.body8.i, !llvm.loop !22

for.inc22.i.loopexit:                             ; preds = %for.body8.i
  %.lcssa1 = phi double [ %40, %for.body8.i ]
  %41 = ptrtoint ptr %arrayidx5.i to i64
  call void @__asan_store8(i64 %41)
  store double %.lcssa1, ptr %arrayidx5.i, align 8, !tbaa !10
  br label %for.inc22.i

for.inc22.i:                                      ; preds = %for.inc22.i.loopexit, %for.body3.i93
  %indvars.iv.next120.i = add nuw nsw i64 %indvars.iv119.i, 1
  %exitcond123.not.i = icmp eq i64 %indvars.iv.next120.i, %11
  br i1 %exitcond123.not.i, label %for.inc25.i.loopexit, label %for.body3.i93, !llvm.loop !23

for.inc25.i.loopexit:                             ; preds = %for.inc22.i
  br label %for.inc25.i

for.inc25.i:                                      ; preds = %for.inc25.i.loopexit, %for.cond1.preheader.i90
  %indvars.iv.next125.i = add nuw nsw i64 %indvars.iv124.i, 1
  %exitcond128.not.i = icmp eq i64 %indvars.iv.next125.i, %wide.trip.count127.i
  br i1 %exitcond128.not.i, label %for.cond28.preheader.i, label %for.cond1.preheader.i90, !llvm.loop !24

for.cond31.preheader.i:                           ; preds = %for.inc61.i, %for.cond31.preheader.lr.ph.i
  %indvars.iv139.i = phi i64 [ 0, %for.cond31.preheader.lr.ph.i ], [ %indvars.iv.next140.i, %for.inc61.i ]
  br i1 %cmp35138.i, label %for.body33.lr.ph.i, label %for.inc61.i

for.body33.lr.ph.i:                               ; preds = %for.cond31.preheader.i
  %42 = mul nuw nsw i64 %indvars.iv139.i, %10
  %arrayidx35.i = getelementptr inbounds double, ptr %call26, i64 %42
  %43 = mul nuw nsw i64 %indvars.iv139.i, %11
  %arrayidx43.i = getelementptr inbounds double, ptr %call10, i64 %43
  br label %for.body33.i

for.body33.i:                                     ; preds = %for.inc58.i, %for.body33.lr.ph.i
  %indvars.iv134.i = phi i64 [ 0, %for.body33.lr.ph.i ], [ %indvars.iv.next135.i, %for.inc58.i ]
  %arrayidx37.i = getelementptr inbounds double, ptr %arrayidx35.i, i64 %indvars.iv134.i
  %44 = ptrtoint ptr %arrayidx37.i to i64
  call void @__asan_load8(i64 %44)
  %45 = load double, ptr %arrayidx37.i, align 8, !tbaa !10
  %mul38.i = fmul double %45, 2.123000e+03
  store double %mul38.i, ptr %arrayidx37.i, align 8, !tbaa !10
  %invariant.gep110.i = getelementptr inbounds double, ptr %call22, i64 %indvars.iv134.i
  br i1 %cmp40112.i, label %for.body41.i88.preheader, label %for.inc58.i

for.body41.i88.preheader:                         ; preds = %for.body33.i
  br label %for.body41.i88

for.body41.i88:                                   ; preds = %for.body41.i88.preheader, %for.body41.i88
  %indvars.iv129.i = phi i64 [ %indvars.iv.next130.i, %for.body41.i88 ], [ 0, %for.body41.i88.preheader ]
  %46 = phi double [ %52, %for.body41.i88 ], [ %mul38.i, %for.body41.i88.preheader ]
  %arrayidx45.i = getelementptr inbounds double, ptr %arrayidx43.i, i64 %indvars.iv129.i
  %47 = ptrtoint ptr %arrayidx45.i to i64
  call void @__asan_load8(i64 %47)
  %48 = load double, ptr %arrayidx45.i, align 8, !tbaa !10
  %49 = mul nuw nsw i64 %indvars.iv129.i, %11
  %gep111.i = getelementptr inbounds double, ptr %invariant.gep110.i, i64 %49
  %50 = ptrtoint ptr %gep111.i to i64
  call void @__asan_load8(i64 %50)
  %51 = load double, ptr %gep111.i, align 8, !tbaa !10
  %52 = tail call double @llvm.fmuladd.f64(double %48, double %51, double %46)
  %indvars.iv.next130.i = add nuw nsw i64 %indvars.iv129.i, 1
  %exitcond133.not.i = icmp eq i64 %indvars.iv.next130.i, %11
  br i1 %exitcond133.not.i, label %for.inc58.i.loopexit, label %for.body41.i88, !llvm.loop !25

for.inc58.i.loopexit:                             ; preds = %for.body41.i88
  %.lcssa = phi double [ %52, %for.body41.i88 ]
  %53 = ptrtoint ptr %arrayidx37.i to i64
  call void @__asan_store8(i64 %53)
  store double %.lcssa, ptr %arrayidx37.i, align 8, !tbaa !10
  br label %for.inc58.i

for.inc58.i:                                      ; preds = %for.inc58.i.loopexit, %for.body33.i
  %indvars.iv.next135.i = add nuw nsw i64 %indvars.iv134.i, 1
  %exitcond138.not.i = icmp eq i64 %indvars.iv.next135.i, %10
  br i1 %exitcond138.not.i, label %for.inc61.i.loopexit, label %for.body33.i, !llvm.loop !26

for.inc61.i.loopexit:                             ; preds = %for.inc58.i
  br label %for.inc61.i

for.inc61.i:                                      ; preds = %for.inc61.i.loopexit, %for.cond31.preheader.i
  %indvars.iv.next140.i = add nuw nsw i64 %indvars.iv139.i, 1
  %exitcond143.not.i = icmp eq i64 %indvars.iv.next140.i, %wide.trip.count142.i
  br i1 %exitcond143.not.i, label %kernel_2mm.exit.loopexit, label %for.cond31.preheader.i, !llvm.loop !27

kernel_2mm.exit.loopexit:                         ; preds = %for.inc61.i
  br label %kernel_2mm.exit

kernel_2mm.exit:                                  ; preds = %kernel_2mm.exit.loopexit, %for.cond28.preheader.i, %init_array.exit
  %54 = and i64 %call.i, 4294967295
  %cmp = icmp eq i64 %54, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %kernel_2mm.exit
  br i1 %cmp130.i, label %for.cond1.preheader.lr.ph.i99, label %print_array.exit

for.cond1.preheader.lr.ph.i99:                    ; preds = %if.then
  %wide.trip.count30.i = and i64 %call.i78, 4294967295
  br label %for.cond1.preheader.i100

for.cond1.preheader.i100:                         ; preds = %for.inc8.i101, %for.cond1.preheader.lr.ph.i99
  %indvars.iv27.i = phi i64 [ 0, %for.cond1.preheader.lr.ph.i99 ], [ %indvars.iv.next28.i, %for.inc8.i101 ]
  br i1 %cmp35138.i, label %for.body3.lr.ph.i102, label %for.inc8.i101

for.body3.lr.ph.i102:                             ; preds = %for.cond1.preheader.i100
  %55 = mul nuw nsw i64 %indvars.iv27.i, %10
  %arrayidx.i103 = getelementptr inbounds double, ptr %call26, i64 %55
  %56 = trunc i64 %indvars.iv27.i to i32
  %mul.i104 = mul nsw i32 %56, %conv.i79
  br label %for.body3.i106

for.body3.i106:                                   ; preds = %for.inc.i, %for.body3.lr.ph.i102
  %indvars.iv.i107 = phi i64 [ 0, %for.body3.lr.ph.i102 ], [ %indvars.iv.next.i110, %for.inc.i ]
  call void @__asan_load8(i64 ptrtoint (ptr @stderr to i64))
  %57 = load ptr, ptr @stderr, align 8, !tbaa !6
  %arrayidx5.i108 = getelementptr inbounds double, ptr %arrayidx.i103, i64 %indvars.iv.i107
  %58 = ptrtoint ptr %arrayidx5.i108 to i64
  call void @__asan_load8(i64 %58)
  %59 = load double, ptr %arrayidx5.i108, align 8, !tbaa !10
  %call.i109 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %57, ptr noundef nonnull @.str, double noundef %59) #10
  %60 = trunc i64 %indvars.iv.i107 to i32
  %add.i = add nsw i32 %mul.i104, %60
  %rem.i = srem i32 %add.i, 20
  %cmp6.i = icmp eq i32 %rem.i, 0
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body3.i106
  call void @__asan_load8(i64 ptrtoint (ptr @stderr to i64))
  %61 = load ptr, ptr @stderr, align 8, !tbaa !6
  %fputc21.i = tail call i32 @fputc(i32 10, ptr %61)
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i106
  %indvars.iv.next.i110 = add nuw nsw i64 %indvars.iv.i107, 1
  %exitcond.not.i111 = icmp eq i64 %indvars.iv.next.i110, %10
  br i1 %exitcond.not.i111, label %for.inc8.i101.loopexit, label %for.body3.i106, !llvm.loop !28

for.inc8.i101.loopexit:                           ; preds = %for.inc.i
  br label %for.inc8.i101

for.inc8.i101:                                    ; preds = %for.inc8.i101.loopexit, %for.cond1.preheader.i100
  %indvars.iv.next28.i = add nuw nsw i64 %indvars.iv27.i, 1
  %exitcond31.not.i = icmp eq i64 %indvars.iv.next28.i, %wide.trip.count30.i
  br i1 %exitcond31.not.i, label %print_array.exit.loopexit, label %for.cond1.preheader.i100, !llvm.loop !29

print_array.exit.loopexit:                        ; preds = %for.inc8.i101
  br label %print_array.exit

print_array.exit:                                 ; preds = %print_array.exit.loopexit, %if.then
  %zyarg_16 = inttoptr i64 ptrtoint (ptr @stderr to i64) to ptr
  %zybc_17 = bitcast ptr %zyarg_16 to ptr
  %lf_spawn_env18 = alloca [1 x ptr], align 8
  %lf_spawn_slot19 = getelementptr inbounds [1 x ptr], ptr %lf_spawn_env18, i32 0, i32 0
  store ptr %zybc_17, ptr %lf_spawn_slot19, align 8
  call void @_Z5spawnjPFvPvES_(i32 1937728374, ptr @_spawn_loop_free_func_3_0, ptr %lf_spawn_env18)
  call void @__asan_load8(i64 ptrtoint (ptr @stderr to i64))
  %62 = load ptr, ptr @stderr, align 8, !tbaa !6
  %fputc.i = tail call i32 @fputc(i32 10, ptr %62)
  br label %if.end

if.end:                                           ; preds = %print_array.exit, %kernel_2mm.exit
  call void @_Z4joinj(i32 829358890)
  call void @_Z4joinj(i32 -1378710521)
  call void @_Z4joinj(i32 1223336752)
  call void @_Z4joinj(i32 1937728374)
  tail call void @free(ptr noundef %call10) #8
  tail call void @free(ptr noundef %call14) #8
  tail call void @free(ptr noundef %call18) #8
  tail call void @free(ptr noundef %call22) #8
  tail call void @free(ptr noundef %call26) #8
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn
declare i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #4

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @fputc(i32 noundef, ptr nocapture noundef) local_unnamed_addr #6

declare void @__asan_load8(i64)

declare void @__asan_store8(i64)

declare void @__asan_register_elf_globals(i64, i64, i64)

declare void @__asan_unregister_elf_globals(i64, i64, i64)

declare void @__asan_init()

; Function Attrs: nounwind uwtable
define internal void @asan.module_ctor() #7 comdat {
  %lf_spawn_env = alloca [3 x ptr], align 8
  %lf_spawn_slot = getelementptr inbounds [3 x ptr], ptr %lf_spawn_env, i32 0, i32 0
  store ptr %zybc_, ptr %lf_spawn_slot, align 8
  %lf_spawn_slot5 = getelementptr inbounds [3 x ptr], ptr %lf_spawn_env, i32 0, i32 1
  store ptr %zybc_2, ptr %lf_spawn_slot5, align 8
  %lf_spawn_slot6 = getelementptr inbounds [3 x ptr], ptr %lf_spawn_env, i32 0, i32 2
  store ptr %zybc_4, ptr %lf_spawn_slot6, align 8
  call void @__asan_init()
  call void @__asan_version_mismatch_check_v8()
  %zyarg_ = inttoptr i64 ptrtoint (ptr @___asan_globals_registered to i64) to ptr
  %zybc_ = bitcast ptr %zyarg_ to ptr
  %zyarg_1 = inttoptr i64 ptrtoint (ptr @__start_asan_globals to i64) to ptr
  %zybc_2 = bitcast ptr %zyarg_1 to ptr
  %zyarg_3 = inttoptr i64 ptrtoint (ptr @__stop_asan_globals to i64) to ptr
  %zybc_4 = bitcast ptr %zyarg_3 to ptr
  call void @_Z5spawnjPFvPvES_(i32 -971139009, ptr @_spawn_loop_free_func_4_0, ptr %lf_spawn_env)
  call void @__asan_register_elf_globals(i64 ptrtoint (ptr @___asan_globals_registered to i64), i64 ptrtoint (ptr @__start_asan_globals to i64), i64 ptrtoint (ptr @__stop_asan_globals to i64))
  call void @_Z4joinj(i32 -971139009)
  ret void
}

declare void @__asan_version_mismatch_check_v8()

; Function Attrs: nounwind uwtable
define internal void @asan.module_dtor() #7 comdat {
  %zyarg_ = inttoptr i64 ptrtoint (ptr @___asan_globals_registered to i64) to ptr
  %zybc_ = bitcast ptr %zyarg_ to ptr
  %zyarg_1 = inttoptr i64 ptrtoint (ptr @__start_asan_globals to i64) to ptr
  %zybc_2 = bitcast ptr %zyarg_1 to ptr
  %zyarg_3 = inttoptr i64 ptrtoint (ptr @__stop_asan_globals to i64) to ptr
  %zybc_4 = bitcast ptr %zyarg_3 to ptr
  %lf_spawn_env = alloca [3 x ptr], align 8
  %lf_spawn_slot = getelementptr inbounds [3 x ptr], ptr %lf_spawn_env, i32 0, i32 0
  store ptr %zybc_, ptr %lf_spawn_slot, align 8
  %lf_spawn_slot5 = getelementptr inbounds [3 x ptr], ptr %lf_spawn_env, i32 0, i32 1
  store ptr %zybc_2, ptr %lf_spawn_slot5, align 8
  %lf_spawn_slot6 = getelementptr inbounds [3 x ptr], ptr %lf_spawn_env, i32 0, i32 2
  store ptr %zybc_4, ptr %lf_spawn_slot6, align 8
  call void @_Z5spawnjPFvPvES_(i32 1780336636, ptr @_spawn_loop_free_func_5_0, ptr %lf_spawn_env)
  call void @__asan_unregister_elf_globals(i64 ptrtoint (ptr @___asan_globals_registered to i64), i64 ptrtoint (ptr @__start_asan_globals to i64), i64 ptrtoint (ptr @__stop_asan_globals to i64))
  call void @_Z4joinj(i32 1780336636)
  ret void
}

declare void @_Z4joinj(i32)

define internal void @_spawn_loop_free_func_0_0(ptr %0) {
entry:
  %lf_env_base = bitcast ptr %0 to ptr
  %lf_env_slot = getelementptr ptr, ptr %lf_env_base, i32 0
  %1 = load ptr, ptr %lf_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %zt_ = ptrtoint ptr %2 to i64
  call void @__asan_load8(i64 %zt_)
  %lf_env_slot1 = getelementptr ptr, ptr %lf_env_base, i32 1
  %3 = load ptr, ptr %lf_env_slot1, align 8
  %4 = bitcast ptr %3 to ptr
  %zt_2 = ptrtoint ptr %4 to i64
  call void @__asan_load8(i64 %zt_2)
  ret void
}

declare void @_Z5spawnjPFvPvES_(i32, ptr, ptr)

define internal void @_spawn_loop_free_func_1_0(ptr %0) {
entry:
  %lf_env_base = bitcast ptr %0 to ptr
  %lf_env_slot = getelementptr ptr, ptr %lf_env_base, i32 0
  %1 = load ptr, ptr %lf_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %zt_ = ptrtoint ptr %2 to i64
  call void @__asan_load8(i64 %zt_)
  %lf_env_slot1 = getelementptr ptr, ptr %lf_env_base, i32 1
  %3 = load ptr, ptr %lf_env_slot1, align 8
  %4 = bitcast ptr %3 to ptr
  %zt_2 = ptrtoint ptr %4 to i64
  call void @__asan_load8(i64 %zt_2)
  ret void
}

define internal void @_spawn_loop_free_func_2_0(ptr %0) {
entry:
  %lf_env_base = bitcast ptr %0 to ptr
  %lf_env_slot = getelementptr ptr, ptr %lf_env_base, i32 0
  %1 = load ptr, ptr %lf_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %zt_ = ptrtoint ptr %2 to i64
  call void @__asan_load8(i64 %zt_)
  ret void
}

define internal void @_spawn_loop_free_func_3_0(ptr %0) {
entry:
  %lf_env_base = bitcast ptr %0 to ptr
  %lf_env_slot = getelementptr ptr, ptr %lf_env_base, i32 0
  %1 = load ptr, ptr %lf_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %zt_ = ptrtoint ptr %2 to i64
  call void @__asan_load8(i64 %zt_)
  ret void
}

define internal void @_spawn_loop_free_func_4_0(ptr %0) {
entry:
  %lf_env_base = bitcast ptr %0 to ptr
  call void @__asan_init()
  call void @__asan_version_mismatch_check_v8()
  %lf_env_slot = getelementptr ptr, ptr %lf_env_base, i32 0
  %1 = load ptr, ptr %lf_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %zt_ = ptrtoint ptr %2 to i64
  %lf_env_slot1 = getelementptr ptr, ptr %lf_env_base, i32 1
  %3 = load ptr, ptr %lf_env_slot1, align 8
  %4 = bitcast ptr %3 to ptr
  %zt_2 = ptrtoint ptr %4 to i64
  %lf_env_slot3 = getelementptr ptr, ptr %lf_env_base, i32 2
  %5 = load ptr, ptr %lf_env_slot3, align 8
  %6 = bitcast ptr %5 to ptr
  %zt_4 = ptrtoint ptr %6 to i64
  call void @__asan_register_elf_globals(i64 %zt_, i64 %zt_2, i64 %zt_4)
  ret void
}

define internal void @_spawn_loop_free_func_5_0(ptr %0) {
entry:
  %lf_env_base = bitcast ptr %0 to ptr
  %lf_env_slot = getelementptr ptr, ptr %lf_env_base, i32 0
  %1 = load ptr, ptr %lf_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %zt_ = ptrtoint ptr %2 to i64
  %lf_env_slot1 = getelementptr ptr, ptr %lf_env_base, i32 1
  %3 = load ptr, ptr %lf_env_slot1, align 8
  %4 = bitcast ptr %3 to ptr
  %zt_2 = ptrtoint ptr %4 to i64
  %lf_env_slot3 = getelementptr ptr, ptr %lf_env_base, i32 2
  %5 = load ptr, ptr %lf_env_slot3, align 8
  %6 = bitcast ptr %5 to ptr
  %zt_4 = ptrtoint ptr %6 to i64
  call void @__asan_unregister_elf_globals(i64 %zt_, i64 %zt_2, i64 %zt_4)
  ret void
}

attributes #0 = { nounwind sanitize_address uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind uwtable }
attributes #8 = { nounwind }
attributes #9 = { nounwind allocsize(0) }
attributes #10 = { cold }

!llvm.module.flags = !{!1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{ptr @.str}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"double", !8, i64 0}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !13, !14}
!16 = distinct !{!16, !13, !14}
!17 = distinct !{!17, !13, !14}
!18 = distinct !{!18, !13, !14}
!19 = distinct !{!19, !13, !14}
!20 = distinct !{!20, !13, !14}
!21 = distinct !{!21, !13, !14}
!22 = distinct !{!22, !13, !14}
!23 = distinct !{!23, !13, !14}
!24 = distinct !{!24, !13, !14}
!25 = distinct !{!25, !13, !14}
!26 = distinct !{!26, !13, !14}
!27 = distinct !{!27, !13, !14}
!28 = distinct !{!28, !13, !14}
!29 = distinct !{!29, !13, !14}
