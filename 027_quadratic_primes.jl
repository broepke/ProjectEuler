# Euler discovered the remarkable quadratic formula: n2+n+41

# It turns out that the formula will produce 40 primes for the
# consecutive integer values 0≤n≤39

# . However, when n=40,402+40+41=40(40+1)+41 is divisible by 41,
# and certainly when n=41,412+41+41 is clearly divisible by 41.

# The incredible formula n2−79n+1601 was discovered, which produces
# 80 primes for the consecutive values 0≤n≤79 .The product of the
# coefficients, −79 and 1601, is −126479.

# Considering quadratics of the form:

# n2+an+b, where |a|<1000 and |b|≤1000 where |n| is the
# modulus/absolute value of n

# e.g. |11|=11 and |−4|=4

# Find the product of the coefficients, a and b, for the quadratic
# expression that produces the maximum number of primes for consecutive
# values of n, starting with n=0

using DelimitedFiles

function calc_quadratic(a, b)

    consec = 0
    n_value = 0
    for n in (1 : 100)
        result = n * n + (a * n) + b
        if result in prime_list
            consec += 1
            n_value = n
        else
            return consec, n_value
        end
    end

    return consec, n_value
end

prime_list = []
largest_count = 0
largest_combo = []
largest_product = 0
largest_n = 0
a = []
b = []
c = []

# open up the list of the first 10,000 prime numbers
prime_list = readdlm("primes.txt", Int32)

# generate the lists needed to get the cartesian product
for x in (-999 : 1000)
    push!(a, x)
end

for y in (1 : 1000)
    push!(b, y)
end

# Get a new list of all cartesian products for all a & b
c = collect(Iterators.product(a, b))

# loop through the products and call the quadratic function
for i in c
    a = i[1]
    b = i[2]
    quad, quad_n = calc_quadratic(a, b)
    if quad > largest_count
        largest_count = quad
        largest_n = quad_n
        largest_combo = [a, b]

        largest_product = a * b
    end
end

print(largest_combo)
print(largest_n)

print("Problem 27 = ", largest_product)  # -59231
