# Leap Years (Part 2)

=begin
A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine leap years both before and after 1752.
=end

=begin
Notes:

Julian < 1752
(year % 4 == 0 && year < 1752)

Gregorian >= 1752
(year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)

Problem:
input: an integer, year
output: a boolean true or false

Write a method that determines whether an integer,
year, is a leap year with reference to Julian and Gregorian calendars

rules:
  Gregorian >= 1752
  Julian < 1752

Examples and test cases:

Data structures:

Algorithm:

subprocess julian_leap_year?
Given an integer, year
Return boolean result of (year % 4 == 0)

subprocess gregorian_leap_year?
Given an integer, year
Return boolean result of (year % 400 == 0) ||
  (year % 4 == 0 && year % 100 != 0)

subprocess leap_year?
Given an integer, year
if year < 1752
  Return julian_leap_year?(year)
Else
  Return gregorian_leap_year?(year)
=end

def julian_leap_year?(year)
  year % 4 == 0
end

def gregorian_leap_year?(year)
  (year % 400 == 0) ||
    (year % 4 == 0 && year % 100 != 0)
end

def leap_year?(year)
  year < 1752 ? julian_leap_year?(year) : gregorian_leap_year?(year)
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

# 10:09
