import time
import euler

start_time = time.time()


# The number, 197, is called a circular prime because all rotations of
# the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100:
# 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?

def cycle_numbers(num):
    '''Function to cycle a number into all its possible cycle combinations'''
    cycle_list = []
    num_list = []

    cycle_list.append(num)

    # Turn the number into a string so we can shuffle it
    for i in str(num):
        num_list.append(int(i))

    for j in range(len(num_list) - 1):
        pop = num_list.pop(len(num_list) - 1)
        num_list.insert(0, pop)
        s = ""
        st = ""
        for i in num_list:
            s = str(i)
            st += s
        cycle_list.append(int(st))

    return cycle_list


def all_one_three_seven_nine(num):
    '''Apart from 2 and 5, all prime numbers have to end in 1, 3, 7 or 9 '''
    num_list = []
    check_list = [1, 3, 7, 9]
    in_check_list = True

    for i in str(num):
        num_list.append(int(i))

    for i in num_list:
        if i not in check_list:
            in_check_list = False
            break

    return in_check_list


def all_prime(cycle_list):
    '''Function to check if all the numbers in a
    given list are prime numbers'''
    all_primes = True

    for i in cycle_list:
        if i not in primes:
            all_primes = False
            break

    return all_primes


# create the prime list from the Sieve
primes = euler.read_file(type='primes')

circular_numbers = [2, 5]

for i in primes:
    if i < 1000001:
        if all_one_three_seven_nine(i):
            a = cycle_numbers(i)
            if all_prime(a):
                circular_numbers.append(i)


print('Problem 35 =', len(circular_numbers))
print("Program took %s seconds to run." % (time.time() - start_time))
