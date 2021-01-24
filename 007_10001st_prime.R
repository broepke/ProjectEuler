# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.
# What is the 10 001st prime number?

library(dplyr)

start_time = Sys.time()

prime_list <- c(2)
num <- 3

while (length(prime_list) < 10001){
  is_prime <- TRUE
  for (i in (2 : (floor(sqrt(num)) + 1))){
    if (num %% i == 0){
      is_prime = FALSE
      break
    }
  }
  if (is_prime == TRUE){
    prime_list <- append(prime_list, num)
  }
  num = num + 1
}


print(paste("Question 7 = ", last(prime_list)))  # 104743

end_time = Sys.time()
print(end_time - start_time)



