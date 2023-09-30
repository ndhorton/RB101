# Convert a Signed Number to a String!

=begin
In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.
=end

=begin
Notes:

Problem:
input: any integer
output: a string representation of input including sign

Write a method that takes any integer as input
and returns a string representation including sign
unless 0

rules:
  if number is 0 -> '0'
  if number is positive prepend '+'
  if number is negative prepend '-'

Examples and test cases:

Data structures:

Algorithm:
subprocess integer_to_string given

subprocess signed_integer_to_string
Given an integer, number
If number > 0
  Return '+' concatenated to integer_to_string(number)
Else if number < 0
  Return '-' concatenated to integer_to_string(-number)
Else
  Return '0'
=end

DIGIT_MAP = [*(0..9)].zip([*('0'..'9')]).to_h.freeze

def signed_integer_to_string(number)
  if number > 0
    '+' + integer_to_string(number)
  elsif number < 0
    '-' + integer_to_string(-number)
  else
    '0'
  end
end

def integer_to_string(number)
  result = ''
  loop do
    number, digit = number.divmod(10)
    result.prepend(DIGIT_MAP[digit])
    break unless number > 0
  end
  result
end

def signed_integer_to_string(number)
  value = integer_to_string(number.abs)
  case number <=> 0
  when 1 then '+' + value
  when 0 then value
  when -1 then '-' + value
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# 10:39 - Fuzzy algorithm - integer_to_string() only defined
# for non-negative numbers so it is necessary to strip the negative
# from the number you pass in
