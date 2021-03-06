# By starting at the top of the triangle below and moving to adjacent
# numbers on the row below, the maximum total from top to bottom is 23.
#
# 3
# 7 4
# 2 4 6
# 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom of the triangle below:
#
# 75
# 95 64
# 17 47 82
# 18 35 87 10
# 20 04 82 47 65
# 19 01 23 75 03 34
# 88 02 77 73 07 63 67
# 99 65 04 28 06 16 70 92
# 41 41 26 56 83 40 80 70 33
# 41 48 72 33 47 32 37 16 94 29
# 53 71 44 65 25 43 91 52 97 51 14
# 70 11 33 28 77 73 17 78 39 68 17 57
# 91 71 52 38 17 14 91 43 58 50 27 29 48
# 63 66 04 68 89 53 67 30 73 16 69 87 40 31
# 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
#
# NOTE: As there are only 16384 routes, it is possible to solve this
# problem by trying every route. However, Problem 67, is the same challenge
# with a triangle containing one-hundred rows; it cannot be solved by
# brute force, and requires a clever method! ;o)

# the triangle is a classic Pascals triangle when determining paths,
# but it would be irrelevant in this case to traverse all options,
# here we just need to walk down the triangle selecting the best options
# with the greatest sum.  Because Pascal's triangle is just a matrix
# rotated 45 degrees, we can esily turn this into a matrix and walk
# through it.

tri = [75 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ;
        95 64 00 00 00 00 00 00 00 00 00 00 00 00 00 ;
        17 47 82 00 00 00 00 00 00 00 00 00 00 00 00 ;
        18 35 87 10 00 00 00 00 00 00 00 00 00 00 00 ;
        20 4 82 47 65 00 00 00 00 00 00 00 00 00 00 ;
        19 1 23 75 3 34 00 00 00 00 00 00 00 00 00 ;
        88 2 77 73 7 63 67 00 00 00 00 00 00 00 00 ;
        99 65 4 28 6 16 70 92 00 00 00 00 00 00 00 ;
        41 41 26 56 83 40 80 70 33 00 00 00 00 00 00 ;
        41 48 72 33 47 32 37 16 94 29 00 00 00 00 00 ;
        53 71 44 65 25 43 91 52 97 51 14 00 00 00 00 ;
        70 11 33 28 77 73 17 78 39 68 17 57 00 00 00 ;
        91 71 52 38 17 14 91 43 58 50 27 29 48 00 00 ;
        63 66 4 68 89 53 67 30 73 16 69 87 40 31 00 ;
        4 62 98 27 23 9 70 98 73 93 38 53 60 4 23]


# Matrix of zeros to store max values
new_tri = zeros(14,14)

for row in reverse(1:14)
        for col in (1:length(tri[row,:][tri[row,:] .> 0]))
                new_tri[row, col] = max(tri[row, col] + tri[row + 1, col],
                tri[row, col] + tri[row + 1, col + 1])
        end

  # replace values in original Matrix with calculated max values
  for col in (1:length(tri[row,:][tri[row,:] .> 0]))
          tri[row, col] = new_tri[row, col]
  end
end

tri[1:14, 1:14] #full pyramid of max values

print("Problem 18 = ", tri[1, 1])  # 1074
