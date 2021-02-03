# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a
# prime below one-hundred.
#
# The longest sum of consecutive primes below one-thousand that adds
# to a prime, contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most consecutive primes?

using DelimitedFiles

# create the prime list from the Sieve
primes = readdlm("primes.txt", Int32)

# Another list of all the sums
prime_sums = []


function upper_bounds(limit, consec)
    "find the upper bounds of the range of primes to loop through by
    dividing the upper bounds by the consecutive starting point."

    global prime_index
    j = limit / consec
    i = 1

    while i < length(primes)
        if primes[i] > j
            prime_index = i
            break
        end
        i += 1
    end

    return prime_index -1 #Need to remove 1.  Julia is not zero based
end


function longest_consecutive_possible(limit)
    "This will take and calculate the longest possible consecutive range.
    Starting at zero, the logest possible value will be the smallest numbers,
    so just sum until you hit the limit"

    tmp_list = []

    for i in (0 : length(primes))
        push!(tmp_list, i)
        if sum(tmp_list) > limit
            break
        end
    end

    return length(tmp_list)
end

# Get the highest possible index of the primes
limit = 1000000
consec = longest_consecutive_possible(limit)
range_max = upper_bounds(limit, consec)
longest = 0

# 2 dimensional loop through all the possible combinations
for j in (1 : range_max)
    for i in (j : consec + 1)
        x = sum(primes[j:i])
        length = i - j
        if x in primes && x < limit && length > longest
            # add the sum of the first 5 numbers to the primes list
            longest = length
            push!(prime_sums, x)
        end
    end
end

# Check to see if it's in the Primes file
prime_max = maximum(prime_sums)


print("Problem 50 = ", prime_max) # 997651
