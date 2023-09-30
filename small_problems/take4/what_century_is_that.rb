# What Century is That?

=begin
Notes:

if the penultimate digit is not 1
  and the last digit is 1 -> st
  and the last digit is 2 -> nd
  and the last digit is 3 -> rd
else
  -> th

if the penultimat digit is 1
  return "#{century}th"

case expression

1900 - 1
1899 / 100
18 + 1 = 19

1901 - 1
1900 / 100
19 + 1 = 20


Problem:
input: an integer, year
output: a string

  Write a method that takes an integer, year, and returns the
  ordinal number of the century as a string.
  e.g. 1950 -> '20th'
  New centuries begin on years ending in 01, so 1901-2000 -> '20th'

rules:
  New centuries begin on years ending in 01, so 1901-2000 -> '20th'

Examples and test cases:

Data structures:

Algorithm:
Given an integer, year
Set century_number :=
  Subtract 1 from year
  Divide result by 100
  Add 1 to result
  Covert result to string
If size of century_number is > 1 && penultimate character == '1'
  Return century_number + 'th'
If last character of century_number is '1'
  Return century_number + 'st'
Else if last character is '2'
  Return century_number + 'nd'
Else if last character is '3'
  Return century_number + 'rd'
Else
 Return century_number + 'th'
=end

def century(year)
  century_number = ((year - 1) / 100 + 1).to_s
  return "#{century_number}th" if century_number[-2] == '1'
  case century_number[-1]
  when '1' then "#{century_number}st"
  when '2' then "#{century_number}nd"
  when '3' then "#{century_number}rd"
  else
    "#{century_number}th"
  end
end

# refactor based on LS solution
def century(year)
  century_number = ((year - 1) / 100 + 1)
  century_number.to_s + century_suffix(century_number)
end

def century_suffix(century)
  return 'th' if century / 10 % 10 == 1
  
  case (century % 10)
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

# 19:34
