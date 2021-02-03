# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

start_time = Sys.time()

options(scipen=999)

p <- 1000  # Power
t <- 0  # Running Total

a <- 2^p  # Raise it to the power
a <- as.character(a)  # Covert to a String
a <- strsplit(a, "")

# Loop through the iterable string and sum them.
# There are tons of ways to do this...
t <- 0
for (i in a){
  t <- t + as.numeric(i)  
}

t <- sum(t)

print(paste("Problem 16 = ", t))  # 1366

end_time <- Sys.time()
print(end_time - start_time)