#include "header.h"



int main(){
	//Reading a File.
	char singleLine[BuffSize];

	FILE *fptr;
	FILE *fpsr;
	int i =0;
	char *pch;
	char *ch[BuffSize];
   char llfile[100]; 


   int rule1 = 0;
   int rule2 = 1;

	//We can ask for the file path.
   printf("Enter the name of the ll file to be tested : \n ");
   scanf("%s",llfile);

   // Read the orginal ll file.
	fptr = fopen(llfile,"r");

	//Write to a file all the MPI_Send and MPI_Recv found.
	fpsr = fopen(send_recv_ll, "w");


	//for exceptions.
	if(fptr == NULL) {
      perror("Error opening file");
      return(-1);
   	}
   	while(fgets(singleLine,BuffSize,fptr) !=NULL){
   			if ((pch = strstr (singleLine,word1))!=NULL)
   				//puts(singleLine);
   				
   				fprintf(fpsr,"%s",singleLine);  
      			//fprintf(fp,"\n");

   			else if ((pch = strstr (singleLine,word2))!=NULL)
   				//puts(singleLine);
   				
   				fprintf(fpsr,"%s",singleLine);  
      			//fprintf(fp,"\n");
      			
   	}

 

   fclose(fpsr);
   
  
   fclose(fptr);

   rule1 = flag1();
   if(rule1 == 1){
      printf("There is equal number of send and recv stage 1 passed.\n");
      printf("Lets proceed to stage 2 check send recv order\n");  
   }
   else{
      printf("Deadlock detected because of send recv not equal\n");
      
   }
   flag2();
}



