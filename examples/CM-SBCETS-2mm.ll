; ModuleID = 'CM-SBCETS-2mm.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 0, void ()* @__softboundcets_global_init }]

define i32 @softboundcets_pseudo_main(i32 %argc, i8** %argv) {
entry:
  %base.alloca270 = alloca i8*
  %bound.alloca271 = alloca i8*
  %key.alloca272 = alloca i64
  %lock.alloca273 = alloca i8*
  %base.alloca261 = alloca i8*
  %bound.alloca262 = alloca i8*
  %key.alloca263 = alloca i64
  %lock.alloca264 = alloca i8*
  %base.alloca252 = alloca i8*
  %bound.alloca253 = alloca i8*
  %key.alloca254 = alloca i64
  %lock.alloca255 = alloca i8*
  %base.alloca243 = alloca i8*
  %bound.alloca244 = alloca i8*
  %key.alloca245 = alloca i64
  %lock.alloca246 = alloca i8*
  %base.alloca234 = alloca i8*
  %bound.alloca235 = alloca i8*
  %key.alloca236 = alloca i64
  %lock.alloca237 = alloca i8*
  %base.alloca225 = alloca i8*
  %bound.alloca226 = alloca i8*
  %key.alloca227 = alloca i64
  %lock.alloca228 = alloca i8*
  %base.alloca216 = alloca i8*
  %bound.alloca217 = alloca i8*
  %key.alloca218 = alloca i64
  %lock.alloca219 = alloca i8*
  %base.alloca207 = alloca i8*
  %bound.alloca208 = alloca i8*
  %key.alloca209 = alloca i64
  %lock.alloca210 = alloca i8*
  %base.alloca198 = alloca i8*
  %bound.alloca199 = alloca i8*
  %key.alloca200 = alloca i64
  %lock.alloca201 = alloca i8*
  %base.alloca189 = alloca i8*
  %bound.alloca190 = alloca i8*
  %key.alloca191 = alloca i64
  %lock.alloca192 = alloca i8*
  %base.alloca180 = alloca i8*
  %bound.alloca181 = alloca i8*
  %key.alloca182 = alloca i64
  %lock.alloca183 = alloca i8*
  %base.alloca171 = alloca i8*
  %bound.alloca172 = alloca i8*
  %key.alloca173 = alloca i64
  %lock.alloca174 = alloca i8*
  %base.alloca162 = alloca i8*
  %bound.alloca163 = alloca i8*
  %key.alloca164 = alloca i64
  %lock.alloca165 = alloca i8*
  %base.alloca153 = alloca i8*
  %bound.alloca154 = alloca i8*
  %key.alloca155 = alloca i64
  %lock.alloca156 = alloca i8*
  %base.alloca144 = alloca i8*
  %bound.alloca145 = alloca i8*
  %key.alloca146 = alloca i64
  %lock.alloca147 = alloca i8*
  %base.alloca135 = alloca i8*
  %bound.alloca136 = alloca i8*
  %key.alloca137 = alloca i64
  %lock.alloca138 = alloca i8*
  %base.alloca126 = alloca i8*
  %bound.alloca127 = alloca i8*
  %key.alloca128 = alloca i64
  %lock.alloca129 = alloca i8*
  %base.alloca117 = alloca i8*
  %bound.alloca118 = alloca i8*
  %key.alloca119 = alloca i64
  %lock.alloca120 = alloca i8*
  %base.alloca108 = alloca i8*
  %bound.alloca109 = alloca i8*
  %key.alloca110 = alloca i64
  %lock.alloca111 = alloca i8*
  %base.alloca99 = alloca i8*
  %bound.alloca100 = alloca i8*
  %key.alloca101 = alloca i64
  %lock.alloca102 = alloca i8*
  %base.alloca90 = alloca i8*
  %bound.alloca91 = alloca i8*
  %key.alloca92 = alloca i64
  %lock.alloca93 = alloca i8*
  %base.alloca81 = alloca i8*
  %bound.alloca82 = alloca i8*
  %key.alloca83 = alloca i64
  %lock.alloca84 = alloca i8*
  %base.alloca72 = alloca i8*
  %bound.alloca73 = alloca i8*
  %key.alloca74 = alloca i64
  %lock.alloca75 = alloca i8*
  %base.alloca63 = alloca i8*
  %bound.alloca64 = alloca i8*
  %key.alloca65 = alloca i64
  %lock.alloca66 = alloca i8*
  %base.alloca = alloca i8*
  %bound.alloca = alloca i8*
  %key.alloca = alloca i64
  %lock.alloca = alloca i8*
  %lock_alloca = alloca i8*
  %key_alloca = alloca i64
  call void @__softboundcets_stack_memory_allocation(i8** %lock_alloca, i64* %key_alloca)
  %lock.load = load i8** %lock_alloca
  %key.load = load i64* %key_alloca
  %0 = call i8* @__softboundcets_load_base_shadow_stack(i32 1)
  %1 = call i8* @__softboundcets_load_bound_shadow_stack(i32 1)
  %2 = call i64 @__softboundcets_load_key_shadow_stack(i32 1)
  %3 = call i8* @__softboundcets_load_lock_shadow_stack(i32 1)
  %4 = call i8* @__softboundcets_get_global_lock()
  %retval = alloca i32, align 4
  %retval1 = bitcast i32* %retval to i32*
  %bitcast = bitcast i32* %retval to i8*
  %mtmp = getelementptr i32* %retval1, i32 1
  %bitcast2 = bitcast i32* %mtmp to i8*
  %argc.addr = alloca i32, align 4
  %argc.addr3 = bitcast i32* %argc.addr to i32*
  %bitcast4 = bitcast i32* %argc.addr to i8*
  %mtmp5 = getelementptr i32* %argc.addr3, i32 1
  %bitcast6 = bitcast i32* %mtmp5 to i8*
  %argv.addr = alloca i8**, align 8
  %argv.addr7 = bitcast i8*** %argv.addr to i8***
  %bitcast8 = bitcast i8*** %argv.addr to i8*
  %mtmp9 = getelementptr i8*** %argv.addr7, i32 1
  %bitcast10 = bitcast i8*** %mtmp9 to i8*
  %dump_code = alloca i32, align 4
  %dump_code11 = bitcast i32* %dump_code to i32*
  %bitcast12 = bitcast i32* %dump_code to i8*
  %mtmp13 = getelementptr i32* %dump_code11, i32 1
  %bitcast14 = bitcast i32* %mtmp13 to i8*
  %ni = alloca i32, align 4
  %ni15 = bitcast i32* %ni to i32*
  %bitcast16 = bitcast i32* %ni to i8*
  %mtmp17 = getelementptr i32* %ni15, i32 1
  %bitcast18 = bitcast i32* %mtmp17 to i8*
  %nj = alloca i32, align 4
  %nj19 = bitcast i32* %nj to i32*
  %bitcast20 = bitcast i32* %nj to i8*
  %mtmp21 = getelementptr i32* %nj19, i32 1
  %bitcast22 = bitcast i32* %mtmp21 to i8*
  %nk = alloca i32, align 4
  %nk23 = bitcast i32* %nk to i32*
  %bitcast24 = bitcast i32* %nk to i8*
  %mtmp25 = getelementptr i32* %nk23, i32 1
  %bitcast26 = bitcast i32* %mtmp25 to i8*
  %nl = alloca i32, align 4
  %nl27 = bitcast i32* %nl to i32*
  %bitcast28 = bitcast i32* %nl to i8*
  %mtmp29 = getelementptr i32* %nl27, i32 1
  %bitcast30 = bitcast i32* %mtmp29 to i8*
  %alpha = alloca double, align 8
  %alpha31 = bitcast double* %alpha to double*
  %bitcast32 = bitcast double* %alpha to i8*
  %mtmp33 = getelementptr double* %alpha31, i32 1
  %bitcast34 = bitcast double* %mtmp33 to i8*
  %beta = alloca double, align 8
  %beta35 = bitcast double* %beta to double*
  %bitcast36 = bitcast double* %beta to i8*
  %mtmp37 = getelementptr double* %beta35, i32 1
  %bitcast38 = bitcast double* %mtmp37 to i8*
  %tmp = alloca double*, align 8
  %tmp39 = bitcast double** %tmp to double**
  %bitcast40 = bitcast double** %tmp to i8*
  %mtmp41 = getelementptr double** %tmp39, i32 1
  %bitcast42 = bitcast double** %mtmp41 to i8*
  %A = alloca double*, align 8
  %A43 = bitcast double** %A to double**
  %bitcast44 = bitcast double** %A to i8*
  %mtmp45 = getelementptr double** %A43, i32 1
  %bitcast46 = bitcast double** %mtmp45 to i8*
  %B = alloca double*, align 8
  %B47 = bitcast double** %B to double**
  %bitcast48 = bitcast double** %B to i8*
  %mtmp49 = getelementptr double** %B47, i32 1
  %bitcast50 = bitcast double** %mtmp49 to i8*
  %C = alloca double*, align 8
  %C51 = bitcast double** %C to double**
  %bitcast52 = bitcast double** %C to i8*
  %mtmp53 = getelementptr double** %C51, i32 1
  %bitcast54 = bitcast double** %mtmp53 to i8*
  %D = alloca double*, align 8
  %D55 = bitcast double** %D to double**
  %bitcast56 = bitcast double** %D to i8*
  %mtmp57 = getelementptr double** %D55, i32 1
  %bitcast58 = bitcast double** %mtmp57 to i8*
  %bitcast284 = bitcast i32* %retval to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast, i8* %bitcast2, i8* %bitcast284, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %retval
  %bitcast285 = bitcast i32* %argc.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast4, i8* %bitcast6, i8* %bitcast285, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %argc, i32* %argc.addr, align 4
  %bitcast286 = bitcast i8*** %argv.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast8, i8* %bitcast10, i8* %bitcast286, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store i8** %argv, i8*** %argv.addr, align 8
  %bitcast278 = bitcast i8*** %argv.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast278, i8* %0, i8* %1, i64 %2, i8* %3)
  %5 = load i8*** %argv.addr, align 8
  %bitcast59 = bitcast i8*** %argv.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast59, i8** %base.alloca, i8** %bound.alloca, i64* %key.alloca, i8** %lock.alloca)
  %base.load = load i8** %base.alloca
  %bound.load = load i8** %bound.alloca
  %key.load60 = load i64* %key.alloca
  %lock.load61 = load i8** %lock.alloca
  %arrayidx = getelementptr inbounds i8** %5, i64 1
  %bitcast287 = bitcast i8** %arrayidx to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load, i8* %bound.load, i8* %bitcast287, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load61, i64 %key.load60, i8* %base.load, i8* %bound.load)
  %6 = load i8** %arrayidx, align 8
  %bitcast62 = bitcast i8** %arrayidx to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast62, i8** %base.alloca63, i8** %bound.alloca64, i64* %key.alloca65, i8** %lock.alloca66)
  %base.load67 = load i8** %base.alloca63
  %bound.load68 = load i8** %bound.alloca64
  %key.load69 = load i64* %key.alloca65
  %lock.load70 = load i8** %lock.alloca66
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load67, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load68, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load69, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load70, i32 1)
  %call = call i32 @softboundcets_atoi(i8* %6) #3
  call void @__softboundcets_deallocate_shadow_stack_space()
  %bitcast288 = bitcast i32* %dump_code to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast12, i8* %bitcast14, i8* %bitcast288, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %call, i32* %dump_code, align 4
  %7 = load i8*** %argv.addr, align 8
  %bitcast71 = bitcast i8*** %argv.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast71, i8** %base.alloca72, i8** %bound.alloca73, i64* %key.alloca74, i8** %lock.alloca75)
  %base.load76 = load i8** %base.alloca72
  %bound.load77 = load i8** %bound.alloca73
  %key.load78 = load i64* %key.alloca74
  %lock.load79 = load i8** %lock.alloca75
  %arrayidx1 = getelementptr inbounds i8** %7, i64 2
  %bitcast289 = bitcast i8** %arrayidx1 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load76, i8* %bound.load77, i8* %bitcast289, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load79, i64 %key.load78, i8* %base.load76, i8* %bound.load77)
  %8 = load i8** %arrayidx1, align 8
  %bitcast80 = bitcast i8** %arrayidx1 to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast80, i8** %base.alloca81, i8** %bound.alloca82, i64* %key.alloca83, i8** %lock.alloca84)
  %base.load85 = load i8** %base.alloca81
  %bound.load86 = load i8** %bound.alloca82
  %key.load87 = load i64* %key.alloca83
  %lock.load88 = load i8** %lock.alloca84
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load85, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load86, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load87, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load88, i32 1)
  %call2 = call i32 @softboundcets_atoi(i8* %8) #3
  call void @__softboundcets_deallocate_shadow_stack_space()
  %bitcast290 = bitcast i32* %ni to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast16, i8* %bitcast18, i8* %bitcast290, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %call2, i32* %ni, align 4
  %9 = load i8*** %argv.addr, align 8
  %bitcast89 = bitcast i8*** %argv.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast89, i8** %base.alloca90, i8** %bound.alloca91, i64* %key.alloca92, i8** %lock.alloca93)
  %base.load94 = load i8** %base.alloca90
  %bound.load95 = load i8** %bound.alloca91
  %key.load96 = load i64* %key.alloca92
  %lock.load97 = load i8** %lock.alloca93
  %arrayidx3 = getelementptr inbounds i8** %9, i64 3
  %bitcast291 = bitcast i8** %arrayidx3 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load94, i8* %bound.load95, i8* %bitcast291, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load97, i64 %key.load96, i8* %base.load94, i8* %bound.load95)
  %10 = load i8** %arrayidx3, align 8
  %bitcast98 = bitcast i8** %arrayidx3 to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast98, i8** %base.alloca99, i8** %bound.alloca100, i64* %key.alloca101, i8** %lock.alloca102)
  %base.load103 = load i8** %base.alloca99
  %bound.load104 = load i8** %bound.alloca100
  %key.load105 = load i64* %key.alloca101
  %lock.load106 = load i8** %lock.alloca102
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load103, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load104, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load105, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load106, i32 1)
  %call4 = call i32 @softboundcets_atoi(i8* %10) #3
  call void @__softboundcets_deallocate_shadow_stack_space()
  %bitcast292 = bitcast i32* %nj to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast20, i8* %bitcast22, i8* %bitcast292, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %call4, i32* %nj, align 4
  %11 = load i8*** %argv.addr, align 8
  %bitcast107 = bitcast i8*** %argv.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast107, i8** %base.alloca108, i8** %bound.alloca109, i64* %key.alloca110, i8** %lock.alloca111)
  %base.load112 = load i8** %base.alloca108
  %bound.load113 = load i8** %bound.alloca109
  %key.load114 = load i64* %key.alloca110
  %lock.load115 = load i8** %lock.alloca111
  %arrayidx5 = getelementptr inbounds i8** %11, i64 4
  %bitcast293 = bitcast i8** %arrayidx5 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load112, i8* %bound.load113, i8* %bitcast293, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load115, i64 %key.load114, i8* %base.load112, i8* %bound.load113)
  %12 = load i8** %arrayidx5, align 8
  %bitcast116 = bitcast i8** %arrayidx5 to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast116, i8** %base.alloca117, i8** %bound.alloca118, i64* %key.alloca119, i8** %lock.alloca120)
  %base.load121 = load i8** %base.alloca117
  %bound.load122 = load i8** %bound.alloca118
  %key.load123 = load i64* %key.alloca119
  %lock.load124 = load i8** %lock.alloca120
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load121, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load122, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load123, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load124, i32 1)
  %call6 = call i32 @softboundcets_atoi(i8* %12) #3
  call void @__softboundcets_deallocate_shadow_stack_space()
  %bitcast294 = bitcast i32* %nk to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast24, i8* %bitcast26, i8* %bitcast294, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %call6, i32* %nk, align 4
  %13 = load i8*** %argv.addr, align 8
  %bitcast125 = bitcast i8*** %argv.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast125, i8** %base.alloca126, i8** %bound.alloca127, i64* %key.alloca128, i8** %lock.alloca129)
  %base.load130 = load i8** %base.alloca126
  %bound.load131 = load i8** %bound.alloca127
  %key.load132 = load i64* %key.alloca128
  %lock.load133 = load i8** %lock.alloca129
  %arrayidx7 = getelementptr inbounds i8** %13, i64 5
  %bitcast295 = bitcast i8** %arrayidx7 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load130, i8* %bound.load131, i8* %bitcast295, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load133, i64 %key.load132, i8* %base.load130, i8* %bound.load131)
  %14 = load i8** %arrayidx7, align 8
  %bitcast134 = bitcast i8** %arrayidx7 to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast134, i8** %base.alloca135, i8** %bound.alloca136, i64* %key.alloca137, i8** %lock.alloca138)
  %base.load139 = load i8** %base.alloca135
  %bound.load140 = load i8** %bound.alloca136
  %key.load141 = load i64* %key.alloca137
  %lock.load142 = load i8** %lock.alloca138
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load139, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load140, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load141, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load142, i32 1)
  %call8 = call i32 @softboundcets_atoi(i8* %14) #3
  call void @__softboundcets_deallocate_shadow_stack_space()
  %bitcast296 = bitcast i32* %nl to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast28, i8* %bitcast30, i8* %bitcast296, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %call8, i32* %nl, align 4
  %15 = load i32* %ni, align 4
  %16 = zext i32 %15 to i64
  %17 = load i32* %nj, align 4
  %18 = zext i32 %17 to i64
  %19 = load i32* %ni, align 4
  %20 = zext i32 %19 to i64
  %21 = load i32* %nj, align 4
  %22 = zext i32 %21 to i64
  %23 = load i32* %ni, align 4
  %24 = load i32* %nj, align 4
  %mul = mul nsw i32 %23, %24
  %conv = sext i32 %mul to i64
  %mul9 = mul i64 %conv, 8
  call void @__softboundcets_allocate_shadow_stack_space(i32 1)
  %call10 = call noalias i8* @softboundcets_malloc(i64 %mul9) #2
  %25 = call i8* @__softboundcets_load_base_shadow_stack(i32 0)
  %26 = call i8* @__softboundcets_load_bound_shadow_stack(i32 0)
  %27 = call i64 @__softboundcets_load_key_shadow_stack(i32 0)
  %28 = call i8* @__softboundcets_load_lock_shadow_stack(i32 0)
  call void @__softboundcets_deallocate_shadow_stack_space()
  %29 = bitcast i8* %call10 to double*
  %bitcast297 = bitcast double** %tmp to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast40, i8* %bitcast42, i8* %bitcast297, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %29, double** %tmp, align 8
  %bitcast279 = bitcast double** %tmp to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast279, i8* %25, i8* %26, i64 %27, i8* %28)
  %30 = load i32* %ni, align 4
  %31 = zext i32 %30 to i64
  %32 = load i32* %nk, align 4
  %33 = zext i32 %32 to i64
  %34 = load i32* %ni, align 4
  %35 = zext i32 %34 to i64
  %36 = load i32* %nk, align 4
  %37 = zext i32 %36 to i64
  %38 = load i32* %ni, align 4
  %39 = load i32* %nk, align 4
  %mul12 = mul nsw i32 %38, %39
  %conv13 = sext i32 %mul12 to i64
  %mul14 = mul i64 %conv13, 8
  call void @__softboundcets_allocate_shadow_stack_space(i32 1)
  %call15 = call noalias i8* @softboundcets_malloc(i64 %mul14) #2
  %40 = call i8* @__softboundcets_load_base_shadow_stack(i32 0)
  %41 = call i8* @__softboundcets_load_bound_shadow_stack(i32 0)
  %42 = call i64 @__softboundcets_load_key_shadow_stack(i32 0)
  %43 = call i8* @__softboundcets_load_lock_shadow_stack(i32 0)
  call void @__softboundcets_deallocate_shadow_stack_space()
  %44 = bitcast i8* %call15 to double*
  %bitcast298 = bitcast double** %A to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast44, i8* %bitcast46, i8* %bitcast298, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %44, double** %A, align 8
  %bitcast280 = bitcast double** %A to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast280, i8* %40, i8* %41, i64 %42, i8* %43)
  %45 = load i32* %nk, align 4
  %46 = zext i32 %45 to i64
  %47 = load i32* %nj, align 4
  %48 = zext i32 %47 to i64
  %49 = load i32* %nk, align 4
  %50 = zext i32 %49 to i64
  %51 = load i32* %nj, align 4
  %52 = zext i32 %51 to i64
  %53 = load i32* %nk, align 4
  %54 = load i32* %nj, align 4
  %mul17 = mul nsw i32 %53, %54
  %conv18 = sext i32 %mul17 to i64
  %mul19 = mul i64 %conv18, 8
  call void @__softboundcets_allocate_shadow_stack_space(i32 1)
  %call20 = call noalias i8* @softboundcets_malloc(i64 %mul19) #2
  %55 = call i8* @__softboundcets_load_base_shadow_stack(i32 0)
  %56 = call i8* @__softboundcets_load_bound_shadow_stack(i32 0)
  %57 = call i64 @__softboundcets_load_key_shadow_stack(i32 0)
  %58 = call i8* @__softboundcets_load_lock_shadow_stack(i32 0)
  call void @__softboundcets_deallocate_shadow_stack_space()
  %59 = bitcast i8* %call20 to double*
  %bitcast299 = bitcast double** %B to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast48, i8* %bitcast50, i8* %bitcast299, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %59, double** %B, align 8
  %bitcast281 = bitcast double** %B to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast281, i8* %55, i8* %56, i64 %57, i8* %58)
  %60 = load i32* %nl, align 4
  %61 = zext i32 %60 to i64
  %62 = load i32* %nj, align 4
  %63 = zext i32 %62 to i64
  %64 = load i32* %nl, align 4
  %65 = zext i32 %64 to i64
  %66 = load i32* %nj, align 4
  %67 = zext i32 %66 to i64
  %68 = load i32* %nl, align 4
  %69 = load i32* %nj, align 4
  %mul22 = mul nsw i32 %68, %69
  %conv23 = sext i32 %mul22 to i64
  %mul24 = mul i64 %conv23, 8
  call void @__softboundcets_allocate_shadow_stack_space(i32 1)
  %call25 = call noalias i8* @softboundcets_malloc(i64 %mul24) #2
  %70 = call i8* @__softboundcets_load_base_shadow_stack(i32 0)
  %71 = call i8* @__softboundcets_load_bound_shadow_stack(i32 0)
  %72 = call i64 @__softboundcets_load_key_shadow_stack(i32 0)
  %73 = call i8* @__softboundcets_load_lock_shadow_stack(i32 0)
  call void @__softboundcets_deallocate_shadow_stack_space()
  %74 = bitcast i8* %call25 to double*
  %bitcast300 = bitcast double** %C to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast52, i8* %bitcast54, i8* %bitcast300, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %74, double** %C, align 8
  %bitcast282 = bitcast double** %C to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast282, i8* %70, i8* %71, i64 %72, i8* %73)
  %75 = load i32* %ni, align 4
  %76 = zext i32 %75 to i64
  %77 = load i32* %nl, align 4
  %78 = zext i32 %77 to i64
  %79 = load i32* %ni, align 4
  %80 = zext i32 %79 to i64
  %81 = load i32* %nl, align 4
  %82 = zext i32 %81 to i64
  %83 = load i32* %ni, align 4
  %84 = load i32* %nl, align 4
  %mul27 = mul nsw i32 %83, %84
  %conv28 = sext i32 %mul27 to i64
  %mul29 = mul i64 %conv28, 8
  call void @__softboundcets_allocate_shadow_stack_space(i32 1)
  %call30 = call noalias i8* @softboundcets_malloc(i64 %mul29) #2
  %85 = call i8* @__softboundcets_load_base_shadow_stack(i32 0)
  %86 = call i8* @__softboundcets_load_bound_shadow_stack(i32 0)
  %87 = call i64 @__softboundcets_load_key_shadow_stack(i32 0)
  %88 = call i8* @__softboundcets_load_lock_shadow_stack(i32 0)
  call void @__softboundcets_deallocate_shadow_stack_space()
  %89 = bitcast i8* %call30 to double*
  %bitcast301 = bitcast double** %D to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast56, i8* %bitcast58, i8* %bitcast301, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %89, double** %D, align 8
  %bitcast283 = bitcast double** %D to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast283, i8* %85, i8* %86, i64 %87, i8* %88)
  %90 = load i32* %ni, align 4
  %91 = load i32* %nj, align 4
  %92 = load i32* %nk, align 4
  %93 = load i32* %nl, align 4
  %94 = load double** %A, align 8
  %bitcast143 = bitcast double** %A to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast143, i8** %base.alloca144, i8** %bound.alloca145, i64* %key.alloca146, i8** %lock.alloca147)
  %base.load148 = load i8** %base.alloca144
  %bound.load149 = load i8** %bound.alloca145
  %key.load150 = load i64* %key.alloca146
  %lock.load151 = load i8** %lock.alloca147
  %95 = load double** %B, align 8
  %bitcast152 = bitcast double** %B to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast152, i8** %base.alloca153, i8** %bound.alloca154, i64* %key.alloca155, i8** %lock.alloca156)
  %base.load157 = load i8** %base.alloca153
  %bound.load158 = load i8** %bound.alloca154
  %key.load159 = load i64* %key.alloca155
  %lock.load160 = load i8** %lock.alloca156
  %96 = load double** %C, align 8
  %bitcast161 = bitcast double** %C to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast161, i8** %base.alloca162, i8** %bound.alloca163, i64* %key.alloca164, i8** %lock.alloca165)
  %base.load166 = load i8** %base.alloca162
  %bound.load167 = load i8** %bound.alloca163
  %key.load168 = load i64* %key.alloca164
  %lock.load169 = load i8** %lock.alloca165
  %97 = load double** %D, align 8
  %bitcast170 = bitcast double** %D to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast170, i8** %base.alloca171, i8** %bound.alloca172, i64* %key.alloca173, i8** %lock.alloca174)
  %base.load175 = load i8** %base.alloca171
  %bound.load176 = load i8** %bound.alloca172
  %key.load177 = load i64* %key.alloca173
  %lock.load178 = load i8** %lock.alloca174
  call void @__softboundcets_allocate_shadow_stack_space(i32 7)
  call void @__softboundcets_store_base_shadow_stack(i8* %bitcast32, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bitcast34, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load, i32 1)
  call void @__softboundcets_store_base_shadow_stack(i8* %bitcast36, i32 2)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bitcast38, i32 2)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load, i32 2)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load, i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load148, i32 3)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load149, i32 3)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load150, i32 3)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load151, i32 3)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load157, i32 4)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load158, i32 4)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load159, i32 4)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load160, i32 4)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load166, i32 5)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load167, i32 5)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load168, i32 5)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load169, i32 5)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load175, i32 6)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load176, i32 6)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load177, i32 6)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load178, i32 6)
  call void @init_array(i32 %90, i32 %91, i32 %92, i32 %93, double* %alpha, double* %beta, double* %94, double* %95, double* %96, double* %97)
  call void @__softboundcets_deallocate_shadow_stack_space()
  %98 = load i32* %ni, align 4
  %99 = load i32* %nj, align 4
  %100 = load i32* %nk, align 4
  %101 = load i32* %nl, align 4
  %bitcast302 = bitcast double* %alpha to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %bitcast32, i8* %bitcast34, i8* %bitcast302, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  %102 = load double* %alpha, align 8
  %bitcast303 = bitcast double* %beta to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %bitcast36, i8* %bitcast38, i8* %bitcast303, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  %103 = load double* %beta, align 8
  %104 = load double** %tmp, align 8
  %bitcast179 = bitcast double** %tmp to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast179, i8** %base.alloca180, i8** %bound.alloca181, i64* %key.alloca182, i8** %lock.alloca183)
  %base.load184 = load i8** %base.alloca180
  %bound.load185 = load i8** %bound.alloca181
  %key.load186 = load i64* %key.alloca182
  %lock.load187 = load i8** %lock.alloca183
  %105 = load double** %A, align 8
  %bitcast188 = bitcast double** %A to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast188, i8** %base.alloca189, i8** %bound.alloca190, i64* %key.alloca191, i8** %lock.alloca192)
  %base.load193 = load i8** %base.alloca189
  %bound.load194 = load i8** %bound.alloca190
  %key.load195 = load i64* %key.alloca191
  %lock.load196 = load i8** %lock.alloca192
  %106 = load double** %B, align 8
  %bitcast197 = bitcast double** %B to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast197, i8** %base.alloca198, i8** %bound.alloca199, i64* %key.alloca200, i8** %lock.alloca201)
  %base.load202 = load i8** %base.alloca198
  %bound.load203 = load i8** %bound.alloca199
  %key.load204 = load i64* %key.alloca200
  %lock.load205 = load i8** %lock.alloca201
  %107 = load double** %C, align 8
  %bitcast206 = bitcast double** %C to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast206, i8** %base.alloca207, i8** %bound.alloca208, i64* %key.alloca209, i8** %lock.alloca210)
  %base.load211 = load i8** %base.alloca207
  %bound.load212 = load i8** %bound.alloca208
  %key.load213 = load i64* %key.alloca209
  %lock.load214 = load i8** %lock.alloca210
  %108 = load double** %D, align 8
  %bitcast215 = bitcast double** %D to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast215, i8** %base.alloca216, i8** %bound.alloca217, i64* %key.alloca218, i8** %lock.alloca219)
  %base.load220 = load i8** %base.alloca216
  %bound.load221 = load i8** %bound.alloca217
  %key.load222 = load i64* %key.alloca218
  %lock.load223 = load i8** %lock.alloca219
  call void @__softboundcets_allocate_shadow_stack_space(i32 6)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load184, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load185, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load186, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load187, i32 1)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load193, i32 2)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load194, i32 2)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load195, i32 2)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load196, i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load202, i32 3)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load203, i32 3)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load204, i32 3)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load205, i32 3)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load211, i32 4)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load212, i32 4)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load213, i32 4)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load214, i32 4)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load220, i32 5)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load221, i32 5)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load222, i32 5)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load223, i32 5)
  call void @kernel_2mm(i32 %98, i32 %99, i32 %100, i32 %101, double %102, double %103, double* %104, double* %105, double* %106, double* %107, double* %108)
  call void @__softboundcets_deallocate_shadow_stack_space()
  %109 = load i32* %dump_code, align 4
  %cmp = icmp eq i32 %109, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %110 = load i32* %ni, align 4
  %111 = load i32* %nl, align 4
  %112 = load double** %D, align 8
  %bitcast224 = bitcast double** %D to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast224, i8** %base.alloca225, i8** %bound.alloca226, i64* %key.alloca227, i8** %lock.alloca228)
  %base.load229 = load i8** %base.alloca225
  %bound.load230 = load i8** %bound.alloca226
  %key.load231 = load i64* %key.alloca227
  %lock.load232 = load i8** %lock.alloca228
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load229, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load230, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load231, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load232, i32 1)
  call void @print_array(i32 %110, i32 %111, double* %112)
  call void @__softboundcets_deallocate_shadow_stack_space()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %113 = load double** %tmp, align 8
  %bitcast233 = bitcast double** %tmp to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast233, i8** %base.alloca234, i8** %bound.alloca235, i64* %key.alloca236, i8** %lock.alloca237)
  %base.load238 = load i8** %base.alloca234
  %bound.load239 = load i8** %bound.alloca235
  %key.load240 = load i64* %key.alloca236
  %lock.load241 = load i8** %lock.alloca237
  %114 = bitcast double* %113 to i8*
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load238, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load239, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load240, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load241, i32 1)
  call void @softboundcets_free(i8* %114) #2
  call void @__softboundcets_deallocate_shadow_stack_space()
  %115 = load double** %A, align 8
  %bitcast242 = bitcast double** %A to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast242, i8** %base.alloca243, i8** %bound.alloca244, i64* %key.alloca245, i8** %lock.alloca246)
  %base.load247 = load i8** %base.alloca243
  %bound.load248 = load i8** %bound.alloca244
  %key.load249 = load i64* %key.alloca245
  %lock.load250 = load i8** %lock.alloca246
  %116 = bitcast double* %115 to i8*
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load247, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load248, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load249, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load250, i32 1)
  call void @softboundcets_free(i8* %116) #2
  call void @__softboundcets_deallocate_shadow_stack_space()
  %117 = load double** %B, align 8
  %bitcast251 = bitcast double** %B to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast251, i8** %base.alloca252, i8** %bound.alloca253, i64* %key.alloca254, i8** %lock.alloca255)
  %base.load256 = load i8** %base.alloca252
  %bound.load257 = load i8** %bound.alloca253
  %key.load258 = load i64* %key.alloca254
  %lock.load259 = load i8** %lock.alloca255
  %118 = bitcast double* %117 to i8*
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load256, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load257, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load258, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load259, i32 1)
  call void @softboundcets_free(i8* %118) #2
  call void @__softboundcets_deallocate_shadow_stack_space()
  %119 = load double** %C, align 8
  %bitcast260 = bitcast double** %C to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast260, i8** %base.alloca261, i8** %bound.alloca262, i64* %key.alloca263, i8** %lock.alloca264)
  %base.load265 = load i8** %base.alloca261
  %bound.load266 = load i8** %bound.alloca262
  %key.load267 = load i64* %key.alloca263
  %lock.load268 = load i8** %lock.alloca264
  %120 = bitcast double* %119 to i8*
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load265, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load266, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load267, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load268, i32 1)
  call void @softboundcets_free(i8* %120) #2
  call void @__softboundcets_deallocate_shadow_stack_space()
  %121 = load double** %D, align 8
  %bitcast269 = bitcast double** %D to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast269, i8** %base.alloca270, i8** %bound.alloca271, i64* %key.alloca272, i8** %lock.alloca273)
  %base.load274 = load i8** %base.alloca270
  %bound.load275 = load i8** %bound.alloca271
  %key.load276 = load i64* %key.alloca272
  %lock.load277 = load i8** %lock.alloca273
  %122 = bitcast double* %121 to i8*
  call void @__softboundcets_allocate_shadow_stack_space(i32 2)
  call void @__softboundcets_store_base_shadow_stack(i8* %base.load274, i32 1)
  call void @__softboundcets_store_bound_shadow_stack(i8* %bound.load275, i32 1)
  call void @__softboundcets_store_key_shadow_stack(i64 %key.load276, i32 1)
  call void @__softboundcets_store_lock_shadow_stack(i8* %lock.load277, i32 1)
  call void @softboundcets_free(i8* %122) #2
  call void @__softboundcets_deallocate_shadow_stack_space()
  call void @__softboundcets_stack_memory_deallocation(i64 %key.load)
  ret i32 0

