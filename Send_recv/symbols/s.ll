; ModuleID = 'sym.c'
source_filename = "sym.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MPI_Status = type { i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [65 x i8] c"The process number are: %d,and the size of communication is: %d\0A\00", align 1
@main.name = private unnamed_addr constant [10 x i8] c"Hello\00\00\00\00\00", align 1
@main.j = private unnamed_addr constant [10 x i8] c"Hi\00\00\00\00\00\00\00\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"Process 1 received number %d from process 0\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"Process 1 received number %f from process 0\0A\00", align 1
@.str.3 = private unnamed_addr constant [45 x i8] c"Process 1 received number %s from process 0\0A\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Process 1 received number %ld from process 0\0A\00", align 1
@.str.5 = private unnamed_addr constant [47 x i8] c"Process 1 received number %lld from process 0\0A\00", align 1
@.str.6 = private unnamed_addr constant [46 x i8] c"Process 1 received number %Lf from process 0\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [128 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca float, align 4
  %9 = alloca [10 x i8], align 1
  %10 = alloca i16, align 2
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca [10 x i8], align 1
  %14 = alloca i16, align 2
  %15 = alloca i32, align 4
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca x86_fp80, align 16
  store i32 0, i32* %1, align 4
  %19 = call i32 @MPI_Init(i32* null, i8*** null)
  %20 = call i32 @MPI_Comm_size(i32 1140850688, i32* %2)
  %21 = call i32 @MPI_Comm_rank(i32 1140850688, i32* %3)
  %22 = load i32, i32* %3, align 4
  %23 = load i32, i32* %2, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), i32 %22, i32 %23)
  %25 = bitcast [10 x i8]* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @main.name, i32 0, i32 0), i64 10, i32 1, i1 false)
  %26 = bitcast [10 x i8]* %13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @main.j, i32 0, i32 0), i64 10, i32 1, i1 false)
  %27 = load i32, i32* %3, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %56

; <label>:29:                                     ; preds = %0
  store i32 1, i32* %6, align 4
  store double 3.000000e+00, double* %7, align 8
  store float 5.000000e+00, float* %8, align 4
  store i16 10, i16* %10, align 2
  store i64 20, i64* %11, align 8
  store i64 10000, i64* %12, align 8
  store i16 101, i16* %14, align 2
  store i32 201, i32* %15, align 4
  store i64 301, i64* %16, align 8
  store i64 222, i64* %17, align 8
  store x86_fp80 0xK4007FA00000000000000, x86_fp80* %18, align 16
  %30 = bitcast i32* %6 to i8*
  %31 = call i32 @MPI_Send(i8* %30, i32 1, i32 1275069445, i32 1, i32 0, i32 1140850688)
  %32 = bitcast double* %7 to i8*
  %33 = call i32 @MPI_Send(i8* %32, i32 1, i32 1275070475, i32 1, i32 0, i32 1140850688)
  %34 = bitcast float* %8 to i8*
  %35 = call i32 @MPI_Send(i8* %34, i32 1, i32 1275069450, i32 1, i32 0, i32 1140850688)
  %36 = getelementptr inbounds [10 x i8], [10 x i8]* %9, i32 0, i32 0
  %37 = call i32 @MPI_Send(i8* %36, i32 1, i32 1275068673, i32 1, i32 0, i32 1140850688)
  %38 = bitcast i16* %10 to i8*
  %39 = call i32 @MPI_Send(i8* %38, i32 1, i32 1275068931, i32 1, i32 0, i32 1140850688)
  %40 = bitcast i64* %11 to i8*
  %41 = call i32 @MPI_Send(i8* %40, i32 1, i32 1275070471, i32 1, i32 0, i32 1140850688)
  %42 = bitcast i64* %12 to i8*
  %43 = call i32 @MPI_Send(i8* %42, i32 1, i32 1275070473, i32 1, i32 0, i32 1140850688)
  %44 = getelementptr inbounds [10 x i8], [10 x i8]* %13, i32 0, i32 0
  %45 = call i32 @MPI_Send(i8* %44, i32 1, i32 1275068674, i32 1, i32 0, i32 1140850688)
  %46 = bitcast i16* %14 to i8*
  %47 = call i32 @MPI_Send(i8* %46, i32 1, i32 1275068932, i32 1, i32 0, i32 1140850688)
  %48 = bitcast i32* %15 to i8*
  %49 = call i32 @MPI_Send(i8* %48, i32 1, i32 1275069446, i32 1, i32 0, i32 1140850688)
  %50 = bitcast i64* %16 to i8*
  %51 = call i32 @MPI_Send(i8* %50, i32 1, i32 1275070472, i32 1, i32 0, i32 1140850688)
  %52 = bitcast i64* %17 to i8*
  %53 = call i32 @MPI_Send(i8* %52, i32 1, i32 1275070489, i32 1, i32 0, i32 1140850688)
  %54 = bitcast x86_fp80* %18 to i8*
  %55 = call i32 @MPI_Send(i8* %54, i32 1, i32 1275072524, i32 1, i32 0, i32 1140850688)
  br label %116

