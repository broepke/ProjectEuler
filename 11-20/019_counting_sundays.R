# You are given the following information, but you may
# prefer to do some research for yourself.

# 1 Jan 1900 was a Monday.

# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.

# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a
# century unless it is divisible by 400.

# How many Sundays fell on the first of the month during the
# twentieth century (1 Jan 1901 to 31 Dec 2000)?

library(lubridate)
start_time <- Sys.time()

start_year <- 1901
end_year <- 2000
counter <- 0

for (x in (start_year:end_year)) {
  d <- as.Date(paste(x, "-1-1", sep = ""))
  d <-
    d + (7 - wday(d, week_start = getOption("lubridate.week.start", 1)))
  this_year <- as.Date(paste(x, "-1-1", sep = ""))
  
  while (year(d) == year(this_year)) {
    if (day(d) == 1) {
      counter = counter + 1
    }
    d = d + 7
  }
}


print(paste("Problem 19 =", counter)) # 171

end_time <- Sys.time()
print(end_time - start_time)