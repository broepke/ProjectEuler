
using DelimitedFiles

# create the prime list from the Sieve
binTree = readdlm("067_triangle_tab.txt", Int32)



for i in (2 : length(binTree))
    binTree[i , 1] += binTree[i - 1 , 1]
    binTree[i , length(binTree[i]) - 1] += binTree[i - 1 , length(binTree[i - 1]) - 1]
end

for i in (3 : length(binTree))
    for j in (2 : length(binTree[i]) - 1)
        binTree[i , j] += maximum(binTree[i - 1 , j - 1], binTree[i - 1 , j])
    end
end

total = maximum(binTree[length(binTree) - 1])

print("Problem 18 = ", total)  # 7273
