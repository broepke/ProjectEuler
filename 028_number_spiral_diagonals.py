import time
start_time = time.time()

# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

median = 501 #3 to test, 501 for solution  

# initialize this outside the center.  The center is always 1 so it will be 
# easier to caclulate the loops after adding and moving past the center.
start = 3
corners = [1]


# since each of these are a perfect four sided square, you can increment up on the 
# corners by odd values, and using the square of that to represent the range of the loop
# then just figure out the corners based on that. 
for c in range(median-1):
	corner = start**2
	corners.append(corner)
	for n in range(3):
		corner = corner-(start-1)
		corners.append(corner)
	start += 2
	
total = sum(corners)


print('Problem 28 =', total) # 669171001
print("Program took %s seconds to run." % (time.time() - start_time))
