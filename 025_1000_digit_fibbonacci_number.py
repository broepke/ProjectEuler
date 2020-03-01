import time
start_time = time.time()

# The Fibonacci sequence is defined by the recurrence relation:

# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:

# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.

# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

last_idx = 0

def fib(n):
	a, b, c = 0, 1, 0
	while len(str(a)) <= n-1:
		c += 1
		a, b = b, a+b
	
	return (c)	

last_idx = fib(1000)

print('Problem 25 =',last_idx) # 4782
print("Program took %s seconds to run." % (time.time() - start_time))


