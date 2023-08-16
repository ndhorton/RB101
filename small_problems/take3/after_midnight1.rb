# After Midnight (Part 1)

=begin
Notes:

first thing to do is define constants
minutes in an hour
hours in a day
minutes in a day

normalize negative minutes by:
repeatedly add minuts in a day to minutes until positive
so,
while minutes < 0
    minutes = minutes + minutes_per_a_day

hours = normal_minutes / minutes in hour
minute_output = normal_minutes % minutes in hour

format is important!

"%.2i:%.2i"

questions:


Problem:
input: integer
output: string

  Write a method that takes a signed integer representing minutes
  before (negative) or after (positive) midnight (0 or multiples of
  number of minutes in a day) and returns a string "hh:mm" giving the
  time as the readout of a 24h clock

rules:
  cannot use Date or Time
  disregard daylight savings, standard time, etc

Examples/test cases:

Data Structures:


Algorithm:

Given an integer, minutes
Iterate while minutes < 0
  Add MINUTES_IN_DAY to minutes
minutes %= MINUTES_IN_DAY
Set hours_readout := minutes / MINUTES_IN_HOUR
Set minutes_readout := minutes % MINUTES_IN_HOUR
Create string composed of String(hours_readout) + ':' + String(minutes_readout)

=end

SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

MIDNIGHT = Time.utc(2023, 8, 6)
WEEKDAYS = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

def time_of_day(minutes)
  minutes += MINUTES_PER_DAY while minutes < 0
  minutes %= MINUTES_PER_DAY
  hours_readout, minutes_readout = minutes.divmod(MINUTES_PER_HOUR)
  format("%.2i:%.2i", hours_readout, minutes_readout)
end

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end



# Further exploration
# 1
def time_of_day(delta_minutes)
  delta_minutes %= MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

#2
def time_of_day(delta_minutes)
  target_time = MIDNIGHT + (SECONDS_PER_MINUTE * delta_minutes)
  hours = target_time.hour
  minutes = target_time.min
  format('%02d:%02d', hours, minutes)
end


def time_of_date(delta_minutes)
  target_time = MIDNIGHT + (SECONDS_PER_MINUTE * delta_minutes)
  hours = target_time.hour
  minutes = target_time.min
  weekday = WEEKDAYS[target_time.wday]
  format('%s, %02d:%02d', weekday, hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

p time_of_date(0) #== "00:00"
p time_of_date(-3) #== "23:57"
p time_of_date(35) #== "00:35"
p time_of_date(-1437) #== "00:03"
p time_of_date(3000) #== "02:00"
p time_of_date(800) #== "13:20"
p time_of_date(-4231) #== "01:29"

# 32:02 - forgot the decimal readout had to always be a pair of 2-digit numbers
        # - forgot to modulo off minutes greater than 1 day
