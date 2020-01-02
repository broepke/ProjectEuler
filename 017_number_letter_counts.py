import time

start_time = time.time()


# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are
# 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were
# written out in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage.

print("Program took %s seconds to run." % (time.time() - start_time))

num_len_dict = {}

num_len_dict['zero'] = 4
num_len_dict['one'] = 3
num_len_dict['two'] = 3
num_len_dict['three'] = 4
num_len_dict['four'] = 4
num_len_dict['five'] = 4
num_len_dict['six'] = 3
num_len_dict['seven'] = 5
num_len_dict['eight'] = 5
num_len_dict['nine'] = 4
num_len_dict['ten'] = 3

num_len_dict['eleven'] = 6
num_len_dict['twelve'] = 3
num_len_dict['thirteen'] = 3
num_len_dict['fourteen'] = 3
num_len_dict['fifteen'] = 3
num_len_dict['sixteen'] = 3
num_len_dict['seventeen'] = 3
num_len_dict['eighteen'] = 3
num_len_dict['nineteen'] = 3
num_len_dict['twenty'] = 3


print(num_len_dict)
