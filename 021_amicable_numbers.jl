# Let d(n) be defined as the sum of proper divisors of n
# (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an
# amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are
# 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

function sum_div(n)
    total = 1
    for x in (2:floor(sqrt(n))+1)
        if n % x == 0
            total += x
            y = fld(n, x)
            if y > x
                total += y
            end
        end
    end
    return total
end

function amicable_numbers(a)
    b = sum_div(a)
    if a != b && sum_div(b) == a
        return a
    end
end

holder = []


for i in (1:10000)
    c = amicable_numbers(i)
    if c !== nothing
        append!(holder, c)
    end
end

print("Problem 21 = ", sum(holder)) # 31626
