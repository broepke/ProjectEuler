import time
import numpy as np

start_time = time.time()


tri = np.genfromtxt('067_triangle_tab.txt', delimiter="\t")

total = 75
row = 0
col = 0


def get_largest_path(row, col, total):
    # total += tri[row][col]

    row += 1

    # Find the biggest path by comparing each one and finding the max in an array
    o1 = tri[row][col] + tri[row + 1][col]
    o2 = tri[row][col] + tri[row + 1][col + 1]

    o3 = tri[row][col + 1] + tri[row + 1][col + 1]
    o4 = tri[row][col + 1] + tri[row + 1][col + 2]

    # Increment the rows based on what the largest option was
    options = np.array([o1, o2, o3, o4])
    opt = np.where(options == np.amax(options))

    if opt[0][0] == 0:
        total += tri[row][col]
        total += tri[row + 1][col]
        row += 1
        col = col
    elif opt[0][0] == 1:
        total += tri[row][col]
        total += tri[row + 1][col + 1]
        row += 1
        col = col + 1
    elif opt[0][0] == 2:
        total += tri[row][col + 1]
        total += tri[row + 1][col + 1]
        row += 1
        col = col + 1
    else:
        total += tri[row][col + 1]
        total += tri[row + 1][col + 2]
        row += 1
        col = col + 2

    return row, col, total


while row <= 97:
    row, col, total = get_largest_path(row, col, total)

print('Problem 18 =', total)  #

print("Program took %s seconds to run." % (time.time() - start_time))