fault:                                            ; No predecessors!
  call void @__softboundcets_dummy()
  call void @__softboundcets_abort()
  unreachable
}

declare i32 @softboundcets_atoi(i8*)

declare i8* @softboundcets_malloc(i64)

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* %alpha, double* %beta, double* %A, double* %B, double* %C, double* %D) #0 {
entry:
  %base.alloca168 = alloca i8*
  %bound.alloca169 = alloca i8*
  %key.alloca170 = alloca i64
  %lock.alloca171 = alloca i8*
  %base.alloca159 = alloca i8*
  %bound.alloca160 = alloca i8*
  %key.alloca161 = alloca i64
  %lock.alloca162 = alloca i8*
  %base.alloca150 = alloca i8*
  %bound.alloca151 = alloca i8*
  %key.alloca152 = alloca i64
  %lock.alloca153 = alloca i8*
  %base.alloca141 = alloca i8*
  %bound.alloca142 = alloca i8*
  %key.alloca143 = alloca i64
  %lock.alloca144 = alloca i8*
  %base.alloca132 = alloca i8*
  %bound.alloca133 = alloca i8*
  %key.alloca134 = alloca i64
  %lock.alloca135 = alloca i8*
  %base.alloca = alloca i8*
  %bound.alloca = alloca i8*
  %key.alloca = alloca i64
  %lock.alloca = alloca i8*
  %lock_alloca = alloca i8*
  %key_alloca = alloca i64
  call void @__softboundcets_stack_memory_allocation(i8** %lock_alloca, i64* %key_alloca)
  %lock.load = load i8** %lock_alloca
  %key.load = load i64* %key_alloca
  %0 = call i8* @__softboundcets_load_base_shadow_stack(i32 6)
  %1 = call i8* @__softboundcets_load_bound_shadow_stack(i32 6)
  %2 = call i64 @__softboundcets_load_key_shadow_stack(i32 6)
  %3 = call i8* @__softboundcets_load_lock_shadow_stack(i32 6)
  %4 = call i8* @__softboundcets_load_base_shadow_stack(i32 5)
  %5 = call i8* @__softboundcets_load_bound_shadow_stack(i32 5)
  %6 = call i64 @__softboundcets_load_key_shadow_stack(i32 5)
  %7 = call i8* @__softboundcets_load_lock_shadow_stack(i32 5)
  %8 = call i8* @__softboundcets_load_base_shadow_stack(i32 4)
  %9 = call i8* @__softboundcets_load_bound_shadow_stack(i32 4)
  %10 = call i64 @__softboundcets_load_key_shadow_stack(i32 4)
  %11 = call i8* @__softboundcets_load_lock_shadow_stack(i32 4)
  %12 = call i8* @__softboundcets_load_base_shadow_stack(i32 3)
  %13 = call i8* @__softboundcets_load_bound_shadow_stack(i32 3)
  %14 = call i64 @__softboundcets_load_key_shadow_stack(i32 3)
  %15 = call i8* @__softboundcets_load_lock_shadow_stack(i32 3)
  %16 = call i8* @__softboundcets_load_base_shadow_stack(i32 2)
  %17 = call i8* @__softboundcets_load_bound_shadow_stack(i32 2)
  %18 = call i64 @__softboundcets_load_key_shadow_stack(i32 2)
  %19 = call i8* @__softboundcets_load_lock_shadow_stack(i32 2)
  %20 = call i8* @__softboundcets_load_base_shadow_stack(i32 1)
  %21 = call i8* @__softboundcets_load_bound_shadow_stack(i32 1)
  %22 = call i64 @__softboundcets_load_key_shadow_stack(i32 1)
  %23 = call i8* @__softboundcets_load_lock_shadow_stack(i32 1)
  %24 = call i8* @__softboundcets_get_global_lock()
  %ni.addr = alloca i32, align 4
  %ni.addr82 = bitcast i32* %ni.addr to i32*
  %bitcast = bitcast i32* %ni.addr to i8*
  %mtmp = getelementptr i32* %ni.addr82, i32 1
  %bitcast83 = bitcast i32* %mtmp to i8*
  %nj.addr = alloca i32, align 4
  %nj.addr84 = bitcast i32* %nj.addr to i32*
  %bitcast85 = bitcast i32* %nj.addr to i8*
  %mtmp86 = getelementptr i32* %nj.addr84, i32 1
  %bitcast87 = bitcast i32* %mtmp86 to i8*
  %nk.addr = alloca i32, align 4
  %nk.addr88 = bitcast i32* %nk.addr to i32*
  %bitcast89 = bitcast i32* %nk.addr to i8*
  %mtmp90 = getelementptr i32* %nk.addr88, i32 1
  %bitcast91 = bitcast i32* %mtmp90 to i8*
  %nl.addr = alloca i32, align 4
  %nl.addr92 = bitcast i32* %nl.addr to i32*
  %bitcast93 = bitcast i32* %nl.addr to i8*
  %mtmp94 = getelementptr i32* %nl.addr92, i32 1
  %bitcast95 = bitcast i32* %mtmp94 to i8*
  %alpha.addr = alloca double*, align 8
  %alpha.addr96 = bitcast double** %alpha.addr to double**
  %bitcast97 = bitcast double** %alpha.addr to i8*
  %mtmp98 = getelementptr double** %alpha.addr96, i32 1
  %bitcast99 = bitcast double** %mtmp98 to i8*
  %beta.addr = alloca double*, align 8
  %beta.addr100 = bitcast double** %beta.addr to double**
  %bitcast101 = bitcast double** %beta.addr to i8*
  %mtmp102 = getelementptr double** %beta.addr100, i32 1
  %bitcast103 = bitcast double** %mtmp102 to i8*
  %A.addr = alloca double*, align 8
  %A.addr104 = bitcast double** %A.addr to double**
  %bitcast105 = bitcast double** %A.addr to i8*
  %mtmp106 = getelementptr double** %A.addr104, i32 1
  %bitcast107 = bitcast double** %mtmp106 to i8*
  %B.addr = alloca double*, align 8
  %B.addr108 = bitcast double** %B.addr to double**
  %bitcast109 = bitcast double** %B.addr to i8*
  %mtmp110 = getelementptr double** %B.addr108, i32 1
  %bitcast111 = bitcast double** %mtmp110 to i8*
  %C.addr = alloca double*, align 8
  %C.addr112 = bitcast double** %C.addr to double**
  %bitcast113 = bitcast double** %C.addr to i8*
  %mtmp114 = getelementptr double** %C.addr112, i32 1
  %bitcast115 = bitcast double** %mtmp114 to i8*
  %D.addr = alloca double*, align 8
  %D.addr116 = bitcast double** %D.addr to double**
  %bitcast117 = bitcast double** %D.addr to i8*
  %mtmp118 = getelementptr double** %D.addr116, i32 1
  %bitcast119 = bitcast double** %mtmp118 to i8*
  %i = alloca i32, align 4
  %i120 = bitcast i32* %i to i32*
  %bitcast121 = bitcast i32* %i to i8*
  %mtmp122 = getelementptr i32* %i120, i32 1
  %bitcast123 = bitcast i32* %mtmp122 to i8*
  %j = alloca i32, align 4
  %j124 = bitcast i32* %j to i32*
  %bitcast125 = bitcast i32* %j to i8*
  %mtmp126 = getelementptr i32* %j124, i32 1
  %bitcast127 = bitcast i32* %mtmp126 to i8*
  %bitcast182 = bitcast i32* %ni.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast, i8* %bitcast83, i8* %bitcast182, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %ni, i32* %ni.addr, align 4
  %bitcast183 = bitcast i32* %nj.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast85, i8* %bitcast87, i8* %bitcast183, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %nj, i32* %nj.addr, align 4
  %bitcast184 = bitcast i32* %nk.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast89, i8* %bitcast91, i8* %bitcast184, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %nk, i32* %nk.addr, align 4
  %bitcast185 = bitcast i32* %nl.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast93, i8* %bitcast95, i8* %bitcast185, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %nl, i32* %nl.addr, align 4
  %bitcast186 = bitcast double** %alpha.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast97, i8* %bitcast99, i8* %bitcast186, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %alpha, double** %alpha.addr, align 8
  %bitcast176 = bitcast double** %alpha.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast176, i8* %20, i8* %21, i64 %22, i8* %23)
  %bitcast187 = bitcast double** %beta.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast101, i8* %bitcast103, i8* %bitcast187, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %beta, double** %beta.addr, align 8
  %bitcast177 = bitcast double** %beta.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast177, i8* %16, i8* %17, i64 %18, i8* %19)
  %bitcast188 = bitcast double** %A.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast105, i8* %bitcast107, i8* %bitcast188, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %A, double** %A.addr, align 8
  %bitcast178 = bitcast double** %A.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast178, i8* %12, i8* %13, i64 %14, i8* %15)
  %bitcast189 = bitcast double** %B.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast109, i8* %bitcast111, i8* %bitcast189, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %B, double** %B.addr, align 8
  %bitcast179 = bitcast double** %B.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast179, i8* %8, i8* %9, i64 %10, i8* %11)
  %bitcast190 = bitcast double** %C.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast113, i8* %bitcast115, i8* %bitcast190, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %C, double** %C.addr, align 8
  %bitcast180 = bitcast double** %C.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast180, i8* %4, i8* %5, i64 %6, i8* %7)
  %bitcast191 = bitcast double** %D.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast117, i8* %bitcast119, i8* %bitcast191, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %D, double** %D.addr, align 8
  %bitcast181 = bitcast double** %D.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast181, i8* %0, i8* %1, i64 %2, i8* %3)
  %25 = load i32* %ni.addr, align 4
  %26 = zext i32 %25 to i64
  %27 = load i32* %nl.addr, align 4
  %28 = zext i32 %27 to i64
  %29 = load i32* %nk.addr, align 4
  %30 = zext i32 %29 to i64
  %31 = load i32* %nj.addr, align 4
  %32 = zext i32 %31 to i64
  %33 = load i32* %nl.addr, align 4
  %34 = zext i32 %33 to i64
  %35 = load i32* %nj.addr, align 4
  %36 = zext i32 %35 to i64
  %37 = load i32* %ni.addr, align 4
  %38 = zext i32 %37 to i64
  %39 = load i32* %nl.addr, align 4
  %40 = zext i32 %39 to i64
  %41 = load double** %alpha.addr, align 8
  %bitcast128 = bitcast double** %alpha.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast128, i8** %base.alloca, i8** %bound.alloca, i64* %key.alloca, i8** %lock.alloca)
  %base.load = load i8** %base.alloca
  %bound.load = load i8** %bound.alloca
  %key.load129 = load i64* %key.alloca
  %lock.load130 = load i8** %lock.alloca
  %bitcast192 = bitcast double* %41 to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %base.load, i8* %bound.load, i8* %bitcast192, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_store_dereference_check(i8* %lock.load130, i64 %key.load129, i8* %base.load, i8* %bound.load)
  store double 3.241200e+04, double* %41, align 8
  %42 = load double** %beta.addr, align 8
  %bitcast131 = bitcast double** %beta.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast131, i8** %base.alloca132, i8** %bound.alloca133, i64* %key.alloca134, i8** %lock.alloca135)
  %base.load136 = load i8** %base.alloca132
  %bound.load137 = load i8** %bound.alloca133
  %key.load138 = load i64* %key.alloca134
  %lock.load139 = load i8** %lock.alloca135
  %bitcast193 = bitcast double* %42 to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %base.load136, i8* %bound.load137, i8* %bitcast193, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_store_dereference_check(i8* %lock.load139, i64 %key.load138, i8* %base.load136, i8* %bound.load137)
  store double 2.123000e+03, double* %42, align 8
  %bitcast194 = bitcast i32* %i to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast121, i8* %bitcast123, i8* %bitcast194, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %i, align 4
  %yy_18 = bitcast i32* %nk.addr to i8*
  %yy_19 = bitcast i8** %base.alloca141 to i8*
  %yy_20 = bitcast i8** %bound.alloca142 to i8*
  %yy_21 = bitcast i32* %ni.addr to i8*
  %yy_22 = bitcast i64* %key.alloca143 to i8*
  %yy_23 = bitcast double** %A.addr to i8*
  %yy_24 = bitcast i8** %lock.alloca144 to i8*
  %ya_25 = alloca i64
  store i64 %28, i64* %ya_25
  %yy_26 = bitcast i64* %ya_25 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 1242928373, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_func_37, i8* %yy_18, i8* %yy_19, i8* %yy_20, i8* %yy_21, i8* %yy_22, i8* %yy_23, i8* %yy_24, i8* %yy_26)
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %43 = load i32* %i, align 4
  %44 = load i32* %ni.addr, align 4
  %cmp = icmp slt i32 %43, %44
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %bitcast195 = bitcast i32* %j to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast125, i8* %bitcast127, i8* %bitcast195, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %45 = load i32* %j, align 4
  %46 = load i32* %nk.addr, align 4
  %cmp2 = icmp slt i32 %45, %46
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %47 = load i32* %i, align 4
  %conv = sitofp i32 %47 to double
  %48 = load i32* %j, align 4
  %conv4 = sitofp i32 %48 to double
  %mul = fmul double %conv, %conv4
  %49 = load i32* %ni.addr, align 4
  %conv5 = sitofp i32 %49 to double
  %div = fdiv double %mul, %conv5
  %50 = load i32* %j, align 4
  %idxprom = sext i32 %50 to i64
  %51 = load i32* %i, align 4
  %idxprom6 = sext i32 %51 to i64
  %52 = load double** %A.addr, align 8
  %bitcast140 = bitcast double** %A.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast140, i8** %base.alloca141, i8** %bound.alloca142, i64* %key.alloca143, i8** %lock.alloca144)
  %base.load145 = load i8** %base.alloca141
  %bound.load146 = load i8** %bound.alloca142
  %key.load147 = load i64* %key.alloca143
  %lock.load148 = load i8** %lock.alloca144
  %53 = mul nsw i64 %idxprom6, %28
  %arrayidx = getelementptr inbounds double* %52, i64 %53
  %arrayidx7 = getelementptr inbounds double* %arrayidx, i64 %idxprom
  %bitcast196 = bitcast double* %arrayidx7 to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %base.load145, i8* %bound.load146, i8* %bitcast196, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_store_dereference_check(i8* %lock.load148, i64 %key.load147, i8* %base.load145, i8* %bound.load146)
  store double %div, double* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %54 = load i32* %j, align 4
  %inc = add nsw i32 %54, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %55 = load i32* %i, align 4
  %inc9 = add nsw i32 %55, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  %yy_27 = bitcast i32* %nk.addr to i8*
  %ya_28 = alloca i64
  store i64 %32, i64* %ya_28
  %yy_29 = bitcast i64* %ya_28 to i8*
  %yy_30 = bitcast i8** %bound.alloca151 to i8*
  %yy_31 = bitcast double** %B.addr to i8*
  %yy_32 = bitcast i64* %key.alloca152 to i8*
  %yy_33 = bitcast i32* %nj.addr to i8*
  %yy_34 = bitcast i8** %lock.alloca153 to i8*
  %yy_35 = bitcast i8** %base.alloca150 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 901987152, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_func_40, i8* %yy_27, i8* %yy_29, i8* %yy_30, i8* %yy_31, i8* %yy_32, i8* %yy_33, i8* %yy_34, i8* %yy_35)
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc31, %for.end10
  %56 = load i32* %i, align 4
  %57 = load i32* %nk.addr, align 4
  %cmp12 = icmp slt i32 %56, %57
  br i1 %cmp12, label %for.body14, label %for.end33

