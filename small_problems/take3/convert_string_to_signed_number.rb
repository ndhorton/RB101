# Convert a String to a Signed Number!

=begin

Notes:

Need to check if there is a leading sign
Set sign := no value
If there is:
  sign = first index of string
  Set string := slice string from index 1 onwards

Set result := return from previous method
If sign is equal to '-'
  result = result * -1

  Return result

questions:
  do i need to validate argument? no
  am i permitted to use the String#ord method? yes

Problem:
input: a string of digits, possibly with sign
output: the integer representation of the input

  Write a method that takes a String of digits with or
  without a leading sign and returns the integer representation
  of the input string.

rules:
  the input string may or may not have a leading sign
  if there is no sign the integer returned should be positive
  do not use standard conversion methods
  you can use previous exercises solution method

Examples:

DS:

Algorithm:
Given a string, decimal_string
Set sign := no value
If first index reference of decimal_string is a '+' or '-'
  sign = first index of decimal_string
  decimal_string = remaining string after the first char

Set result := string_to_integer(decimal_string)
If sign == '-'
  result = result * -1
Return result

=end

def string_to_integer(decimal_string)
  decimal_string.chars.reduce(0) do |result, char|
    digit_value = char.ord - 48
    result *= 10
    result += digit_value
  end
end

def string_to_signed_integer(decimal_string)
  sign = nil
  if ['-', '+'].include?(decimal_string[0])
    sign = decimal_string[0]
    decimal_string = decimal_string[1..-1]
  end

  result = string_to_integer(decimal_string)
  result *= -1 if sign == '-'

  result
end 

# LS solution
def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# 16:54
