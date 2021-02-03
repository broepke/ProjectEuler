import time
import numpy as np

start_time = time.time()

# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 552 = 3025
# Hence the difference between the sum of the squares of the first
# ten natural numbers and the square of the sum is 3025 - 385 = 2640.
# Find the difference between the sum of the squares of the
# first one hundred natural numbers and the square of the sum.

alist = np.arange(1, 101, 1)

# sum of squares
a = alist ** 2
a = np.sum(a)

# square of sum
b = np.sum(alist)
b = b ** 2

print('Question 6 =', b - a)  # 25164150

print("Program took %s seconds to run." % (time.time() - start_time))
