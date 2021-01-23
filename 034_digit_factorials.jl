# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal
# to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.


num_list = []

for x in (3 : 100000)
    num_total = 0

    for i in string(x)
        num_total += factorial(parse(Int64, i))
    end

    if num_total == x
        push!(num_list, x)
    end
end

print(num_list)

print("Problem 34 = ", sum(num_list)) # 40730
