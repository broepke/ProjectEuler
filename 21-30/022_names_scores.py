import time

start_time = time.time()

# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
# containing over five-thousand first names, begin by sorting it into
# alphabetical order. Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to
# obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So,
# COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

total = 0

f = open('p022_names.txt', 'r')
x = f.readlines()
f.close()

y = x[0].split(',')

y = sorted(y)


def get_total(name):
    total = 0
    for l in name.strip('""'):
        total += (ord(l) - 64)

    return total


for i in y:
    a = get_total(i)
    a *= y.index(i) + 1
    total += a

print('Problem 22 =', total)
print("Program took %s seconds to run." % (time.time() - start_time))
