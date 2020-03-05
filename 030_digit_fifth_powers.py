import time
start_time = time.time()

# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4

# As 1 = 1^4 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

start = 4000
end = 200000
p_digits = []

for dig in range(start,end):
	total = 0
	for num in str(dig):
		total += int(num)**5
	if total == dig:
		p_digits.append(dig)
		
		
print(p_digits)

print('Problem 30 =', sum(p_digits)) #443839
print("Program took %s seconds to run." % (time.time() - start_time))
