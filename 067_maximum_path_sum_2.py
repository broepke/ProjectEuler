import time
import numpy as np

start_time = time.time()

# By starting at the top of the triangle below and moving to adjacent numbers on the row below,
# the maximum total from top to bottom is 23.
#
# 3
# 7 4
# 2 4 6
# 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'),
# a 15K text file containing a triangle with one-hundred rows.
#
# NOTE: This is a much more difficult version of Problem 18. It is not possible
# to try every route to solve this problem, as there are 299 altogether!
# If you could check one trillion (1012) routes every second it would take over twenty billion years
# to check them all. There is an efficient algorithm to solve it. ;o)


tri = np.genfromtxt('067_triangle.txt', delimiter="\t")


total = 59
row = 0
col = 0


def get_largest_path(row, col, total):

    print(total)

    row += 1

    # Find the biggest path by comparing each one and finding the max in an array
    print(row, col)
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

    # print(row, col, total)

    return row, col, total


while row <= 97:
    row, col, total = get_largest_path(row, col, total)


print('Problem 18 =', total)  # 1074

print("Program took %s seconds to run." % (time.time() - start_time))


