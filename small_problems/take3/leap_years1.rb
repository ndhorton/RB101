# Leap Years (Part 1)

=begin

Notes:

(year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)

questions:


Problem:
input: an integer, year
output: a boolean true or false

  Write a method that takes a year as an integer and returns
  `true` if it is a leap year in the Gregorian calendar, `false`
  otherwise

rules:
  a leap year occurs when
    a year is divisible by 400 or
    a year divisible by 4 that is not also divisible by 100

Examples:

DS:

Algorithm:
Given an integer, year
If year is divisible by 400
  Return true
Else if year is divisble by 4 AND year is not divisble by 100
  Return true
Else
  Return false
=end

def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

# LS solution
# Algorithm more like
# Given an integer, year
# If year is divisible by 400
#   Return true
# Else if year is divisible by 100
#   Return false
# Else
#   Return (Is year is divisble by 4? true or false)
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# Further exploration
# The given solution will fail for years divisble by 400
# since the divisible by 100 branch will have already
# returned false

# The rewrite is indeed much more complicated
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

# 8:32
