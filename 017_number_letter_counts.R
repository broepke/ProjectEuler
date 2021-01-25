# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were
# written out in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342
# (three hundred and forty-two)
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage


# the approch i'm taking is to use a big dictionary that will hold all the
# lengths of the words by key's of thir numbers for easy lookup of string
# length then iterate through all the use cases of how words are built
# from 1-1000 1-19 are unique words round "tens" and "hundreds" are also
# unique words and per the instructions above, you build them with the
# example syntax

start_time = Sys.time()

options(scipen=999)
library(dplyr)
library(stringi)

num_len_dict <- list()

# Number counts for single digits
num_len_dict[[1]] <- 3
num_len_dict[[2]] <- 3
num_len_dict[[3]] <- 5
num_len_dict[[4]] <- 4
num_len_dict[[5]] <- 4
num_len_dict[[6]] <- 3
num_len_dict[[7]] <- 5
num_len_dict[[8]] <- 5
num_len_dict[[9]] <- 4

# Number counts for teens
num_len_dict[[10]] <- 3
num_len_dict[[11]] <- 6
num_len_dict[[12]] <- 6
num_len_dict[[13]] <- 8
num_len_dict[[14]] <- 8
num_len_dict[[15]] <- 7
num_len_dict[[16]] <- 7
num_len_dict[[17]] <- 9
num_len_dict[[18]] <- 8
num_len_dict[[19]] <- 8

# Number counts for the tens
num_len_dict[[20]] <- 6
num_len_dict[[30]] <- 6
num_len_dict[[40]] <- 5
num_len_dict[[50]] <- 5
num_len_dict[[60]] <- 5
num_len_dict[[70]] <- 7
num_len_dict[[80]] <- 6
num_len_dict[[90]] <- 6

# Number counts for the hudred
num_len_dict[[100]] <- 10
num_len_dict[[200]] <- 10
num_len_dict[[300]] <- 12
num_len_dict[[400]] <- 11
num_len_dict[[500]] <- 11
num_len_dict[[600]] <- 10
num_len_dict[[700]] <- 12
num_len_dict[[800]] <- 12
num_len_dict[[900]] <- 11

# Finally - the thousands
num_len_dict[[1000]] <- 11

# Initialization and looping
x <- 0

for (i in (1 : 1000)){
  # everything under twenty is just the length of the number
  if (i < 20) {
    x <- x + num_len_dict[[i]]
  } else if (i < 100) {
    # when you're 20 -> 99 then you need to break them up
    # except when you have the base ten.  then it's straight
    # we can find that with the modulo operator
    if (i %% 10 == 0){
      x <- x + num_len_dict[[i]]
    } else {
      x <- x + num_len_dict[[as.numeric(substr(as.character(i),1,1)) * 10]]
      x <- x + num_len_dict[[as.numeric(substr(as.character(i), stri_length(i), stri_length(i)))]]
    }
  } else if (i < 1000) {
    if (i %% 100 == 0) {
      # if the number is exactly a hundred.  just use that key/value
      x <- x + num_len_dict[[i]]
    } else if (as.numeric(substr(as.character(i), stri_length(i)-1, stri_length(i))) < 20) {
      # for all numbers under 20 for the last two digigts, take one hundred
      # plus just the value for the key for that two digit numbers
      x <- x + num_len_dict[[as.numeric(substr(as.character(i),1,1)) * 100]]
      x <- x + 3 # and
      x <- x + num_len_dict[[as.numeric(substr(as.character(i), stri_length(i)-1, stri_length(i)))]]
    } else {
      # now, for each number in the hundreds where the 10 is modulo
      # 10 (230, 350) you have to handle this like was done for the
      # tens above, but with better slicing of the numbers
      if (i %% 10 == 0){
        x <- x + num_len_dict[[as.numeric(substr(as.character(i),1,1)) * 100]]
        x <- x + 3 # and
        x <- x + num_len_dict[[as.numeric(substr(as.character(i), stri_length(i)-1, stri_length(i)))]]
      } else {
        x <- x + num_len_dict[[as.numeric(substr(as.character(i),1,1)) * 100]]
        x <- x + 3 # and
        x <- x + num_len_dict[[as.numeric(substr(as.character(i),2,2)) * 10]]
        x <- x + num_len_dict[[as.numeric(substr(as.character(i), stri_length(i), stri_length(i)))]]
      }
    }
  } else {
    # finally the use case for 1000 is just to take the key's value
    x <- x + num_len_dict[[i]]
  }
}

print(paste("Problem 17 = ", x))  # 21,124 total letters

end_time <- Sys.time()
print(end_time - start_time)
