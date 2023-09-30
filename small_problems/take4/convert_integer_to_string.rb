# Convert a Number to a String!

=begin
In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.
=end

=begin
Notes:

Problem:
input: a non-negative integer
output: a string representation of input number

Write a method that takes an integer and
returns a string representation of that integer

rules:
  cannot use any standard conversion methods
    e.g. format, to_s, String(), etc.

Examples and test cases:

4321
break into a digit Array
4 3 2 1
1

Data structures:

a hash where a single-digit integer maps to
  a single-character string

Algorithm:
Define constant DIGIT_MAP

Given an integer, number
Set result := empty string
# Set number_of_digits := floor(log10(number)) + 1
If number == 0
  result = '0'
Iterate while number > 0
  Set current_digit := number % 10
  number = number / 10
  Prepend DIGIT_MAP[current_digit] to result
Return result
=end

DIGIT_MAP = [*(0..9)].zip(*['0'..'9']).to_h.freeze

def integer_to_string(number)
  result = ''
  result = '0' if number == 0
  while number > 0
    current_digit = number % 10
    number /= 10
    result.prepend(DIGIT_MAP[current_digit])
  end
  result
end

# LS solution
def integer_to_string(number)
  result = ''
  loop do
    number, digit = number.divmod(10)
    result.prepend(DIGIT_MAP[digit])
    break unless number > 0
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# 14:27 - Fuzzy algorithm, the log10(x) function
# is not defined for x=0 so this is even
# more problematic than the simpler `while number > 0`
# way I ended up changing it to during
# implementation after running it for the first time
# LS solution solves it a lot more neatly
# using a do/while loop

