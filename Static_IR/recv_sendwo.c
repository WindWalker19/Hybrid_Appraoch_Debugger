//The send and receive consists of diffrent tokens.

#include <stdio.h>
#include <mpi.h>


int main(){

	MPI_Init(NULL, NULL);

    // Get the number of processes
    int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    // Get the rank of the process
    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int number;

    if (world_rank == 1) {
    MPI_Recv(&number, 1, MPI_INT, 0, 1, MPI_COMM_WORLD,MPI_STATUS_IGNORE);
    printf("Process 1 received number %d from process 0\n",number);
    }
    
    else if (world_rank == 0) {
    number = -1;
    MPI_Send(&number, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
	} 

	
    

    // Finalize the MPI environment.
    MPI_Finalize();
}