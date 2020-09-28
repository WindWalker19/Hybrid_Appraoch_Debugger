; ModuleID = 'sendrecv_int.c'
source_filename = "sendrecv_int.c"
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
  %7 = alloca i64*, align 8
  store i32 0, i32* %1, align 4
  %8 = call i32 @MPI_Init(i32* null, i8*** null)
  %9 = call i32 @MPI_Comm_size(i32 1140850688, i32* %2)
  %10 = call i32 @MPI_Comm_rank(i32 1140850688, i32* %3)
  %11 = load i32, i32* %3, align 4
  %12 = load i32, i32* %2, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), i32 %11, i32 %12)
  %14 = load i32, i32* %3, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %0
  store i32 1, i32* %6, align 4
  %17 = bitcast i32* %6 to i8*
  %18 = call i32 @MPI_Send(i8* %17, i32 1, i32 1275069445, i32 1, i32 0, i32 1140850688)
  br label %28

; <label>:19:                                     ; preds = %0
  %20 = load i32, i32* %3, align 4
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %22, label %27

; <label>:22:                                     ; preds = %19
  %23 = bitcast i32* %6 to i8*
  %24 = call i32 @MPI_Recv(i8* %23, i32 1, i32 1275069445, i32 0, i32 0, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %25 = load i32, i32* %6, align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i32 %25)
  br label %27

; <label>:27:                                     ; preds = %22, %19
  br label %28

; <label>:28:                                     ; preds = %27, %16
  %29 = load i64*, i64** %7, align 8
  %30 = bitcast i64* %29 to i8*
  %31 = call i32 @MPI_Allgather(i8* inttoptr (i64 -1 to i8*), i32 1, i32 1275070522, i8* %30, i32 1, i32 1275070473, i32 1140850688)
  %32 = call i32 @MPI_Finalize()
  %33 = load i32, i32* %1, align 4
  ret i32 %33
}

declare i32 @MPI_Init(i32*, i8***) #1

declare i32 @MPI_Comm_size(i32, i32*) #1

declare i32 @MPI_Comm_rank(i32, i32*) #1

declare i32 @printf(i8*, ...) #1

declare i32 @MPI_Send(i8*, i32, i32, i32, i32, i32) #1

declare i32 @MPI_Recv(i8*, i32, i32, i32, i32, i32, %struct.MPI_Status*) #1

declare i32 @MPI_Allgather(i8*, i32, i32, i8*, i32, i32, i32) #1

declare i32 @MPI_Finalize() #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
