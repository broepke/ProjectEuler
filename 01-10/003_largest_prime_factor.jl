# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143


n = 600851475143
i = 2

@time while i * i < n
    while n % i == 0
        n = n / i
    end
    i = i + 1
end

print("Question 3 = ", n)  # 6857
