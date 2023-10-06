# Unlucky Days

=begin


Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

=end


=begin
Notes:

Will need the Date class
require 'date'
Date.new(year)
approach:
add 1 to date until you reach the 13th
check if it's Friday
  if so increment a counter
skip to next month


Problem:
input: integer
output: an integer

Write a method that takes an integer, year,
and returns an integer count of the number
of Friday 13ths in that year

rules:
  assume argument greater than 1752

Examples and test cases:

Data structures:

Algorithm:
Given an integer, year
Set date := a Date object, year-1-13
Set unlucky_days := 0
While date year is < year + 1
  if date is a friday
    unlucky_days = unlucky_days + 1
  Skip to next month
Return unlucky_days
=end

require 'date'

def friday_13th(year)
  date = Date.new(year, 1, 13)
  unlucky_days = 0
  until date.year > year
    unlucky_days += 1 if date.friday?
    date = date.next_month
  end
  unlucky_days
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# 9:37
