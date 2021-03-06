from math import factorial
from math import sqrt


def generate_prime_list(prime_count=10000):
	"""get all prime numbers to a certain number.  input variables are the total number of primes
    desired to be generated.  will return a list with the len of the variable of prime numbers"""

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


def generate_fibs_list(n=500):
	"""Generates a list of a fibbonacci numbers."""

	list = []
	count = 0
	a, b = 0, 1

	while count < n:
		list.append(a)
		count += 1
		a, b = b, a + b

	return list


def generate_factorials(n=100):
	"""Generate a list of numbers that are the factorials of 3-n"""

	fac_list = []

	for i in range(3, n):
		fac_list.append((factorial(i)))

	return fac_list


def write_file(type='primes'):
	"""write all the primes to a text file.  Input is file name as well as the total number of primes to generate."""

	if type == 'primes':
		list = generate_prime_list(100000)
	elif type == 'fibs':
		list = generate_fibs_list(500)
	else:
		type == 'factorials'
		list = generate_factorials(100)

	f_name = type + '.txt'

	f = open(f_name, 'w')

	for p in list:
		f.write(str(p) + '\n')

	f.close()

	return


def read_file(type='primes'):
	"""Reads a text file and build a list input variable is filename."""
	list = []

	f_name = type + '.txt'

	try:
		f = open(f_name, 'r')
	except:
		if type == 'primes':
			generate_prime_list()
		elif type == 'fibs':
			generate_fibs_list()
		else:
			type == 'factorials'
			generate_factorials()

	f = open(f_name, 'r')

	for l in f:
		list.append(int(l.rstrip('\n')))

	f.close()

	return list

write_file('primes')
print('done')