for.body14:                                       ; preds = %for.cond11
  %bitcast197 = bitcast i32* %j to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast125, i8* %bitcast127, i8* %bitcast197, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %j, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc28, %for.body14
  %58 = load i32* %j, align 4
  %59 = load i32* %nj.addr, align 4
  %cmp16 = icmp slt i32 %58, %59
  br i1 %cmp16, label %for.body18, label %for.end30

for.body18:                                       ; preds = %for.cond15
  %60 = load i32* %i, align 4
  %conv19 = sitofp i32 %60 to double
  %61 = load i32* %j, align 4
  %add = add nsw i32 %61, 1
  %conv20 = sitofp i32 %add to double
  %mul21 = fmul double %conv19, %conv20
  %62 = load i32* %nj.addr, align 4
  %conv22 = sitofp i32 %62 to double
  %div23 = fdiv double %mul21, %conv22
  %63 = load i32* %j, align 4
  %idxprom24 = sext i32 %63 to i64
  %64 = load i32* %i, align 4
  %idxprom25 = sext i32 %64 to i64
  %65 = load double** %B.addr, align 8
  %bitcast149 = bitcast double** %B.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast149, i8** %base.alloca150, i8** %bound.alloca151, i64* %key.alloca152, i8** %lock.alloca153)
  %base.load154 = load i8** %base.alloca150
  %bound.load155 = load i8** %bound.alloca151
  %key.load156 = load i64* %key.alloca152
  %lock.load157 = load i8** %lock.alloca153
  %66 = mul nsw i64 %idxprom25, %32
  %arrayidx26 = getelementptr inbounds double* %65, i64 %66
  %arrayidx27 = getelementptr inbounds double* %arrayidx26, i64 %idxprom24
  %bitcast198 = bitcast double* %arrayidx27 to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %base.load154, i8* %bound.load155, i8* %bitcast198, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_store_dereference_check(i8* %lock.load157, i64 %key.load156, i8* %base.load154, i8* %bound.load155)
  store double %div23, double* %arrayidx27, align 8
  br label %for.inc28

