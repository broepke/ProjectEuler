# By starting at the top of the triangle below and moving to adjacent numbers on
# the row below, the maximum total from top to bottom is 23.
#
# 3 7 4 2 4 6 8 5 9 3
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
# NOTE: As there are only 16384 routes, it is possible to solve this problem by
# trying every route. However, Problem 67, is the same challenge with a triangle
# containing one-hundred rows; it cannot be solved by brute force, and requires
# a clever method! ;o)

library(pracma)
library(stringr)

start_time <- Sys.time()

t <- c(75, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00,
       95, 64, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00,
       17, 47, 82, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00,
       18, 35, 87, 10, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00,
       20, 04, 82, 47, 65, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00,
       19, 01, 23, 75, 03, 34, 00, 00, 00, 00, 00, 00, 00, 00, 00,
       88, 02, 77, 73, 07, 63, 67, 00, 00, 00, 00, 00, 00, 00, 00,
       99, 65, 04, 28, 06, 16, 70, 92, 00, 00, 00, 00, 00, 00, 00,
       41, 41, 26, 56, 83, 40, 80, 70, 33, 00, 00, 00, 00, 00, 00,
       41, 48, 72, 33, 47, 32, 37, 16, 94, 29, 00, 00, 00, 00, 00,
       53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14, 00, 00, 00, 00,
       70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57, 00, 00, 00,
       91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48, 00, 00,
       63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31, 00,
       04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23)

tri <- matrix(t, nrow=15)
tri <- apply(t(tri),2,rev)
tri <- flipud(tri)

x = "75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

#Split by line (\n) and then by space
y <- str_split(x, "\n") %>% .[[1]] %>% str_split(" ")

#Create 15 x 15 matrix of trieros to place values
tri <- matrix(0, nrow = 15, ncol = 15)

# Move the integer values into the Matrix

for (row in rev(1:15)) {
  for (col in 1:length(y[[row]])) {
    tri[row, col] <- as.integer(y[[row]][col])
    
  }
}

z #Matrix


# Matrix of zeros to store max values
t <- matrix(0, nrow = 14, ncol = 14)

for (row in rev(1:14)) {
  # Calculate Max values
  for (col in 1:length(tri[row,][tri[row,] != 0])) {
    t[row, col] <- max(tri[row, col] + tri[row + 1, col], tri[row, col] + tri[row + 1, col + 1])
    
    
  }
  
  # replace values in original Matrix with calculated max values
  
  for (col in 1:length(tri[row,][tri[row,] != 0])) {
    tri[row, col] <- t[row, col]
  }
}

tri[1:14, 1:14] #full pyramid of max values

tri[1, 1] #top value
