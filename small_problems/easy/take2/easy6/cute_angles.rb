# Cute Angles

# input: a float, degrees
# output: degrees converted to degrees, minutes, seconds so that all 3
# values are integers with minutes and seconds formatted to 2 digits
# padded with zeroes

# write a function to split float using string representation into
# integer and fractional part, returning a 2-element array of integers

# The first example suggests that an integer might be passed,
# make sure to convert input to float

# Given a number, decimal_degrees
# decimal_degrees = Float(degrees)
# Set degrees, decimal_minutes := split_float(decimal_degrees)
# degrees = degrees.to_i
# decimal_minutes = decimalize(decimal_minutes)
# decimal_minutes *= 60
# Set minutes, decimal_seconds := split_float(Float(decimal_minutes))
# minutes = minutes.to_i
# decimal_seconds = decimalize(decimal_seconds)
# seconds = truncate(decimal_seconds * 60)

# Set dms_string := format("%i%s%02i%s%02%s",
#   degrees, DEGREES, minutes, MINUTES, seconds,SECONDS)
# Return dms_string

# DEGREES = "\xC2\xB0"
# MINUTES = "'"
# SECONDS = '"'


# def split_float(number)
#   number.to_f.to_s.split('.')
# end

# def decimalize(number)
#   "0.#{number.to_s}".to_f
# end

# def dms(decimal_representation)
#   degrees, decimal_minutes = split_float(decimal_representation)
#   degrees = degrees.to_i

#   decimal_minutes = decimalize(decimal_minutes)
#   decimal_minutes *= 60
  
#   minutes, decimal_seconds = split_float(decimal_minutes)
#   minutes = minutes.to_i

#   decimal_seconds = decimalize(decimal_seconds)
#   seconds = (decimal_seconds * 60).round

#   format("%i%s%02i%s%02i%s", degrees, DEGREES, minutes, MINUTES, seconds, SECONDS)
# end

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
# Further Exploration
MAXIMUM_DEGREES = 360

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
# Further Exploration
  total_seconds %= MAXIMUM_DEGREES * SECONDS_PER_DEGREE

  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
