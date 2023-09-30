# After Midnight (Part 1)

=begin
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.
=end

=begin
Notes:

-13
Add number of minutes in a day to -13
To make it work for negative numbers with abs > 1440
  repeatedly add until input number is positive

Then divmod by 60

format("%02d:%02d", hours, minutes)

Problem:
input: an integer
output: a formatted 24hour time string

rules:
  you cannot use Date or Time classes
  string must be in format 'hh:mm'

Examples and test cases:

Data structures:

Algorithm:
define contants
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

Given an integer, minutes_delta
Iterate while minutes_delta < 0
  minutes_delta = minutes_delta + MINUTES_PER_DAY
minutes_delta = minutes_delta % MINUTES_PER_DAY
Set hours := minutes_delta / MINUTES_PER_HOUR
Set minutes := minutes_delta % MINUTES_PER_HOUR
Format hours, minutes as a string of the format 'hh:mm'
Return formatted string
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def time_of_day(minutes_delta)
  minutes_delta += MINUTES_PER_DAY while minutes_delta.negative?
  minutes_delta %= MINUTES_PER_DAY
  hours, minutes = minutes_delta.divmod(MINUTES_PER_HOUR)
  format("%02d:%02d", hours, minutes)
end

def time_of_day(minutes_delta)
  minutes_delta %= MINUTES_PER_DAY
  hours, minutes = minutes_delta.divmod(MINUTES_PER_HOUR)
  format("%02d:%02d", hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# 13:42
