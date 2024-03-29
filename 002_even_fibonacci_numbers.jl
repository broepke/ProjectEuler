# Question 2
# Each new term in the Fibonacci sequence is generated by adding the previous
# two terms. By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not
# exceed four million, find the sum of the even-valued terms.



global first = 1
global second = 2
global fib = 3
global total = 2

@time while fib < 4000000
    fib = first + second
    if fib % 2 == 0
        total += fib
    end
    first = second
    second = fib
end

print("Question 2 = ", total)  # 4613732
