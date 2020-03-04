from math import sqrt

def generate_prime_list(prime_count=10000):
	'''get all prime numbers to a certain number.  input variables are 
	the total number of primes desired to be generated.  will return a
	list with the len of the variable of prime numbers.'''
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
	
	
def write_primes_file(f_name='primes.txt', num_primes=10000):
	'''write all the primes to a text file.  Input is file name 
	as well as the total number of primes to generate.'''
	
	prime_list = generate_prime_list(num_primes)
	
	f = open(f_name,'w')
	
	for p in prime_list:
		f.write(str(p)+'\n')
		
	f.close()
	
	
def read_primes_file(f_name='primes.txt'):
	'''Reads a text file and build a list input variable is filename.'''
	prime_list = []
	
	try:
		f = open(f_name,'r')
	except:
		write_primes_file()
		f = open(f_name,'r')
	
	for l in f:
		prime_list.append(int(l.rstrip('\n')))
		
	f.close()
	
	return prime_list
	

