# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
# containing over five-thousand first names, begin by sorting it into
# alphabetical order. Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to
# obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So,
# COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?


f = open("p022_names.txt", "r")
x = readline(f)
close(f)

y = split(x, ",")
y = sort!(y)

function get_total(name)
    total = 0
    for l in strip(name, ['\"', '\"'])
        total += (Int(l[1]) - 64)
    end
    return total
end

total = 0
idx_count = 1
for i in y
    a = get_total(i)
    a = a * idx_count
    total += a
    idx_count += 1
end

print("Problem 22 = ", total) # 871198282
