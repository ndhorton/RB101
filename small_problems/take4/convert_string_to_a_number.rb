# Convert String to a Number!

=begin
The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.
=end

=begin
Notes:

Problem:
input: a string, digits
output: an integer

Write a method that takes a string of digits and returns an integer representation of the same number.

rules:
  cannot use String#to_i or Integer() methods
  assume all characters are Numeric

Examples and test cases:

4 3 2 1
result = 0
result = result + 1 * (10 ** 0)
result = result + 2 * (10 ** 1)
result = result + 3 * (10 ** 2)
result = result + 4 * (10 ** 3)

result = 0
result = result * 10
result = result + 4 # result == 4
result *= 10 # 40
result += 2  # 42
result *= 10 # 420
result += 3  # 432
result *= 10 # 4320
result += 1  # 4321

Data structures:

Create a constant hash, DIGIT_MAP
where each key is an ASCII digit and the associated value is the integer digit

Algorithm:
Constant DIGIT_MAP (hash)

Given a string, digits
Set result := 0
Iterate through each digit in digits
  Set numeric_digit := DIGIT_MAP[digit]
  result = result * 10
  result = result + numeric_digit
Return result
=end

DIGIT_MAP = [*('0'..'9')].zip([*(0..9)]).to_h.freeze

def string_to_integer(digits)
  digits.chars.reduce(0) do |result, digit|
    numeric_digit = DIGIT_MAP[digit]
    result *= 10
    result + numeric_digit
  end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# 15:36
