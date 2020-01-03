import time
from math import factorial

start_time = time.time()

# n! means n × (n − 1) × ... × 3 × 2 × 1

# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

total = 0

a = factorial(100)

a = str(a)

for x in a: total += int(x)

print('Problem 19 =', total) # 171

print("Program took %s seconds to run." % (time.time() - start_time))
