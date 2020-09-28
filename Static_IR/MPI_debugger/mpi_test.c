
#include <mpi.h>
#include <stdio.h>

int main(){
	MPI_Init(NULL,NULL);

	int total_processors;
	MPI_Comm_size(MPI_COMM_WORLD,&total_processors);

	int PID;
	MPI_Comm_rank(MPI_COMM_WORLD, &PID);

	char processor_name[MPI_MAX_PROCESSOR_NAME];
	int name_len;
	MPI_Get_processor_name(processor_name, &name_len);

	printf("Hi from processor %s, PID %d out of %d processors \n",processor_name, PID, total_processors);

	MPI_Finalize();



}
