; ModuleID = 'unmatch.c'
source_filename = "unmatch.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MPI_Status = type { i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [65 x i8] c"The process number are: %d,and the size of communication is: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"Process 1 received number %d from process 0\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [128 x i8], align 16
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %7 = call i32 @MPI_Init(i32* null, i8*** null)
  %8 = call i32 @MPI_Comm_size(i32 1140850688, i32* %2)
  %9 = call i32 @MPI_Comm_rank(i32 1140850688, i32* %3)
  %10 = load i32, i32* %3, align 4
  %11 = load i32, i32* %2, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), i32 %10, i32 %11)
  %13 = load i32, i32* %3, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %24

; <label>:15:                                     ; preds = %0
  store i32 1, i32* %6, align 4
  %16 = bitcast i32* %6 to i8*
  %17 = call i32 @MPI_Send(i8* %16, i32 1, i32 1275069445, i32 1, i32 0, i32 1140850688)
  %18 = bitcast i32* %6 to i8*
  %19 = call i32 @MPI_Send(i8* %18, i32 1, i32 1275069445, i32 1, i32 1, i32 1140850688)
  %20 = bitcast i32* %6 to i8*
  %21 = call i32 @MPI_Send(i8* %20, i32 1, i32 1275069445, i32 1, i32 2, i32 1140850688)
  %22 = bitcast i32* %6 to i8*
  %23 = call i32 @MPI_Send(i8* %22, i32 1, i32 1275069445, i32 1, i32 3, i32 1140850688)
  br label %41

; <label>:24:                                     ; preds = %0
  %25 = load i32, i32* %3, align 4
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %40

; <label>:27:                                     ; preds = %24
  %28 = bitcast i32* %6 to i8*
  %29 = call i32 @MPI_Recv(i8* %28, i32 1, i32 1275069445, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %30 = bitcast i32* %6 to i8*
  %31 = call i32 @MPI_Recv(i8* %30, i32 1, i32 1275069445, i32 0, i32 1, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %32 = bitcast i32* %6 to i8*
  %33 = call i32 @MPI_Recv(i8* %32, i32 1, i32 1275069445, i32 0, i32 2, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %34 = bitcast i32* %6 to i8*
  %35 = call i32 @MPI_Recv(i8* %34, i32 1, i32 1275069445, i32 0, i32 3, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %36 = bitcast i32* %6 to i8*
  %37 = call i32 @MPI_Recv(i8* %36, i32 1, i32 1275069445, i32 0, i32 4, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %38 = load i32, i32* %6, align 4
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i32 %38)
  br label %40

; <label>:40:                                     ; preds = %27, %24
  br label %41

; <label>:41:                                     ; preds = %40, %15
  %42 = call i32 @MPI_Finalize()
  %43 = load i32, i32* %1, align 4
  ret i32 %43
}

declare i32 @MPI_Init(i32*, i8***) #1

declare i32 @MPI_Comm_size(i32, i32*) #1

declare i32 @MPI_Comm_rank(i32, i32*) #1

declare i32 @printf(i8*, ...) #1

declare i32 @MPI_Send(i8*, i32, i32, i32, i32, i32) #1

declare i32 @MPI_Recv(i8*, i32, i32, i32, i32, i32, %struct.MPI_Status*) #1

declare i32 @MPI_Finalize() #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
