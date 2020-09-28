; ModuleID = 'recv_sendwo.c'
source_filename = "recv_sendwo.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MPI_Status = type { i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [45 x i8] c"Process 1 received number %d from process 0\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %5 = call i32 @MPI_Init(i32* null, i8*** null)
  %6 = call i32 @MPI_Comm_size(i32 1140850688, i32* %2)
  %7 = call i32 @MPI_Comm_rank(i32 1140850688, i32* %3)
  %8 = load i32, i32* %3, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %15

10:                                               ; preds = %0
  %11 = bitcast i32* %4 to i8*
  %12 = call i32 @MPI_Recv(i8* %11, i32 1, i32 1275069445, i32 0, i32 1, i32 1140850688, %struct.MPI_Status* inttoptr (i64 1 to %struct.MPI_Status*))
  %13 = load i32, i32* %4, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), i32 %13)
  br label %22

15:                                               ; preds = %0
  %16 = load i32, i32* %3, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %15
  store i32 -1, i32* %4, align 4
  %19 = bitcast i32* %4 to i8*
  %20 = call i32 @MPI_Send(i8* %19, i32 1, i32 1275069445, i32 1, i32 0, i32 1140850688)
  br label %21

21:                                               ; preds = %18, %15
  br label %22

22:                                               ; preds = %21, %10
  %23 = call i32 @MPI_Finalize()
  %24 = load i32, i32* %1, align 4
  ret i32 %24
}

declare dso_local i32 @MPI_Init(i32*, i8***) #1

declare dso_local i32 @MPI_Comm_size(i32, i32*) #1

declare dso_local i32 @MPI_Comm_rank(i32, i32*) #1

declare dso_local i32 @MPI_Recv(i8*, i32, i32, i32, i32, i32, %struct.MPI_Status*) #1

declare dso_local i32 @printf(i8*, ...) #1

declare dso_local i32 @MPI_Send(i8*, i32, i32, i32, i32, i32) #1

declare dso_local i32 @MPI_Finalize() #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (tags/RELEASE_900/final 375507)"}
