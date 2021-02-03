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
    num_list = []

    # Turn the number into a string so we can shuffle it
    for i in string(num)
        push!(num_list, parse(Int64, i))
    end

    push!(cycle_list, num)


    for j in (1 : length(num_list)-1)
        pop = pop!(num_list)
        prepend!(num_list, pop)
        s = ""
        st = ""
        for i in num_list
            s = string(i)
            st = st * s
        end
        push!(cycle_list, parse(Int64, st))
    end

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
        if i ∉ check_list
            in_check_list = false
            break
        end
    end

    return in_check_list

end


function all_prime(cycle_list)
    "Function to check if all the numbers in a given list are prime numbers"

    all_primes = true

    for i in cycle_list
        if i ∉ primes
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
                push!(circular_numbers, i)
            end
        end
    end
end


print("Problem 35 = ", length(circular_numbers))
