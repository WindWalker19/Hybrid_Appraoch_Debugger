import subprocess


#Ask the user for the estimated runtime of the program.
a = input("Enter the estimated runtime of the program: ")
print("The user estimated runtime is",a,"ms")
#Ask user for the program to be tested.
# sp.call(["gcc", "hello.c", "-o", "hello"])
# tmp = sp.call("./hello")
# print("Result:", tmp)

subprocess.call(["gcc","-o hello","hello.c"])
subprocess.call(["chmod", "+x", "./hello"])
tmp=subprocess.call(["./hello", "args", "to", "hello"])
print ("printing result")
print (tmp)
#Run the orginal program, along with gprof.


#Look into how much time it takes to run the program.
#Extract information such as the timetaken by each function and how many time each funtion was called.
# If the time taken to run the program is more than the user estimated runtime then look into the cause of the problem.(And state its a performance issue.)
# If it takes too less time than the user estimated time then it can be due to the mismatch bug, as there is no transfer of data.
