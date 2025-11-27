; ModuleID = 'ASAN-2mm.ll'
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
  %zyarg_129 = inttoptr i64 %0 to ptr
  %zybc_130 = bitcast ptr %zyarg_129 to ptr
  %lf_spawn_env_malloc131 = call ptr @malloc(i64 8)
  %lf_spawn_slot132 = getelementptr inbounds ptr, ptr %lf_spawn_env_malloc131, i32 0
  store ptr %zybc_130, ptr %lf_spawn_slot132, align 8
  call void @_Z5spawnjPFvPvES_(i32 -547341230, ptr @_spawn_loop_free_func_2_0, ptr %lf_spawn_env_malloc131)
  call void @__asan_load8(i64 %0)
  %1 = load ptr, ptr %arrayidx, align 8, !tbaa !6
  %call.i = tail call i64 @strtol(ptr nocapture noundef nonnull %1, ptr noundef null, i32 noundef 10) #8
  %arrayidx1 = getelementptr inbounds ptr, ptr %argv, i64 2
  %2 = ptrtoint ptr %arrayidx1 to i64
  %zyarg_124 = inttoptr i64 %2 to ptr
  %zybc_125 = bitcast ptr %zyarg_124 to ptr
  call void @__asan_load8(i64 %2)
  %3 = load ptr, ptr %arrayidx1, align 8, !tbaa !6
  %call.i78 = tail call i64 @strtol(ptr nocapture noundef nonnull %3, ptr noundef null, i32 noundef 10) #8
  %conv.i79 = trunc i64 %call.i78 to i32
  %arrayidx3 = getelementptr inbounds ptr, ptr %argv, i64 3
  %4 = ptrtoint ptr %arrayidx3 to i64
  %zyarg_122 = inttoptr i64 %4 to ptr
  %zybc_123 = bitcast ptr %zyarg_122 to ptr
  %lf_spawn_env_malloc126 = call ptr @malloc(i64 16)
  %lf_spawn_slot127 = getelementptr inbounds ptr, ptr %lf_spawn_env_malloc126, i32 0
  store ptr %zybc_123, ptr %lf_spawn_slot127, align 8
  %lf_spawn_slot128 = getelementptr inbounds ptr, ptr %lf_spawn_env_malloc126, i32 1
  store ptr %zybc_125, ptr %lf_spawn_slot128, align 8
  call void @_Z5spawnjPFvPvES_(i32 -1752095921, ptr @_spawn_loop_free_func_1_0, ptr %lf_spawn_env_malloc126)
  call void @__asan_load8(i64 %4)
  %5 = load ptr, ptr %arrayidx3, align 8, !tbaa !6
  %call.i80 = tail call i64 @strtol(ptr nocapture noundef nonnull %5, ptr noundef null, i32 noundef 10) #8
  %conv.i81 = trunc i64 %call.i80 to i32
  %arrayidx5 = getelementptr inbounds ptr, ptr %argv, i64 4
  %6 = ptrtoint ptr %arrayidx5 to i64
  %zyarg_119 = inttoptr i64 %6 to ptr
  %zybc_120 = bitcast ptr %zyarg_119 to ptr
  call void @__asan_load8(i64 %6)
  %7 = load ptr, ptr %arrayidx5, align 8, !tbaa !6
  %call.i82 = tail call i64 @strtol(ptr nocapture noundef nonnull %7, ptr noundef null, i32 noundef 10) #8
  %conv.i83 = trunc i64 %call.i82 to i32
  %arrayidx7 = getelementptr inbounds ptr, ptr %argv, i64 5
  %8 = ptrtoint ptr %arrayidx7 to i64
  %zyarg_ = inttoptr i64 %8 to ptr
  %zybc_ = bitcast ptr %zyarg_ to ptr
  %lf_spawn_env_malloc = call ptr @malloc(i64 16)
  %lf_spawn_slot = getelementptr inbounds ptr, ptr %lf_spawn_env_malloc, i32 0
  store ptr %zybc_, ptr %lf_spawn_slot, align 8
  %lf_spawn_slot121 = getelementptr inbounds ptr, ptr %lf_spawn_env_malloc, i32 1
  store ptr %zybc_120, ptr %lf_spawn_slot121, align 8
  call void @_Z5spawnjPFvPvES_(i32 -1359809123, ptr @_spawn_loop_free_func_0_0, ptr %lf_spawn_env_malloc)
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
  %ya_79 = alloca i64, align 8
  store i64 %wide.trip.count148.i, ptr %ya_79, align 8
  %yy_80 = bitcast ptr %ya_79 to ptr
  %ya_81 = alloca double, align 8
  store double %conv5.i, ptr %ya_81, align 8
  %yy_82 = bitcast ptr %ya_81 to ptr
  %ya_83 = alloca i64, align 8
  store i64 %wide.trip.count.i, ptr %ya_83, align 8
  %yy_84 = bitcast ptr %ya_83 to ptr
  %ya_85 = alloca i64, align 8
  store i64 %10, ptr %ya_85, align 8
  %yy_86 = bitcast ptr %ya_85 to ptr
  %yy_87 = bitcast ptr %call14 to ptr
  %ya_88 = alloca i1, align 1
  store i1 %cmp2128.i, ptr %ya_88, align 1
  %yy_89 = bitcast ptr %ya_88 to ptr
  %cm_spawn_env_malloc90 = call ptr @malloc(i64 48)
  %cm_spawn_slot91 = getelementptr ptr, ptr %cm_spawn_env_malloc90, i32 0
  store ptr %yy_80, ptr %cm_spawn_slot91, align 8
  %cm_spawn_slot92 = getelementptr ptr, ptr %cm_spawn_env_malloc90, i32 1
  store ptr %yy_82, ptr %cm_spawn_slot92, align 8
  %cm_spawn_slot93 = getelementptr ptr, ptr %cm_spawn_env_malloc90, i32 2
  store ptr %yy_84, ptr %cm_spawn_slot93, align 8
  %cm_spawn_slot94 = getelementptr ptr, ptr %cm_spawn_env_malloc90, i32 3
  store ptr %yy_86, ptr %cm_spawn_slot94, align 8
  %cm_spawn_slot95 = getelementptr ptr, ptr %cm_spawn_env_malloc90, i32 4
  store ptr %yy_87, ptr %cm_spawn_slot95, align 8
  %cm_spawn_slot96 = getelementptr ptr, ptr %cm_spawn_env_malloc90, i32 5
  store ptr %yy_89, ptr %cm_spawn_slot96, align 8
  call void @_Z5spawnjPFvPvES_(i32 1055325313, ptr @_spawn_loop_func_34, ptr %cm_spawn_env_malloc90)
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

for.cond11.preheader.i:                           ; preds = %for.inc8.i, %entry
  %cmp12134.i = icmp sgt i32 %conv.i83, 0
  br i1 %cmp12134.i, label %for.cond15.preheader.lr.ph.i, label %for.cond34.preheader.i

