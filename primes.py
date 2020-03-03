'''get all prime numbers to a certain number, and write them to a text file'''
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

for p in prime_list:
	f.write(str(p)+'\n')

	
f.close()

'''Read the primes.txt file and build a list'''
prime_list = []

f = open('primes.txt','r')

for l in f:
	prime_list.append(int(l.rstrip('\n')))
	
f.close()
