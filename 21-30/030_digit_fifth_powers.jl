# Surprisingly there are only three numbers that can be written as
# the sum of fourth powers of their digits:

# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4

# As 1 = 1^4 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of
# fifth powers of their digits.

my_start = big(4000)
my_end = big(200000)
p_digits = []

@time for dig in (my_start : my_end)
    total = 0
    for num in string(dig)
        total += parse(BigInt, num) ^ 5
    end
    if total == dig
        push!(p_digits, dig)
    end
end

print(p_digits)

print("Problem 30 = ", sum(p_digits))  # 443839
