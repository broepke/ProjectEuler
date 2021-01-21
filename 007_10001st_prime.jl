# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.
# What is the 10 001st prime number?

prime_list = [2]
num = 3

@time while length(prime_list) < 10001
    is_prime = true
    for i in (2 : floor(sqrt(num)) + 1)
        if num % i == 0
            is_prime = false
            break
        end
    end

    if is_prime
        append!(prime_list, num)
    end
    num += 1
end

print("Question 7 = ", last(prime_list))  # 104743