for.inc28:                                        ; preds = %for.body18
  %67 = load i32* %j, align 4
  %inc29 = add nsw i32 %67, 1
  store i32 %inc29, i32* %j, align 4
  br label %for.cond15

for.end30:                                        ; preds = %for.cond15
  br label %for.inc31

for.inc31:                                        ; preds = %for.end30
  %68 = load i32* %i, align 4
  %inc32 = add nsw i32 %68, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.cond11

for.end33:                                        ; preds = %for.cond11
  store i32 0, i32* %i, align 4
  %ya_9 = alloca i64
  store i64 %36, i64* %ya_9
  %yy_10 = bitcast i64* %ya_9 to i8*
  %yy_11 = bitcast i8** %base.alloca159 to i8*
  %yy_12 = bitcast i8** %bound.alloca160 to i8*
  %yy_13 = bitcast double** %C.addr to i8*
  %yy_14 = bitcast i32* %nl.addr to i8*
  %yy_15 = bitcast i8** %lock.alloca162 to i8*
  %yy_16 = bitcast i32* %nj.addr to i8*
  %yy_17 = bitcast i64* %key.alloca161 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32 -1797411482, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_func_34, i8* %yy_10, i8* %yy_11, i8* %yy_12, i8* %yy_13, i8* %yy_14, i8* %yy_15, i8* %yy_16, i8* %yy_17)
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc55, %for.end33
  %69 = load i32* %i, align 4
  %70 = load i32* %nl.addr, align 4
  %cmp35 = icmp slt i32 %69, %70
  br i1 %cmp35, label %for.body37, label %for.end57

for.body37:                                       ; preds = %for.cond34
  %bitcast199 = bitcast i32* %j to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast125, i8* %bitcast127, i8* %bitcast199, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %j, align 4
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc52, %for.body37
  %71 = load i32* %j, align 4
  %72 = load i32* %nj.addr, align 4
  %cmp39 = icmp slt i32 %71, %72
  br i1 %cmp39, label %for.body41, label %for.end54

for.body41:                                       ; preds = %for.cond38
  %73 = load i32* %i, align 4
  %conv42 = sitofp i32 %73 to double
  %74 = load i32* %j, align 4
  %add43 = add nsw i32 %74, 3
  %conv44 = sitofp i32 %add43 to double
  %mul45 = fmul double %conv42, %conv44
  %75 = load i32* %nl.addr, align 4
  %conv46 = sitofp i32 %75 to double
  %div47 = fdiv double %mul45, %conv46
  %76 = load i32* %j, align 4
  %idxprom48 = sext i32 %76 to i64
  %77 = load i32* %i, align 4
  %idxprom49 = sext i32 %77 to i64
  %78 = load double** %C.addr, align 8
  %bitcast158 = bitcast double** %C.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast158, i8** %base.alloca159, i8** %bound.alloca160, i64* %key.alloca161, i8** %lock.alloca162)
  %base.load163 = load i8** %base.alloca159
  %bound.load164 = load i8** %bound.alloca160
  %key.load165 = load i64* %key.alloca161
  %lock.load166 = load i8** %lock.alloca162
  %79 = mul nsw i64 %idxprom49, %36
  %arrayidx50 = getelementptr inbounds double* %78, i64 %79
  %arrayidx51 = getelementptr inbounds double* %arrayidx50, i64 %idxprom48
  %bitcast200 = bitcast double* %arrayidx51 to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %base.load163, i8* %bound.load164, i8* %bitcast200, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_store_dereference_check(i8* %lock.load166, i64 %key.load165, i8* %base.load163, i8* %bound.load164)
  store double %div47, double* %arrayidx51, align 8
  br label %for.inc52

for.inc52:                                        ; preds = %for.body41
  %80 = load i32* %j, align 4
  %inc53 = add nsw i32 %80, 1
  store i32 %inc53, i32* %j, align 4
  br label %for.cond38

for.end54:                                        ; preds = %for.cond38
  br label %for.inc55

for.inc55:                                        ; preds = %for.end54
  %81 = load i32* %i, align 4
  %inc56 = add nsw i32 %81, 1
  store i32 %inc56, i32* %i, align 4
  br label %for.cond34

for.end57:                                        ; preds = %for.cond34
  store i32 0, i32* %i, align 4
  %yy_ = bitcast i32* %ni.addr to i8*
  %yy_1 = bitcast i32* %nk.addr to i8*
  %yy_2 = bitcast double** %D.addr to i8*
  %yy_3 = bitcast i64* %key.alloca170 to i8*
  %yy_4 = bitcast i32* %nl.addr to i8*
  %ya_ = alloca i64
  store i64 %40, i64* %ya_
  %yy_5 = bitcast i64* %ya_ to i8*
  %yy_6 = bitcast i8** %lock.alloca171 to i8*
  %yy_7 = bitcast i8** %bound.alloca169 to i8*
  %yy_8 = bitcast i8** %base.alloca168 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_(i32 -1561608445, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_func_31, i8* %yy_, i8* %yy_1, i8* %yy_2, i8* %yy_3, i8* %yy_4, i8* %yy_5, i8* %yy_6, i8* %yy_7, i8* %yy_8)
  br label %for.cond58

for.cond58:                                       ; preds = %for.inc79, %for.end57
  %82 = load i32* %i, align 4
  %83 = load i32* %ni.addr, align 4
  %cmp59 = icmp slt i32 %82, %83
  br i1 %cmp59, label %for.body61, label %for.end81

for.body61:                                       ; preds = %for.cond58
  %bitcast201 = bitcast i32* %j to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast125, i8* %bitcast127, i8* %bitcast201, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %j, align 4
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc76, %for.body61
  %84 = load i32* %j, align 4
  %85 = load i32* %nl.addr, align 4
  %cmp63 = icmp slt i32 %84, %85
  br i1 %cmp63, label %for.body65, label %for.end78

for.body65:                                       ; preds = %for.cond62
  %86 = load i32* %i, align 4
  %conv66 = sitofp i32 %86 to double
  %87 = load i32* %j, align 4
  %add67 = add nsw i32 %87, 2
  %conv68 = sitofp i32 %add67 to double
  %mul69 = fmul double %conv66, %conv68
  %88 = load i32* %nk.addr, align 4
  %conv70 = sitofp i32 %88 to double
  %div71 = fdiv double %mul69, %conv70
  %89 = load i32* %j, align 4
  %idxprom72 = sext i32 %89 to i64
  %90 = load i32* %i, align 4
  %idxprom73 = sext i32 %90 to i64
  %91 = load double** %D.addr, align 8
  %bitcast167 = bitcast double** %D.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast167, i8** %base.alloca168, i8** %bound.alloca169, i64* %key.alloca170, i8** %lock.alloca171)
  %base.load172 = load i8** %base.alloca168
  %bound.load173 = load i8** %bound.alloca169
  %key.load174 = load i64* %key.alloca170
  %lock.load175 = load i8** %lock.alloca171
  %92 = mul nsw i64 %idxprom73, %40
  %arrayidx74 = getelementptr inbounds double* %91, i64 %92
  %arrayidx75 = getelementptr inbounds double* %arrayidx74, i64 %idxprom72
  %bitcast202 = bitcast double* %arrayidx75 to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %base.load172, i8* %bound.load173, i8* %bitcast202, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_store_dereference_check(i8* %lock.load175, i64 %key.load174, i8* %base.load172, i8* %bound.load173)
  store double %div71, double* %arrayidx75, align 8
  br label %for.inc76

for.inc76:                                        ; preds = %for.body65
  %93 = load i32* %j, align 4
  %inc77 = add nsw i32 %93, 1
  store i32 %inc77, i32* %j, align 4
  br label %for.cond62

for.end78:                                        ; preds = %for.cond62
  br label %for.inc79

for.inc79:                                        ; preds = %for.end78
  %94 = load i32* %i, align 4
  %inc80 = add nsw i32 %94, 1
  store i32 %inc80, i32* %i, align 4
  br label %for.cond58

for.end81:                                        ; preds = %for.cond58
  call void @_Z4joinj(i32 -1561608445)
  call void @_Z4joinj(i32 -1797411482)
  call void @_Z4joinj(i32 1242928373)
  call void @_Z4joinj(i32 901987152)
  call void @__softboundcets_stack_memory_deallocation(i64 %key.load)
  ret void

fault:                                            ; No predecessors!
  call void @__softboundcets_dummy()
  call void @__softboundcets_abort()
  unreachable
}

