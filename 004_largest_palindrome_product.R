# A palindromic number reads the same both ways. The largest palindrome
# made from the product of two 2-digit numbers is 9009 = 91 x 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

options(scipen=999)
library(stringi)

palindrome <- function (a, b){
  "check to see if two numbers are palindromic"
  c <- a * b
  d <- toString(c)
  d <- stri_reverse(d)
  d <- as.numeric(d)
  
  if(c == d){
    return(TRUE)
  } else {
    return(FALSE)
  }
}

largest_found <- 0
largest_a <- 0
largest_b <- 0

rng <- seq(from = 999, to = 900, by = -1)

for (a in rng){
  b <- 999
  found <- FALSE
  while (found == FALSE){
    found <- palindrome(a,b)
    b <- b - 1
  }
  if (largest_found < (a * (b + 1))){
    largest_a <- a
    largest_b <- b + 1
    largest_found <- largest_a * largest_b   
  }
}


print(paste('Question 4 =', largest_found,
      '(', largest_a, largest_b, ')'))  # 906609 ( 993 913 )
