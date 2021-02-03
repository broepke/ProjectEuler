# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less
# than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24.
# By mathematical analysis, it can be shown that all integers greater
# than 28123 can be written as the sum of two abundant numbers.
# However, this upper limit cannot be reduced any further by analysis
# even though it is known that the greatest number that cannot be expressed
# as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the
# sum of two abundant numbers.

target = 28123
total_sum = 0
abundant_nums = Set()


function get_abundant(y)
    "find all the proper divisors for a number"
    total = 0

    for x in (1 : y-1)
        if y % x == 0
            total += x
        end
    end

    if total > y
        push!(abundant_nums, y)
    end

    return abundant_nums
end

function check_sum_abundant(check_num)
    "check to see if the number is the sum of two abundant numbers
    first by checking for each value in the abundant list, if the remainder
    is in the list anywhere."

    for i in abundant_list
        if i <= check_num
            rem = check_num - i
            if rem in abundant_list
                return true
            end
        else
            return false
        end
    end
    return false
end

# create the list (set) of all abundant numbers
for i in (1 : target-1)
    get_abundant(i)
end

# sort the list - just because it's easier to read
abundant_list = sort!(collect(abundant_nums))

# check to see for each number again in the target, if the number is the sum
# of any two abundant numbers
@time for i in (1 : target)
    b = check_sum_abundant(i)
    if b == true
        continue
    else
        total_sum += i
    end
end


print("Problem 23 = ", total_sum)  # 4179871
