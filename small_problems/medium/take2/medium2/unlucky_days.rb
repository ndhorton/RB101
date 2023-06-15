# Unlucky Days

=begin

Thoughts:
Given a year
Set friday_thirteenths := 0
Set current_date := date object(year)
Iterate through every day in the year
  if the day is a Friday 13th
    friday_thirteenths += 1

Problem:

Write a method that returns the number of Friday 13ths in a given year,
assume year > 1752 and calendar Gregorian

Examples:

DS:

Algorithm:

Given an integer > 1752, year
Set constant SECONDS_IN_MINUTE := 60
Set constant MINUTES_IN_HOUR := 60
Set constant HOURS_IN_DAY := 24
Set constant SECONDS_IN_DAY := SECONDS_IN_MINUTE * MINUTES_IN_HOUR * HOURS_IN_DAY

Set current_date := time object(year)
Set friday_thirteenths := 0
Iterate until current_date.year == year + 1
  if current_date.friday? && current_date.mday == 13
    friday_thirteenths += 1
  end if
  current_date += SECONDS_IN_DAY
end iteration
Return friday_thirteenths

=end

SECONDS_IN_MINUTE = 60
MINUTES_IN_HOUR = 60
HOURS_IN_DAY = 24

SECONDS_IN_DAY = SECONDS_IN_MINUTE * MINUTES_IN_HOUR * HOURS_IN_DAY

def friday_13th(year)
  current_date = Time.new(year)
  friday_thirteenths = 0
  loop do
    break if current_date.year >= year + 1
    friday_thirteenths += 1 if current_date.friday? && current_date.mday == 13
    current_date += SECONDS_IN_DAY
  end
  friday_thirteenths
end

require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.civil(year, 1, 13)
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
require 'date'

def months_with_five_fridays(year)
  fridays_per_month = []
  current_date = Date.new(year)

  12.times do
    fridays = 0
    last_of_month = current_date.next_month - 1
    
    current_date.step(last_of_month) { |date| fridays += 1 if date.friday? }
    fridays_per_month << fridays

    current_date = current_date.next_month
  end

  fridays_per_month.count(5)
end

p months_with_five_fridays(1986) == 4
p months_with_five_fridays(2020) == 4

# 19:05
# Had to use irb a lot, and LS recommends Date rather than Time
# Looking at the docs though, they recommend Time if you only need Gregorian dates
# but it lacks the ease of stepping through months and days that Date has