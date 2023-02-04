# Unlucky Days

=begin
P:
input: a year as integer, year > 1752
output: integer representing how many 13ths of months of that
year are fridays
goal: loop testing time objects for the 13th of each month
checking if that day is a friday, if so counter++

A:
given an integer, year
set friday_13ths
for i from 1 to 12
  if time(year, i, 13) is a friday
    friday_13ths += 1
return friday_13ths
=end

require 'date'

# def friday_13th(year)
#   friday_13ths = 0
#   1.upto(12) do |month|
#     friday_13ths += 1 if Date.new(year, month, 13).friday?
#   end
#   friday_13ths
# end

# LS solution

# def friday_13th(year)
#   unlucky_count = 0
#   thirteenth = Date.civil(year, 1, 13)
#   12.times do
#     unlucky_count += 1 if thirteenth.friday?
#     thirteenth = thirteenth.next_month
#   end
#   unlucky_count
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# Further explorations
# mine
# def five_fridays(year)
#   day = Date.civil(year, 1, 1)
#   months_of_five = 0
#   1.upto(12) do
#     fridays = 0
#     month_end = day.next_month
#     until day == month_end
#       fridays += 1 if day.friday?
#       day += 1
#     end
#     months_of_five += 1 if fridays >= 5
#   end
#   months_of_five
# end

# Aaron Baumgarten student solution
def five_fridays(year)
  month_hash = Hash.new(0)
  (Date.new(year, 1, 1)..Date.new(year, 12, 31)).each {|day|
    if day.friday?
      month_hash[day.mon] += 1
    end
  }
  month_hash.count {|k,v| v == 5}
end
p five_fridays(2003)
