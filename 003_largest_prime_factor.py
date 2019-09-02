import time

start_time = time.time()

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143


n = 600851475143
i = 2

while i * i < n:
    while n % i == 0:
        n = n / i
    i = i + 1

print('Question 3 =', int(n))  # 6857

print("Program took %s seconds to run." % (time.time() - start_time))