for.cond15.preheader.lr.ph.i:                     ; preds = %for.cond11.preheader.i
  %cmp16132.i = icmp sgt i32 %conv.i81, 0
  %conv22.i = sitofp i32 %conv.i81 to double
  %wide.trip.count158.i = and i64 %call.i82, 4294967295
  %ya_ = alloca i64, align 8
  store i64 %wide.trip.count158.i, ptr %ya_, align 8
  %yy_ = bitcast ptr %ya_ to ptr
  %ya_1 = alloca double, align 8
  store double %conv22.i, ptr %ya_1, align 8
  %yy_2 = bitcast ptr %ya_1 to ptr
  %ya_3 = alloca i64, align 8
  store i64 %11, ptr %ya_3, align 8
  %yy_4 = bitcast ptr %ya_3 to ptr
  %yy_5 = bitcast ptr %call18 to ptr
  %ya_6 = alloca i1, align 1
  store i1 %cmp16132.i, ptr %ya_6, align 1
  %yy_7 = bitcast ptr %ya_6 to ptr
  %cm_spawn_env_malloc = call ptr @malloc(i64 40)
  %cm_spawn_slot = getelementptr ptr, ptr %cm_spawn_env_malloc, i32 0
  store ptr %yy_, ptr %cm_spawn_slot, align 8
  %cm_spawn_slot8 = getelementptr ptr, ptr %cm_spawn_env_malloc, i32 1
  store ptr %yy_2, ptr %cm_spawn_slot8, align 8
  %cm_spawn_slot9 = getelementptr ptr, ptr %cm_spawn_env_malloc, i32 2
  store ptr %yy_4, ptr %cm_spawn_slot9, align 8
  %cm_spawn_slot10 = getelementptr ptr, ptr %cm_spawn_env_malloc, i32 3
  store ptr %yy_5, ptr %cm_spawn_slot10, align 8
  %cm_spawn_slot11 = getelementptr ptr, ptr %cm_spawn_env_malloc, i32 4
  store ptr %yy_7, ptr %cm_spawn_slot11, align 8
  call void @_Z5spawnjPFvPvES_(i32 1180195010, ptr @_spawn_loop_func_16, ptr %cm_spawn_env_malloc)
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
  br i1 %exitcond.not.i, label %for.inc8.i, label %for.body3.i, !llvm.loop !12

for.inc8.i:                                       ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.next146.i = add nuw nsw i64 %indvars.iv145.i, 1
  %exitcond149.not.i = icmp eq i64 %indvars.iv.next146.i, %wide.trip.count148.i
  br i1 %exitcond149.not.i, label %for.cond11.preheader.i, label %for.cond1.preheader.i, !llvm.loop !15

for.cond15.preheader.i:                           ; preds = %for.inc31.i, %for.cond15.preheader.lr.ph.i
  %indvars.iv155.i = phi i64 [ 0, %for.cond15.preheader.lr.ph.i ], [ %indvars.iv.next156.i, %for.inc31.i ]
  br i1 %cmp16132.i, label %for.body18.lr.ph.i, label %for.inc31.i

for.body18.lr.ph.i:                               ; preds = %for.cond15.preheader.i
  %16 = trunc i64 %indvars.iv155.i to i32
  %conv19.i = sitofp i32 %16 to double
  %17 = mul nuw nsw i64 %indvars.iv155.i, %11
  %arrayidx25.i = getelementptr inbounds double, ptr %call18, i64 %17
  br label %for.body18.i

for.cond34.preheader.i:                           ; preds = %for.inc31.i, %for.cond11.preheader.i
  %cmp35138.i = icmp sgt i32 %conv.i85, 0
  br i1 %cmp35138.i, label %for.cond38.preheader.lr.ph.i, label %for.cond58.preheader.i

for.cond38.preheader.lr.ph.i:                     ; preds = %for.cond34.preheader.i
  %cmp39136.i = icmp sgt i32 %conv.i81, 0
  %conv46.i = sitofp i32 %conv.i85 to double
  %ya_12 = alloca i64, align 8
  store i64 %10, ptr %ya_12, align 8
  %yy_13 = bitcast ptr %ya_12 to ptr
  %ya_14 = alloca double, align 8
  store double %conv46.i, ptr %ya_14, align 8
  %yy_15 = bitcast ptr %ya_14 to ptr
  %ya_16 = alloca i64, align 8
  store i64 %11, ptr %ya_16, align 8
  %yy_17 = bitcast ptr %ya_16 to ptr
  %yy_18 = bitcast ptr %call22 to ptr
  %ya_19 = alloca i1, align 1
  store i1 %cmp39136.i, ptr %ya_19, align 1
  %yy_20 = bitcast ptr %ya_19 to ptr
  %cm_spawn_env_malloc21 = call ptr @malloc(i64 40)
  %cm_spawn_slot22 = getelementptr ptr, ptr %cm_spawn_env_malloc21, i32 0
  store ptr %yy_13, ptr %cm_spawn_slot22, align 8
  %cm_spawn_slot23 = getelementptr ptr, ptr %cm_spawn_env_malloc21, i32 1
  store ptr %yy_15, ptr %cm_spawn_slot23, align 8
  %cm_spawn_slot24 = getelementptr ptr, ptr %cm_spawn_env_malloc21, i32 2
  store ptr %yy_17, ptr %cm_spawn_slot24, align 8
  %cm_spawn_slot25 = getelementptr ptr, ptr %cm_spawn_env_malloc21, i32 3
  store ptr %yy_18, ptr %cm_spawn_slot25, align 8
  %cm_spawn_slot26 = getelementptr ptr, ptr %cm_spawn_env_malloc21, i32 4
  store ptr %yy_20, ptr %cm_spawn_slot26, align 8
  call void @_Z5spawnjPFvPvES_(i32 -1045780949, ptr @_spawn_loop_func_19, ptr %cm_spawn_env_malloc21)
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
  br i1 %exitcond154.not.i, label %for.inc31.i, label %for.body18.i, !llvm.loop !16

for.inc31.i:                                      ; preds = %for.body18.i, %for.cond15.preheader.i
  %indvars.iv.next156.i = add nuw nsw i64 %indvars.iv155.i, 1
  %exitcond159.not.i = icmp eq i64 %indvars.iv.next156.i, %wide.trip.count158.i
  br i1 %exitcond159.not.i, label %for.cond34.preheader.i, label %for.cond15.preheader.i, !llvm.loop !17

for.cond38.preheader.i:                           ; preds = %for.inc55.i, %for.cond38.preheader.lr.ph.i
  %indvars.iv166.i = phi i64 [ 0, %for.cond38.preheader.lr.ph.i ], [ %indvars.iv.next167.i, %for.inc55.i ]
  br i1 %cmp39136.i, label %for.body41.lr.ph.i, label %for.inc55.i

for.body41.lr.ph.i:                               ; preds = %for.cond38.preheader.i
  %20 = trunc i64 %indvars.iv166.i to i32
  %conv42.i = sitofp i32 %20 to double
  %21 = mul nuw nsw i64 %indvars.iv166.i, %11
  %arrayidx49.i = getelementptr inbounds double, ptr %call22, i64 %21
  br label %for.body41.i

for.cond58.preheader.i:                           ; preds = %for.inc55.i, %for.cond34.preheader.i
  br i1 %cmp130.i, label %for.cond62.preheader.lr.ph.i, label %init_array.exit

for.cond62.preheader.lr.ph.i:                     ; preds = %for.cond58.preheader.i
  %conv70.i = sitofp i32 %conv.i83 to double
  %wide.trip.count180.i = and i64 %call.i78, 4294967295
  %ya_27 = alloca i64, align 8
  store i64 %wide.trip.count180.i, ptr %ya_27, align 8
  %yy_28 = bitcast ptr %ya_27 to ptr
  %ya_29 = alloca double, align 8
  store double %conv70.i, ptr %ya_29, align 8
  %yy_30 = bitcast ptr %ya_29 to ptr
  %ya_31 = alloca i64, align 8
  store i64 %10, ptr %ya_31, align 8
  %yy_32 = bitcast ptr %ya_31 to ptr
  %yy_33 = bitcast ptr %call26 to ptr
  %ya_34 = alloca i1, align 1
  store i1 %cmp35138.i, ptr %ya_34, align 1
  %yy_35 = bitcast ptr %ya_34 to ptr
  %cm_spawn_env_malloc36 = call ptr @malloc(i64 40)
  %cm_spawn_slot37 = getelementptr ptr, ptr %cm_spawn_env_malloc36, i32 0
  store ptr %yy_28, ptr %cm_spawn_slot37, align 8
  %cm_spawn_slot38 = getelementptr ptr, ptr %cm_spawn_env_malloc36, i32 1
  store ptr %yy_30, ptr %cm_spawn_slot38, align 8
  %cm_spawn_slot39 = getelementptr ptr, ptr %cm_spawn_env_malloc36, i32 2
  store ptr %yy_32, ptr %cm_spawn_slot39, align 8
  %cm_spawn_slot40 = getelementptr ptr, ptr %cm_spawn_env_malloc36, i32 3
  store ptr %yy_33, ptr %cm_spawn_slot40, align 8
  %cm_spawn_slot41 = getelementptr ptr, ptr %cm_spawn_env_malloc36, i32 4
  store ptr %yy_35, ptr %cm_spawn_slot41, align 8
  call void @_Z5spawnjPFvPvES_(i32 17774050, ptr @_spawn_loop_func_22, ptr %cm_spawn_env_malloc36)
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
  br i1 %exitcond165.not.i, label %for.inc55.i, label %for.body41.i, !llvm.loop !18

