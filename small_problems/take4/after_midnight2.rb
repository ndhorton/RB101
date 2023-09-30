# After Midnight (Part 2)

=begin
As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us, though; it makes the problem more interesting.

Disregard Daylight Savings and Standard Time and other irregularities.
=end

=begin
Notes:

Problem:
input: a string of format 'hh:mm'
output: an integer

Given a string of format 'hh:mm',
        for after_midnight return number of minutes after midnight
        for before_midnight return number of minutes before unsigned

rules:
  inputs include 24:00
  do i need to validate input? no, by examples

Examples and test cases:

Data structures:

Algorithm:
define constants
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

subprocess after_midnight
Given a string, time
Split time on ':' character, hours, minutes
Convert hours and minutes to integers
hours = hours % HOURS_PER_DAY
Set result := (hours * MINUTES_PER_HOUR) + minutes
Return result

subprocess before_midnight
Given a string, time
Set minutes_after := after_midnight(time)
Set result := -minutes_after % MINUTES_PER_DAY
Return result
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  hours %= HOURS_PER_DAY
  result = (hours * MINUTES_PER_HOUR) + minutes
  result
end

def before_midnight(time)
  minutes_after = after_midnight(time)
  
  -minutes_after % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# 13:58 - forgot i had to put a negative sign on minutes_after
#         because i was using integer literals to test in irb
