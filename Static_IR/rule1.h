// This header checks if there is equal number of send and recv call made.
#define BuffSize1 100000

int flag1(){
	
	char word11[50] = "call i32 @MPI_Send";
	char word21[50] = "call i32 @MPI_Recv";
	
	int a = 0; //tracking the number of send calls.
	int b = 0; //tracking the number of recv calls.
	FILE *fptr1;
	char singleLine1[BuffSize1];
	//Reading a file that we contains the extraction of send and recv.
	fptr1 = fopen("MPI_Send_Recv.txt","r");
	
	//for exceptions.
	if(fptr1 == NULL) {
      perror("Error opening file");
      return(-1);
   	}
   	while(fgets(singleLine1,BuffSize1,fptr1) !=NULL){ // Reading the files line by line.
   			if ((strstr (singleLine1,word11))!=NULL)
   				a++; // returns the total send 
   			else if ((strstr (singleLine1,word21))!=NULL)
   				b++; // returns the total recv
   		}


   printf("Total number of send call %d\n",a );
   printf("Total number of recv call %d\n",b );
   fclose(fptr1);

   if(a == b){
   	return 1;
   }
   else{
   	return 0;
   }
}