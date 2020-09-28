#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "rule1.h"
#include "rule2.h"


#define BuffSize 100000
#define send_recv_ll "MPI_Send_Recv.txt" // The text file where the send recv call are extracted.
#define word1 "call i32 @MPI_Send" //Keyword send to search for.
#define word2 "call i32 @MPI_Recv" //Keyword recv to search for.