import time

import numpy as np

start_time = time.time()

tri = np.loadtxt("067_triangle_tab.txt", delimiter="\t")

# Matrix of zeros to store max values
new_tri = np.zeros((99, 99))

for row in range(98, -1, -1):
    # Calculate Max values
    for col in range(0, len(tri[row, :][tri[row, :] != 0])):
        new_tri[row, col] = max(tri[row, col] + tri[row + 1, col], tri[row, col] + tri[row + 1, col + 1])

    # replace values in original Matrix with calculated max values
    for col in range(0, len(tri[row, :][tri[row, :] != 0])):
        tri[row, col] = new_tri[row, col]

print("Problem 18 = ", tri[0, 0])  # 7273

print("Program took %s seconds to run." % (time.time() - start_time))
