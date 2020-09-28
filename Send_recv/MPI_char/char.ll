; ModuleID = 'sendrecv_char.c'
source_filename = "sendrecv_char.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MPI_Status = type { i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [65 x i8] c"The process number are: %d,and the size of communication is: %d\0A\00", align 1
@main.name = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str.1 = private unnamed_addr constant [43 x i8] c"Process 1 received name %s from process 0\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [128 x i8], align 16
  %6 = alloca [6 x i8], align 1
  store i32 0, i32* %1, align 4
  %7 = call i32 @MPI_Init(i32* null, i8*** null)
  %8 = call i32 @MPI_Comm_size(i32 1140850688, i32* %2)
  %9 = call i32 @MPI_Comm_rank(i32 1140850688, i32* %3)
  %10 = load i32, i32* %3, align 4
  %11 = load i32, i32* %2, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), i32 %10, i32 %11)
  %13 = bitcast [6 x i8]* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @main.name, i32 0, i32 0), i64 6, i32 1, i1 false)
  %14 = load i32, i32* %3, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %0
  %17 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i32 0, i32 0
  %18 = call i32 @MPI_Send(i8* %17, i32 1, i32 1275068673, i32 1, i32 0, i32 1140850688)
  br label %28

; <label>:19:                                     ; preds = %0
  %20 = load i32, i32* %3, align 4
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %22, label %27

; <label>:22:                                     ; preds = %19
  %23 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i32 0, i32 0
  %24 = call i32 @MPI_Recv(i8* %23, i32 1, i32 1275068673, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %25 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i32 0, i32 0
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.1, i32 0, i32 0), i8* %25)
  br label %27

; <label>:27:                                     ; preds = %22, %19
  br label %28

; <label>:28:                                     ; preds = %27, %16
  %29 = call i32 @MPI_Finalize()
  %30 = load i32, i32* %1, align 4
  ret i32 %30
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
