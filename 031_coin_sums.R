import time
start_time = time.time()

# In the United Kingdom the currency is made up of pound (£)
# and pence (p). There are eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
# It is possible to make £2 in the following way:

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?

ways <- function(target) {
  # Initialize the table of ways to make each amount of money.
  ways <- rep(0, target + 1)
  ways[0] <- 1

  # Iterate over the coins, and for each coin, add the number
  # of ways to make the target amount of money using the coin to the
  # ways to make the target amount of money without the coin.
  for (coin in c(1, 2, 5, 10, 20, 50, 100, 200)) {
    for (i in seq_len(target + 1 - coin)) {
      ways[i + coin] <- ways[i + coin] + ways[i]
    }
  }

  return(ways[target])
}


if (interactive()) {
  target <- 200
  print(ways(target))
}