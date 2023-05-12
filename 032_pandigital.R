import time
start_time = time.time()

# We shall say that an n-digit number is pandigital if it makes 
# use of all the digits 1 to n exactly once; 
# for example, the 5-digit number, 15234, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 × 186 = 7254, 
# containing multiplicand, multiplier, 
# and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product 
# identity can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one 
# way so be sure to only include it once in your sum.

library(gtools)

pandigital_products <- function() {
  digits <- c("1", "2", "3", "4", "5", "6", "7", "8", "9")
  products <- vector()

  perms <- permutations(n=9, r=9, v=digits)

  for (p in 1:nrow(perms)) {
    num <- paste(perms[p,], collapse = "")

    for (i in 1:7) {
      for (j in (i + 1):8) {
        multiplicand <- as.numeric(substr(num, 1, i))
        multiplier <- as.numeric(substr(num, i + 1, j))
        product <- as.numeric(substr(num, j + 1, 9))
        if (multiplicand * multiplier == product) {
          products <- c(products, product)
        }
      }
    }
  }

  products <- unique(products)
  return(sum(products))
}

print(pandigital_products())