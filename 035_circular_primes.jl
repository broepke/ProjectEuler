# The number, 197, is called a circular prime because all rotations of
# the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100:
# 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?

using DelimitedFiles

function cycle_numbers(num)
    "Function to cycle a number into all its possible cycle combinations"

    cycle_list = []

    # Push the number into the first position of the list
    push!(cycle_list, num)
    # Push the reverse of the number into the list (via string)
    push!(cycle_list, parse(Int64, reverse(string(num))))

    return cycle_list
end

function all_one_three_seven_nine(num)
    "Apart from 2 and 5, all prime numbers have to end in 1, 3, 7 or 9"

    num_list = []
    check_list = [1, 3, 7, 9]
    in_check_list = true

    for i in string(num)
        push!(num_list, parse(Int64, i))
    end

    for i in num_list
        if i in check_list == false
            in_check_list = false
            break
        end
    end

    return in_check_list
end

all_one_three_seven_nine(197)

for i in string(num)
    push!(num_list, parse(Int64, i))
end

for i in num_list
    if i in check_list == false
        in_check_list = false
        break
    end
end


function all_prime(cycle_list)
    "Function to check if all the numbers in a given list are prime numbers"

    all_primes = true

    for i in cycle_list
        if i
            not in primes
            all_primes = false
            break
        end
    end

    return all_primes
end





# open up the list of the first 10,000 prime numbers
primes = readdlm("primes.txt", Int32)

circular_numbers = [2, 5]

for i in primes
    if i < 1000000
        if all_one_three_seven_nine(i)
            a = cycle_numbers(i)
            if all_prime(a)
                circular_numbers.append(i)
            end
        end
    end
end


print("Problem 35 = ", length(circular_numbers))
