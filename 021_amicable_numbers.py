import time

start_time = time.time()

# Let d(n) be defined as the sum of proper divisors of n 
# (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an 
# amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are
# 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. 
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

def amicable(x):
	'''find the amicable number'''
	total = 0
	for y in range(1,x):
		if target % y == 0:
			total += y
			
	return total

target = 220
total_amicable = 0

for x in range(1,target):
	a = amicable(x)
	print(a)
			
			
print(total_amicable)



# print('Problem 21 =', c)
print("Program took %s seconds to run." % (time.time() - start_time))