; Function Attrs: nounwind uwtable
define internal void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, double* %tmp, double* %A, double* %B, double* %C, double* %D) #0 {
entry:
  %base.alloca180 = alloca i8*
  %bound.alloca181 = alloca i8*
  %key.alloca182 = alloca i64
  %lock.alloca183 = alloca i8*
  %base.alloca171 = alloca i8*
  %bound.alloca172 = alloca i8*
  %key.alloca173 = alloca i64
  %lock.alloca174 = alloca i8*
  %base.alloca162 = alloca i8*
  %bound.alloca163 = alloca i8*
  %key.alloca164 = alloca i64
  %lock.alloca165 = alloca i8*
  %base.alloca153 = alloca i8*
  %bound.alloca154 = alloca i8*
  %key.alloca155 = alloca i64
  %lock.alloca156 = alloca i8*
  %base.alloca144 = alloca i8*
  %bound.alloca145 = alloca i8*
  %key.alloca146 = alloca i64
  %lock.alloca147 = alloca i8*
  %base.alloca135 = alloca i8*
  %bound.alloca136 = alloca i8*
  %key.alloca137 = alloca i64
  %lock.alloca138 = alloca i8*
  %base.alloca126 = alloca i8*
  %bound.alloca127 = alloca i8*
  %key.alloca128 = alloca i64
  %lock.alloca129 = alloca i8*
  %base.alloca = alloca i8*
  %bound.alloca = alloca i8*
  %key.alloca = alloca i64
  %lock.alloca = alloca i8*
  %lock_alloca = alloca i8*
  %key_alloca = alloca i64
  call void @__softboundcets_stack_memory_allocation(i8** %lock_alloca, i64* %key_alloca)
  %lock.load = load i8** %lock_alloca
  %key.load = load i64* %key_alloca
  %0 = call i8* @__softboundcets_load_base_shadow_stack(i32 5)
  %1 = call i8* @__softboundcets_load_bound_shadow_stack(i32 5)
  %2 = call i64 @__softboundcets_load_key_shadow_stack(i32 5)
  %3 = call i8* @__softboundcets_load_lock_shadow_stack(i32 5)
  %4 = call i8* @__softboundcets_load_base_shadow_stack(i32 4)
  %5 = call i8* @__softboundcets_load_bound_shadow_stack(i32 4)
  %6 = call i64 @__softboundcets_load_key_shadow_stack(i32 4)
  %7 = call i8* @__softboundcets_load_lock_shadow_stack(i32 4)
  %8 = call i8* @__softboundcets_load_base_shadow_stack(i32 3)
  %9 = call i8* @__softboundcets_load_bound_shadow_stack(i32 3)
  %10 = call i64 @__softboundcets_load_key_shadow_stack(i32 3)
  %11 = call i8* @__softboundcets_load_lock_shadow_stack(i32 3)
  %12 = call i8* @__softboundcets_load_base_shadow_stack(i32 2)
  %13 = call i8* @__softboundcets_load_bound_shadow_stack(i32 2)
  %14 = call i64 @__softboundcets_load_key_shadow_stack(i32 2)
  %15 = call i8* @__softboundcets_load_lock_shadow_stack(i32 2)
  %16 = call i8* @__softboundcets_load_base_shadow_stack(i32 1)
  %17 = call i8* @__softboundcets_load_bound_shadow_stack(i32 1)
  %18 = call i64 @__softboundcets_load_key_shadow_stack(i32 1)
  %19 = call i8* @__softboundcets_load_lock_shadow_stack(i32 1)
  %20 = call i8* @__softboundcets_get_global_lock()
  %ni.addr = alloca i32, align 4
  %ni.addr68 = bitcast i32* %ni.addr to i32*
  %bitcast = bitcast i32* %ni.addr to i8*
  %mtmp = getelementptr i32* %ni.addr68, i32 1
  %bitcast69 = bitcast i32* %mtmp to i8*
  %nj.addr = alloca i32, align 4
  %nj.addr70 = bitcast i32* %nj.addr to i32*
  %bitcast71 = bitcast i32* %nj.addr to i8*
  %mtmp72 = getelementptr i32* %nj.addr70, i32 1
  %bitcast73 = bitcast i32* %mtmp72 to i8*
  %nk.addr = alloca i32, align 4
  %nk.addr74 = bitcast i32* %nk.addr to i32*
  %bitcast75 = bitcast i32* %nk.addr to i8*
  %mtmp76 = getelementptr i32* %nk.addr74, i32 1
  %bitcast77 = bitcast i32* %mtmp76 to i8*
  %nl.addr = alloca i32, align 4
  %nl.addr78 = bitcast i32* %nl.addr to i32*
  %bitcast79 = bitcast i32* %nl.addr to i8*
  %mtmp80 = getelementptr i32* %nl.addr78, i32 1
  %bitcast81 = bitcast i32* %mtmp80 to i8*
  %alpha.addr = alloca double, align 8
  %alpha.addr82 = bitcast double* %alpha.addr to double*
  %bitcast83 = bitcast double* %alpha.addr to i8*
  %mtmp84 = getelementptr double* %alpha.addr82, i32 1
  %bitcast85 = bitcast double* %mtmp84 to i8*
  %beta.addr = alloca double, align 8
  %beta.addr86 = bitcast double* %beta.addr to double*
  %bitcast87 = bitcast double* %beta.addr to i8*
  %mtmp88 = getelementptr double* %beta.addr86, i32 1
  %bitcast89 = bitcast double* %mtmp88 to i8*
  %tmp.addr = alloca double*, align 8
  %tmp.addr90 = bitcast double** %tmp.addr to double**
  %bitcast91 = bitcast double** %tmp.addr to i8*
  %mtmp92 = getelementptr double** %tmp.addr90, i32 1
  %bitcast93 = bitcast double** %mtmp92 to i8*
  %A.addr = alloca double*, align 8
  %A.addr94 = bitcast double** %A.addr to double**
  %bitcast95 = bitcast double** %A.addr to i8*
  %mtmp96 = getelementptr double** %A.addr94, i32 1
  %bitcast97 = bitcast double** %mtmp96 to i8*
  %B.addr = alloca double*, align 8
  %B.addr98 = bitcast double** %B.addr to double**
  %bitcast99 = bitcast double** %B.addr to i8*
  %mtmp100 = getelementptr double** %B.addr98, i32 1
  %bitcast101 = bitcast double** %mtmp100 to i8*
  %C.addr = alloca double*, align 8
  %C.addr102 = bitcast double** %C.addr to double**
  %bitcast103 = bitcast double** %C.addr to i8*
  %mtmp104 = getelementptr double** %C.addr102, i32 1
  %bitcast105 = bitcast double** %mtmp104 to i8*
  %D.addr = alloca double*, align 8
  %D.addr106 = bitcast double** %D.addr to double**
  %bitcast107 = bitcast double** %D.addr to i8*
  %mtmp108 = getelementptr double** %D.addr106, i32 1
  %bitcast109 = bitcast double** %mtmp108 to i8*
  %i = alloca i32, align 4
  %i110 = bitcast i32* %i to i32*
  %bitcast111 = bitcast i32* %i to i8*
  %mtmp112 = getelementptr i32* %i110, i32 1
  %bitcast113 = bitcast i32* %mtmp112 to i8*
  %j = alloca i32, align 4
  %j114 = bitcast i32* %j to i32*
  %bitcast115 = bitcast i32* %j to i8*
  %mtmp116 = getelementptr i32* %j114, i32 1
  %bitcast117 = bitcast i32* %mtmp116 to i8*
  %k = alloca i32, align 4
  %k118 = bitcast i32* %k to i32*
  %bitcast119 = bitcast i32* %k to i8*
  %mtmp120 = getelementptr i32* %k118, i32 1
  %bitcast121 = bitcast i32* %mtmp120 to i8*
  %bitcast193 = bitcast i32* %ni.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast, i8* %bitcast69, i8* %bitcast193, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %ni, i32* %ni.addr, align 4
  %bitcast194 = bitcast i32* %nj.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast71, i8* %bitcast73, i8* %bitcast194, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %nj, i32* %nj.addr, align 4
  %bitcast195 = bitcast i32* %nk.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast75, i8* %bitcast77, i8* %bitcast195, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %nk, i32* %nk.addr, align 4
  %bitcast196 = bitcast i32* %nl.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast79, i8* %bitcast81, i8* %bitcast196, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %nl, i32* %nl.addr, align 4
  %bitcast197 = bitcast double* %alpha.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast83, i8* %bitcast85, i8* %bitcast197, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  store double %alpha, double* %alpha.addr, align 8
  %bitcast198 = bitcast double* %beta.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast87, i8* %bitcast89, i8* %bitcast198, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  store double %beta, double* %beta.addr, align 8
  %bitcast199 = bitcast double** %tmp.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast91, i8* %bitcast93, i8* %bitcast199, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %tmp, double** %tmp.addr, align 8
  %bitcast188 = bitcast double** %tmp.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast188, i8* %16, i8* %17, i64 %18, i8* %19)
  %bitcast200 = bitcast double** %A.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast95, i8* %bitcast97, i8* %bitcast200, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %A, double** %A.addr, align 8
  %bitcast189 = bitcast double** %A.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast189, i8* %12, i8* %13, i64 %14, i8* %15)
  %bitcast201 = bitcast double** %B.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast99, i8* %bitcast101, i8* %bitcast201, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %B, double** %B.addr, align 8
  %bitcast190 = bitcast double** %B.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast190, i8* %8, i8* %9, i64 %10, i8* %11)
  %bitcast202 = bitcast double** %C.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast103, i8* %bitcast105, i8* %bitcast202, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %C, double** %C.addr, align 8
  %bitcast191 = bitcast double** %C.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast191, i8* %4, i8* %5, i64 %6, i8* %7)
  %bitcast203 = bitcast double** %D.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast107, i8* %bitcast109, i8* %bitcast203, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %D, double** %D.addr, align 8
  %bitcast192 = bitcast double** %D.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast192, i8* %0, i8* %1, i64 %2, i8* %3)
  %21 = load i32* %ni.addr, align 4
  %22 = zext i32 %21 to i64
  %23 = load i32* %nj.addr, align 4
  %24 = zext i32 %23 to i64
  %25 = load i32* %ni.addr, align 4
  %26 = zext i32 %25 to i64
  %27 = load i32* %nk.addr, align 4
  %28 = zext i32 %27 to i64
  %29 = load i32* %nk.addr, align 4
  %30 = zext i32 %29 to i64
  %31 = load i32* %nj.addr, align 4
  %32 = zext i32 %31 to i64
  %33 = load i32* %nl.addr, align 4
  %34 = zext i32 %33 to i64
  %35 = load i32* %nj.addr, align 4
  %36 = zext i32 %35 to i64
  %37 = load i32* %ni.addr, align 4
  %38 = zext i32 %37 to i64
  %39 = load i32* %nl.addr, align 4
  %40 = zext i32 %39 to i64
  %bitcast204 = bitcast i32* %i to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast111, i8* %bitcast113, i8* %bitcast204, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %i, align 4
  %yy_28 = bitcast i32* %ni.addr to i8*
  %yy_29 = bitcast i8** %base.alloca144 to i8*
  %yy_30 = bitcast double** %A.addr to i8*
  %yy_31 = bitcast i8** %bound.alloca136 to i8*
  %yy_32 = bitcast i8** %bound.alloca127 to i8*
  %yy_33 = bitcast i8** %bound.alloca to i8*
  %yy_34 = bitcast i64* %key.alloca137 to i8*
  %yy_35 = bitcast double* %alpha.addr to i8*
  %yy_36 = bitcast i8** %lock.alloca129 to i8*
  %yy_37 = bitcast i8** %lock.alloca to i8*
  %yy_38 = bitcast i8** %base.alloca126 to i8*
  %yy_39 = bitcast i64* %key.alloca146 to i8*
  %yy_40 = bitcast i32* %nj.addr to i8*
  %yy_41 = bitcast double** %tmp.addr to i8*
  %yy_42 = bitcast i64* %key.alloca128 to i8*
  %yy_43 = bitcast i8** %bound.alloca145 to i8*
  %ya_44 = alloca i64
  store i64 %28, i64* %ya_44
  %yy_45 = bitcast i64* %ya_44 to i8*
  %yy_46 = bitcast i8** %lock.alloca138 to i8*
  %yy_47 = bitcast i64* %key.alloca to i8*
  %yy_48 = bitcast double** %B.addr to i8*
  %ya_49 = alloca i64
  store i64 %24, i64* %ya_49
  %yy_50 = bitcast i64* %ya_49 to i8*
  %yy_51 = bitcast i8** %base.alloca135 to i8*
  %yy_52 = bitcast i32* %nk.addr to i8*
  %yy_53 = bitcast i8** %base.alloca to i8*
  %yy_54 = bitcast i8** %lock.alloca147 to i8*
  %ya_55 = alloca i64
  store i64 %32, i64* %ya_55
  %yy_56 = bitcast i64* %ya_55 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1558056636, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_func_25, i8* %yy_28, i8* %yy_29, i8* %yy_30, i8* %yy_31, i8* %yy_32, i8* %yy_33, i8* %yy_34, i8* %yy_35, i8* %yy_36, i8* %yy_37, i8* %yy_38, i8* %yy_39, i8* %yy_40, i8* %yy_41, i8* %yy_42, i8* %yy_43, i8* %yy_45, i8* %yy_46, i8* %yy_47, i8* %yy_48, i8* %yy_50, i8* %yy_51, i8* %yy_52, i8* %yy_53, i8* %yy_54, i8* %yy_56)
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %entry
  %41 = load i32* %i, align 4
  %42 = load i32* %ni.addr, align 4
  %cmp = icmp slt i32 %41, %42
  br i1 %cmp, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  %bitcast205 = bitcast i32* %j to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast115, i8* %bitcast117, i8* %bitcast205, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc25, %for.body
  %43 = load i32* %j, align 4
  %44 = load i32* %nj.addr, align 4
  %cmp5 = icmp slt i32 %43, %44
  br i1 %cmp5, label %for.body6, label %for.end27

for.body6:                                        ; preds = %for.cond4
  %45 = load i32* %j, align 4
  %idxprom = sext i32 %45 to i64
  %46 = load i32* %i, align 4
  %idxprom7 = sext i32 %46 to i64
  %47 = load double** %tmp.addr, align 8
  %bitcast122 = bitcast double** %tmp.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast122, i8** %base.alloca, i8** %bound.alloca, i64* %key.alloca, i8** %lock.alloca)
  %base.load = load i8** %base.alloca
  %bound.load = load i8** %bound.alloca
  %key.load123 = load i64* %key.alloca
  %lock.load124 = load i8** %lock.alloca
  %48 = mul nsw i64 %idxprom7, %24
  %arrayidx = getelementptr inbounds double* %47, i64 %48
  %arrayidx8 = getelementptr inbounds double* %arrayidx, i64 %idxprom
  %bitcast206 = bitcast double* %arrayidx8 to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %base.load, i8* %bound.load, i8* %bitcast206, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_store_dereference_check(i8* %lock.load124, i64 %key.load123, i8* %base.load, i8* %bound.load)
  store double 0.000000e+00, double* %arrayidx8, align 8
  %bitcast207 = bitcast i32* %k to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast119, i8* %bitcast121, i8* %bitcast207, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %k, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body6
  %49 = load i32* %k, align 4
  %50 = load i32* %nk.addr, align 4
  %cmp10 = icmp slt i32 %49, %50
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond9
  %51 = load double* %alpha.addr, align 8
  %52 = load i32* %k, align 4
  %idxprom12 = sext i32 %52 to i64
  %53 = load i32* %i, align 4
  %idxprom13 = sext i32 %53 to i64
  %54 = load double** %A.addr, align 8
  %bitcast125 = bitcast double** %A.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast125, i8** %base.alloca126, i8** %bound.alloca127, i64* %key.alloca128, i8** %lock.alloca129)
  %base.load130 = load i8** %base.alloca126
  %bound.load131 = load i8** %bound.alloca127
  %key.load132 = load i64* %key.alloca128
  %lock.load133 = load i8** %lock.alloca129
  %55 = mul nsw i64 %idxprom13, %28
  %arrayidx14 = getelementptr inbounds double* %54, i64 %55
  %arrayidx15 = getelementptr inbounds double* %arrayidx14, i64 %idxprom12
  %bitcast209 = bitcast double* %arrayidx15 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load130, i8* %bound.load131, i8* %bitcast209, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load133, i64 %key.load132, i8* %base.load130, i8* %bound.load131)
  %56 = load double* %arrayidx15, align 8
  %mul = fmul double %51, %56
  %57 = load i32* %j, align 4
  %idxprom16 = sext i32 %57 to i64
  %58 = load i32* %k, align 4
  %idxprom17 = sext i32 %58 to i64
  %59 = load double** %B.addr, align 8
  %bitcast134 = bitcast double** %B.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast134, i8** %base.alloca135, i8** %bound.alloca136, i64* %key.alloca137, i8** %lock.alloca138)
  %base.load139 = load i8** %base.alloca135
  %bound.load140 = load i8** %bound.alloca136
  %key.load141 = load i64* %key.alloca137
  %lock.load142 = load i8** %lock.alloca138
  %60 = mul nsw i64 %idxprom17, %32
  %arrayidx18 = getelementptr inbounds double* %59, i64 %60
  %arrayidx19 = getelementptr inbounds double* %arrayidx18, i64 %idxprom16
  %bitcast210 = bitcast double* %arrayidx19 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load139, i8* %bound.load140, i8* %bitcast210, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load142, i64 %key.load141, i8* %base.load139, i8* %bound.load140)
  %61 = load double* %arrayidx19, align 8
  %mul20 = fmul double %mul, %61
  %62 = load i32* %j, align 4
  %idxprom21 = sext i32 %62 to i64
  %63 = load i32* %i, align 4
  %idxprom22 = sext i32 %63 to i64
  %64 = load double** %tmp.addr, align 8
  %base.load148 = load i8** %base.alloca144
  %bound.load149 = load i8** %bound.alloca145
  %key.load150 = load i64* %key.alloca146
  %lock.load151 = load i8** %lock.alloca147
  %65 = mul nsw i64 %idxprom22, %24
  %arrayidx23 = getelementptr inbounds double* %64, i64 %65
  %arrayidx24 = getelementptr inbounds double* %arrayidx23, i64 %idxprom21
  %66 = load double* %arrayidx24, align 8
  %add = fadd double %66, %mul20
  store double %add, double* %arrayidx24, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body11
  %67 = load i32* %k, align 4
  %inc = add nsw i32 %67, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  br label %for.inc25

for.inc25:                                        ; preds = %for.end
  %68 = load i32* %j, align 4
  %inc26 = add nsw i32 %68, 1
  store i32 %inc26, i32* %j, align 4
  br label %for.cond4

for.end27:                                        ; preds = %for.cond4
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %69 = load i32* %i, align 4
  %inc29 = add nsw i32 %69, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  %yy_ = bitcast double* %beta.addr to i8*
  %yy_1 = bitcast i64* %key.alloca182 to i8*
  %yy_2 = bitcast i32* %nj.addr to i8*
  %yy_3 = bitcast i8** %bound.alloca172 to i8*
  %yy_4 = bitcast i8** %bound.alloca154 to i8*
  %ya_ = alloca i64
  store i64 %24, i64* %ya_
  %yy_5 = bitcast i64* %ya_ to i8*
  %yy_6 = bitcast i8** %base.alloca171 to i8*
  %yy_7 = bitcast i8** %bound.alloca163 to i8*
  %yy_8 = bitcast double** %tmp.addr to i8*
  %yy_9 = bitcast i8** %base.alloca153 to i8*
  %yy_10 = bitcast i8** %lock.alloca165 to i8*
  %yy_11 = bitcast i8** %base.alloca180 to i8*
  %yy_12 = bitcast i32* %nl.addr to i8*
  %yy_13 = bitcast i8** %base.alloca162 to i8*
  %yy_14 = bitcast double** %D.addr to i8*
  %yy_15 = bitcast i8** %lock.alloca183 to i8*
  %ya_16 = alloca i64
  store i64 %36, i64* %ya_16
  %yy_17 = bitcast i64* %ya_16 to i8*
  %yy_18 = bitcast i64* %key.alloca164 to i8*
  %yy_19 = bitcast i8** %lock.alloca156 to i8*
  %yy_20 = bitcast i64* %key.alloca173 to i8*
  %yy_21 = bitcast i8** %lock.alloca174 to i8*
  %yy_22 = bitcast i8** %bound.alloca181 to i8*
  %yy_23 = bitcast i32* %ni.addr to i8*
  %ya_24 = alloca i64
  store i64 %40, i64* %ya_24
  %yy_25 = bitcast i64* %ya_24 to i8*
  %yy_26 = bitcast double** %C.addr to i8*
  %yy_27 = bitcast i64* %key.alloca155 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 852869196, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_func_16, i8* %yy_, i8* %yy_1, i8* %yy_2, i8* %yy_3, i8* %yy_4, i8* %yy_5, i8* %yy_6, i8* %yy_7, i8* %yy_8, i8* %yy_9, i8* %yy_10, i8* %yy_11, i8* %yy_12, i8* %yy_13, i8* %yy_14, i8* %yy_15, i8* %yy_17, i8* %yy_18, i8* %yy_19, i8* %yy_20, i8* %yy_21, i8* %yy_22, i8* %yy_23, i8* %yy_25, i8* %yy_26, i8* %yy_27)
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc65, %for.end30
  %70 = load i32* %i, align 4
  %71 = load i32* %ni.addr, align 4
  %cmp32 = icmp slt i32 %70, %71
  br i1 %cmp32, label %for.body33, label %for.end67

for.body33:                                       ; preds = %for.cond31
  %bitcast208 = bitcast i32* %j to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast115, i8* %bitcast117, i8* %bitcast208, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %j, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc62, %for.body33
  %72 = load i32* %j, align 4
  %73 = load i32* %nl.addr, align 4
  %cmp35 = icmp slt i32 %72, %73
  br i1 %cmp35, label %for.body36, label %for.end64

