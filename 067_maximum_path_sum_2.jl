
nums = []
open("067_triangle.txt") do file
    for ln in eachline(file)
        push!(nums, ln)
    end
end

int_list = Array{Int}[]
for i in nums
    tl = split(i)
    push!(int_list, [parse(Int, j) for j in tl])
end

function find_max(mat)
    max_map = mat[length(mat)]
    for i in (length(mat)-1):-1:1
        temp_mat = mat[i]
        for j in 1:i
            temp_mat[j] += maximum([max_map[j], max_map[j+1]])
        end
        max_map = temp_mat
    end
    return max_map[1]
end

@time find_max(int_list)
