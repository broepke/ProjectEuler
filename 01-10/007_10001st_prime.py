from math import sqrt
import time

start_time = time.time()

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.
# What is the 10 001st prime number?

prime_list = [2]
num = 3

while len(prime_list) < 10001:
    is_prime = True
    for i in range(2, int(sqrt(num)) + 1):
        if num % i == 0:
            is_prime = False
            break

    if is_prime:
        prime_list.append(num)

    num += 1

print('Question 7 =', prime_list[-1:])  # 104743

print("Program took %s seconds to run." % (time.time() - start_time))
