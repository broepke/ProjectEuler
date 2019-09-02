from math import sqrt
import time

start_time = time.time()



# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

prime_list_2 = [2]
num = 3

while num < 2000000:
    is_prime = True
    for i in range(2, int(sqrt(num)) + 1):
        if num % i == 0:
            is_prime = False
            break

    if is_prime:
        prime_list_2.append(num)

    num += 1

total = sum(prime_list_2)

print('Question 10 =', total)  # 142913828922

print("Program took %s seconds to run." % (time.time() - start_time))
