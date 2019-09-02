import time
from math import factorial

start_time = time.time()

# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
# there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

# This can be solved with a calculator using binomial theorem.  a.k.a = N choose K.
# rows + columns = n, and since we can only go down/right, divide that by 2 for k

n = 40
k = 20

lattice = int(factorial(n)/(factorial(k) ** 2))

print('Problem 15 =', lattice) # 137,846,528,820

print("Program took %s seconds to run." % (time.time() - start_time))



