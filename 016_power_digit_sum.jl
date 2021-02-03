# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

p = 1000  # Power
t = 0  # Running Total

a = BigInt(exp2(p))  # Raise it to the power
a = string(a)  # Covert to a String

# Loop through the iterable string and sum them.
# There are tons of ways to do this...
@time for i in a
    t += parse(Int8, i)
end

print("Problem 16 = ", t)  # 1366
