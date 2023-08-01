# Leap Years (Part 2)

=begin

Notes:

method from previous exercise
if year >= 1752
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
else
  year % 4 == 0

questions:


Problem:
input: integer, year
output: boolean true or false

  Write a method that takes a year as integer and returns
  boolean true or false depending on whether the year
  is a leap, taking account of the change to the Gregorian
  from Julian in 1752 (in British Empire)

rules:
  if year < 1752, then only need to check if year is divisible by 4
  if year >= 1752, then need nuances from previous method

Examples:

DS:

Algorithm:
Given an integer, year
If year < 1752
  Return result of checking if year is divisble by 4
Else
  Return result of checking if (year is divisible by 400)
                            OR (year is divisible by 4
                                AND not divisible by 100)


=end

def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  end
end

# LS solution
def leap_year?(year)
  if year < 1752 && year % 4 == 0
    true
  elsif year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# 8:52
