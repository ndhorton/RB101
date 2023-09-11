# Unlucky Days

=begin

Notes:

questions:
do i need to check year is an integer?

Problem:
input: an integer, year
output: an integer, number of friday 13th in year

  Write a method that returns the number of Friday 13ths for the given year

rules:
  Gregorian calander may be assumed
  year will be greater than 1752

Examples:

DS:

Algorithm:
Given an integer, year
Using Ruby's knowledge of dates...
Instantiate Date 1-1-year
Set unlucky_days := 0
Iterate while Date.year < year + 1
  If day is friday and day of month is 13
    unlucky_days = unlucky_days + 1
  
  Increment Date by 1 day
Return unlucky_days
=end

require 'date'

# def friday_13th(year)
#   current_date = Date.new(year)
#   unlucky_days = 0
#   while current_date.year < year + 1
#     unlucky_days += 1 if current_date.day == 13 && current_date.friday?
#     current_date = current_date.next
#   end
#   unlucky_days
# end

# # LS solution
def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Further exploration
def count_fridays_per_month(year)
  d = Date.new(year)
  d += 1 until d.friday?
  fridays = []
  12.times do |index|
    month = d.month
    friday_count = 0
    loop do
      break if d.month > month || d.year > year
      friday_count += 1
      d += 7
    end
    fridays << friday_count
  end
  fridays
end

p count_fridays_per_month(2015)
p count_fridays_per_month(1986)
p count_fridays_per_month(2019)
p count_fridays_per_month(2020) # leap year

# 11:33
