import time

start_time = time.time()

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

n = 2  # Number
p = 1000  # Power
t = 0  # Running Total

a = n ** p  # Raise it to the power
a = str(a)  # Covert to a String

# Loop through the iterable string and sum them.
# There are tons of ways to do this...
for i in a:
    t += int(i)

print('Problem 16 =', t)  # 1366

print("Program took %s seconds to run." % (time.time() - start_time))

# Another example from the discussion board.  Much cleaner
print(sum([int(x) for x in str(2 ** 1000)]))
