import time
start_time = time.time()


# A unit fraction contains 1 in the numerator. The decimal representation 
# of the unit fractions with denominators 2 to 10 are given:

# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. 
# It can be seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d < 1000 for which 1/d contains the 
# longest recurring cycle in its decimal fraction part.


largest_repeat = 0
largest_num = 0
largest_repeat_val = 0

def find_repeat(a):
	''''find the largest repeating string in the decimal form of the number'''
	
	a = str(a) # turn the number into a string
	a = a[2:] # trim off the leading "0."
	repeat = 0
	
	# and (a[0] != a[1] and a[1] != a[2])
		
	# remove any number that first are like 1/3
	if len(a) < 3:
		print('not repeating')
		return (1/7)
	elif a[0] == a[1] and a[1] == a[2] and a[2] == a[3]:
		print('repeating like 1/3')
		return (1/7)
	elif a[1] == a[2] and a[2] == a[3] and a[3] == a[4]:
		print('a number like 1/6')
		return (1/7)
			 
	for i in range(len(str(a))):	
		b = a[0:i]
		print(b)
		if a.count(b) > 1:
			repeat = b

	return repeat


for i in range(2,10):
	x = find_repeat(1/i)
	if len(str(x)) > largest_repeat:
		largest_repeat = len(str(x))
		largest_repeat_val = x
		largest_num = i

print(largest_repeat, largest_repeat_val, largest_num)		

print('Problem 26 =', largest_repeat) #
print("Program took %s seconds to run." % (time.time() - start_time))

