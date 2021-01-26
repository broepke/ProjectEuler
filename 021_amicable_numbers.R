# Let d(n) be defined as the sum of proper divisors of n
# (numbers less than n which divide evenly into n).
# If d(a) <- b and d(b) <- a, where a ≠ b, then a and b are an
# amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are
# 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) <- 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) <- 220.

# Evaluate the sum of all the amicable numbers under 10000.

sum_div <- function (n) {
  total <- 1
  for (x in (2 : (floor(sqrt(n)) + 1))){
    if (n %% x == 0) {
      total <- total + x
      y <- floor(n / x)
      if (y > x) {
        total <- total + y
      }
    }
  }
  return (total)
}

amicable_numbers <- function(a){
  b <- sum_div(a)
  if (a != b && sum_div(b) == a){
    return (a)
  }
}

holder <- numeric(0)

for (i in (1:10000)){
  c <- amicable_numbers(i)
  if (is.null(c) != TRUE){
    holder <- append(holder, c)
  }
}


print(paste("Problem 21 <- ", sum(holder))) # 31626
