from math import sqrt


def generate_prime_list(prime_count):
	'''get all prime numbers to a certain number'''
	prime_list = [2]
	num = 3
	
	while len(prime_list) < prime_count:
		is_prime = True
		for i in range(2, int(sqrt(num)) + 1):
			if num % i == 0:
				is_prime = False
				break
				
		if is_prime:
			prime_list.append(num)
			
		num += 1
		
	return prime_list
	
	
def write_primes_file(f_name, primes):
	'''write all the primes to a text file'''
	
	f = open(f_name,'w')
	
	for p in primes:
		f.write(str(p)+'\n')
		
	f.close()
	
	
def read_primes_file(f_name):
	'''Read the primes.txt file and build a list'''
	prime_list = []
	
	f = open(f_name,'r')
	
	for l in f:
		prime_list.append(int(l.rstrip('\n')))
		
	f.close()
	
	return prime_list
	
# Create primes
prime_list = generate_prime_list(10000)

# write file
write_primes_file('primes.txt', prime_list)

# Read File
new_primes = read_primes_file('primes.txt')