for.inc55.i:                                      ; preds = %for.body41.i, %for.cond38.preheader.i
  %indvars.iv.next167.i = add nuw nsw i64 %indvars.iv166.i, 1
  %exitcond170.not.i = icmp eq i64 %indvars.iv.next167.i, %10
  br i1 %exitcond170.not.i, label %for.cond58.preheader.i, label %for.cond38.preheader.i, !llvm.loop !19

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
  br i1 %exitcond176.not.i, label %for.inc79.i, label %for.body65.i, !llvm.loop !20

for.inc79.i:                                      ; preds = %for.body65.i, %for.cond62.preheader.i
  %indvars.iv.next178.i = add nuw nsw i64 %indvars.iv177.i, 1
  %exitcond181.not.i = icmp eq i64 %indvars.iv.next178.i, %wide.trip.count180.i
  br i1 %exitcond181.not.i, label %init_array.exit, label %for.cond62.preheader.i, !llvm.loop !21

init_array.exit:                                  ; preds = %for.inc79.i, %for.cond58.preheader.i
  %30 = and i64 %call.i82, 4294967295
  br i1 %cmp130.i, label %for.cond1.preheader.lr.ph.i89, label %kernel_2mm.exit

for.cond1.preheader.lr.ph.i89:                    ; preds = %init_array.exit
  %cmp2106.i = icmp sgt i32 %conv.i81, 0
  %wide.trip.count127.i = and i64 %call.i78, 4294967295
  %ya_42 = alloca i64, align 8
  store i64 %11, ptr %ya_42, align 8
  %yy_43 = bitcast ptr %ya_42 to ptr
  %ya_44 = alloca i64, align 8
  store i64 %wide.trip.count127.i, ptr %ya_44, align 8
  %yy_45 = bitcast ptr %ya_44 to ptr
  %yy_46 = bitcast ptr %call18 to ptr
  %ya_47 = alloca i1, align 1
  store i1 %cmp12134.i, ptr %ya_47, align 1
  %yy_48 = bitcast ptr %ya_47 to ptr
  %ya_49 = alloca i64, align 8
  store i64 %30, ptr %ya_49, align 8
  %yy_50 = bitcast ptr %ya_49 to ptr
  %yy_51 = bitcast ptr %call10 to ptr
  %yy_52 = bitcast ptr %call14 to ptr
  %ya_53 = alloca i1, align 1
  store i1 %cmp2106.i, ptr %ya_53, align 1
  %yy_54 = bitcast ptr %ya_53 to ptr
  %cm_spawn_env_malloc55 = call ptr @malloc(i64 64)
  %cm_spawn_slot56 = getelementptr ptr, ptr %cm_spawn_env_malloc55, i32 0
  store ptr %yy_43, ptr %cm_spawn_slot56, align 8
  %cm_spawn_slot57 = getelementptr ptr, ptr %cm_spawn_env_malloc55, i32 1
  store ptr %yy_45, ptr %cm_spawn_slot57, align 8
  %cm_spawn_slot58 = getelementptr ptr, ptr %cm_spawn_env_malloc55, i32 2
  store ptr %yy_46, ptr %cm_spawn_slot58, align 8
  %cm_spawn_slot59 = getelementptr ptr, ptr %cm_spawn_env_malloc55, i32 3
  store ptr %yy_48, ptr %cm_spawn_slot59, align 8
  %cm_spawn_slot60 = getelementptr ptr, ptr %cm_spawn_env_malloc55, i32 4
  store ptr %yy_50, ptr %cm_spawn_slot60, align 8
  %cm_spawn_slot61 = getelementptr ptr, ptr %cm_spawn_env_malloc55, i32 5
  store ptr %yy_51, ptr %cm_spawn_slot61, align 8
  %cm_spawn_slot62 = getelementptr ptr, ptr %cm_spawn_env_malloc55, i32 6
  store ptr %yy_52, ptr %cm_spawn_slot62, align 8
  %cm_spawn_slot63 = getelementptr ptr, ptr %cm_spawn_env_malloc55, i32 7
  store ptr %yy_54, ptr %cm_spawn_slot63, align 8
  call void @_Z5spawnjPFvPvES_(i32 1125486862, ptr @_spawn_loop_func_25, ptr %cm_spawn_env_malloc55)
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
  %ya_97 = alloca i64, align 8
  store i64 %wide.trip.count142.i, ptr %ya_97, align 8
  %yy_98 = bitcast ptr %ya_97 to ptr
  %ya_99 = alloca i64, align 8
  store i64 %10, ptr %ya_99, align 8
  %yy_100 = bitcast ptr %ya_99 to ptr
  %ya_101 = alloca i64, align 8
  store i64 %11, ptr %ya_101, align 8
  %yy_102 = bitcast ptr %ya_101 to ptr
  %yy_103 = bitcast ptr %call22 to ptr
  %ya_104 = alloca i1, align 1
  store i1 %cmp40112.i, ptr %ya_104, align 1
  %yy_105 = bitcast ptr %ya_104 to ptr
  %yy_106 = bitcast ptr %call26 to ptr
  %yy_107 = bitcast ptr %call10 to ptr
  %ya_108 = alloca i1, align 1
  store i1 %cmp35138.i, ptr %ya_108, align 1
  %yy_109 = bitcast ptr %ya_108 to ptr
  %cm_spawn_env_malloc110 = call ptr @malloc(i64 64)
  %cm_spawn_slot111 = getelementptr ptr, ptr %cm_spawn_env_malloc110, i32 0
  store ptr %yy_98, ptr %cm_spawn_slot111, align 8
  %cm_spawn_slot112 = getelementptr ptr, ptr %cm_spawn_env_malloc110, i32 1
  store ptr %yy_100, ptr %cm_spawn_slot112, align 8
  %cm_spawn_slot113 = getelementptr ptr, ptr %cm_spawn_env_malloc110, i32 2
  store ptr %yy_102, ptr %cm_spawn_slot113, align 8
  %cm_spawn_slot114 = getelementptr ptr, ptr %cm_spawn_env_malloc110, i32 3
  store ptr %yy_103, ptr %cm_spawn_slot114, align 8
  %cm_spawn_slot115 = getelementptr ptr, ptr %cm_spawn_env_malloc110, i32 4
  store ptr %yy_105, ptr %cm_spawn_slot115, align 8
  %cm_spawn_slot116 = getelementptr ptr, ptr %cm_spawn_env_malloc110, i32 5
  store ptr %yy_106, ptr %cm_spawn_slot116, align 8
  %cm_spawn_slot117 = getelementptr ptr, ptr %cm_spawn_env_malloc110, i32 6
  store ptr %yy_107, ptr %cm_spawn_slot117, align 8
  %cm_spawn_slot118 = getelementptr ptr, ptr %cm_spawn_env_malloc110, i32 7
  store ptr %yy_109, ptr %cm_spawn_slot118, align 8
  call void @_Z5spawnjPFvPvES_(i32 962217869, ptr @_spawn_loop_func_37, ptr %cm_spawn_env_malloc110)
  br label %for.cond31.preheader.i

