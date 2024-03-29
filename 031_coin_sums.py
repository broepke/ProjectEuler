import time
start_time = time.time()

# In the United Kingdom the currency is made up of pound (£)
# and pence (p). There are eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
# It is possible to make £2 in the following way:

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?

def ways(target):
  """
  Returns the number of ways to make the target amount of money using any number of coins.

  Args:
    target: The target amount of money in pence.

  Returns:
    The number of ways to make the target amount of money.
  """

  # Initialize the table of ways to make each amount of money.
  ways = [0] * (target + 1)
  ways[0] = 1

  # Iterate over the coins, and for each coin, add the number of ways to make the target amount of money
  # using the coin to the ways to make the target amount of money without the coin.
  for coin in [1, 2, 5, 10, 20, 50, 100, 200]:
    for i in range(coin, target + 1):
      ways[i] += ways[i - coin]

  return ways[target]


print('Problem 31 =', ways(200)) #73682
print("Program took %s seconds to run." % (time.time() - start_time))
