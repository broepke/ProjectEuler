# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.


function sum_of_primes(num)
    prime_list_2 = [2]

    while num < 2000000
        is_prime = true
        for i in (2:floor(sqrt(num))+1)
            if num % i == 0
                is_prime = false
                break
            end
        end

        if is_prime
            append!(prime_list_2, num)
        end

        num += 1
    end

    return sum(prime_list_2)
end

@time total = sum_of_primes(3)

print("Question 10 = ", total)  # 14291382892
