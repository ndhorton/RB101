# Next Featured Number Higher than a Given Value

=begin

Notes:

9876543201 is the greatest featured number

approach: find next odd multiple of 7, then add 14 until digits
found to be unique

questions:

Problem:
input: an integer
output: a featured number greater than integer

  Write a method that takes an integer argument and returns the next
  featured number that is greater than the arguement.

rules:
  a featured number: an odd number that is a multiple of 7
                     whose digits are unique
  9_999_999_999 is an upper bound because there are only
  10 digits in the decimal number system and digits must be unique
  The cut-off point itself would be the last odd multiple of 7
    before 9_999_etc

Examples:

DS:

Algorithm:

Given an integer, number
If number is greater than or equal to 9_876_543_201
  Return "There is no possible number that fulfills those requirements"
Increment number to avoid returning the argument (feature number should be greater)
Iterate until number % 7 == 0 && number is odd
  number = number + 1
Iterate until the digits of number are unique
  number = number + 14
Return number

=end

def featured(number)
  if number >= 9_876_543_201
    return "There is no possible number that fulfills those requirements"
  end

  number += 1

  until number % 7 == 0 && number.odd?
    number += 1
  end

  until number.digits.uniq == number.digits
    number += 14
  end

  number
end

# LS solution
def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.chars
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_999_999_999
  end

  "There is no possible number that fulfills those requirements"
end

t = Time.now
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
p "Time: #{Time.now - t}"
# 17:02
# by finding the last featured number in IRB beforehand, my initial check speeds up
# the final test case by 2x (i think the `digits` method is faster than type conversion too
# and easier to read)