for.body36:                                       ; preds = %for.cond34
  %74 = load double* %beta.addr, align 8
  %75 = load i32* %j, align 4
  %idxprom37 = sext i32 %75 to i64
  %76 = load i32* %i, align 4
  %idxprom38 = sext i32 %76 to i64
  %77 = load double** %D.addr, align 8
  %bitcast152 = bitcast double** %D.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast152, i8** %base.alloca153, i8** %bound.alloca154, i64* %key.alloca155, i8** %lock.alloca156)
  %base.load157 = load i8** %base.alloca153
  %bound.load158 = load i8** %bound.alloca154
  %key.load159 = load i64* %key.alloca155
  %lock.load160 = load i8** %lock.alloca156
  %78 = mul nsw i64 %idxprom38, %40
  %arrayidx39 = getelementptr inbounds double* %77, i64 %78
  %arrayidx40 = getelementptr inbounds double* %arrayidx39, i64 %idxprom37
  %bitcast212 = bitcast double* %arrayidx40 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load157, i8* %bound.load158, i8* %bitcast212, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load160, i64 %key.load159, i8* %base.load157, i8* %bound.load158)
  %79 = load double* %arrayidx40, align 8
  %mul41 = fmul double %79, %74
  store double %mul41, double* %arrayidx40, align 8
  %bitcast213 = bitcast i32* %k to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast119, i8* %bitcast121, i8* %bitcast213, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %k, align 4
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc59, %for.body36
  %80 = load i32* %k, align 4
  %81 = load i32* %nj.addr, align 4
  %cmp43 = icmp slt i32 %80, %81
  br i1 %cmp43, label %for.body44, label %for.end61

for.body44:                                       ; preds = %for.cond42
  %82 = load i32* %k, align 4
  %idxprom45 = sext i32 %82 to i64
  %83 = load i32* %i, align 4
  %idxprom46 = sext i32 %83 to i64
  %84 = load double** %tmp.addr, align 8
  %bitcast161 = bitcast double** %tmp.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast161, i8** %base.alloca162, i8** %bound.alloca163, i64* %key.alloca164, i8** %lock.alloca165)
  %base.load166 = load i8** %base.alloca162
  %bound.load167 = load i8** %bound.alloca163
  %key.load168 = load i64* %key.alloca164
  %lock.load169 = load i8** %lock.alloca165
  %85 = mul nsw i64 %idxprom46, %24
  %arrayidx47 = getelementptr inbounds double* %84, i64 %85
  %arrayidx48 = getelementptr inbounds double* %arrayidx47, i64 %idxprom45
  %bitcast214 = bitcast double* %arrayidx48 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load166, i8* %bound.load167, i8* %bitcast214, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load169, i64 %key.load168, i8* %base.load166, i8* %bound.load167)
  %86 = load double* %arrayidx48, align 8
  %87 = load i32* %j, align 4
  %idxprom49 = sext i32 %87 to i64
  %88 = load i32* %k, align 4
  %idxprom50 = sext i32 %88 to i64
  %89 = load double** %C.addr, align 8
  %bitcast170 = bitcast double** %C.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast170, i8** %base.alloca171, i8** %bound.alloca172, i64* %key.alloca173, i8** %lock.alloca174)
  %base.load175 = load i8** %base.alloca171
  %bound.load176 = load i8** %bound.alloca172
  %key.load177 = load i64* %key.alloca173
  %lock.load178 = load i8** %lock.alloca174
  %90 = mul nsw i64 %idxprom50, %36
  %arrayidx51 = getelementptr inbounds double* %89, i64 %90
  %arrayidx52 = getelementptr inbounds double* %arrayidx51, i64 %idxprom49
  %bitcast215 = bitcast double* %arrayidx52 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load175, i8* %bound.load176, i8* %bitcast215, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load178, i64 %key.load177, i8* %base.load175, i8* %bound.load176)
  %91 = load double* %arrayidx52, align 8
  %mul53 = fmul double %86, %91
  %92 = load i32* %j, align 4
  %idxprom54 = sext i32 %92 to i64
  %93 = load i32* %i, align 4
  %idxprom55 = sext i32 %93 to i64
  %94 = load double** %D.addr, align 8
  %base.load184 = load i8** %base.alloca180
  %bound.load185 = load i8** %bound.alloca181
  %key.load186 = load i64* %key.alloca182
  %lock.load187 = load i8** %lock.alloca183
  %95 = mul nsw i64 %idxprom55, %40
  %arrayidx56 = getelementptr inbounds double* %94, i64 %95
  %arrayidx57 = getelementptr inbounds double* %arrayidx56, i64 %idxprom54
  %96 = load double* %arrayidx57, align 8
  %add58 = fadd double %96, %mul53
  store double %add58, double* %arrayidx57, align 8
  br label %for.inc59

for.inc59:                                        ; preds = %for.body44
  %97 = load i32* %k, align 4
  %inc60 = add nsw i32 %97, 1
  store i32 %inc60, i32* %k, align 4
  br label %for.cond42

for.end61:                                        ; preds = %for.cond42
  br label %for.inc62

for.inc62:                                        ; preds = %for.end61
  %98 = load i32* %j, align 4
  %inc63 = add nsw i32 %98, 1
  store i32 %inc63, i32* %j, align 4
  br label %for.cond34

for.end64:                                        ; preds = %for.cond34
  br label %for.inc65

for.inc65:                                        ; preds = %for.end64
  %99 = load i32* %i, align 4
  %inc66 = add nsw i32 %99, 1
  store i32 %inc66, i32* %i, align 4
  br label %for.cond31

for.end67:                                        ; preds = %for.cond31
  call void @_Z4joinj(i32 852869196)
  call void @_Z4joinj(i32 -1558056636)
  call void @__softboundcets_stack_memory_deallocation(i64 %key.load)
  ret void

fault:                                            ; No predecessors!
  call void @__softboundcets_dummy()
  call void @__softboundcets_abort()
  unreachable
}

; Function Attrs: nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, double* %D) #0 {
entry:
  %base.alloca52 = alloca i8*
  %bound.alloca53 = alloca i8*
  %key.alloca54 = alloca i64
  %lock.alloca55 = alloca i8*
  %base.alloca43 = alloca i8*
  %bound.alloca44 = alloca i8*
  %key.alloca45 = alloca i64
  %lock.alloca46 = alloca i8*
  %base.alloca34 = alloca i8*
  %bound.alloca35 = alloca i8*
  %key.alloca36 = alloca i64
  %lock.alloca37 = alloca i8*
  %base.alloca = alloca i8*
  %bound.alloca = alloca i8*
  %key.alloca = alloca i64
  %lock.alloca = alloca i8*
  %lock_alloca = alloca i8*
  %key_alloca = alloca i64
  call void @__softboundcets_stack_memory_allocation(i8** %lock_alloca, i64* %key_alloca)
  %lock.load = load i8** %lock_alloca
  %key.load = load i64* %key_alloca
  %0 = call i8* @__softboundcets_load_base_shadow_stack(i32 1)
  %1 = call i8* @__softboundcets_load_bound_shadow_stack(i32 1)
  %2 = call i64 @__softboundcets_load_key_shadow_stack(i32 1)
  %3 = call i8* @__softboundcets_load_lock_shadow_stack(i32 1)
  %4 = call i8* @__softboundcets_get_global_lock()
  %ni.addr = alloca i32, align 4
  %ni.addr12 = bitcast i32* %ni.addr to i32*
  %bitcast = bitcast i32* %ni.addr to i8*
  %mtmp = getelementptr i32* %ni.addr12, i32 1
  %bitcast13 = bitcast i32* %mtmp to i8*
  %nl.addr = alloca i32, align 4
  %nl.addr14 = bitcast i32* %nl.addr to i32*
  %bitcast15 = bitcast i32* %nl.addr to i8*
  %mtmp16 = getelementptr i32* %nl.addr14, i32 1
  %bitcast17 = bitcast i32* %mtmp16 to i8*
  %D.addr = alloca double*, align 8
  %D.addr18 = bitcast double** %D.addr to double**
  %bitcast19 = bitcast double** %D.addr to i8*
  %mtmp20 = getelementptr double** %D.addr18, i32 1
  %bitcast21 = bitcast double** %mtmp20 to i8*
  %i = alloca i32, align 4
  %i22 = bitcast i32* %i to i32*
  %bitcast23 = bitcast i32* %i to i8*
  %mtmp24 = getelementptr i32* %i22, i32 1
  %bitcast25 = bitcast i32* %mtmp24 to i8*
  %j = alloca i32, align 4
  %j26 = bitcast i32* %j to i32*
  %bitcast27 = bitcast i32* %j to i8*
  %mtmp28 = getelementptr i32* %j26, i32 1
  %bitcast29 = bitcast i32* %mtmp28 to i8*
  %bitcast61 = bitcast i32* %ni.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast, i8* %bitcast13, i8* %bitcast61, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %ni, i32* %ni.addr, align 4
  %bitcast62 = bitcast i32* %nl.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast15, i8* %bitcast17, i8* %bitcast62, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %nl, i32* %nl.addr, align 4
  %bitcast63 = bitcast double** %D.addr to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast19, i8* %bitcast21, i8* %bitcast63, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  store double* %D, double** %D.addr, align 8
  %bitcast60 = bitcast double** %D.addr to i8*
  call void @__softboundcets_metadata_store(i8* %bitcast60, i8* %0, i8* %1, i64 %2, i8* %3)
  %5 = load i32* %ni.addr, align 4
  %6 = zext i32 %5 to i64
  %7 = load i32* %nl.addr, align 4
  %8 = zext i32 %7 to i64
  %bitcast64 = bitcast i32* %i to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast23, i8* %bitcast25, i8* %bitcast64, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %i, align 4
  %yy_ = bitcast i64* %key.alloca54 to i8*
  %yy_1 = bitcast i8** %bound.alloca53 to i8*
  %yy_2 = bitcast i8** %base.alloca52 to i8*
  %yy_3 = bitcast i64* %key.alloca45 to i8*
  %yy_4 = bitcast i8** %bound.alloca35 to i8*
  %yy_5 = bitcast i64* %key.alloca36 to i8*
  %yy_6 = bitcast i8** %lock.alloca46 to i8*
  %yy_7 = bitcast double** %D.addr to i8*
  %yy_8 = bitcast i8** %bound.alloca44 to i8*
  %yy_9 = bitcast i32* %ni.addr to i8*
  %ya_ = alloca i64
  store i64 %8, i64* %ya_
  %yy_10 = bitcast i64* %ya_ to i8*
  %yy_11 = bitcast i32* %nl.addr to i8*
  %yy_12 = bitcast i8** %lock.alloca55 to i8*
  %yy_13 = bitcast i8** %base.alloca43 to i8*
  %yy_14 = bitcast i8** %lock.alloca37 to i8*
  %yy_15 = bitcast i8** %base.alloca34 to i8*
  call void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32 -1463795766, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @_spawn_loop_func_22, i8* %yy_, i8* %yy_1, i8* %yy_2, i8* %yy_3, i8* %yy_4, i8* %yy_5, i8* %yy_6, i8* %yy_7, i8* %yy_8, i8* %yy_9, i8* %yy_10, i8* %yy_11, i8* %yy_12, i8* %yy_13, i8* %yy_14, i8* %yy_15)
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %9 = load i32* %i, align 4
  %10 = load i32* %ni.addr, align 4
  %cmp = icmp slt i32 %9, %10
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %bitcast65 = bitcast i32* %j to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast27, i8* %bitcast29, i8* %bitcast65, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %11 = load i32* %j, align 4
  %12 = load i32* %nl.addr, align 4
  %cmp2 = icmp slt i32 %11, %12
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %bitcast67 = bitcast %struct._IO_FILE** @stderr to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* null, i8* inttoptr (i64 281474976710656 to i8*), i8* %bitcast67, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  %13 = load %struct._IO_FILE** @stderr, align 8
  %base.load38 = load i8** %base.alloca34
  %bound.load39 = load i8** %bound.alloca35
  %key.load40 = load i64* %key.alloca36
  %lock.load41 = load i8** %lock.alloca37
  %14 = load i32* %j, align 4
  %idxprom = sext i32 %14 to i64
  %15 = load i32* %i, align 4
  %idxprom4 = sext i32 %15 to i64
  %16 = load double** %D.addr, align 8
  %bitcast42 = bitcast double** %D.addr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast42, i8** %base.alloca43, i8** %bound.alloca44, i64* %key.alloca45, i8** %lock.alloca46)
  %base.load47 = load i8** %base.alloca43
  %bound.load48 = load i8** %bound.alloca44
  %key.load49 = load i64* %key.alloca45
  %lock.load50 = load i8** %lock.alloca46
  %17 = mul nsw i64 %idxprom4, %8
  %arrayidx = getelementptr inbounds double* %16, i64 %17
  %arrayidx5 = getelementptr inbounds double* %arrayidx, i64 %idxprom
  %bitcast68 = bitcast double* %arrayidx5 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %base.load47, i8* %bound.load48, i8* %bitcast68, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %lock.load50, i64 %key.load49, i8* %base.load47, i8* %bound.load48)
  %18 = load double* %arrayidx5, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), double %18)
  %19 = load i32* %i, align 4
  %20 = load i32* %ni.addr, align 4
  %mul = mul nsw i32 %19, %20
  %21 = load i32* %j, align 4
  %add = add nsw i32 %mul, %21
  %rem = srem i32 %add, 20
  %cmp6 = icmp eq i32 %rem, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %22 = load %struct._IO_FILE** @stderr, align 8
  %base.load56 = load i8** %base.alloca52
  %bound.load57 = load i8** %bound.alloca53
  %key.load58 = load i64* %key.alloca54
  %lock.load59 = load i8** %lock.alloca55
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %23 = load i32* %j, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %24 = load i32* %i, align 4
  %inc9 = add nsw i32 %24, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  call void @_Z4joinj(i32 -1463795766)
  %bitcast66 = bitcast %struct._IO_FILE** @stderr to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* null, i8* inttoptr (i64 281474976710656 to i8*), i8* %bitcast66, i64 ptrtoint (i1** getelementptr (i1** null, i32 1) to i64))
  %25 = load %struct._IO_FILE** @stderr, align 8
  %bitcast30 = bitcast %struct._IO_FILE** @stderr to i8*
  call void @__softboundcets_metadata_load(i8* %bitcast30, i8** %base.alloca, i8** %bound.alloca, i64* %key.alloca, i8** %lock.alloca)
  %base.load = load i8** %base.alloca
  %bound.load = load i8** %bound.alloca
  %key.load31 = load i64* %key.alloca
  %lock.load32 = load i8** %lock.alloca
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  call void @__softboundcets_stack_memory_deallocation(i64 %key.load)
  ret void

fault:                                            ; No predecessors!
  call void @__softboundcets_dummy()
  call void @__softboundcets_abort()
  unreachable
}

declare void @softboundcets_free(i8*)

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare void @__softboundcets_spatial_load_dereference_check(i8*, i8*, i8*, i64)

declare void @__softboundcets_spatial_store_dereference_check(i8*, i8*, i8*, i64)

declare void @__softboundcets_temporal_load_dereference_check(i8*, i64, i8*, i8*)

declare void @__softboundcets_temporal_store_dereference_check(i8*, i64, i8*, i8*)

; Function Attrs: nounwind
define internal void @__softboundcets_global_init() #2 {
entry:
  call void @__softboundcets_init(i32 1)
  ret void
}

declare void @__softboundcets_init(i32)

declare void @__softboundcets_allocate_shadow_stack_space(i32)

declare void @__softboundcets_deallocate_shadow_stack_space()

declare i8* @__softboundcets_load_base_shadow_stack(i32)

declare i8* @__softboundcets_load_bound_shadow_stack(i32)

declare i64 @__softboundcets_load_key_shadow_stack(i32)

declare i8* @__softboundcets_load_lock_shadow_stack(i32)

declare void @__softboundcets_store_base_shadow_stack(i8*, i32)

declare void @__softboundcets_store_bound_shadow_stack(i8*, i32)

declare void @__softboundcets_store_key_shadow_stack(i64, i32)

declare void @__softboundcets_store_lock_shadow_stack(i8*, i32)

declare void @__softboundcets_introspect_metadata(i8*, i8*, i32)

declare void @__softboundcets_copy_metadata(i8*, i8*, i64)

declare i8* @__softboundcets_metadata_map(i8*)

declare i8* @__softboundcets_metadata_load_base(i8*)

declare i8* @__softboundcets_metadata_load_bound(i8*)

declare i64 @__softboundcets_metadata_load_key(i8*)

declare i8* @__softboundcets_metadata_load_lock(i8*)

declare void @__softboundcets_metadata_load_vector(i8*, i8**, i8**, i64*, i8**, i32)

declare void @__softboundcets_metadata_store_vector(i8*, i8*, i8*, i64, i8*, i32)

declare void @__softboundcets_metadata_load(i8*, i8**, i8**, i64*, i8**)

declare void @__softboundcets_metadata_store(i8*, i8*, i8*, i64, i8*)

declare void @__softboundcets_memcopy_check(i8*, i8*, i64, i8*, i8*, i8*, i8*, i64, i8*, i64, i8*)

