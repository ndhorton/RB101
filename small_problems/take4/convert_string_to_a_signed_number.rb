# Convert a String to a Signed Number!

=begin
In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

=end

=begin
Notes:

If digits[0] is '+'
  Remove first character
  Return string_to_integer(digits)
Else if digits[0] is '-'
  Remove first character
  Return -string_to_integer(digits)
Else
  Return string_to_digits(digits)

Problem:
input: a string
output: integer

Write a method that takes a string of digits possibly
prepended by a sign, and returns a positive or negative
integer representation of that number.

rules:
  If there is no sign, the number should be positive

Examples and test cases:

Data structures:

Algorithm:
subprocess string_to_integer (given)

subprocess string_to_signed_integer
Given a string, digits
If digits[0] is '+'
  Remove first character
  Return string_to_integer(digits)
Else if digits[0] is '-'
  Remove first character
  Return -string_to_integer(digits)
Return string_to_digits(digits)
=end

DIGIT_MAP = [*('0'..'9')].zip([*(0..9)]).to_h.freeze

def string_to_signed_integer(digits)
  case digits[0]
  when '+' then string_to_integer(digits[1..-1])
  when '-' then -string_to_integer(digits[1..-1])
  else
    string_to_integer(digits)
  end
end

def string_to_integer(digits)
  digits.chars.reduce(0) do |result, digit|
    numeric_digit = DIGIT_MAP[digit]
    result *= 10
    result + numeric_digit
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# 9:52
