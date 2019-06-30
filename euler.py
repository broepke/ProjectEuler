# solving the Euler Problems

# Question 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

multiples = []
sum = 0
for i in range(1, 1000):
    if i % 3 == 0 or i % 5 == 0:
        sum += i
print('Question 1 =', sum)

# Question 2
# Each new term in the Fibonacci sequence is generated by adding the previous
# two terms. By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not
# exceed four million, find the sum of the even-valued terms.

first = 1
second = 2
fib = 3
total = 2

while fib < 4000000:
    fib = first + second
    if fib % 2 == 0:
        total += fib
    first = second
    second = fib

print('Question 2 =', total)
