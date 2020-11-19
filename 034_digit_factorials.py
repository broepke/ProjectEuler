import time
from math import factorial
start_time = time.time()


# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal
# to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.


num_list = []

for x in range(3, 100000):
    num_total = 0

    for i in str(x):
        num_total += factorial(int(i))

    if num_total == x:
        num_list.append(x)

print(num_list)

print('Problem 34 =', sum(num_list))
print("Program took %s seconds to run." % (time.time() - start_time))
