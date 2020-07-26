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

limit = 1000

# create the prime list from the Sieve
primes = []
primes = euler.read_file(type='primes')

# Another list of all the sums
prime_sums = []

for i in range(7):
	x = sum(primes[0:i])
	if x in primes:
		print(x)
		# add the sum of the first 5 numbers to the primes list
		prime_sums.append(x)

# Check to see if it's in the Primes file
prime_max = max(prime_sums)

print('Problem 50 =', prime_max)
print("Program took %s seconds to run." % (time.time() - start_time))
