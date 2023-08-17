# After Midnight (Part 2)

=begin

Notes:

need to split the input string ':'
a, b = string.split(':')

after midnight
(hours % 24) * MINUTES_PER_HOUR + minutes

before midnight
(24 - (hours % 24)) * MINUTES_PER_HOUR - minutes

questions:

Problem:
input: a string
output: an integer

  Write a method that takes a string representing a 24h time in the
  format 'hh:mm' and returns the number of minutes before midnight
  as an integer.

  Write a second method that takes the same input and returns
  the number of minutes *after* midnight.

rules:
  input times can include '24:00'

Examples:

  24:00 -> 0

DS:

Algorithm:
subroutine after_midnight
Given a string of the form 'hh:mm', clock_time
Split the string on ':' char and assign first half to hours, second to minutes
Convert hours and minutes to integers
Set minutes_after := ((hours % HOURS_PER_DAY) * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
Return minutes_after

subroutine before_midnight
Given a string of the form 'hh:mm', clock_time
Split the string on ':' char and assign first half to hours, second to minutes
Convert hours and minutes to integers
Set minutes_before := ((HOURS_PER_DAY - (hours % HOURS_PER_DAY))
  * MINUTES_PER_HOUR - minutes) % MINUTES_PER_DAY
Return minutes_before
=end

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(clock_time)
  hours, minutes = clock_time.split(':').map(&:to_i)
  ((hours % HOURS_PER_DAY) * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY # first modulo unnecessary
end

def before_midnight(clock_time)
  hours, minutes = clock_time.split(':').map(&:to_i)
  ((HOURS_PER_DAY - (hours % HOURS_PER_DAY)) * MINUTES_PER_HOUR - minutes) % MINUTES_PER_DAY
end

# LS solution
def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
