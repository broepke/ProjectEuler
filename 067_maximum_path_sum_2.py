import time

start_time = time.time()

def listPrep(file):
    f = open(file, 'r')
    x = f.readlines()
    f.close()

    for i in range(0, len(x)):
        for char in '\n':
            x[i] = x[i].replace(char, '')
        x[i] = x[i].split()

    for i in range(0, len(x)):
        for j in range(0, len(x[i])):
            x[i][j] = int(x[i][j])

    return x


binTree = listPrep('067_triangle.txt')

for i in range(1, len(binTree)):
    binTree[i][0] += binTree[i - 1][0]
    binTree[i][len(binTree[i]) - 1] += binTree[i - 1][len(binTree[i - 1]) - 1]


for i in range(2, len(binTree)):
    for j in range(1, len(binTree[i]) - 1):
        binTree[i][j] += max(binTree[i - 1][j - 1], binTree[i - 1][j])

total = max(binTree[len(binTree) - 1])

print('Problem 18 =', total)  # 7273

print("Program took %s seconds to run." % (time.time() - start_time))