import time
from math import sqrt

start_time = time.time()

# Euler discovered the remarkable quadratic formula: n2+n+41

# It turns out that the formula will produce 40 primes for the
# consecutive integer values 0≤n≤39

#. However, when n=40,402+40+41=40(40+1)+41 is divisible by 41,
# and certainly when n=41,412+41+41 is clearly divisible by 41.

# The incredible formula n2−79n+1601 was discovered, which produces
# 80 primes for the consecutive values 0≤n≤79 .The product of the
# coefficients, −79 and 1601, is −126479.

# Considering quadratics of the form:

#n2+an+b, where |a|<1000 and |b|≤1000 where |n| is the modulus/absolute value of n

# e.g. |11|=11 and |−4|=4

# Find the product of the coefficients, a and b, for the quadratic
# expression that produces the maximum number of primes for consecutive
# values of n, starting with n=0

prime_list = [2]
num = 3

while len(prime_list) < 10000:
	is_prime = True
	for i in range(2, int(sqrt(num)) + 1):
		if num % i == 0:
			is_prime = False
			break
			
	if is_prime:
		prime_list.append(num)
		
	num += 1
	
print(len(prime_list))

f = open('primes.txt','w')

# for p in prime_list:
# 	f.write(str(p)+'\n')

	
f.close()
	
print('Problem 27 =')
print("Program took %s seconds to run." % (time.time() - start_time))