for.body3.i93:                                    ; preds = %for.inc22.i, %for.body3.lr.ph.i91
  %indvars.iv119.i = phi i64 [ 0, %for.body3.lr.ph.i91 ], [ %indvars.iv.next120.i, %for.inc22.i ]
  %arrayidx5.i = getelementptr inbounds double, ptr %arrayidx.i92, i64 %indvars.iv119.i
  %33 = ptrtoint ptr %arrayidx5.i to i64
  call void @__asan_store8(i64 %33)
  store double 0.000000e+00, ptr %arrayidx5.i, align 8, !tbaa !10
  %invariant.gep.i = getelementptr inbounds double, ptr %call18, i64 %indvars.iv119.i
  br i1 %cmp12134.i, label %for.body8.i, label %for.inc22.i

for.body8.i:                                      ; preds = %for.body8.i, %for.body3.i93
  %indvars.iv.i95 = phi i64 [ %indvars.iv.next.i97, %for.body8.i ], [ 0, %for.body3.i93 ]
  %34 = phi double [ %40, %for.body8.i ], [ 0.000000e+00, %for.body3.i93 ]
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
  %41 = ptrtoint ptr %arrayidx5.i to i64
  call void @__asan_store8(i64 %41)
  store double %40, ptr %arrayidx5.i, align 8, !tbaa !10
  br label %for.inc22.i

for.inc22.i:                                      ; preds = %for.inc22.i.loopexit, %for.body3.i93
  %indvars.iv.next120.i = add nuw nsw i64 %indvars.iv119.i, 1
  %exitcond123.not.i = icmp eq i64 %indvars.iv.next120.i, %11
  br i1 %exitcond123.not.i, label %for.inc25.i, label %for.body3.i93, !llvm.loop !23

for.inc25.i:                                      ; preds = %for.inc22.i, %for.cond1.preheader.i90
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
  br i1 %cmp40112.i, label %for.body41.i88, label %for.inc58.i

for.body41.i88:                                   ; preds = %for.body41.i88, %for.body33.i
  %indvars.iv129.i = phi i64 [ %indvars.iv.next130.i, %for.body41.i88 ], [ 0, %for.body33.i ]
  %46 = phi double [ %52, %for.body41.i88 ], [ %mul38.i, %for.body33.i ]
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
  %53 = ptrtoint ptr %arrayidx37.i to i64
  call void @__asan_store8(i64 %53)
  store double %52, ptr %arrayidx37.i, align 8, !tbaa !10
  br label %for.inc58.i

for.inc58.i:                                      ; preds = %for.inc58.i.loopexit, %for.body33.i
  %indvars.iv.next135.i = add nuw nsw i64 %indvars.iv134.i, 1
  %exitcond138.not.i = icmp eq i64 %indvars.iv.next135.i, %10
  br i1 %exitcond138.not.i, label %for.inc61.i, label %for.body33.i, !llvm.loop !26

for.inc61.i:                                      ; preds = %for.inc58.i, %for.cond31.preheader.i
  %indvars.iv.next140.i = add nuw nsw i64 %indvars.iv139.i, 1
  %exitcond143.not.i = icmp eq i64 %indvars.iv.next140.i, %wide.trip.count142.i
  br i1 %exitcond143.not.i, label %kernel_2mm.exit, label %for.cond31.preheader.i, !llvm.loop !27

kernel_2mm.exit:                                  ; preds = %for.inc61.i, %for.cond28.preheader.i, %init_array.exit
  %54 = and i64 %call.i, 4294967295
  %cmp = icmp eq i64 %54, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %kernel_2mm.exit
  br i1 %cmp130.i, label %for.cond1.preheader.lr.ph.i99, label %print_array.exit

for.cond1.preheader.lr.ph.i99:                    ; preds = %if.then
  %wide.trip.count30.i = and i64 %call.i78, 4294967295
  %ya_64 = alloca i64, align 8
  store i64 %wide.trip.count30.i, ptr %ya_64, align 8
  %yy_65 = bitcast ptr %ya_64 to ptr
  %ya_66 = alloca i64, align 8
  store i64 %10, ptr %ya_66, align 8
  %yy_67 = bitcast ptr %ya_66 to ptr
  %yy_68 = bitcast ptr %call26 to ptr
  %ya_69 = alloca i32, align 4
  store i32 %conv.i79, ptr %ya_69, align 4
  %yy_70 = bitcast ptr %ya_69 to ptr
  %ya_71 = alloca i1, align 1
  store i1 %cmp35138.i, ptr %ya_71, align 1
  %yy_72 = bitcast ptr %ya_71 to ptr
  %cm_spawn_env_malloc73 = call ptr @malloc(i64 40)
  %cm_spawn_slot74 = getelementptr ptr, ptr %cm_spawn_env_malloc73, i32 0
  store ptr %yy_65, ptr %cm_spawn_slot74, align 8
  %cm_spawn_slot75 = getelementptr ptr, ptr %cm_spawn_env_malloc73, i32 1
  store ptr %yy_67, ptr %cm_spawn_slot75, align 8
  %cm_spawn_slot76 = getelementptr ptr, ptr %cm_spawn_env_malloc73, i32 2
  store ptr %yy_68, ptr %cm_spawn_slot76, align 8
  %cm_spawn_slot77 = getelementptr ptr, ptr %cm_spawn_env_malloc73, i32 3
  store ptr %yy_70, ptr %cm_spawn_slot77, align 8
  %cm_spawn_slot78 = getelementptr ptr, ptr %cm_spawn_env_malloc73, i32 4
  store ptr %yy_72, ptr %cm_spawn_slot78, align 8
  call void @_Z5spawnjPFvPvES_(i32 1048355326, ptr @_spawn_loop_func_31, ptr %cm_spawn_env_malloc73)
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
  br i1 %exitcond.not.i111, label %for.inc8.i101, label %for.body3.i106, !llvm.loop !28

for.inc8.i101:                                    ; preds = %for.inc.i, %for.cond1.preheader.i100
  %indvars.iv.next28.i = add nuw nsw i64 %indvars.iv27.i, 1
  %exitcond31.not.i = icmp eq i64 %indvars.iv.next28.i, %wide.trip.count30.i
  br i1 %exitcond31.not.i, label %print_array.exit, label %for.cond1.preheader.i100, !llvm.loop !29

print_array.exit:                                 ; preds = %for.inc8.i101, %if.then
  %zyarg_133 = inttoptr i64 ptrtoint (ptr @stderr to i64) to ptr
  %zybc_134 = bitcast ptr %zyarg_133 to ptr
  %lf_spawn_env_malloc135 = call ptr @malloc(i64 8)
  %lf_spawn_slot136 = getelementptr inbounds ptr, ptr %lf_spawn_env_malloc135, i32 0
  store ptr %zybc_134, ptr %lf_spawn_slot136, align 8
  call void @_Z5spawnjPFvPvES_(i32 -959428996, ptr @_spawn_loop_free_func_3_0, ptr %lf_spawn_env_malloc135)
  call void @__asan_load8(i64 ptrtoint (ptr @stderr to i64))
  %62 = load ptr, ptr @stderr, align 8, !tbaa !6
  %fputc.i = tail call i32 @fputc(i32 10, ptr %62)
  br label %if.end

if.end:                                           ; preds = %print_array.exit, %kernel_2mm.exit
  call void @_Z4joinj(i32 1180195010)
  call void @_Z4joinj(i32 -1045780949)
  call void @_Z4joinj(i32 17774050)
  call void @_Z4joinj(i32 1125486862)
  call void @_Z4joinj(i32 1048355326)
  call void @_Z4joinj(i32 1055325313)
  call void @_Z4joinj(i32 962217869)
  call void @_Z4joinj(i32 -1359809123)
  call void @_Z4joinj(i32 -1752095921)
  call void @_Z4joinj(i32 -547341230)
  call void @_Z4joinj(i32 -959428996)
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
  call void @__asan_init()
  call void @__asan_version_mismatch_check_v8()
  call void @__asan_register_elf_globals(i64 ptrtoint (ptr @___asan_globals_registered to i64), i64 ptrtoint (ptr @__start_asan_globals to i64), i64 ptrtoint (ptr @__stop_asan_globals to i64))
  ret void
}

declare void @__asan_version_mismatch_check_v8()

