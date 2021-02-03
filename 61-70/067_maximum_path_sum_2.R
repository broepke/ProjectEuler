# By starting at the top of the triangle below and moving to adjacent numbers on
# the row below, the maximum total from top to bottom is 23.
#
# 3 7 4 2 4 6 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom in triangle.txt (right click and
# 'Save Link/Target As...'), a 15K text file containing a triangle with
# one-hundred rows.
#
# NOTE: This is a much more difficult version of Problem 18. It is not possible
# to try every route to solve this problem, as there are 299 altogether! If you
# could check one trillion (1012) routes every second it would take over twenty
# billion years to check them all. There is an efficient algorithm to solve it.
# ;o)

library(pracma)
library(stringr)

start_time <- Sys.time()

tri <- read.delim("067_triangle_tab.txt", sep = "\t", header = FALSE)


# Matrix of zeros to store max values
new_tri <- matrix(0, nrow = 99, ncol = 99)

for (row in rev(1:99)) {
  # Calculate Max values
  for (col in 1:length(tri[row, ][tri[row, ] != 0])) {
    new_tri[row, col] <-
      max(tri[row, col] + tri[row + 1, col], tri[row, col] + tri[row + 1, col + 1])
  }
  
  # replace values in original Matrix with calculated max values
  for (col in 1:length(tri[row, ][tri[row, ] != 0])) {
    tri[row, col] <- new_tri[row, col]
  }
}

print(paste("Problem 18 = ", tri[1, 1]))  #7273

end_time <- Sys.time()
print(end_time - start_time)
