
using DelimitedFiles

# create the prime list from the Sieve
tri = readdlm("067_triangle_tab.txt", Int32)

function get_largest_path(row, col, total)

    # Find the biggest path by comparing each one and finding the max in an array
    o1 = tri[row , col] + tri[row + 1 , col]
    o2 = tri[row , col] + tri[row + 1 , col + 1]

    o3 = tri[row , col + 1] + tri[row + 1 , col + 1]
    o4 = tri[row , col + 1] + tri[row + 1 , col + 2]

    # Increment the rows based on what the largest option was
    max_array = [o1, o2, o3, o4]
    mv, opt = findmax(max_array)


    if opt[1 , 1] == 1
        total += tri[row , col]
        total += tri[row + 1 , col]
        row += 1
        col = col
    elseif opt[1 , 1] == 2
        total += tri[row , col]
        total += tri[row + 1 , col + 1]
        row += 1
        col = col + 1
    elseif opt[1 , 1] == 3
        total += tri[row , col + 1]
        total += tri[row + 1 , col + 1]
        row += 1
        col = col + 1
    else
        total += tri[row , col + 1]
        total += tri[row + 1 , col + 2]
        row += 1
        col = col + 2
    end

    return row, col, total
end

total = 59
row = 1
col = 1

while row <= 100
    row, col, total = get_largest_path(row, col, total)
    row += 1
end



print("Problem 18 = ", total)  # 7273
