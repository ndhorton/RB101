# After Midnight (Part 2)

# input: a string time_24h in the format '00:00'
# output: time in minutes after midnight or before midnight

# after midnight
# get ints, hours and minutes
# hours % 24
# minutes_after_midnight = hours * 60 + minutes

# before midnight
# (1440 - after_midnight(time_24h)) % 1440 need parentheses here

MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def after_midnight(time24h)
  hours = time24h[0, 2].to_i % 24
  minutes = time24h[3, 2].to_i
  minutes + hours * MINUTES_PER_HOUR
end

def before_midnight(time24h)
  (MINUTES_PER_DAY - after_midnight(time24h)) % MINUTES_PER_DAY
end

# LS solution

# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
SECONDS_PER_MINUTE = 60

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (Time.new(2023, 1, 1, hours, minutes) - Time.new(2023)) / 
  SECONDS_PER_MINUTE % MINUTES_PER_DAY
  .to_i
end

def before_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  # hours %= 24
  (Time.new(2023, 1, 2) - Time.new(2023, 1, 1, hours, minutes)) / 
    SECONDS_PER_MINUTE % MINUTES_PER_DAY
    .to_i
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
