import time

start_time = time.time()

# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which
#
# a2 + b2 = c2
# For example, 3^22 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.


def pythag(a, b, c):
    if a ** 2 + b ** 2 == c ** 2:
        return True
    return False


a = [x for x in range(1, 1000)]

for num in a:
    for dig in range(num, 1000 - num):
        for i in range(dig, 1000 - dig):
            if num + dig + i == 1000:
                if pythag(num, dig, i):
                    print("Question 9 =", num * dig * i)


print("Program took %s seconds to run." % (time.time() - start_time))
