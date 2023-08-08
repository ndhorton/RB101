# Convert a Number to a String

=begin

Notes:

questions:

Problem:
input: integer
output: string

  Write a method that that converts an integer to a
  string representation of that integer

rules:
  cannot use to_s, String(), format, etc
  must be able to convert 0
  if the break condition is number == 0
    must use do/while loop structure

Examples:

5000
5000 % 10 = 0
divide by 10
500 % 10 = 0
divide by 10
50 % 10 = 0
div by 10
5 % 10 = 5
div by 10
number = 0, stop iterating

Take the base10 log
Floor function on log
Add 1
To get the number of digits

DS:

Hash map from integer to string version

or simply add 48 and call #chr

Algorithm:

Create hash mapping integer digits to string char representations

Given an integer, number
Set string_number := empty string
Iterate
  Set digit := number % 10
  number = number / 10
  Map number through hash and append to string_number
Until number == 0
Return string_number
=end

# DIGITS = [*(0..9)].zip([*('0'..'9')]).to_h

# def integer_to_string(number)
#   string_number = ''
#   loop do
#     digit = number % 10
#     number /= 10
#     string_number.prepend(DIGITS[digit])
#     break if number == 0
#   end
#   string_number
# end

DIGITS = [*('0'..'9')]

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# 13:11 - briefly thought about the order of insertion of digit into
#         string_number but got distracted and ended up using << concatenation
#         which reversed the number

# interesting point that most mutating method ending with ! have a
# non-mutating version (in Ruby core/stdlib)
# so prepend has no ! because it has no non-mutating form
