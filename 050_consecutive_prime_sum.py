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

# Set up some of the bounds and starting point
limit = 1000
consec = 21

# create the prime list from the Sieve
primes = []
primes = euler.read_file(type='primes')

# Another list of all the sums
prime_sums = []


def upper_bounds(num,con):
    """find the upper bounds of the range of primes to loop through by dividing the upper bounds
    by the consecutive starting point."""

    global prime_index
    j = num / con
    i = 0

    while i < len(primes):
        if primes[i] > j:
            prime_index = i
            break
        i += 1

    return prime_index

# Get the highest possible index of the primes
range_max = upper_bounds(limit,consec)
range_min = 0

#### This is wrong.... - - for j in range(range_min,range_max):
    for i in range(consec + 1):
        x = sum(primes[0:i])
        if x in primes:
            # add the sum of the first 5 numbers to the primes list
            prime_sums.append(x)

# Check to see if it's in the Primes file
prime_max = max(prime_sums)

print('Problem 50 =', prime_max)
print("Program took %s seconds to run." % (time.time() - start_time))
