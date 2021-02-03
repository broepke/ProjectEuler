import time

start_time = time.time()

# 2520 is the smallest number that can be divided by each of the
# numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible
# by all of the numbers from 1 to 20?

divisible = False
start_num = 2520
step = 20


def check_divisible(num):
    check_list = [11, 13, 14, 16, 17, 18, 19, 20]
    for i in check_list:
        if num % i != 0:
            return False
    return True


while not divisible:
    divisible = check_divisible(start_num)
    start_num += step

print('Question 5 =', start_num - step)  # 232792560

print("Program took %s seconds to run." % (time.time() - start_time))
