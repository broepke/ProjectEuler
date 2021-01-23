import time
start_time = time.time()


# A unit fraction contains 1 in the numerator. The decimal representation
# of the unit fractions with denominators 2 to 10 are given:

# 1/2   =       0.5
# 1/3   =       0.(3)
# 1/4   =       0.25
# 1/5   =       0.2
# 1/6   =       0.1(6)
# 1/7   =       0.(142857)
# 1/8   =       0.125
# 1/9   =       0.(1)
# 1/10  =       0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
# It can be seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d < 1000 for which 1/d contains the
# longest recurring cycle in its decimal fraction part.

function calc_longest_recur_cycle(LIMIT)
    max_len = 0   # The maximum length
    max_d = 1     # The 'd' that has maximum length

    for d in (1 : LIMIT)
        quotient = Dict(0=>0)  # Stores the decimal quotient
        cur_value = 1      # Variable used to perform division as if by hand
        len_recur = 0      # Recurring length

        # Performing division as if by hand
        while haskey(quotient, cur_value) == false  # while the value is not recurring
            len_recur += 1
            quotient[cur_value] = len_recur
            cur_value = (cur_value % d) * 10
        end

        if cur_value == false
            continue
        end

        # Remove number of values that do not recur
        len_recur -= quotient[cur_value]
        # quotient.clear()

        if len_recur > max_len
            max_len = len_recur
            max_d = d
        end
    end
    return max_d, max_len
end

a, b = calc_longest_recur_cycle(1000)

print("Problem 26 = ", a, " ", b)  # 983
