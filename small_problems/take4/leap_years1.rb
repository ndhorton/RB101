# Leap Years (Part 1)

=begin
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.
=end

=begin
Notes:

Problem:
input: an integer, year
output: boolean true or false

  Write a method that takes an integer year
  and returns true if it is a leap year
  and false otherwise

rules:
  assume I don't have to check if argument is > 0? yes
  if a year is divisible by 400 then it's a leap year
  if a year is divisible by 100 and not 400
    it's not a leap year
  otherwise
    -> is year divisible by 4?

Examples and test cases:

Data structures:

Algorithm:
Given an integer, year
If year % 400 == 0
  Return true
Else if year % 100 == 0
  Return false
Else
  Return boolean result of (year % 4 == 0)
=end

def leap_year?(year)
  if year % 400 == 0
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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# 10:55
