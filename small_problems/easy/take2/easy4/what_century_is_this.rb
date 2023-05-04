# What Century is This?

# input: a string representing a year, year_string
# output: a string representing the century number and appropriate ending

# 1 st
# 2 nd
# 3 rd
# Else+ th

# EXCEPT 11th 12th 13th so need to check the penultimate char on the first if condition

# Convert number to integer
# Subtract 1 from number to account for years like 100 1900 etc
# Divide by 100
# Increment by 1
# Convert to string
# if elsif else statement for endings above



def century(year_string)
  cardinal_century = year_string.to_i
  cardinal_century -= 1
  cardinal_century /= 100
  cardinal_century += 1
  cardinal_century = cardinal_century.to_s

  if cardinal_century[-2] == '1'
    cardinal_century + 'th'
  elsif cardinal_century[-1] == '1'
    cardinal_century + 'st'
  elsif cardinal_century[-1] == '2'
    cardinal_century + 'nd'
  elsif cardinal_century[-1] == '3'
    cardinal_century + 'rd'
  else
    cardinal_century + 'th'
  end
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
  else 'th'
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