declare void @__softboundcets_memset_check(i8*, i64, i8*, i8*, i64, i8*)

declare i8* @__softboundcets_get_global_lock()

declare void @__softboundcets_stack_memory_allocation(i8**, i64*)

declare void @__softboundcets_stack_memory_deallocation(i64)

declare void @__softboundcets_spatial_call_dereference_check(i8*, i8*, i8*)

declare void @__softboundcets_print_metadata(i8*, i8*, i8*, i64, i64*)

declare void @__softboundcets_dummy()

declare void @__softboundcets_intermediate(i1, i1, i1, i64)

declare void @__softboundcets_abort()

declare void @_Z4joinj(i32)

define internal void @_loop_func_16(double* %beta.addr, i64* %key.alloca182, i32* %nj.addr, i8** %bound.alloca172, i8** %bound.alloca154, i64, i8** %base.alloca171, i8** %bound.alloca163, double** %tmp.addr, i8** %base.alloca153, i8** %lock.alloca165, i8** %base.alloca180, i32* %nl.addr, i8** %base.alloca162, double** %D.addr, i8** %lock.alloca183, i64, i64* %key.alloca164, i8** %lock.alloca156, i64* %key.alloca173, i8** %lock.alloca174, i8** %bound.alloca181, i32* %ni.addr, i64, double** %C.addr, i64* %key.alloca155) {
entry:
  %zyyac_ = alloca i32
  %zyyacptr_ = bitcast i32* %zyyac_ to i32*
  %zyybitcast = bitcast i32* %zyyacptr_ to i8*
  %zyytmp = getelementptr i32* %zyyacptr_, i32 1
  %zyybitcast1 = bitcast i32* %zyytmp to i8*
  %zyac_ = alloca i32
  store i32 0, i32* %zyac_
  %zyacptr_ = bitcast i32* %zyac_ to i32*
  %zybitcast = bitcast i32* %zyacptr_ to i8*
  %zytmp = getelementptr i32* %zyacptr_, i32 1
  %zybitcast2 = bitcast i32* %zytmp to i8*
  %zyyac_3 = alloca i32
  %zyyacptr_4 = bitcast i32* %zyyac_3 to i32*
  %zyybitcast5 = bitcast i32* %zyyacptr_4 to i8*
  %zyytmp6 = getelementptr i32* %zyyacptr_4, i32 1
  %zyybitcast7 = bitcast i32* %zyytmp6 to i8*
  %3 = bitcast i8* %zyybitcast to i8*
  %4 = bitcast i8* %zyybitcast7 to i8*
  %5 = bitcast i32* %zyyac_ to i32*
  %6 = bitcast i8* %zyybitcast1 to i8*
  %7 = bitcast i8* %zyybitcast5 to i8*
  %8 = bitcast i32* %zyac_ to i32*
  %9 = bitcast i32* %zyyac_3 to i32*
  %10 = bitcast double* %beta.addr to double*
  %11 = bitcast i64* %key.alloca182 to i64*
  %12 = bitcast i32* %nj.addr to i32*
  %13 = bitcast i8** %bound.alloca172 to i8**
  %14 = bitcast i8** %bound.alloca154 to i8**
  %15 = bitcast i64 %0 to i64
  %16 = bitcast i8** %base.alloca171 to i8**
  %17 = bitcast i8** %bound.alloca163 to i8**
  %18 = bitcast double** %tmp.addr to double**
  %19 = bitcast i8** %base.alloca153 to i8**
  %20 = bitcast i8** %lock.alloca165 to i8**
  %21 = bitcast i8** %base.alloca180 to i8**
  %22 = bitcast i32* %nl.addr to i32*
  %23 = bitcast i8** %base.alloca162 to i8**
  %24 = bitcast double** %D.addr to double**
  %25 = bitcast i8** %lock.alloca183 to i8**
  %26 = bitcast i64 %1 to i64
  %27 = bitcast i64* %key.alloca164 to i64*
  %28 = bitcast i8** %lock.alloca156 to i8**
  %29 = bitcast i64* %key.alloca173 to i64*
  %30 = bitcast i8** %lock.alloca174 to i8**
  %31 = bitcast i8** %bound.alloca181 to i8**
  %32 = bitcast i32* %ni.addr to i32*
  %33 = bitcast i64 %2 to i64
  %34 = bitcast double** %C.addr to double**
  %35 = bitcast i64* %key.alloca155 to i64*
  br label %for.cond31

for.inc59:                                        ; preds = %for.body44
  %36 = load i32* %5, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %5, align 4
  br label %for.cond42

for.body44:                                       ; preds = %for.cond42
  %38 = load i32* %9, align 4
  %39 = sext i32 %38 to i64
  %40 = load i32* %8, align 4
  %41 = sext i32 %40 to i64
  %42 = load double** %24, align 8
  %43 = bitcast double** %24 to i8*
  call void @__softboundcets_metadata_load(i8* %43, i8** %21, i8** %31, i64* %11, i8** %25)
  %44 = load i8** %21
  %45 = load i8** %31
  %46 = load i64* %11
  %47 = load i8** %25
  %48 = mul nsw i64 %41, %33
  %49 = getelementptr inbounds double* %42, i64 %48
  %50 = getelementptr inbounds double* %49, i64 %39
  %51 = bitcast double* %50 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %44, i8* %45, i8* %51, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %47, i64 %46, i8* %44, i8* %45)
  br label %for.inc59

for.inc62:                                        ; preds = %for.end61
  %52 = load i32* %9, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %9, align 4
  br label %for.cond34

for.body36:                                       ; preds = %for.cond34
  br label %for.cond42

for.end64:                                        ; preds = %for.cond34
  br label %for.inc65

for.end61:                                        ; preds = %for.cond42
  br label %for.inc62

for.cond42:                                       ; preds = %for.body36, %for.inc59
  %54 = load i32* %5, align 4
  %55 = load i32* %12, align 4
  %56 = icmp slt i32 %54, %55
  br i1 %56, label %for.body44, label %for.end61

for.cond34:                                       ; preds = %for.body33, %for.inc62
  %57 = load i32* %9, align 4
  %58 = load i32* %22, align 4
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %for.body36, label %for.end64

for.body33:                                       ; preds = %for.cond31
  br label %for.cond34

for.inc65:                                        ; preds = %for.end64
  %60 = load i32* %8, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %8, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc65, %entry
  %62 = load i32* %8, align 4
  %63 = load i32* %32, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %for.body33, label %exit

exit:                                             ; preds = %for.cond31
  ret void
}

define internal void @_spawn_loop_func_16(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %26 = bitcast i8* %0 to double*
  %27 = bitcast i8* %1 to i64*
  %28 = bitcast i8* %2 to i32*
  %29 = bitcast i8* %3 to i8**
  %30 = bitcast i8* %4 to i8**
  %31 = bitcast i8* %5 to i64*
  %32 = load i64* %31
  %33 = bitcast i8* %6 to i8**
  %34 = bitcast i8* %7 to i8**
  %35 = bitcast i8* %8 to double**
  %36 = bitcast i8* %9 to i8**
  %37 = bitcast i8* %10 to i8**
  %38 = bitcast i8* %11 to i8**
  %39 = bitcast i8* %12 to i32*
  %40 = bitcast i8* %13 to i8**
  %41 = bitcast i8* %14 to double**
  %42 = bitcast i8* %15 to i8**
  %43 = bitcast i8* %16 to i64*
  %44 = load i64* %43
  %45 = bitcast i8* %17 to i64*
  %46 = bitcast i8* %18 to i8**
  %47 = bitcast i8* %19 to i64*
  %48 = bitcast i8* %20 to i8**
  %49 = bitcast i8* %21 to i8**
  %50 = bitcast i8* %22 to i32*
  %51 = bitcast i8* %23 to i64*
  %52 = load i64* %51
  %53 = bitcast i8* %24 to double**
  %54 = bitcast i8* %25 to i64*
  call void @_loop_func_16(double* %26, i64* %27, i32* %28, i8** %29, i8** %30, i64 %32, i8** %33, i8** %34, double** %35, i8** %36, i8** %37, i8** %38, i32* %39, i8** %40, double** %41, i8** %42, i64 %44, i64* %45, i8** %46, i64* %47, i8** %48, i8** %49, i32* %50, i64 %52, double** %53, i64* %54)
  ret void
}

declare void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)

define internal void @_loop_func_22(i64* %key.alloca54, i8** %bound.alloca53, i8** %base.alloca52, i64* %key.alloca45, i8** %bound.alloca35, i64* %key.alloca36, i8** %lock.alloca46, double** %D.addr, i8** %bound.alloca44, i32* %ni.addr, i64, i32* %nl.addr, i8** %lock.alloca55, i8** %base.alloca43, i8** %lock.alloca37, i8** %base.alloca34) {
entry:
  %zyyac_ = alloca i32
  %zyyacptr_ = bitcast i32* %zyyac_ to i32*
  %zyybitcast = bitcast i32* %zyyacptr_ to i8*
  %zyytmp = getelementptr i32* %zyyacptr_, i32 1
  %zyybitcast1 = bitcast i32* %zyytmp to i8*
  %zyac_ = alloca i32
  store i32 0, i32* %zyac_
  %zyacptr_ = bitcast i32* %zyac_ to i32*
  %zybitcast = bitcast i32* %zyacptr_ to i8*
  %zytmp = getelementptr i32* %zyacptr_, i32 1
  %zybitcast2 = bitcast i32* %zytmp to i8*
  %1 = bitcast i8* %zyybitcast1 to i8*
  %2 = bitcast i8* %zyybitcast to i8*
  %3 = bitcast i32* %zyyac_ to i32*
  %4 = bitcast i32* %zyac_ to i32*
  %5 = bitcast i64* %key.alloca54 to i64*
  %6 = bitcast i8** %bound.alloca53 to i8**
  %7 = bitcast i8** %base.alloca52 to i8**
  %8 = bitcast i64* %key.alloca45 to i64*
  %9 = bitcast i8** %bound.alloca35 to i8**
  %10 = bitcast i64* %key.alloca36 to i64*
  %11 = bitcast i8** %lock.alloca46 to i8**
  %12 = bitcast double** %D.addr to double**
  %13 = bitcast i8** %bound.alloca44 to i8**
  %14 = bitcast i32* %ni.addr to i32*
  %15 = bitcast i64 %0 to i64
  %16 = bitcast i32* %nl.addr to i32*
  %17 = bitcast i8** %lock.alloca55 to i8**
  %18 = bitcast i8** %base.alloca43 to i8**
  %19 = bitcast i8** %lock.alloca37 to i8**
  %20 = bitcast i8** %base.alloca34 to i8**
  br label %for.cond

for.inc:                                          ; preds = %if.end
  %21 = load i32* %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %3, align 4
  br label %for.cond1

if.end:                                           ; preds = %for.body3, %if.then
  br label %for.inc

if.then:                                          ; preds = %for.body3
  %23 = bitcast %struct._IO_FILE** @stderr to i8*
  call void @__softboundcets_metadata_load(i8* %23, i8** %7, i8** %6, i64* %5, i8** %17)
  br label %if.end

for.body3:                                        ; preds = %for.cond1
  %24 = bitcast %struct._IO_FILE** @stderr to i8*
  call void @__softboundcets_metadata_load(i8* %24, i8** %20, i8** %9, i64* %10, i8** %19)
  %25 = load i32* %4, align 4
  %26 = load i32* %14, align 4
  %27 = mul nsw i32 %25, %26
  %28 = load i32* %3, align 4
  %29 = add nsw i32 %27, %28
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %if.then, label %if.end

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %32 = load i32* %4, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %4, align 4
  br label %for.cond

for.cond1:                                        ; preds = %for.body, %for.inc
  %34 = load i32* %3, align 4
  %35 = load i32* %16, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %for.body3, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond:                                         ; preds = %for.inc8, %entry
  %37 = load i32* %4, align 4
  %38 = load i32* %14, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %for.body, label %exit

exit:                                             ; preds = %for.cond
  ret void
}

define internal void @_spawn_loop_func_22(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %16 = bitcast i8* %0 to i64*
  %17 = bitcast i8* %1 to i8**
  %18 = bitcast i8* %2 to i8**
  %19 = bitcast i8* %3 to i64*
  %20 = bitcast i8* %4 to i8**
  %21 = bitcast i8* %5 to i64*
  %22 = bitcast i8* %6 to i8**
  %23 = bitcast i8* %7 to double**
  %24 = bitcast i8* %8 to i8**
  %25 = bitcast i8* %9 to i32*
  %26 = bitcast i8* %10 to i64*
  %27 = load i64* %26
  %28 = bitcast i8* %11 to i32*
  %29 = bitcast i8* %12 to i8**
  %30 = bitcast i8* %13 to i8**
  %31 = bitcast i8* %14 to i8**
  %32 = bitcast i8* %15 to i8**
  call void @_loop_func_22(i64* %16, i8** %17, i8** %18, i64* %19, i8** %20, i64* %21, i8** %22, double** %23, i8** %24, i32* %25, i64 %27, i32* %28, i8** %29, i8** %30, i8** %31, i8** %32)
  ret void
}

declare void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_S_S_S_S_S_S_S_(i32, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)

define internal void @_loop_func_25(i32* %ni.addr, i8** %base.alloca144, double** %A.addr, i8** %bound.alloca136, i8** %bound.alloca127, i8** %bound.alloca, i64* %key.alloca137, double* %alpha.addr, i8** %lock.alloca129, i8** %lock.alloca, i8** %base.alloca126, i64* %key.alloca146, i32* %nj.addr, double** %tmp.addr, i64* %key.alloca128, i8** %bound.alloca145, i64, i8** %lock.alloca138, i64* %key.alloca, double** %B.addr, i64, i8** %base.alloca135, i32* %nk.addr, i8** %base.alloca, i8** %lock.alloca147, i64) {
entry:
  %zyyac_ = alloca i32
  %zyyacptr_ = bitcast i32* %zyyac_ to i32*
  %zyybitcast = bitcast i32* %zyyacptr_ to i8*
  %zyytmp = getelementptr i32* %zyyacptr_, i32 1
  %zyybitcast1 = bitcast i32* %zyytmp to i8*
  %zyac_ = alloca i32
  store i32 0, i32* %zyac_
  %zyacptr_ = bitcast i32* %zyac_ to i32*
  %zybitcast = bitcast i32* %zyacptr_ to i8*
  %zytmp = getelementptr i32* %zyacptr_, i32 1
  %zybitcast2 = bitcast i32* %zytmp to i8*
  %zyyac_3 = alloca i32
  %zyyacptr_4 = bitcast i32* %zyyac_3 to i32*
  %zyybitcast5 = bitcast i32* %zyyacptr_4 to i8*
  %zyytmp6 = getelementptr i32* %zyyacptr_4, i32 1
  %zyybitcast7 = bitcast i32* %zyytmp6 to i8*
  %3 = bitcast i8* %zyybitcast to i8*
  %4 = bitcast i32* %zyyac_ to i32*
  %5 = bitcast i8* %zyybitcast5 to i8*
  %6 = bitcast i32* %zyac_ to i32*
  %7 = bitcast i8* %zyybitcast7 to i8*
  %8 = bitcast i32* %zyyac_3 to i32*
  %9 = bitcast i8* %zyybitcast1 to i8*
  %10 = bitcast i32* %ni.addr to i32*
  %11 = bitcast i8** %base.alloca144 to i8**
  %12 = bitcast double** %A.addr to double**
  %13 = bitcast i8** %bound.alloca136 to i8**
  %14 = bitcast i8** %bound.alloca127 to i8**
  %15 = bitcast i8** %bound.alloca to i8**
  %16 = bitcast i64* %key.alloca137 to i64*
  %17 = bitcast double* %alpha.addr to double*
  %18 = bitcast i8** %lock.alloca129 to i8**
  %19 = bitcast i8** %lock.alloca to i8**
  %20 = bitcast i8** %base.alloca126 to i8**
  %21 = bitcast i64* %key.alloca146 to i64*
  %22 = bitcast i32* %nj.addr to i32*
  %23 = bitcast double** %tmp.addr to double**
  %24 = bitcast i64* %key.alloca128 to i64*
  %25 = bitcast i8** %bound.alloca145 to i8**
  %26 = bitcast i64 %0 to i64
  %27 = bitcast i8** %lock.alloca138 to i8**
  %28 = bitcast i64* %key.alloca to i64*
  %29 = bitcast double** %B.addr to double**
  %30 = bitcast i64 %1 to i64
  %31 = bitcast i8** %base.alloca135 to i8**
  %32 = bitcast i32* %nk.addr to i32*
  %33 = bitcast i8** %base.alloca to i8**
  %34 = bitcast i8** %lock.alloca147 to i8**
  %35 = bitcast i64 %2 to i64
  br label %for.cond

for.inc:                                          ; preds = %for.body11
  %36 = load i32* %4, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %4, align 4
  br label %for.cond9

for.body11:                                       ; preds = %for.cond9
  %38 = load i32* %8, align 4
  %39 = sext i32 %38 to i64
  %40 = load i32* %6, align 4
  %41 = sext i32 %40 to i64
  %42 = load double** %23, align 8
  %43 = bitcast double** %23 to i8*
  call void @__softboundcets_metadata_load(i8* %43, i8** %11, i8** %25, i64* %21, i8** %34)
  %44 = load i8** %11
  %45 = load i8** %25
  %46 = load i64* %21
  %47 = load i8** %34
  %48 = mul nsw i64 %41, %30
  %49 = getelementptr inbounds double* %42, i64 %48
  %50 = getelementptr inbounds double* %49, i64 %39
  %51 = bitcast double* %50 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %44, i8* %45, i8* %51, i64 ptrtoint (double* getelementptr (double* null, i32 1) to i64))
  call void @__softboundcets_temporal_load_dereference_check(i8* %47, i64 %46, i8* %44, i8* %45)
  br label %for.inc

