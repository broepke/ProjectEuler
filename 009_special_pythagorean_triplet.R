# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which
#
# a2 + b2 = c2
# For example, 3^22 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

start_time = Sys.time()

pythag <- function (a, b, c){
  if (a ^ 2 + b ^ 2 == c ^ 2){
    return(TRUE)
  }
  return(FALSE)
}


a <- seq(1:999)

for (num in a){
  for (dig in (num : 1000 - num)){
    for (i in (dig : 1000 - dig)){
      if (num + dig + i == 1000){
        if (pythag(num, dig, i)){
          print(paste("Question 9 =", num * dig * i))
        }
      }
    }
  }
}


end_time = Sys.time()
print(end_time - start_time)
