# 2520 is the smallest number that can be divided by each of the
# numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible
# by all of the numbers from 1 to 20?

divisible <- FALSE
start_num <- 2520
step <- 20


check_divisible <- function (num){
  check_list <- c(11, 13, 14, 16, 17, 18, 19, 20)
  for (i in check_list){
    if (num %% i != 0){
      return (FALSE) 
    }
  }
  return (TRUE)
}


while (divisible != TRUE){
  divisible <- check_divisible(start_num)
  start_num <- start_num + step
}


print(paste("Question 5 = ", start_num - step)) # 232792560