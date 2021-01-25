# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 552 = 3025
# Hence the difference between the sum of the squares of the first
# ten natural numbers and the square of the sum is 3025 - 385 = 2640.
# Find the difference between the sum of the squares of the
# first one hundred natural numbers and the square of the sum.

sum_square_diff <- function (alist){
  # sum of squares
  a <- alist ^ 2
  a <- sum(a)
  
  # square of sum
  b <- sum(alist)
  b <- b ^ 2
  
  return (b - a)
}


x <- seq(1:100)

total <- sum_square_diff(x)

print(paste("Question 6 = ", total))  # 25164150
