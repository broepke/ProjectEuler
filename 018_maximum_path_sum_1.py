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
# Find the maximum total from top to bottom of the triangle below:
#
# 75
# 95 64
# 17 47 82
# 18 35 87 10
# 20 04 82 47 65
# 19 01 23 75 03 34
# 88 02 77 73 07 63 67
# 99 65 04 28 06 16 70 92
# 41 41 26 56 83 40 80 70 33
# 41 48 72 33 47 32 37 16 94 29
# 53 71 44 65 25 43 91 52 97 51 14
# 70 11 33 28 77 73 17 78 39 68 17 57
# 91 71 52 38 17 14 91 43 58 50 27 29 48
# 63 66 04 68 89 53 67 30 73 16 69 87 40 31
# 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
#
# NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route.
# However, Problem 67, is the same challenge with a triangle containing one-hundred rows;
# it cannot be solved by brute force, and requires a clever method! ;o)

# the triangle is a classic Pascals triangle when determining paths, but it would be 
# irrelevant in this case to traverse all options,  here we just need to walk down the
# triangle selecting the best options with the greatest sum.  Because Pascal's triangle
# is just a matrix rotated 45 degrees, we can esily turn this into a matrix and walk
# through it. 

tri = np.array([[75, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00],
                [95, 64, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00],
                [17, 47, 82, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00],
                [18, 35, 87, 10, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00],
                [20, 4, 82, 47, 65, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00],
                [19, 1, 23, 75, 3, 34, 00, 00, 00, 00, 00, 00, 00, 00, 00],
                [88, 2, 77, 73, 7, 63, 67, 00, 00, 00, 00, 00, 00, 00, 00],
                [99, 65, 4, 28, 6, 16, 70, 92, 00, 00, 00, 00, 00, 00, 00],
                [41, 41, 26, 56, 83, 40, 80, 70, 33, 00, 00, 00, 00, 00, 00],
                [41, 48, 72, 33, 47, 32, 37, 16, 94, 29, 00, 00, 00, 00, 00],
                [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14, 00, 00, 00, 00],
                [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57, 00, 00, 00],
                [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48, 00, 00],
                [63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31, 00],
                [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]])

total = 75
row = 1
col = 0

def get_largest_path(row, col, total):
	
	print(tri[row][col], total)
	
	# Find the biggest path by comparing each one and finding the max in an array
	o1 = tri[row][col] + tri[row+1][col]
	o2 = tri[row][col] + tri[row+1][col+1]

	o3 = tri[row][col+1] + tri[row+1][col+1]
	o4 = tri[row][col+1] + tri[row+1][col+2]
	

	# Increment the rows based on what the largest option was 
	options = np.array([o1, o2, o3, o4])
	print(options)
	opt = np.where(options == np.amax(options))
	
	if opt[0][0] == 0:
		print(tri[row][col])
		total += tri[row][col]
		row = row + 1
		col = col
	elif opt[0][0] == 1:
		col = col + 1
		print(tri[row][col])
		total += tri[row][col]
		row = row + 1
	elif opt[0][0] == 2:
		print(tri[row][col+1])
		total += tri[row][col+1]
		row = row + 1
		col = col + 1
	else:
		print(tri[row][col+1])
		total += tri[row][col+1]
		row = row + 1
		col = col + 2

	return row, col, total


while row <= 13:
	row, col, total = get_largest_path(row, col, total)

print('Problem 18 =', total)  #

print("Program took %s seconds to run." % (time.time() - start_time))
