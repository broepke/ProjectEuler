# The Fibonacci sequence is defined by the recurrence relation:

# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:

# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.

# What is the index of the first term in the
# Fibonacci sequence to contain 1000 digits?

# options(scipen = 999999)
# library(stringi)
# 
# start_time = Sys.time()
# 
# last_idx = 0
# 
# fib <- function (n) {
#   a <- 0
#   b <- 1
#   c <- 0
#   while (stri_length(as.character(a)) <= (n - 1)) {
#     c <- c + 1
#     a <- b
#     b <- a + b
#   }
#   return (c)
# }
# 
# last_idx = fib(1000)

phi <- (1+sqrt(5))/2
limit <- (999 + 0.5*log10(5))/log10(phi)
answer <- ceiling(limit)

print(paste("Problem 25 = ", answer))  # 4782

end_time <- Sys.time()
print(end_time - start_time)