for.inc25:                                        ; preds = %for.end
  %52 = load i32* %8, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %8, align 4
  br label %for.cond4

for.body6:                                        ; preds = %for.cond4
  br label %for.cond9

for.cond9:                                        ; preds = %for.body6, %for.inc
  %54 = load i32* %4, align 4
  %55 = load i32* %32, align 4
  %56 = icmp slt i32 %54, %55
  br i1 %56, label %for.body11, label %for.end

for.inc28:                                        ; preds = %for.end27
  %57 = load i32* %6, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %6, align 4
  br label %for.cond

for.end27:                                        ; preds = %for.cond4
  br label %for.inc28

for.cond4:                                        ; preds = %for.body, %for.inc25
  %59 = load i32* %8, align 4
  %60 = load i32* %22, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %for.body6, label %for.end27

for.body:                                         ; preds = %for.cond
  br label %for.cond4

for.end:                                          ; preds = %for.cond9
  br label %for.inc25

for.cond:                                         ; preds = %for.inc28, %entry
  %62 = load i32* %6, align 4
  %63 = load i32* %10, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %for.body, label %exit

exit:                                             ; preds = %for.cond
  ret void
}

define internal void @_spawn_loop_func_25(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %26 = bitcast i8* %0 to i32*
  %27 = bitcast i8* %1 to i8**
  %28 = bitcast i8* %2 to double**
  %29 = bitcast i8* %3 to i8**
  %30 = bitcast i8* %4 to i8**
  %31 = bitcast i8* %5 to i8**
  %32 = bitcast i8* %6 to i64*
  %33 = bitcast i8* %7 to double*
  %34 = bitcast i8* %8 to i8**
  %35 = bitcast i8* %9 to i8**
  %36 = bitcast i8* %10 to i8**
  %37 = bitcast i8* %11 to i64*
  %38 = bitcast i8* %12 to i32*
  %39 = bitcast i8* %13 to double**
  %40 = bitcast i8* %14 to i64*
  %41 = bitcast i8* %15 to i8**
  %42 = bitcast i8* %16 to i64*
  %43 = load i64* %42
  %44 = bitcast i8* %17 to i8**
  %45 = bitcast i8* %18 to i64*
  %46 = bitcast i8* %19 to double**
  %47 = bitcast i8* %20 to i64*
  %48 = load i64* %47
  %49 = bitcast i8* %21 to i8**
  %50 = bitcast i8* %22 to i32*
  %51 = bitcast i8* %23 to i8**
  %52 = bitcast i8* %24 to i8**
  %53 = bitcast i8* %25 to i64*
  %54 = load i64* %53
  call void @_loop_func_25(i32* %26, i8** %27, double** %28, i8** %29, i8** %30, i8** %31, i64* %32, double* %33, i8** %34, i8** %35, i8** %36, i64* %37, i32* %38, double** %39, i64* %40, i8** %41, i64 %43, i8** %44, i64* %45, double** %46, i64 %48, i8** %49, i32* %50, i8** %51, i8** %52, i64 %54)
  ret void
}

define internal void @_loop_func_31(i32* %ni.addr, i32* %nk.addr, double** %D.addr, i64* %key.alloca170, i32* %nl.addr, i64, i8** %lock.alloca171, i8** %bound.alloca169, i8** %base.alloca168) {
entry:
  %zyac_ = alloca i32
  store i32 0, i32* %zyac_
  %zyacptr_ = bitcast i32* %zyac_ to i32*
  %zybitcast = bitcast i32* %zyacptr_ to i8*
  %zytmp = getelementptr i32* %zyacptr_, i32 1
  %zybitcast1 = bitcast i32* %zytmp to i8*
  %zyyac_ = alloca i32
  %zyyacptr_ = bitcast i32* %zyyac_ to i32*
  %zyybitcast = bitcast i32* %zyyacptr_ to i8*
  %zyytmp = getelementptr i32* %zyyacptr_, i32 1
  %zyybitcast2 = bitcast i32* %zyytmp to i8*
  %1 = bitcast i8* %zyybitcast2 to i8*
  %2 = bitcast i32* %zyac_ to i32*
  %3 = bitcast i32* %zyyac_ to i32*
  %4 = bitcast i8* %zyybitcast to i8*
  %5 = bitcast i32* %ni.addr to i32*
  %6 = bitcast i32* %nk.addr to i32*
  %7 = bitcast double** %D.addr to double**
  %8 = bitcast i64* %key.alloca170 to i64*
  %9 = bitcast i32* %nl.addr to i32*
  %10 = bitcast i64 %0 to i64
  %11 = bitcast i8** %lock.alloca171 to i8**
  %12 = bitcast i8** %bound.alloca169 to i8**
  %13 = bitcast i8** %base.alloca168 to i8**
  br label %for.cond58

for.inc76:                                        ; preds = %for.body65
  %14 = load i32* %3, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %3, align 4
  br label %for.cond62

for.inc79:                                        ; preds = %for.end78
  %16 = load i32* %2, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %2, align 4
  br label %for.cond58

for.end78:                                        ; preds = %for.cond62
  br label %for.inc79

for.cond62:                                       ; preds = %for.body61, %for.inc76
  %18 = load i32* %3, align 4
  %19 = load i32* %9, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %for.body65, label %for.end78

for.body65:                                       ; preds = %for.cond62
  br label %for.inc76

for.body61:                                       ; preds = %for.cond58
  br label %for.cond62

for.cond58:                                       ; preds = %for.inc79, %entry
  %21 = load i32* %2, align 4
  %22 = load i32* %5, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %for.body61, label %exit

exit:                                             ; preds = %for.cond58
  ret void
}

define internal void @_spawn_loop_func_31(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %9 = bitcast i8* %0 to i32*
  %10 = bitcast i8* %1 to i32*
  %11 = bitcast i8* %2 to double**
  %12 = bitcast i8* %3 to i64*
  %13 = bitcast i8* %4 to i32*
  %14 = bitcast i8* %5 to i64*
  %15 = load i64* %14
  %16 = bitcast i8* %6 to i8**
  %17 = bitcast i8* %7 to i8**
  %18 = bitcast i8* %8 to i8**
  call void @_loop_func_31(i32* %9, i32* %10, double** %11, i64* %12, i32* %13, i64 %15, i8** %16, i8** %17, i8** %18)
  ret void
}

declare void @_Z5spawnjPFvPvS_S_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_S_(i32, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)

define internal void @_loop_func_34(i64, i8** %base.alloca159, i8** %bound.alloca160, double** %C.addr, i32* %nl.addr, i8** %lock.alloca162, i32* %nj.addr, i64* %key.alloca161) {
entry:
  %zyyac_ = alloca i32
  %zyyacptr_ = bitcast i32* %zyyac_ to i32*
  %zyybitcast = bitcast i32* %zyyacptr_ to i8*
  %zyytmp = getelementptr i32* %zyyacptr_, i32 1
  %zyybitcast1 = bitcast i32* %zyytmp to i8*
  %zyac_ = alloca i32
  store i32 0, i32* %zyac_
  %zyacptr_ = bitcast i32* %zyac_ to i32*
  %zybitcast = bitcast i32* %zyacptr_ to i8*
  %zytmp = getelementptr i32* %zyacptr_, i32 1
  %zybitcast2 = bitcast i32* %zytmp to i8*
  %1 = bitcast i32* %zyyac_ to i32*
  %2 = bitcast i32* %zyac_ to i32*
  %3 = bitcast i8* %zyybitcast to i8*
  %4 = bitcast i8* %zyybitcast1 to i8*
  %5 = bitcast i64 %0 to i64
  %6 = bitcast i8** %base.alloca159 to i8**
  %7 = bitcast i8** %bound.alloca160 to i8**
  %8 = bitcast double** %C.addr to double**
  %9 = bitcast i32* %nl.addr to i32*
  %10 = bitcast i8** %lock.alloca162 to i8**
  %11 = bitcast i32* %nj.addr to i32*
  %12 = bitcast i64* %key.alloca161 to i64*
  br label %for.cond34

for.inc52:                                        ; preds = %for.body41
  %13 = load i32* %1, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %1, align 4
  br label %for.cond38

for.inc55:                                        ; preds = %for.end54
  %15 = load i32* %2, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %2, align 4
  br label %for.cond34

for.end54:                                        ; preds = %for.cond38
  br label %for.inc55

for.body41:                                       ; preds = %for.cond38
  br label %for.inc52

for.body37:                                       ; preds = %for.cond34
  br label %for.cond38

for.cond38:                                       ; preds = %for.body37, %for.inc52
  %17 = load i32* %1, align 4
  %18 = load i32* %11, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %for.body41, label %for.end54

for.cond34:                                       ; preds = %for.inc55, %entry
  %20 = load i32* %2, align 4
  %21 = load i32* %9, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %for.body37, label %exit

exit:                                             ; preds = %for.cond34
  ret void
}

define internal void @_spawn_loop_func_34(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to i64*
  %9 = load i64* %8
  %10 = bitcast i8* %1 to i8**
  %11 = bitcast i8* %2 to i8**
  %12 = bitcast i8* %3 to double**
  %13 = bitcast i8* %4 to i32*
  %14 = bitcast i8* %5 to i8**
  %15 = bitcast i8* %6 to i32*
  %16 = bitcast i8* %7 to i64*
  call void @_loop_func_34(i64 %9, i8** %10, i8** %11, double** %12, i32* %13, i8** %14, i32* %15, i64* %16)
  ret void
}

declare void @_Z5spawnjPFvPvS_S_S_S_S_S_S_ES_S_S_S_S_S_S_S_(i32, void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)

define internal void @_loop_func_37(i32* %nk.addr, i8** %base.alloca141, i8** %bound.alloca142, i32* %ni.addr, i64* %key.alloca143, double** %A.addr, i8** %lock.alloca144, i64) {
entry:
  %zyyac_ = alloca i32
  %zyyacptr_ = bitcast i32* %zyyac_ to i32*
  %zyybitcast = bitcast i32* %zyyacptr_ to i8*
  %zyytmp = getelementptr i32* %zyyacptr_, i32 1
  %zyybitcast1 = bitcast i32* %zyytmp to i8*
  %zyac_ = alloca i32
  store i32 0, i32* %zyac_
  %zyacptr_ = bitcast i32* %zyac_ to i32*
  %zybitcast = bitcast i32* %zyacptr_ to i8*
  %zytmp = getelementptr i32* %zyacptr_, i32 1
  %zybitcast2 = bitcast i32* %zytmp to i8*
  %1 = bitcast i32* %zyyac_ to i32*
  %2 = bitcast i32* %zyac_ to i32*
  %3 = bitcast i8* %zyybitcast to i8*
  %4 = bitcast i8* %zyybitcast1 to i8*
  %5 = bitcast i32* %nk.addr to i32*
  %6 = bitcast i8** %base.alloca141 to i8**
  %7 = bitcast i8** %bound.alloca142 to i8**
  %8 = bitcast i32* %ni.addr to i32*
  %9 = bitcast i64* %key.alloca143 to i64*
  %10 = bitcast double** %A.addr to double**
  %11 = bitcast i8** %lock.alloca144 to i8**
  %12 = bitcast i64 %0 to i64
  br label %for.cond

for.inc:                                          ; preds = %for.body3
  %13 = load i32* %1, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %1, align 4
  br label %for.cond1

for.body3:                                        ; preds = %for.cond1
  br label %for.inc

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %15 = load i32* %2, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %2, align 4
  br label %for.cond

for.cond1:                                        ; preds = %for.body, %for.inc
  %17 = load i32* %1, align 4
  %18 = load i32* %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %for.body3, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond:                                         ; preds = %for.inc8, %entry
  %20 = load i32* %2, align 4
  %21 = load i32* %8, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %for.body, label %exit

exit:                                             ; preds = %for.cond
  ret void
}

define internal void @_spawn_loop_func_37(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to i32*
  %9 = bitcast i8* %1 to i8**
  %10 = bitcast i8* %2 to i8**
  %11 = bitcast i8* %3 to i32*
  %12 = bitcast i8* %4 to i64*
  %13 = bitcast i8* %5 to double**
  %14 = bitcast i8* %6 to i8**
  %15 = bitcast i8* %7 to i64*
  %16 = load i64* %15
  call void @_loop_func_37(i32* %8, i8** %9, i8** %10, i32* %11, i64* %12, double** %13, i8** %14, i64 %16)
  ret void
}

define internal void @_loop_func_40(i32* %nk.addr, i64, i8** %bound.alloca151, double** %B.addr, i64* %key.alloca152, i32* %nj.addr, i8** %lock.alloca153, i8** %base.alloca150) {
entry:
  %zyyac_ = alloca i32
  %zyyacptr_ = bitcast i32* %zyyac_ to i32*
  %zyybitcast = bitcast i32* %zyyacptr_ to i8*
  %zyytmp = getelementptr i32* %zyyacptr_, i32 1
  %zyybitcast1 = bitcast i32* %zyytmp to i8*
  %zyac_ = alloca i32
  store i32 0, i32* %zyac_
  %zyacptr_ = bitcast i32* %zyac_ to i32*
  %zybitcast = bitcast i32* %zyacptr_ to i8*
  %zytmp = getelementptr i32* %zyacptr_, i32 1
  %zybitcast2 = bitcast i32* %zytmp to i8*
  %1 = bitcast i32* %zyyac_ to i32*
  %2 = bitcast i8* %zyybitcast to i8*
  %3 = bitcast i32* %zyac_ to i32*
  %4 = bitcast i8* %zyybitcast1 to i8*
  %5 = bitcast i32* %nk.addr to i32*
  %6 = bitcast i64 %0 to i64
  %7 = bitcast i8** %bound.alloca151 to i8**
  %8 = bitcast double** %B.addr to double**
  %9 = bitcast i64* %key.alloca152 to i64*
  %10 = bitcast i32* %nj.addr to i32*
  %11 = bitcast i8** %lock.alloca153 to i8**
  %12 = bitcast i8** %base.alloca150 to i8**
  br label %for.cond11

for.body18:                                       ; preds = %for.cond15
  br label %for.inc28

for.inc31:                                        ; preds = %for.end30
  %13 = load i32* %3, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %3, align 4
  br label %for.cond11

for.end30:                                        ; preds = %for.cond15
  br label %for.inc31

for.cond15:                                       ; preds = %for.inc28, %for.body14
  %15 = load i32* %1, align 4
  %16 = load i32* %10, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %for.body18, label %for.end30

for.body14:                                       ; preds = %for.cond11
  br label %for.cond15

for.inc28:                                        ; preds = %for.body18
  %18 = load i32* %1, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %1, align 4
  br label %for.cond15

for.cond11:                                       ; preds = %for.inc31, %entry
  %20 = load i32* %3, align 4
  %21 = load i32* %5, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %for.body14, label %exit

exit:                                             ; preds = %for.cond11
  ret void
}

define internal void @_spawn_loop_func_40(i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) {
entry:
  %8 = bitcast i8* %0 to i32*
  %9 = bitcast i8* %1 to i64*
  %10 = load i64* %9
  %11 = bitcast i8* %2 to i8**
  %12 = bitcast i8* %3 to double**
  %13 = bitcast i8* %4 to i64*
  %14 = bitcast i8* %5 to i32*
  %15 = bitcast i8* %6 to i8**
  %16 = bitcast i8* %7 to i8**
  call void @_loop_func_40(i32* %8, i64 %10, i8** %11, double** %12, i64* %13, i32* %14, i8** %15, i8** %16)
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (branches/release_34)"}
