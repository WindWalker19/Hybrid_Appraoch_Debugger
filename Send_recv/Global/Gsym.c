#include <stdio.h>
#include <mpi.h>

int number;
double d;
float f;
char name[10] = "Hello";
short int a;
long int b;
long long int c;
unsigned char j[10] = "Hi";
unsigned short int e;
unsigned int k;
unsigned long int g;
unsigned long long int h;
long double i;

int main(){
    
    
	MPI_Init(NULL,NULL);
	int mpi_size,mpi_rank,name_len;
	char processor_name[MPI_MAX_PROCESSOR_NAME];
	
	// Determine the number of processes in communicator.
	MPI_Comm_size(MPI_COMM_WORLD, &mpi_size);
	
	// Determines the rank of the processors.
	MPI_Comm_rank(MPI_COMM_WORLD,&mpi_rank);
	
	printf("The process number are: %d,and the size of communication is: %d\n",mpi_rank,mpi_size);

	
	if (mpi_rank == 0) {
    	number = 1;
    	d = 3;
    	f = 5;
    	a = 10;
    	b = 20;
    	c = 10000;
    	e = 101;
    	k = 201;
    	g = 301;
    	h = 222;
    	i = 500;
    	MPI_Send(&number, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(&d, 1, MPI_DOUBLE, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(&f, 1, MPI_FLOAT, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(name, 1, MPI_CHAR, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(&a, 1, MPI_SHORT, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(&b, 1, MPI_LONG, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(&c, 1, MPI_LONG_LONG, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(j, 1, MPI_UNSIGNED_CHAR, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(&e, 1, MPI_UNSIGNED_SHORT, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(&k, 1, MPI_UNSIGNED, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(&g, 1, MPI_UNSIGNED_LONG, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(&h, 1, MPI_UNSIGNED_LONG_LONG, 1, 0, MPI_COMM_WORLD);
    	MPI_Send(&i, 1, MPI_LONG_DOUBLE, 1, 0, MPI_COMM_WORLD);

	} 
	else if (mpi_rank == 1) {
    	MPI_Recv(&number, 1, MPI_INT, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(&d, 1, MPI_DOUBLE, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(&f, 1, MPI_FLOAT, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(name, 1, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(&a, 1, MPI_SHORT, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(&b, 1, MPI_LONG, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(&c, 1, MPI_LONG_LONG, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(j, 1, MPI_UNSIGNED_CHAR, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(&e, 1, MPI_UNSIGNED_SHORT, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(&k, 1, MPI_UNSIGNED, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(&g, 1, MPI_UNSIGNED_LONG, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(&h, 1, MPI_UNSIGNED_LONG_LONG, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	MPI_Recv(&i, 1, MPI_LONG_DOUBLE, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    	printf("Process 1 received number %d from process 0\n",number);
    	printf("Process 1 received number %f from process 0\n",d);
    	printf("Process 1 received number %f from process 0\n",f);
    	printf("Process 1 received number %s from process 0\n",name);
    	printf("Process 1 received number %d from process 0\n",a);
    	printf("Process 1 received number %ld from process 0\n",b);
    	printf("Process 1 received number %lld from process 0\n",c);
    	printf("Process 1 received number %s from process 0\n",j);
    	printf("Process 1 received number %d from process 0\n",e);
    	printf("Process 1 received number %d from process 0\n",k);
    	printf("Process 1 received number %ld from process 0\n",g);
    	printf("Process 1 received number %lld from process 0\n",h);
    	printf("Process 1 received number %Lf from process 0\n",i);

    
}
	//terminating the MPI.
	MPI_Finalize();

}

