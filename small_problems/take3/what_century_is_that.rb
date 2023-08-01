# What Century is That?

=begin

Notes:

1 - 1 = 0
0 / 100 = 0
0 + 1 = 1 (only has one digit, this should be included in check)

100 - 1 = 99
99 / 100 = 0
0 + 1 = 1

101 - 1 = 100
100 / 100 = 1
1 + 1 = 2

2000 - 1 = 1999
1999 / 100 = 19
19 + 1 = 20

2001 - 1 = 2000
20
21

is the size of the string bigger than 1 and is the character
at index: string.size - 2 == 1?
  If so, then the suffix is 'th'

questions:
  What is the range of possible years?
  Is 1 the earliest? Yes
  check range is positive integer? no
Problem:
input: integer year e.g. 1989
output: string representing century with suffix e.g '20th'

Write a method that takes a year as input and returns the century.

rules:
  assume - input must be a positive integer
  the output must contain correct suffix
  output must be string
  must check the number of digits before checking penultimate

Examples:

final two digits (if 2 or more digits)
st - anything but 1 (including doesn't exist), 1
nd - anything but 1, 2
rd - anything but 1, 3
th - anything else including where penultimate digit is 1

DS:

case statement over hash because it allows for ranges

Algorithm:
Given an integer, year
Subtract 1 from year
Divide year by 100
Add 1 to year
Set century := convert year to string
Set suffix := null value
If size of century > 1 AND the second-to-last char is '1'
  suffix = 'th'
Else if last char is '1'
  suffix = 'st'
Else if last char is '2'
  suffix = 'nd'
Else if last char is '3'
  suffix = 'rd'
Else
  suffix = 'th'
Append suffix to century
Return century

=end

def century(year)
  year -= 1
  year /= 100
  year += 1

  century = year.to_s
  century <<  if century.size > 1 && century[-2] == '1' then 'th'
              elsif century[-1] == '1'                  then 'st'
              elsif century[-1] == '2'                  then 'nd'
              elsif century[-1] == '3'                  then 'rd'
              else
                'th'
              end
  century
end

# LS solution
def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else
    'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# 25:20 - not sure about that if statement
