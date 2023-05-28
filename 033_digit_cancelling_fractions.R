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

# Load required library
library(MASS)

# Initialize product as 1
product <- fractions(1)

# Loop over all two-digit numbers
for (denominator in 10:99) {
  for (numerator in 10:(denominator-1)) {
    # Avoid 'trivial' examples
    if (numerator %% 10 == 0 && denominator %% 10 == 0) {
      next
    }

    # Calculate the 'true' quotient
    true_quotient <- fractions(numerator/denominator)

    # Calculate the 'incorrect' quotients and check if they're equal to the 'true' one
    for (digit in strsplit(as.character(numerator), "")[[1]]) {
      if (digit %in% strsplit(as.character(denominator), "")[[1]]) {
        incorrect_numerator <- as.numeric(gsub(digit, "", as.character(numerator)))
        incorrect_denominator <- as.numeric(gsub(digit, "", as.character(denominator)))

        if (incorrect_denominator != 0) {  # Avoid dividing by zero
          incorrect_quotient <- fractions(incorrect_numerator / incorrect_denominator)

          if (true_quotient == incorrect_quotient) {
            product <- product * true_quotient
          }
        }
      }
    }
  }
}

# Print the denominator of the product
cat(attr(product, "denominator"))