; <label>:56:                                     ; preds = %0
  %57 = load i32, i32* %3, align 4
  %58 = icmp eq i32 %57, 1
  br i1 %58, label %59, label %115

; <label>:59:                                     ; preds = %56
  %60 = bitcast i32* %6 to i8*
  %61 = call i32 @MPI_Recv(i8* %60, i32 1, i32 1275069445, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %62 = bitcast double* %7 to i8*
  %63 = call i32 @MPI_Recv(i8* %62, i32 1, i32 1275070475, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %64 = bitcast float* %8 to i8*
  %65 = call i32 @MPI_Recv(i8* %64, i32 1, i32 1275069450, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %66 = getelementptr inbounds [10 x i8], [10 x i8]* %9, i32 0, i32 0
  %67 = call i32 @MPI_Recv(i8* %66, i32 1, i32 1275068673, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %68 = bitcast i16* %10 to i8*
  %69 = call i32 @MPI_Recv(i8* %68, i32 1, i32 1275068931, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %70 = bitcast i64* %11 to i8*
  %71 = call i32 @MPI_Recv(i8* %70, i32 1, i32 1275070471, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %72 = bitcast i64* %12 to i8*
  %73 = call i32 @MPI_Recv(i8* %72, i32 1, i32 1275070473, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %74 = getelementptr inbounds [10 x i8], [10 x i8]* %13, i32 0, i32 0
  %75 = call i32 @MPI_Recv(i8* %74, i32 1, i32 1275068674, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %76 = bitcast i16* %14 to i8*
  %77 = call i32 @MPI_Recv(i8* %76, i32 1, i32 1275068932, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %78 = bitcast i32* %15 to i8*
  %79 = call i32 @MPI_Recv(i8* %78, i32 1, i32 1275069446, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %80 = bitcast i64* %16 to i8*
  %81 = call i32 @MPI_Recv(i8* %80, i32 1, i32 1275070472, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %82 = bitcast i64* %17 to i8*
  %83 = call i32 @MPI_Recv(i8* %82, i32 1, i32 1275070489, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %84 = bitcast x86_fp80* %18 to i8*
  %85 = call i32 @MPI_Recv(i8* %84, i32 1, i32 1275072524, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %86 = load i32, i32* %6, align 4
  %87 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i32 %86)
  %88 = load double, double* %7, align 8
  %89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i32 0, i32 0), double %88)
  %90 = load float, float* %8, align 4
  %91 = fpext float %90 to double
  %92 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i32 0, i32 0), double %91)
  %93 = getelementptr inbounds [10 x i8], [10 x i8]* %9, i32 0, i32 0
  %94 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.3, i32 0, i32 0), i8* %93)
  %95 = load i16, i16* %10, align 2
  %96 = sext i16 %95 to i32
  %97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i32 %96)
  %98 = load i64, i64* %11, align 8
  %99 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i32 0, i32 0), i64 %98)
  %100 = load i64, i64* %12, align 8
  %101 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.5, i32 0, i32 0), i64 %100)
  %102 = getelementptr inbounds [10 x i8], [10 x i8]* %13, i32 0, i32 0
  %103 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.3, i32 0, i32 0), i8* %102)
  %104 = load i16, i16* %14, align 2
  %105 = zext i16 %104 to i32
  %106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i32 %105)
  %107 = load i32, i32* %15, align 4
  %108 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i32 %107)
  %109 = load i64, i64* %16, align 8
  %110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i32 0, i32 0), i64 %109)
  %111 = load i64, i64* %17, align 8
  %112 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.5, i32 0, i32 0), i64 %111)
  %113 = load x86_fp80, x86_fp80* %18, align 16
  %114 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.6, i32 0, i32 0), x86_fp80 %113)
  br label %115

; <label>:115:                                    ; preds = %59, %56
  br label %116

; <label>:116:                                    ; preds = %115, %29
  %117 = call i32 @MPI_Finalize()
  %118 = load i32, i32* %1, align 4
  ret i32 %118
}

declare i32 @MPI_Init(i32*, i8***) #1

declare i32 @MPI_Comm_size(i32, i32*) #1

declare i32 @MPI_Comm_rank(i32, i32*) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare i32 @MPI_Send(i8*, i32, i32, i32, i32, i32) #1

declare i32 @MPI_Recv(i8*, i32, i32, i32, i32, i32, %struct.MPI_Status*) #1

declare i32 @MPI_Finalize() #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
