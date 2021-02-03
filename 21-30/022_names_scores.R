# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
# containing over five-thousand first names, begin by sorting it into
# alphabetical order. Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to
# obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN
# which is worth 3 + 15 + 12 + 9 + 14 <- 53, is the 938th name in the list. So,
# COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

library(gtools)

f <-
  scan(
    "p022_names.txt",
    what = character(),
    sep = ",",
    na.strings = "XXXX"
  )

y <- sort(f)

get_total <- function (name) {
  name_total <- 0
  for (l in name) {
    name_total <- name_total + (asc(l[1]) - 64)
  }
  return (sum(name_total))
}

total <- 0
idx_count <- 1

for (i in y) {
  a <- get_total(i)
  a <- a * idx_count
  total <- total + a
  idx_count <- idx_count + 1
}

print(paste("Problem 22 = ", total)) # 871198282

