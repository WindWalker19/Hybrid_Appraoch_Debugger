#include <mpi.h>
#include <stdio.h>

int main(){
	MPI_Init(NULL,NULL);
	int num1,num2,sum;
	int total_processors;
	MPI_Comm_size(MPI_COMM_WORLD,&total_processors);

	int PID;
	MPI_Comm_rank(MPI_COMM_WORLD, &PID);

	char processor_name[MPI_MAX_PROCESSOR_NAME];
	int name_len;
	MPI_Get_processor_name(processor_name, &name_len);

	//printf("Hi from processor %s, PID %d out of %d processors \n",processor_name, PID, total_processors);

	if(PID == 0){
		num1 = 4;
		MPI_Send(&num1,1,MPI_INT,2,0,MPI_COMM_WORLD);
	}

	else if (PID == 1){
		num2 = 7;
		MPI_Send(&num2,1,MPI_INT,2,0,MPI_COMM_WORLD);
	}

	else if (PID == 2){
		//sum = num1 + num2; //Sum is 0, as no value has been received.
		MPI_Recv(&num1,1,MPI_INT,0,0,MPI_COMM_WORLD,MPI_STATUS_IGNORE);
		MPI_Recv(&num2,1,MPI_INT,1,0,MPI_COMM_WORLD,MPI_STATUS_IGNORE);
		//MPI_Recv(&num2,1,MPI_INT,1,1,MPI_COMM_WORLD,MPI_STATUS_IGNORE); //changing in the tag of the MPI_Recv as a result there is no coresspoinding recv for a send.
		sum = num1 + num2;
		printf("The sum of the number received form PID 0 and 1 is : %d \n",sum);
	}
	MPI_Finalize();



}
