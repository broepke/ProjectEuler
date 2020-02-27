import time

start_time = time.time()

# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less
# than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24.
# By mathematical analysis, it can be shown that all integers greater
# than 28123 can be written as the sum of two abundant numbers.
# However, this upper limit cannot be reduced any further by analysis
# even though it is known that the greatest number that cannot be expressed
# as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the
# sum of two abundant numbers.

target = 24
abundant_nums = set()

def get_divisors(y):
	'''find all the proper divisors for a number'''
	total = 0
	
	for x in range(1, y):
		if y % x == 0:
			total += x
			
	if total > y:
		abundant_nums.add(y)
			
	return total
	
for i in range(1, target+1):
	get_divisors(i)
						

print(sorted(abundant_nums))
print('Pythonista 3')

# print('Problem 23 =')
print("Program took %s seconds to run." % (time.time() - start_time))
