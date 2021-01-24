# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

start_time = Sys.time()

sum_of_primes <- function (num){
  prime_list_2 <- c(2)
  
  while (num < 2000000){
    is_prime = TRUE
    for (i in (2 : (floor(sqrt(num)) + 1))){
      if (num %% i == 0){
        is_prime = FALSE
        break
      }
    }
    if (is_prime == TRUE){
      prime_list_2 <- append(prime_list_2, num)
      
    }
    num <- num + 1
  }
  
  return (sum(prime_list_2))
}


total = sum_of_primes(3)

print(paste("Question 10 = ", total))  # 142913828922

end_time = Sys.time()
print(end_time - start_time)
