DEGREE = "\xC2\xB0".encode
MINUTE = "'"
SECOND = "\""

MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(dd)
#   degrees, fraction = dd.divmod(1)
#   fraction *= 60
#   minutes, fraction = fraction.divmod(1)
#   seconds = (fraction * 60).round

#   if seconds > 59
#     carry_adjust = seconds.divmod(60)
#     minutes += carry_adjust[0]
#     seconds = carry_adjust[1]
#   end

#   "#{degrees}#{DEGREE}#{minutes.to_s.rjust(2, '0')}"\
#     "#{MINUTE}#{seconds.to_s.rjust(2, '0')}#{SECOND}"
# end

# LS solution

def dms(degrees_float)
# further exploration
  degrees_float /= 10 if degrees_float > 360

  while degrees_float < 0
    degrees_float = 360 + degrees_float
  end

  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
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

# algo:
# -given a float dd
# -set degrees, fraction = dd.divmod(1)
# -set minutes = fraction * 60
# -set minutes, fraction_of_fraction = minutes.divmod(1)
# -set seconds = fraction_of_fraction * 60
# -return string "[degrees][DEGREE] [minutes][MINUTES] [seconds][SECONDS]"
 

# input: float representing DD number
# output: string representing DMS version of the DD number

# need to * by -1 if the DD number is negative
# account for a DD of 0
# need to split the number into whole part and fractional part
# dd.divmod(1) will work for positive number
# dd.to_i will give the integer part
# dd % 1 will give the fractional part

# the integer part remains unchanged as degreees
# the fractional part needs to be converted by:
# minutes = frac * 60 (== minutes)
# divmod frac and the integer part remains minutes
# the fractional part fracfrac
# seconds = fracfrac * 60