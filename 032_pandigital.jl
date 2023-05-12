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

using Combinatorics

function pandigital_products()
    digits = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    products = Set()

    perms = permutations(digits)

    for p in perms
        num = join(p)

        for i in 1:7
            for j in (i + 1):8  # j must be greater than i to avoid repeating the same multiplication
                multiplicand = parse(Int, num[1:i])
                multiplier = parse(Int, num[i + 1:j])
                product = parse(Int, num[j + 1:end])
                if multiplicand * multiplier == product
                    push!(products, product)
                end
            end
        end
    end

    return sum(products)
end

println(pandigital_products())