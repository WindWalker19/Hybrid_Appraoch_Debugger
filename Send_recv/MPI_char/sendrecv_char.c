#include <stdio.h>
#include <mpi.h>

int main(){
	MPI_Init(NULL,NULL);
	int mpi_size,mpi_rank,name_len;
	char processor_name[MPI_MAX_PROCESSOR_NAME];
	
	// Determine the number of processes in communicator.
	MPI_Comm_size(MPI_COMM_WORLD, &mpi_size);
	
	// Determines the rank of the processors.
	MPI_Comm_rank(MPI_COMM_WORLD,&mpi_rank);
	
	printf("The process number are: %d,and the size of communication is: %d\n",mpi_rank,mpi_size);

	char name[6] = "hello";
	if (mpi_rank == 0) {
    	MPI_Send(name, 1, MPI_CHAR, 1, 0, MPI_COMM_WORLD);
	} 
	else if (mpi_rank == 1) {
    	MPI_Recv(name, 1, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	printf("Process 1 received name %s from process 0\n",
           name);
}
	//terminating the MPI.
	MPI_Finalize();

}