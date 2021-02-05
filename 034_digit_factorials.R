# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal
# to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

num_list <- c()

for (x in (3:100000)){
  num_total <- 0
  
  for (i in strsplit(as.character(x), "")){
    num_total <- num_total + factorial(as.numeric(i))
  }
  
  
  if (sum(num_total) == x){
    num_list <- append(num_list, x)
  }
}


print(num_list)

print(paste("Problem 34 =", sum(num_list))) # 40730
