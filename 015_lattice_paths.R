# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
# there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

# This can be solved with a calculator using binomial theorem.  a.k.a = N choose K.
# rows + columns = n, and since we can only go down/right, divide that by 2 for k

library(pracma)

n <- 40
k <- 20

lattice <- nchoosek(n, k)

print(paste("Problem 15 = ", lattice))  # 137,846,528,820
