// A header to check if the send and recv are in correct order.
#define BuffSize2 100000


void flag2(){

	FILE * fptr2;
	char word12[50] = "call i32 @MPI_Send";
	char word22[50] = "call i32 @MPI_Recv";
	
	int a1 = 0; //tracking the number of send calls.
	int b1 = 0; //tracking the number of recv calls.
	char singleLine2[BuffSize2];
	int flag2 = 0;

	//open the file that contains the information of send and recv.
	fptr2 = fopen("MPI_Send_Recv.txt","r");

	//for exceptions.
		if(fptr2 == NULL) {
      		perror("Error opening file");
      		
   		}

   		else{
   			while(fgets(singleLine2,BuffSize2,fptr2) !=NULL){   // We are reading the file line by line.
   				
   				if ((strstr (singleLine2,word12)!=NULL)){
   				   a1++;  
   				}
      			
   				else if ((strstr (singleLine2,word22))!=NULL){
   					b1++;  
   				}
      			
      			if(b1 > a1){
      				flag2++;
      				printf("%d :Hey we have a flag2 showing the order of send and recv is wrong.\n",flag2);
      				printf("Some recv call is looking to recv some values from a send call.\n");
      			}

   				}
   		}
  		
 }