import time
start_time = time.time()

# We shall say that an n-digit number is pandigital if it makes 
# use of all the digits 1 to n exactly once; 
# for example, the 5-digit number, 15234, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 × 186 = 7254, 
# containing multiplicand, multiplier, 
# and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product 
# identity can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one 
# way so be sure to only include it once in your sum.

from itertools import permutations

def pandigital_products():
    digits = '123456789'
    products = set()

    for p in permutations(digits):
        num = ''.join(p)
        for i in range(1, 8):
            for j in range(i+1, 9):  # j must be greater than i to avoid repeating the same multiplication
                multiplicand = int(num[:i])
                multiplier = int(num[i:j])
                product = int(num[j:])
                if multiplicand * multiplier == product:
                    products.add(product)

    return sum(products)

print('Problem 32 =', pandigital_products()) #45228
print("Program took %s seconds to run." % (time.time() - start_time))
