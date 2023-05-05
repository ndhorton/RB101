# After Midnight (Part 1)

# input: an integer, minute_offset, representing minutes before
# or after midnight. Before for negative, after for positive.
# output: the time as a 24h hh:mm

# if offset is negative or positive it works! Have to trace through
# the modular arithmetic to remember why it works

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

def normalize_minutes(minute_offset)
  while minute_offset < 0
    minute_offset += MINUTES_PER_HOUR
  end

  minute_offset.remainder(MINUTES_PER_HOUR)
end

def time_of_day(minute_offset)
  hours = minute_offset / MINUTES_PER_HOUR % HOURS_PER_DAY
  minutes = normalize_minutes(minute_offset) # minute_offset % MINUTES_PER_HOUR
  "%02i:%02i" % [hours, minutes]
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

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
