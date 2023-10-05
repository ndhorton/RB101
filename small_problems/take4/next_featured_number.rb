# Next Featured Number Higher than a Given Value

=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.
=end

=begin
Notes:

Problem:
input: an integer
output: an integer

Write a method that takes an integer and returns the
next 'featured number' greater in value than argument
if it exists, otherwise return error message.

rules:
  a featured number is:
  - odd
  - a multiple of 7
  - has unique digits
  error message:
  - "There is no possible number that fulfills those requirements"
  last 'featured number' is 9876543201

Examples and test cases:

Data structures:

Algorithm:
Given an integer, number
Increment number by 1
If number > 9876543201
  Return "There is no possible number that fulfills those requirements"
Iterate while number % 7 != 0 && number not odd
  number = number + 1
Iterate while number's digits are not unique
  number = number + 14
Return number
=end

def featured(number)
  number += 1
  if number > 9876543201
    return "There is no possible number that fulfills those requirements"
  end

  number += 1 until number % 7 == 0 && number.odd?
  loop do
    number_digits = number.digits
    break if number_digits.uniq == number_digits
    number += 14
  end
  number
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# forgot to add 1 initially to make sure I didn't return the argument