; Function Attrs: nounwind uwtable
define internal void @asan.module_dtor() #7 comdat {
  call void @__asan_unregister_elf_globals(i64 ptrtoint (ptr @___asan_globals_registered to i64), i64 ptrtoint (ptr @__start_asan_globals to i64), i64 ptrtoint (ptr @__stop_asan_globals to i64))
  ret void
}

declare void @_Z4joinj(i32)

define internal void @_loop_func_16(i64 %wide.trip.count158.i, double %conv22.i, i64 %0, ptr %call18, i1 %cmp16132.i) {
entry:
  %1 = bitcast i64 %wide.trip.count158.i to i64
  %2 = bitcast double %conv22.i to double
  %3 = bitcast i64 %0 to i64
  %4 = bitcast ptr %call18 to ptr
  %5 = bitcast i1 %cmp16132.i to i1
  br label %for.cond15.preheader.i

for.inc31.i:                                      ; preds = %for.cond15.preheader.i, %for.body18.i
  %6 = add nuw nsw i64 %21, 1
  %7 = icmp eq i64 %6, %1
  br i1 %7, label %exit, label %for.cond15.preheader.i, !llvm.loop !17

for.body18.i:                                     ; preds = %for.body18.lr.ph.i, %for.body18.i
  %8 = phi i64 [ 0, %for.body18.lr.ph.i ], [ %9, %for.body18.i ]
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %18, %11
  %13 = fdiv double %12, %2
  %14 = getelementptr inbounds double, ptr %20, i64 %8
  %15 = ptrtoint ptr %14 to i64
  call void @__asan_store8(i64 %15)
  store double %13, ptr %14, align 8, !tbaa !10
  %16 = icmp eq i64 %9, %3
  br i1 %16, label %for.inc31.i, label %for.body18.i, !llvm.loop !16

for.body18.lr.ph.i:                               ; preds = %for.cond15.preheader.i
  %17 = trunc i64 %21 to i32
  %18 = sitofp i32 %17 to double
  %19 = mul nuw nsw i64 %21, %3
  %20 = getelementptr inbounds double, ptr %4, i64 %19
  br label %for.body18.i

for.cond15.preheader.i:                           ; preds = %entry, %for.inc31.i
  %21 = phi i64 [ 0, %entry ], [ %6, %for.inc31.i ]
  br i1 %5, label %for.body18.lr.ph.i, label %for.inc31.i

exit:                                             ; preds = %for.inc31.i
  ret void
}

define internal void @_spawn_loop_func_16(ptr %0) {
entry:
  %cm_env_base = bitcast ptr %0 to ptr
  %cm_env_slot = getelementptr ptr, ptr %cm_env_base, i32 0
  %1 = load ptr, ptr %cm_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %3 = load i64, ptr %2, align 8
  %cm_env_slot1 = getelementptr ptr, ptr %cm_env_base, i32 1
  %4 = load ptr, ptr %cm_env_slot1, align 8
  %5 = bitcast ptr %4 to ptr
  %6 = load double, ptr %5, align 8
  %cm_env_slot2 = getelementptr ptr, ptr %cm_env_base, i32 2
  %7 = load ptr, ptr %cm_env_slot2, align 8
  %8 = bitcast ptr %7 to ptr
  %9 = load i64, ptr %8, align 8
  %cm_env_slot3 = getelementptr ptr, ptr %cm_env_base, i32 3
  %10 = load ptr, ptr %cm_env_slot3, align 8
  %11 = bitcast ptr %10 to ptr
  %cm_env_slot4 = getelementptr ptr, ptr %cm_env_base, i32 4
  %12 = load ptr, ptr %cm_env_slot4, align 8
  %13 = bitcast ptr %12 to ptr
  %14 = load i1, ptr %13, align 1
  call void @_loop_func_16(i64 %3, double %6, i64 %9, ptr %11, i1 %14)
  call void @free(ptr %0)
  ret void
}

declare void @_Z5spawnjPFvPvES_(i32, ptr, ptr)

define internal void @_loop_func_19(i64 %0, double %conv46.i, i64 %1, ptr %call22, i1 %cmp39136.i) {
entry:
  %2 = bitcast i64 %0 to i64
  %3 = bitcast double %conv46.i to double
  %4 = bitcast i64 %1 to i64
  %5 = bitcast ptr %call22 to ptr
  %6 = bitcast i1 %cmp39136.i to i1
  br label %for.cond38.preheader.i

for.inc55.i:                                      ; preds = %for.cond38.preheader.i, %for.body41.i
  %7 = add nuw nsw i64 %23, 1
  %8 = icmp eq i64 %7, %2
  br i1 %8, label %exit, label %for.cond38.preheader.i, !llvm.loop !19

for.body41.i:                                     ; preds = %for.body41.lr.ph.i, %for.body41.i
  %9 = phi i64 [ 0, %for.body41.lr.ph.i ], [ %17, %for.body41.i ]
  %10 = trunc i64 %9 to i32
  %11 = add i32 %10, 3
  %12 = sitofp i32 %11 to double
  %13 = fmul double %20, %12
  %14 = fdiv double %13, %3
  %15 = getelementptr inbounds double, ptr %22, i64 %9
  %16 = ptrtoint ptr %15 to i64
  call void @__asan_store8(i64 %16)
  store double %14, ptr %15, align 8, !tbaa !10
  %17 = add nuw nsw i64 %9, 1
  %18 = icmp eq i64 %17, %4
  br i1 %18, label %for.inc55.i, label %for.body41.i, !llvm.loop !18

for.body41.lr.ph.i:                               ; preds = %for.cond38.preheader.i
  %19 = trunc i64 %23 to i32
  %20 = sitofp i32 %19 to double
  %21 = mul nuw nsw i64 %23, %4
  %22 = getelementptr inbounds double, ptr %5, i64 %21
  br label %for.body41.i

for.cond38.preheader.i:                           ; preds = %entry, %for.inc55.i
  %23 = phi i64 [ 0, %entry ], [ %7, %for.inc55.i ]
  br i1 %6, label %for.body41.lr.ph.i, label %for.inc55.i

exit:                                             ; preds = %for.inc55.i
  ret void
}

define internal void @_spawn_loop_func_19(ptr %0) {
entry:
  %cm_env_base = bitcast ptr %0 to ptr
  %cm_env_slot = getelementptr ptr, ptr %cm_env_base, i32 0
  %1 = load ptr, ptr %cm_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %3 = load i64, ptr %2, align 8
  %cm_env_slot1 = getelementptr ptr, ptr %cm_env_base, i32 1
  %4 = load ptr, ptr %cm_env_slot1, align 8
  %5 = bitcast ptr %4 to ptr
  %6 = load double, ptr %5, align 8
  %cm_env_slot2 = getelementptr ptr, ptr %cm_env_base, i32 2
  %7 = load ptr, ptr %cm_env_slot2, align 8
  %8 = bitcast ptr %7 to ptr
  %9 = load i64, ptr %8, align 8
  %cm_env_slot3 = getelementptr ptr, ptr %cm_env_base, i32 3
  %10 = load ptr, ptr %cm_env_slot3, align 8
  %11 = bitcast ptr %10 to ptr
  %cm_env_slot4 = getelementptr ptr, ptr %cm_env_base, i32 4
  %12 = load ptr, ptr %cm_env_slot4, align 8
  %13 = bitcast ptr %12 to ptr
  %14 = load i1, ptr %13, align 1
  call void @_loop_func_19(i64 %3, double %6, i64 %9, ptr %11, i1 %14)
  call void @free(ptr %0)
  ret void
}

