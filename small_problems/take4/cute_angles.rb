# Cute Angles

=begin
Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:
DEGREE = "\xC2\xB0"
=end

=begin
Notes:

Problem:
input: a float, degree_decimal
output: a formatted string with dms

Write a method that takes a float, degree_decimal, giving
an angle between 0 and 360 degrees as a decimal
and returns a formatted string with Degrees, Minutes and seconds

rules:
  60 seconds in a minute
  60 minutes in a degree
  Degree symbol for degrees
  single quote for minutes
  double quote for seconds

Examples and test cases:

76.73 * SECONDS_PER_DEGREE == 276228.0, total_seconds
remaining_minutes = total_seconds / SECONDS_PER_MINUTE
seconds = total_seconds % SECONDS_PER_MINUTE

degrees = remaining_minutes / DEGREES_PER_MINUTE
minutes = remaining_minutes % DEGREES_PER_MINUTE

Data structures:

Algorithm:
Given a float, degree_decimal
Set total_seconds := degree_decimal * SECONDS_PER_DEGREE
Round total_seconds to nearest integer

Set seconds := total_seconds % SECONDS_PER_MINUTE
Set remaining_minutes := total_seconds / SECONDS_PER_MINUTE

Set minutes := remaining_minutes % MINUTES_PER_DEGREE
Set degrees := remaining_minutes / MINUTES_PER_DEGREE

Format string in DMS
Return formatted string
=end

DEGREE = "\xC2\xB0"
MINUTE = "'"
SECOND = '"'

SECONDS_PER_MINUTE = 60
MINUTES_PER_DEGREE = 60
SECONDS_PER_DEGREE = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE

def dms(degree_decimal)
  total_seconds = (degree_decimal * SECONDS_PER_DEGREE).round
  
  remaining_minutes, seconds = total_seconds.divmod(SECONDS_PER_MINUTE)
  degrees, minutes = remaining_minutes.divmod(MINUTES_PER_DEGREE)

  format("%d#{DEGREE}%02d#{MINUTE}%02d#{SECOND}", degrees, minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# 20:24
