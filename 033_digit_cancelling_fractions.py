import time
from fractions import Fraction

start_time = time.time()

# The fraction 49/98 is a curious fraction, as an inexperienced mathematician
# in attempting to simplify it may incorrectly believe that 49/98 = 4/8,
# which is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction,
# less than one in value,and containing two digits in the
# numerator and denominator.
#
# If the product of these four fractions is given in its lowest common
# terms, find the value of the denominator.

# Initialize the product as 1 (since 1 is the multiplicative identity)
product = Fraction(1, 1)

# Loop over all two-digit numbers
for denominator in range(10, 100):
    for numerator in range(10, denominator):
        # Avoid 'trivial' examples
        if numerator%10 == 0 and denominator%10 == 0:
            continue

        # Calculate the 'true' quotient
        true_quotient = Fraction(numerator, denominator)

        # Calculate the 'incorrect' quotients and check if they're equal to the 'true' one
        for digit in str(numerator):
            if digit in str(denominator):
                incorrect_numerator = int(str(numerator).replace(digit, "", 1))
                incorrect_denominator = int(str(denominator).replace(digit, "", 1))
                if incorrect_denominator != 0:  # Avoid dividing by zero
                    incorrect_quotient = Fraction(incorrect_numerator, incorrect_denominator)
                    if true_quotient == incorrect_quotient:
                        product *= true_quotient

# Print the denominator of the product
print(product.denominator)


print('Problem 33 =', product.denominator)
print(f"Program took {(time.time() - start_time)} seconds to run.")



