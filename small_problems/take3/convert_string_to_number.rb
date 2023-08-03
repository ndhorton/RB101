# Convert String to Number

=begin

Notes:

you can use #ord to get the ASCII value
or a hash



questions:

Problem:
input: a numeric string
output: an integer with the same digits

  Write a method that takes a String of digits and returns
  the appropriate number as an Integer

rules:
  no leading sign
  assume all chars numeric

Examples:

4321
first char is '4'
map to 4
result_int *= 10
result_int += 4
4
second char is '3'
map to 3
result_int *= 10
40
result_int += 3
43
...


DS:

Algorithm:

Given a String of numeric digits, decimal_string
Set result := 0
Iterate over each char in decimal_string
  Set digit := map char to integer represented
  result = result * 10
  result = result + digit
Return result

=end

ASCII_TO_INTEGER = [*('0'..'9')].zip([*(0..9)]).to_h

def string_to_integer(decimal_string)
  decimal_string.chars.reduce(0) do |result, char|
    digit = ASCII_TO_INTEGER[char]
    result *= 10
    result += digit
  end
end

def string_to_integer(decimal_string)
  decimal_string.chars.reduce(0) do |acc, char|
    digit = char.ord - 48
    acc *= 10
    acc += digit
  end
end

# 14:54

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
