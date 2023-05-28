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

using RationalNumbers

# Initialize product as 1
product = 1//1

# Loop over all two-digit numbers
for denominator = 10:99
    for numerator = 10:denominator-1
        # Avoid 'trivial' examples
        if numerator % 10 == 0 && denominator % 10 == 0
            continue
        end

        # Calculate the 'true' quotient
        true_quotient = numerator // denominator

        # Calculate the 'incorrect' quotients and check if they're equal to the 'true' one
        for digit in string(numerator)
            if digit in string(denominator)
                incorrect_numerator = parse(Int, replace(string(numerator), digit => ""))
                incorrect_denominator = parse(Int, replace(string(denominator), digit => ""))
                
                # Avoid dividing by zero
                if incorrect_denominator != 0 
                    incorrect_quotient = incorrect_numerator // incorrect_denominator
                    if true_quotient == incorrect_quotient
                        product *= true_quotient
                    end
                end
            end
        end
    end
end

# Print the denominator of the product
println(den(product))
