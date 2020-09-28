#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BuffSize 10000
#define send_recv_ll "MPI_Send_Recv_order.txt" // The text file where the send recv call are extracted.
#define word1 "call i32 @MPI_Send" //Keyword send to search for.
#define word2 "call i32 @MPI_Recv" //Keyword recv to search for.
#define word3 "icmp eq"

int main(){
   //Reading a File.
   char singleLine[BuffSize];

   FILE *fptr;
   FILE *fpsr;
   int i =0;
   char *ch[BuffSize];
   char llfile[100]; 


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
            if ((strstr (singleLine,word1))!=NULL)               
               fprintf(fpsr,"%s",singleLine);  
            else if ((strstr (singleLine,word2))!=NULL)      
               fprintf(fpsr,"%s",singleLine);  
            else if((strstr (singleLine,word3))!=NULL)
               fprintf(fpsr,"%s",singleLine);
      }

 

   fclose(fpsr);
   
  
   fclose(fptr);

  
}


