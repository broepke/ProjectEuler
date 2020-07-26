import time
import euler
start_time = time.time()


# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
#
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most consecutive primes?

primes = []
primes = euler.read_file(type='primes')

print(sum(primes[0:22]))

print('Problem 50 =', )
print("Program took %s seconds to run." % (time.time() - start_time))