define internal void @_loop_func_22(i64 %wide.trip.count180.i, double %conv70.i, i64 %0, ptr %call26, i1 %cmp35138.i) {
entry:
  %1 = bitcast i64 %wide.trip.count180.i to i64
  %2 = bitcast double %conv70.i to double
  %3 = bitcast i64 %0 to i64
  %4 = bitcast ptr %call26 to ptr
  %5 = bitcast i1 %cmp35138.i to i1
  br label %for.cond62.preheader.i

for.inc79.i:                                      ; preds = %for.cond62.preheader.i, %for.body65.i
  %6 = add nuw nsw i64 %22, 1
  %7 = icmp eq i64 %6, %1
  br i1 %7, label %exit, label %for.cond62.preheader.i, !llvm.loop !21

for.body65.i:                                     ; preds = %for.body65.lr.ph.i, %for.body65.i
  %8 = phi i64 [ 0, %for.body65.lr.ph.i ], [ %16, %for.body65.i ]
  %9 = trunc i64 %8 to i32
  %10 = add i32 %9, 2
  %11 = sitofp i32 %10 to double
  %12 = fmul double %19, %11
  %13 = fdiv double %12, %2
  %14 = getelementptr inbounds double, ptr %21, i64 %8
  %15 = ptrtoint ptr %14 to i64
  call void @__asan_store8(i64 %15)
  store double %13, ptr %14, align 8, !tbaa !10
  %16 = add nuw nsw i64 %8, 1
  %17 = icmp eq i64 %16, %3
  br i1 %17, label %for.inc79.i, label %for.body65.i, !llvm.loop !20

for.body65.lr.ph.i:                               ; preds = %for.cond62.preheader.i
  %18 = trunc i64 %22 to i32
  %19 = sitofp i32 %18 to double
  %20 = mul nuw nsw i64 %22, %3
  %21 = getelementptr inbounds double, ptr %4, i64 %20
  br label %for.body65.i

for.cond62.preheader.i:                           ; preds = %entry, %for.inc79.i
  %22 = phi i64 [ 0, %entry ], [ %6, %for.inc79.i ]
  br i1 %5, label %for.body65.lr.ph.i, label %for.inc79.i

exit:                                             ; preds = %for.inc79.i
  ret void
}

define internal void @_spawn_loop_func_22(ptr %0) {
entry:
  %cm_env_base = bitcast ptr %0 to ptr
  %cm_env_slot = getelementptr ptr, ptr %cm_env_base, i32 0
  %1 = load ptr, ptr %cm_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %3 = load i64, ptr %2, align 8
  %cm_env_slot1 = getelementptr ptr, ptr %cm_env_base, i32 1
  %4 = load ptr, ptr %cm_env_slot1, align 8
  %5 = bitcast ptr %4 to ptr
  %6 = load double, ptr %5, align 8
  %cm_env_slot2 = getelementptr ptr, ptr %cm_env_base, i32 2
  %7 = load ptr, ptr %cm_env_slot2, align 8
  %8 = bitcast ptr %7 to ptr
  %9 = load i64, ptr %8, align 8
  %cm_env_slot3 = getelementptr ptr, ptr %cm_env_base, i32 3
  %10 = load ptr, ptr %cm_env_slot3, align 8
  %11 = bitcast ptr %10 to ptr
  %cm_env_slot4 = getelementptr ptr, ptr %cm_env_base, i32 4
  %12 = load ptr, ptr %cm_env_slot4, align 8
  %13 = bitcast ptr %12 to ptr
  %14 = load i1, ptr %13, align 1
  call void @_loop_func_22(i64 %3, double %6, i64 %9, ptr %11, i1 %14)
  call void @free(ptr %0)
  ret void
}

define internal void @_loop_func_25(i64 %0, i64 %wide.trip.count127.i, ptr %call18, i1 %cmp12134.i, i64 %1, ptr %call10, ptr %call14, i1 %cmp2106.i) {
entry:
  %2 = bitcast i64 %0 to i64
  %3 = bitcast i64 %wide.trip.count127.i to i64
  %4 = bitcast ptr %call18 to ptr
  %5 = bitcast i1 %cmp12134.i to i1
  %6 = bitcast i64 %1 to i64
  %7 = bitcast ptr %call10 to ptr
  %8 = bitcast ptr %call14 to ptr
  %9 = bitcast i1 %cmp2106.i to i1
  br label %for.cond1.preheader.i90

for.inc22.i:                                      ; preds = %for.body3.i93, %for.inc22.i.loopexit
  %10 = add nuw nsw i64 %15, 1
  %11 = icmp eq i64 %10, %2
  br i1 %11, label %for.inc25.i, label %for.body3.i93, !llvm.loop !23

for.inc25.i:                                      ; preds = %for.cond1.preheader.i90, %for.inc22.i
  %12 = add nuw nsw i64 %36, 1
  %13 = icmp eq i64 %12, %3
  br i1 %13, label %exit, label %for.cond1.preheader.i90, !llvm.loop !24

for.inc22.i.loopexit:                             ; preds = %for.body8.i
  %14 = ptrtoint ptr %16 to i64
  call void @__asan_store8(i64 %14)
  store double %29, ptr %16, align 8, !tbaa !10
  br label %for.inc22.i

for.body3.i93:                                    ; preds = %for.body3.lr.ph.i91, %for.inc22.i
  %15 = phi i64 [ 0, %for.body3.lr.ph.i91 ], [ %10, %for.inc22.i ]
  %16 = getelementptr inbounds double, ptr %33, i64 %15
  %17 = ptrtoint ptr %16 to i64
  call void @__asan_store8(i64 %17)
  store double 0.000000e+00, ptr %16, align 8, !tbaa !10
  %18 = getelementptr inbounds double, ptr %4, i64 %15
  br i1 %5, label %for.body8.i, label %for.inc22.i

for.body8.i:                                      ; preds = %for.body8.i, %for.body3.i93
  %19 = phi i64 [ %30, %for.body8.i ], [ 0, %for.body3.i93 ]
  %20 = phi double [ %29, %for.body8.i ], [ 0.000000e+00, %for.body3.i93 ]
  %21 = getelementptr inbounds double, ptr %35, i64 %19
  %22 = ptrtoint ptr %21 to i64
  call void @__asan_load8(i64 %22)
  %23 = load double, ptr %21, align 8, !tbaa !10
  %24 = fmul double %23, 3.241200e+04
  %25 = mul nuw nsw i64 %19, %2
  %26 = getelementptr inbounds double, ptr %18, i64 %25
  %27 = ptrtoint ptr %26 to i64
  call void @__asan_load8(i64 %27)
  %28 = load double, ptr %26, align 8, !tbaa !10
  %29 = tail call double @llvm.fmuladd.f64(double %24, double %28, double %20)
  %30 = add nuw nsw i64 %19, 1
  %31 = icmp eq i64 %30, %6
  br i1 %31, label %for.inc22.i.loopexit, label %for.body8.i, !llvm.loop !22

for.body3.lr.ph.i91:                              ; preds = %for.cond1.preheader.i90
  %32 = mul nuw nsw i64 %36, %2
  %33 = getelementptr inbounds double, ptr %7, i64 %32
  %34 = mul nuw nsw i64 %36, %6
  %35 = getelementptr inbounds double, ptr %8, i64 %34
  br label %for.body3.i93

for.cond1.preheader.i90:                          ; preds = %entry, %for.inc25.i
  %36 = phi i64 [ 0, %entry ], [ %12, %for.inc25.i ]
  br i1 %9, label %for.body3.lr.ph.i91, label %for.inc25.i

exit:                                             ; preds = %for.inc25.i
  ret void
}

