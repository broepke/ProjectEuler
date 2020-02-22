import time

start_time = time.time()

# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file 
# containing over five-thousand first names, begin by sorting it into 
# alphabetical order. Then working out the alphabetical value for each name, 
# multiply this value by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is 
# worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, 
# COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

f = open('p022_names.txt', 'r')
x = f.readlines()
f.close()

print(x[0])

print('Problem 22 =', )
print("Program took %s seconds to run." % (time.time() - start_time))
