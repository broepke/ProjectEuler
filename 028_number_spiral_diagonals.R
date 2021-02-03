# Starting with the number 1 and moving to the right in a
# clockwise direction a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a
# 1001 by 1001 spiral formed in the same way?

start_time <- Sys.time()

median <- 501  # 3 to test, 501 for solution

# initialize this outside the center.  The center is always 1 so it will be
# easier to calculate the loops after adding and moving past the center.
start <- 3
corners <- list(1)
total <- 0


# since each of these are a perfect four sided square, you can
# increment up on the # corners by odd values, and using the square
# of that to represent the range of the loop then just figure out the
# corners based on that.
for (c in (1 : (median - 1))){
  corner <- start ^ 2
  corners <- append(corners, corner)
  for (n in (1 : 3)){
    corner <- corner - (start - 1)
    corners <- append(corners, corner)
  }
  start <- start + 2
}

total <- Reduce(`+`, corners)

print(paste("Problem 28 = ", total))  # 669171001

end_time <- Sys.time()
print(end_time - start_time)

