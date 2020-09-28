import os
import subprocess

#Ask for user input through a file, which consists of funtion name,time and number of times a funtion is called.

# Creating an empty list with the user conditions.
func_name = []
min_range = []
max_range = []
calls = []

#Actual runtime and calls list.
runtime1 = []
called1 =[]

#List where the result is stored.
result = []


# Opening a file.
file = open('conditional_rule','r')

for y in file:
	#Getting the file name.
	if y.startswith('Program_name'):
		program_name = y[15:19]


	if y.startswith('_'):
		func_name.append(y[1:10])
		min_range.append(y[10:17])
		max_range.append(y[18:27])
		calls.append(y[28:101])


print(program_name)
#print(func_name)

file.close()

#Replacing th tabs from the function name.
for l in range(0,len(func_name)):
	func_name[l] = func_name[l].replace("\t","")

for l in range(0,len(min_range)):
	min_range[l] = min_range[l].replace("\t","")

for l in range(0,len(max_range)):
	max_range[l] = max_range[l].replace("\t","")

for l in range(0,len(calls)):
	calls[l] = calls[l].replace("\n","").replace("\t","")

print(func_name,min_range,max_range,calls)

# print(a[0])
#Ask the user for the estimated runtime of the program and the function name to be tested via conditional_rule file.
# a = input("Enter the estimated runtime of the program: ")
# print("The user estimated runtime is",a,"seconds")
# b = float(a)
# # #Ask user for the program to be tested.
# file1 = input("Enter the program name to be tested: ")


#Run the orginal program, along with gprof.
os.system("~/Desktop/mpich3/bin/mpicc "+ program_name +" -pg")
os.system("~/Desktop/mpich3/bin/mpirun -np 6 ./a.out")
#extacting the gprof output to the text file.
os.system("gprof ./a.out > myoutput")

#Function to get the runtime of each functons in the program.
for i in range(0,len(func_name)): 
	def output_check():
	#Look into how much time it takes to run each funtion of the program.
		file1 = open('myoutput','r')
		for x in file1:
			if func_name[i] in x:
				runtime = float(x[21:25])
				# called = float(x[31:36].replace(" ",""))
				return runtime
	runtime1.append(output_check())
print(runtime1)


#Function to get the number of calls made to each program.
for i in range(0,len(func_name)):
	def output_check1():
	#Look into how much time it takes to run each funtion of the program.
		file1 = open('myoutput','r')
		for x in file1:
			if func_name[i] in x:
				# runtime = float(x[21:25])
				called = float(x[31:36].replace(" ",""))
				return called
	called1.append(output_check1())
print(called1)

for i in range(0,len(func_name)):
	def output_check2():
		if ((runtime1[i] >= min_range[i]) or (runtime1[i] <= max_range[i] )):
			result1 = "passed"
			return result1
	result.append(output_check2())
print(result)	

with open('conditional_rule') as files:
	with open("output","w") as f1:
		for line in files:
			f1.write(line)
files.close()
f1.close()


file4 = open("output", "a+")

file4.write("\n\nActual_Runtime\t\t\t\tActual_calls\t\t\t\tResult")
for i in range(0,len(func_name)):
	file4.write("\n\n"+ str(runtime1[i]) + "\t\t\t\t\t\t\t" + str(called1[i]) + "\t\t\t\t\t\t\t" Result[i])



file4.close()
# 		c = float(gout)
# # If the time taken to run the program is more than the user estimated runtime then look into the cause of the problem.(And state its a performance issue.)
# if(c > b):
# 	result = c - b
# 	print("The actual runtime of the program is greater than the user predicted runtime by",result,"seconds")
# 	print("The result above indicates its a performance issue.")

# # If it takes too less time than the user estimated time then it can be due to the mismatch bug, as there is no transfer of data.
# if(c < b):
# 	result = c - b
# 	print("The actual runtime of the program is lesser than the user predicted runtime by",result,"seconds")
# 	print("The result above indicates its a type mismatch issue.")

# file2.close()

# #Extract information such as the timetaken by each function and how many time each funtion was called.
# h = 1
# file3 = open('myoutput','r')
# for y in file3:
# 	if y.startswith("index % time"):
# 		print(y)
# 	elif(y.startswith("["+str(h)+"]")):
# 		print(y)
# 		h+=1
# file3.close()