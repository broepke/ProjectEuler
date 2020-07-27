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

# create the prime list from the Sieve
primes = []
primes = euler.read_file(type='primes')

# Another list of all the sums
prime_sums = []


def upper_bounds(limit, consec):
    """find the upper bounds of the range of primes to loop through by
    dividing the upper bounds by the consecutive starting point."""

    global prime_index
    j = limit / consec
    i = 0

    while i < len(primes):
        if primes[i] > j:
            prime_index = i
            break
        i += 1

    return prime_index


def longest_consecutive_possible(limit):
    """This will take and calculate the longest possible consecutive range.
    Starting at zero, the logest possible value will be the smallest numbers, so just sum until you hit the limit"""

    tmp_list = []

    for i in range(len(primes)):
        tmp_list.append(i)
        if sum(tmp_list) > limit:
            break

    return len(tmp_list)


# Get the highest possible index of the primes
limit = 1000000
consec = longest_consecutive_possible(limit)
range_max = upper_bounds(limit, consec)
longest = 0

# 2 dimensional loop through all the possible combinations
for j in range(0, range_max):
    for i in range(j, consec + 1):
        x = sum(primes[j:i])
        length = i - j
        if x in primes and x < limit and length > longest:
            # add the sum of the first 5 numbers to the primes list
            longest = length
            prime_sums.append(x)

# Check to see if it's in the Primes file
prime_max = max(prime_sums)

print('Problem 50 =', prime_max, "and was", longest, "digits in length.")
print("Program took %s seconds to run." % (time.time() - start_time))
