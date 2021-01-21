# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 552 = 3025
# Hence the difference between the sum of the squares of the first
# ten natural numbers and the square of the sum is 3025 - 385 = 2640.
# Find the difference between the sum of the squares of the
# first one hundred natural numbers and the square of the sum.

function sum_square_diff(alist)
    # sum of squares
    a = alist .^ 2
    a = sum(a)

    # square of sum
    b = sum(alist)
    b = b .^ 2

    return b - a
end

x = collect(1:1:100)
@time total = sum_square_diff(x)

print("Question 6 = ", total)  # 25164150
