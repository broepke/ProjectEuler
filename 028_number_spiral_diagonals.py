import time
import euler
import numpy as np
import statistics
start_time = time.time()

# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

size = (5,5)
# size = (1001,1001)
medium = 3 
# medium = 501
m = np.zeros(size)



print('Problem 28 =') # 
print("Program took %s seconds to run." % (time.time() - start_time))
