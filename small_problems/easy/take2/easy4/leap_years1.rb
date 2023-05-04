# Leap Years (Part 1)

# input: year as integer, year
# output: true if leap year, false otherwise

# goal:

# is year divisible by 400?
#   -> leap year true
# is year divisible by 4 AND NOT divisible by 100?
#   -> leap year true
# else
#   -> false


def leap_year?(year)
  if year % 400 == 0
    true
  elsif (year % 4 == 0) && (year % 100 != 0)
    true
  else
    false
  end
end

def leap_year?(year)
  (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))
end

# LS solution
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# Further explorations

# the given code will return `false` for leap years divisible by 400
# because the anything divisible by 400 is also divisible by 100 so
# for numbers divisible by 400 the flow of control
# has already passed to the first `if` branch and the check
# for `year % 400 == 0` will never be evaluated successfully

# Reverse order of logic

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        true
      else
        false
      end
    else
      true
    end
  else
    false
  end
end

def leap_year?(year)
  return false if year % 4 != 0
  return false if year % 100 == 0  && year % 400 != 0
  true
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true