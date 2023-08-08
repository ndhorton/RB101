# Convert Signed Number to a String

=begin

Notes:

questions:

Problem:
input: integer, positive or negative
output: string representation of number including sign

  Write a method that takes a signed integer and returns
  a string representation of that integer including sign


rules:
  cannot use standard type conversion methods
  must include sign even if positive
  zero of course should not have a sign

Examples:

DS:

Algorithm:

subroutine get_sign (number)
Given an integer, number
If number less than zero
  Return '-'
Else if number greater than zero
  Return '+'
Else
  Return ''
--
Given an integer, number
Set sign := get_sign(number)
If number < 0
  number = -number
Set result := sign + integer_to_string(number)
Return result

=end

DIGITS = [*('0'..'9')]

def get_sign(number)
  if number < 0
    '-'
  elsif number > 0
    '+'
  else
    ''
  end
end

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  sign = get_sign(number)
  number = -number if number < 0
  "#{sign}#{integer_to_string(number)}"
end

# LS solution
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when 1  then "+#{integer_to_string(number)}"
  else
    integer_to_string(number)
  end
end

# Further exploration

def signed_integer_to_string(number)
  sign =  case number <=> 0
          when -1 then '-'
          when 1  then '+'
          else
           ''
          end

  "#{sign}#{integer_to_string(number.abs)}"
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# 13:02