define internal void @_spawn_loop_func_25(ptr %0) {
entry:
  %cm_env_base = bitcast ptr %0 to ptr
  %cm_env_slot = getelementptr ptr, ptr %cm_env_base, i32 0
  %1 = load ptr, ptr %cm_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %3 = load i64, ptr %2, align 8
  %cm_env_slot1 = getelementptr ptr, ptr %cm_env_base, i32 1
  %4 = load ptr, ptr %cm_env_slot1, align 8
  %5 = bitcast ptr %4 to ptr
  %6 = load i64, ptr %5, align 8
  %cm_env_slot2 = getelementptr ptr, ptr %cm_env_base, i32 2
  %7 = load ptr, ptr %cm_env_slot2, align 8
  %8 = bitcast ptr %7 to ptr
  %cm_env_slot3 = getelementptr ptr, ptr %cm_env_base, i32 3
  %9 = load ptr, ptr %cm_env_slot3, align 8
  %10 = bitcast ptr %9 to ptr
  %11 = load i1, ptr %10, align 1
  %cm_env_slot4 = getelementptr ptr, ptr %cm_env_base, i32 4
  %12 = load ptr, ptr %cm_env_slot4, align 8
  %13 = bitcast ptr %12 to ptr
  %14 = load i64, ptr %13, align 8
  %cm_env_slot5 = getelementptr ptr, ptr %cm_env_base, i32 5
  %15 = load ptr, ptr %cm_env_slot5, align 8
  %16 = bitcast ptr %15 to ptr
  %cm_env_slot6 = getelementptr ptr, ptr %cm_env_base, i32 6
  %17 = load ptr, ptr %cm_env_slot6, align 8
  %18 = bitcast ptr %17 to ptr
  %cm_env_slot7 = getelementptr ptr, ptr %cm_env_base, i32 7
  %19 = load ptr, ptr %cm_env_slot7, align 8
  %20 = bitcast ptr %19 to ptr
  %21 = load i1, ptr %20, align 1
  call void @_loop_func_25(i64 %3, i64 %6, ptr %8, i1 %11, i64 %14, ptr %16, ptr %18, i1 %21)
  call void @free(ptr %0)
  ret void
}

define internal void @_loop_func_31(i64 %wide.trip.count30.i, i64 %0, ptr %call26, i32 %conv.i79, i1 %cmp35138.i) {
entry:
  %1 = bitcast i64 %wide.trip.count30.i to i64
  %2 = bitcast i64 %0 to i64
  %3 = bitcast ptr %call26 to ptr
  %4 = bitcast i32 %conv.i79 to i32
  %5 = bitcast i1 %cmp35138.i to i1
  br label %for.cond1.preheader.i100

for.inc8.i101:                                    ; preds = %for.cond1.preheader.i100, %for.inc.i
  %6 = add nuw nsw i64 %26, 1
  %7 = icmp eq i64 %6, %1
  br i1 %7, label %exit, label %for.cond1.preheader.i100, !llvm.loop !29

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i106
  %8 = add nuw nsw i64 %10, 1
  %9 = icmp eq i64 %8, %2
  br i1 %9, label %for.inc8.i101, label %for.body3.i106, !llvm.loop !28

for.body3.i106:                                   ; preds = %for.body3.lr.ph.i102, %for.inc.i
  %10 = phi i64 [ 0, %for.body3.lr.ph.i102 ], [ %8, %for.inc.i ]
  call void @__asan_load8(i64 ptrtoint (ptr @stderr to i64))
  %11 = load ptr, ptr @stderr, align 8, !tbaa !6
  %12 = getelementptr inbounds double, ptr %21, i64 %10
  %13 = ptrtoint ptr %12 to i64
  call void @__asan_load8(i64 %13)
  %14 = load double, ptr %12, align 8, !tbaa !10
  %15 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef nonnull @.str, double noundef %14) #10
  %16 = trunc i64 %10 to i32
  %17 = add nsw i32 %23, %16
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %if.then.i, label %for.inc.i

for.body3.lr.ph.i102:                             ; preds = %for.cond1.preheader.i100
  %20 = mul nuw nsw i64 %26, %2
  %21 = getelementptr inbounds double, ptr %3, i64 %20
  %22 = trunc i64 %26 to i32
  %23 = mul nsw i32 %22, %4
  br label %for.body3.i106

if.then.i:                                        ; preds = %for.body3.i106
  call void @__asan_load8(i64 ptrtoint (ptr @stderr to i64))
  %24 = load ptr, ptr @stderr, align 8, !tbaa !6
  %25 = tail call i32 @fputc(i32 10, ptr %24)
  br label %for.inc.i

for.cond1.preheader.i100:                         ; preds = %entry, %for.inc8.i101
  %26 = phi i64 [ 0, %entry ], [ %6, %for.inc8.i101 ]
  br i1 %5, label %for.body3.lr.ph.i102, label %for.inc8.i101

exit:                                             ; preds = %for.inc8.i101
  ret void
}

define internal void @_spawn_loop_func_31(ptr %0) {
entry:
  %cm_env_base = bitcast ptr %0 to ptr
  %cm_env_slot = getelementptr ptr, ptr %cm_env_base, i32 0
  %1 = load ptr, ptr %cm_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %3 = load i64, ptr %2, align 8
  %cm_env_slot1 = getelementptr ptr, ptr %cm_env_base, i32 1
  %4 = load ptr, ptr %cm_env_slot1, align 8
  %5 = bitcast ptr %4 to ptr
  %6 = load i64, ptr %5, align 8
  %cm_env_slot2 = getelementptr ptr, ptr %cm_env_base, i32 2
  %7 = load ptr, ptr %cm_env_slot2, align 8
  %8 = bitcast ptr %7 to ptr
  %cm_env_slot3 = getelementptr ptr, ptr %cm_env_base, i32 3
  %9 = load ptr, ptr %cm_env_slot3, align 8
  %10 = bitcast ptr %9 to ptr
  %11 = load i32, ptr %10, align 4
  %cm_env_slot4 = getelementptr ptr, ptr %cm_env_base, i32 4
  %12 = load ptr, ptr %cm_env_slot4, align 8
  %13 = bitcast ptr %12 to ptr
  %14 = load i1, ptr %13, align 1
  call void @_loop_func_31(i64 %3, i64 %6, ptr %8, i32 %11, i1 %14)
  call void @free(ptr %0)
  ret void
}

define internal void @_loop_func_34(i64 %wide.trip.count148.i, double %conv5.i, i64 %wide.trip.count.i, i64 %0, ptr %call14, i1 %cmp2128.i) {
entry:
  %1 = bitcast i64 %wide.trip.count148.i to i64
  %2 = bitcast double %conv5.i to double
  %3 = bitcast i64 %wide.trip.count.i to i64
  %4 = bitcast i64 %0 to i64
  %5 = bitcast ptr %call14 to ptr
  %6 = bitcast i1 %cmp2128.i to i1
  br label %for.cond1.preheader.i

for.inc8.i:                                       ; preds = %for.cond1.preheader.i, %for.body3.i
  %7 = add nuw nsw i64 %22, 1
  %8 = icmp eq i64 %7, %1
  br i1 %8, label %exit, label %for.cond1.preheader.i, !llvm.loop !15

for.body3.i:                                      ; preds = %for.body3.lr.ph.i, %for.body3.i
  %9 = phi i64 [ 0, %for.body3.lr.ph.i ], [ %16, %for.body3.i ]
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %19, %11
  %13 = fdiv double %12, %2
  %14 = getelementptr inbounds double, ptr %21, i64 %9
  %15 = ptrtoint ptr %14 to i64
  call void @__asan_store8(i64 %15)
  store double %13, ptr %14, align 8, !tbaa !10
  %16 = add nuw nsw i64 %9, 1
  %17 = icmp eq i64 %16, %3
  br i1 %17, label %for.inc8.i, label %for.body3.i, !llvm.loop !12

for.body3.lr.ph.i:                                ; preds = %for.cond1.preheader.i
  %18 = trunc i64 %22 to i32
  %19 = sitofp i32 %18 to double
  %20 = mul nuw nsw i64 %22, %4
  %21 = getelementptr inbounds double, ptr %5, i64 %20
  br label %for.body3.i

for.cond1.preheader.i:                            ; preds = %entry, %for.inc8.i
  %22 = phi i64 [ 0, %entry ], [ %7, %for.inc8.i ]
  br i1 %6, label %for.body3.lr.ph.i, label %for.inc8.i

exit:                                             ; preds = %for.inc8.i
  ret void
}

