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

	int number;
	if (mpi_rank == 0) {
    	number = 1;
    	MPI_Send(&number, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
	} 
	else if (mpi_rank == 1) {
    	MPI_Recv(&number, 1, MPI_INT, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	//printf("Process 1 received number %d from process 0\n",number);
	}
	else if (mpi_rank == 2) {
    	number = 1;
    	MPI_Send(&number, 1, MPI_INT, 3, 0, MPI_COMM_WORLD);
	} 
	else if (mpi_rank == 3) {
    	MPI_Recv(&number, 1, MPI_INT, 2, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	//printf("Process 1 received number %d from process 0\n",number);
	}

	//terminating the MPI.
	MPI_Finalize();

}