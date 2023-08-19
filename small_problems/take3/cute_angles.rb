# Cute Angles

=begin

Notes:

To avoid floating-point errors it might be an idea
to convert float to string and seperate fractional part

unicode for degree symbol "\u00B0"

degree has 60 mins
min has 60 seconds

format("#{degrees}#{DEGREE}%02d'%02d\""

questions:

Problem:
input: float
output: string 'dd[degree sign]mm'ss"'

  Write a method that takes a floating-point number representing degrees
  and return a string giving the degrees, minutes, seconds representation

rules:
  the fractional part of the float means what fraction of 60 mins
  the fractional part of the float returned by above means what fraction of 60 seconds
  then you need to strip or round the fractional part of the seconds result
  for the format string, the second two number are <= 60 and should be zero-padded to 2 digits if only 1 digit
    however, the first number should simply be interpolated
Examples:

30 = 30d00'00"
76.73
0.73 of a degree, expressed in minutes means: 0.73 of 60 minutes
= 

DS:

Algorithm:

MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

subroutine zero_prefix
Given a string representation of a decimal fraction, fraction
Prepend '0.' to fraction
Convert fraction to floating-point
Return fraction

routine dms
Given a float, degree_float
degree_float = convert degree_float explicitly to float
# Set degrees := 0
# Set minutes := 0
# Set seconds := 0
Convert degree_float to string representation
Split on '.'
Convert the first element from split array to an integer and assign to degrees
Set degree_fraction := zero_prefix(split_degrees[1])
minute_float = degree_fraction * MINUTES_PER_DEGREE
minutes = round minute_float
Convert minute_float to string
Split string on '.'
Set minute_fraction := zero_prefix(split_minutes[1])
Set seconds := minute_fraction * SECONDS_PER_MINUTE
seconds = round seconds to integer
Return format string

=end

DEGREE = "\xC2\xB0"

MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE

def zero_prefix(fraction)
  fraction.prepend('0.')
  fraction.to_f
end

def dms(degrees)
  degrees = degrees.to_f
  split_degrees = degrees.to_s.split('.')
  
  degrees = split_degrees.first.to_i
  
  degree_fraction = zero_prefix(split_degrees.last)
  minute_float = degree_fraction * MINUTES_PER_DEGREE
  split_minutes = minute_float.to_s.split('.')
  
  minutes = split_minutes.first.to_i
  
  minute_fraction = zero_prefix(split_minutes.last)
  
  seconds = (minute_fraction * SECONDS_PER_MINUTE).round
  
  format("%d#{DEGREE}%02d'%02d\"", degrees, minutes, seconds)
end

# wrote this from memory after seeing LS solution
# this is mis-remembered but also works
def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  remaining_minutes, seconds = total_seconds.divmod(SECONDS_PER_MINUTE)
  degrees, minutes = remaining_minutes.divmod(MINUTES_PER_DEGREE)
  format("%d#{DEGREE}%02d'%02d\"", degrees, minutes, seconds)
end

# actual LS solution
def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# Further exploration
def dms(degrees_float)
  # degrees_float %= 360 # this works in Ruby! (and JS and Python too)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  # probably more sensible to do this though
  total_seconds %= SECONDS_PER_DEGREE * 360
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(%d#{DEGREE}%02d'%02d"), degrees, minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further exp

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")

# 49:40
