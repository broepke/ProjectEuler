import time
from datetime import date, timedelta

start_time = time.time()

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

start_year = 1901
end_year = 2000
counter = 0


def allsundays(year):
    d = date(year, 1, 1)  # January 1st
    d += timedelta(days=6 - d.weekday())  # First Sunday
    while d.year == year:
        yield d
        d += timedelta(days=7)


for i in range(start_year, end_year + 1):
    for d in allsundays(i):
        if d.day == 1:
            counter += 1

print('Problem 19 =', counter, 'Sundays from', start_year,
      'to', end_year, 'fell on the first of the month!')  # 171

print("Program took %s seconds to run." % (time.time() - start_time))