define internal void @_spawn_loop_func_34(ptr %0) {
entry:
  %cm_env_base = bitcast ptr %0 to ptr
  %cm_env_slot = getelementptr ptr, ptr %cm_env_base, i32 0
  %1 = load ptr, ptr %cm_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %3 = load i64, ptr %2, align 8
  %cm_env_slot1 = getelementptr ptr, ptr %cm_env_base, i32 1
  %4 = load ptr, ptr %cm_env_slot1, align 8
  %5 = bitcast ptr %4 to ptr
  %6 = load double, ptr %5, align 8
  %cm_env_slot2 = getelementptr ptr, ptr %cm_env_base, i32 2
  %7 = load ptr, ptr %cm_env_slot2, align 8
  %8 = bitcast ptr %7 to ptr
  %9 = load i64, ptr %8, align 8
  %cm_env_slot3 = getelementptr ptr, ptr %cm_env_base, i32 3
  %10 = load ptr, ptr %cm_env_slot3, align 8
  %11 = bitcast ptr %10 to ptr
  %12 = load i64, ptr %11, align 8
  %cm_env_slot4 = getelementptr ptr, ptr %cm_env_base, i32 4
  %13 = load ptr, ptr %cm_env_slot4, align 8
  %14 = bitcast ptr %13 to ptr
  %cm_env_slot5 = getelementptr ptr, ptr %cm_env_base, i32 5
  %15 = load ptr, ptr %cm_env_slot5, align 8
  %16 = bitcast ptr %15 to ptr
  %17 = load i1, ptr %16, align 1
  call void @_loop_func_34(i64 %3, double %6, i64 %9, i64 %12, ptr %14, i1 %17)
  call void @free(ptr %0)
  ret void
}

define internal void @_loop_func_37(i64 %wide.trip.count142.i, i64 %0, i64 %1, ptr %call22, i1 %cmp40112.i, ptr %call26, ptr %call10, i1 %cmp35138.i) {
entry:
  %2 = bitcast i64 %wide.trip.count142.i to i64
  %3 = bitcast i64 %0 to i64
  %4 = bitcast i64 %1 to i64
  %5 = bitcast ptr %call22 to ptr
  %6 = bitcast i1 %cmp40112.i to i1
  %7 = bitcast ptr %call26 to ptr
  %8 = bitcast ptr %call10 to ptr
  %9 = bitcast i1 %cmp35138.i to i1
  br label %for.cond31.preheader.i

for.inc61.i:                                      ; preds = %for.cond31.preheader.i, %for.inc58.i
  %10 = add nuw nsw i64 %37, 1
  %11 = icmp eq i64 %10, %2
  br i1 %11, label %exit, label %for.cond31.preheader.i, !llvm.loop !27

for.inc58.i:                                      ; preds = %for.body33.i, %for.inc58.i.loopexit
  %12 = add nuw nsw i64 %27, 1
  %13 = icmp eq i64 %12, %3
  br i1 %13, label %for.inc61.i, label %for.body33.i, !llvm.loop !26

for.body41.i88:                                   ; preds = %for.body33.i, %for.body41.i88
  %14 = phi i64 [ %24, %for.body41.i88 ], [ 0, %for.body33.i ]
  %15 = phi double [ %23, %for.body41.i88 ], [ %31, %for.body33.i ]
  %16 = getelementptr inbounds double, ptr %36, i64 %14
  %17 = ptrtoint ptr %16 to i64
  call void @__asan_load8(i64 %17)
  %18 = load double, ptr %16, align 8, !tbaa !10
  %19 = mul nuw nsw i64 %14, %4
  %20 = getelementptr inbounds double, ptr %32, i64 %19
  %21 = ptrtoint ptr %20 to i64
  call void @__asan_load8(i64 %21)
  %22 = load double, ptr %20, align 8, !tbaa !10
  %23 = tail call double @llvm.fmuladd.f64(double %18, double %22, double %15)
  %24 = add nuw nsw i64 %14, 1
  %25 = icmp eq i64 %24, %4
  br i1 %25, label %for.inc58.i.loopexit, label %for.body41.i88, !llvm.loop !25

for.inc58.i.loopexit:                             ; preds = %for.body41.i88
  %26 = ptrtoint ptr %28 to i64
  call void @__asan_store8(i64 %26)
  store double %23, ptr %28, align 8, !tbaa !10
  br label %for.inc58.i

for.body33.i:                                     ; preds = %for.body33.lr.ph.i, %for.inc58.i
  %27 = phi i64 [ 0, %for.body33.lr.ph.i ], [ %12, %for.inc58.i ]
  %28 = getelementptr inbounds double, ptr %34, i64 %27
  %29 = ptrtoint ptr %28 to i64
  call void @__asan_load8(i64 %29)
  %30 = load double, ptr %28, align 8, !tbaa !10
  %31 = fmul double %30, 2.123000e+03
  store double %31, ptr %28, align 8, !tbaa !10
  %32 = getelementptr inbounds double, ptr %5, i64 %27
  br i1 %6, label %for.body41.i88, label %for.inc58.i

for.body33.lr.ph.i:                               ; preds = %for.cond31.preheader.i
  %33 = mul nuw nsw i64 %37, %3
  %34 = getelementptr inbounds double, ptr %7, i64 %33
  %35 = mul nuw nsw i64 %37, %4
  %36 = getelementptr inbounds double, ptr %8, i64 %35
  br label %for.body33.i

for.cond31.preheader.i:                           ; preds = %entry, %for.inc61.i
  %37 = phi i64 [ 0, %entry ], [ %10, %for.inc61.i ]
  br i1 %9, label %for.body33.lr.ph.i, label %for.inc61.i

exit:                                             ; preds = %for.inc61.i
  ret void
}

define internal void @_spawn_loop_func_37(ptr %0) {
entry:
  %cm_env_base = bitcast ptr %0 to ptr
  %cm_env_slot = getelementptr ptr, ptr %cm_env_base, i32 0
  %1 = load ptr, ptr %cm_env_slot, align 8
  %2 = bitcast ptr %1 to ptr
  %3 = load i64, ptr %2, align 8
  %cm_env_slot1 = getelementptr ptr, ptr %cm_env_base, i32 1
  %4 = load ptr, ptr %cm_env_slot1, align 8
  %5 = bitcast ptr %4 to ptr
  %6 = load i64, ptr %5, align 8
  %cm_env_slot2 = getelementptr ptr, ptr %cm_env_base, i32 2
  %7 = load ptr, ptr %cm_env_slot2, align 8
  %8 = bitcast ptr %7 to ptr
  %9 = load i64, ptr %8, align 8
  %cm_env_slot3 = getelementptr ptr, ptr %cm_env_base, i32 3
  %10 = load ptr, ptr %cm_env_slot3, align 8
  %11 = bitcast ptr %10 to ptr
  %cm_env_slot4 = getelementptr ptr, ptr %cm_env_base, i32 4
  %12 = load ptr, ptr %cm_env_slot4, align 8
  %13 = bitcast ptr %12 to ptr
  %14 = load i1, ptr %13, align 1
  %cm_env_slot5 = getelementptr ptr, ptr %cm_env_base, i32 5
  %15 = load ptr, ptr %cm_env_slot5, align 8
  %16 = bitcast ptr %15 to ptr
  %cm_env_slot6 = getelementptr ptr, ptr %cm_env_base, i32 6
  %17 = load ptr, ptr %cm_env_slot6, align 8
  %18 = bitcast ptr %17 to ptr
  %cm_env_slot7 = getelementptr ptr, ptr %cm_env_base, i32 7
  %19 = load ptr, ptr %cm_env_slot7, align 8
  %20 = bitcast ptr %19 to ptr
  %21 = load i1, ptr %20, align 1
  call void @_loop_func_37(i64 %3, i64 %6, i64 %9, ptr %11, i1 %14, ptr %16, ptr %18, i1 %21)
  call void @free(ptr %0)
  ret void
}

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
  call void @free(ptr %0)
  ret void
}

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
  call void @free(ptr %0)
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
  call void @free(ptr %0)
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
  call void @free(ptr %0)
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
