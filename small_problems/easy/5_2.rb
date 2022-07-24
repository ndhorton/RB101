# input: an integer representing number of minutes before or after midnight depending on sign
# output: the clock time represented by the integer

# hours = number / 60
# if hours != 0, minutes = number % 60
# 1440 minutes in a day
# 24 hours in a day

# you could divide off excess days
# number %= 1440

# if number is negative, number = 1440 + number

# algo:
# -given a number
# -set number = number % 1440
# -if number < 0
# --number = 1440 + number
# -set hours = number / 60
# -set minutes = number % 60
# -return "<hours>:<minutes>" formatted as a clock

# formatting as a clock
# if less than 10 you need to pad with a zero
#   hours.to_s.rjust(2, "0")

def time_of_day(number)
  while number < 0
    number += 1440
  end

  number %= 1440

  hours, minutes = number.divmod(60)

  format("%02d:%02d", hours, minutes)
end

#LS solution
# the reason mine is bad is that it depends on using modulo operator on
# negative numbers

# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def time_of_day(number)
#   while number < 0
#     number += MINUTES_PER_DAY
#   end

#   number %= MINUTES_PER_DAY

#   hours, minutes = number.divmod(MINUTES_PER_HOUR)

#   format("%02d:%02d", hours, minutes)
# end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
