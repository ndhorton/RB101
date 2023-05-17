# After Midnight (Part 1)

# input: an integer, minute_offset, representing minutes before
# or after midnight. Before for negative, after for positive.
# output: the time as a 24h hh:mm

# if offset is negative or positive it works! Have to trace through
# the modular arithmetic to remember why it works

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

def time_of_day(minute_offset)
  hours = minute_offset / MINUTES_PER_HOUR % HOURS_PER_DAY
  minutes = minute_offset % MINUTES_PER_HOUR
  "%02d:%02d" % [hours, minutes]
end

# LS solution

# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR # 1400

# def normalize_minutes_to_0_through_1439(minutes)
#   while minutes < 0
#     minutes += MINUTES_PER_DAY
#   end
  
#   minutes % MINUTES_PER_DAY
# end

# def time_of_day(delta_minutes)
#   delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end

# The normalizer essentially means that remainder will work the same
# as modulo because now neither sum is negative

# def normalize_minutes(minute_offset)
#   while minute_offset < 0
#     minute_offset += MINUTES_PER_HOUR * HOURS_PER_DAY
#   end

#   minute_offset.remainder(MINUTES_PER_HOUR * HOURS_PER_DAY)
# end


# Problem 1
# def normalize_minutes(minute_offset)
#   minute_offset % (MINUTES_PER_HOUR * HOURS_PER_DAY)
# end

# def time_of_day(minute_offset)
#   minutes_after_midnight = normalize_minutes(minute_offset)
#   hours, minutes = minutes_after_midnight.divmod(MINUTES_PER_HOUR)
#   format("%02i:%02i", hours, minutes)
# end

# Problem 2

# SECONDS_PER_MINUTE = 60

# def time_of_day(minute_offset)
#   time = Time.at(minute_offset * SECONDS_PER_MINUTE).utc
#   format("%02d:%02d", time.hour, time.min)
# end

# Problem 3
require 'date'

SECONDS_PER_MINUTE = 60
CW_DAYS = ['Monday', 'Tuesday', 'Wednesday',
  'Thursday', 'Friday', 'Saturday', 'Sunday']
SUNDAY_MIDNIGHT = Time.utc(2023, 4, 30)

def time_of_weekday(minute_offset)
  time = SUNDAY_MIDNIGHT + (minute_offset * SECONDS_PER_MINUTE)
  date = Date.new(time.year, time.month, time.day)
  format("%s %02d:%02d", CW_DAYS[date.cwday - 1], time.hour, time.min)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

p time_of_weekday(-4231) == "Thursday 01:29"
