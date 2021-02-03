# A palindromic number reads the same both ways. The largest palindrome
# made from the product of two 2-digit numbers is 9009 = 91 x 99.
# Find the largest palindrome made from the product of two 3-digit numbers.


function palindrome(a, b)
    """check to see if two numbers are palindromic"""
    c = a * b
    d = string(c)
    d = reverse(d)

    return c == parse(Int64, d)
end


largest_found = 0
largest_a = 0
largest_b = 0

@time for a in reverse(900:999)
    b = 999
    found = false
    while found != true
        found = palindrome(a, b)
        b -= 1
    end

    if largest_found < (a * (b + 1))
        largest_a = a
        largest_b = b + 1
        largest_found = largest_a * largest_b
    end
end

print("Question 4 = ", largest_found, "(", largest_a, largest_b, ")")  # 906609 ( 993 913 )
