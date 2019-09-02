import time

start_time = time.time()

# A palindromic number reads the same both ways. The largest palindrome
# made from the product of two 2-digit numbers is 9009 = 91 x 99.
# Find the largest palindrome made from the product of two 3-digit numbers.


def palindrome(a, b):
    """check to see if two numbers are palindromic"""
    c = a * b
    d = str(c)
    d = d[::-1]

    return c == int(d)


largest_found = 0
largest_a = 0
largest_b = 0

for a in range(999, 900, -1):
    b = 999
    found = False
    while not found:
        found = palindrome(a, b)
        b -= 1

    if largest_found < (a * (b + 1)):
        largest_a = a
        largest_b = b + 1
        largest_found = largest_a * largest_b

print('Question 4 =', largest_found,
      '(', largest_a, largest_b, ')')  # 906609 ( 993 913 )

print("Program took %s seconds to run." % (time.time() - start_time))
