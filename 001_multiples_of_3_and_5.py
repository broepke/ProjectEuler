import time

start_time = time.time()

# Question 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

my_sum = 0        
my_sum = sum(i for i in range(1, 1000) if i % 3 == 0 or i % 5 == 0)


print('Question 1 =', my_sum)  # 233168

print("Program took %s seconds to run." % (time.time() - start_time))
