# Rotation (Part 2)

=begin

Notes:

questions:
  is the other argument a positive integer? Yes
  should i check arguments? No

Problem:
input: an integer, number, an integer, n
output: a rotated array

  Write a method that rotates the last n digits of an integer

rules:
  n is always a positive integer

Examples:

7 3 5 2 9 1
7 3 2 9 1 5

DS:

Algorithm:

Given an integer, number, and an integer, n
Set characters := convert integer to string and string to array of character strings
Set rotated_elements := rotate_array(slice characters from index -n to -1)
Set result := concatenate characters from 0 up to not including -n with rotated_elements
Join elements of result as string
Convert result to integer
Return result

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  rotated_elements = rotate_array(digits[-n..-1])
  result = digits[0...-n] + rotated_elements
  result.join.to_i
end

def digit_split(number)
  result = []
  while number > 0
    number, digit = number.divmod(10)
    result.unshift(digit)
  end
  result
end

# 1 2 3 4
# % 10 to the ... 1 more than place value being isolated
# / 10 to the ... place value being isolated

# 1234 % (10 ** (4)) = 1234
# 1234 / (10 ** (above - 1)) = 1

# 1234 % (10 ** 3) = 234
# 234 / (10 ** 2) = 2

# 1234 % (10 ** 2) = 34
# 34 / (10 ** 1) = 3

# 1234 % (10 ** 1) = 4
# 4 / (10 ** 0) = 4

def digit_split(number)
  number_of_digits = Math.log10(number).floor + 1

  result = []
  number_of_digits.downto(1) do |exponent|
    digit = number % 10 ** exponent / 10 ** (exponent - 1)
    exponent -= 1
    result << digit
  end
  result
end

def digit_join(array)
  array.reduce(0) do |sum, digit|
    sum *= 10
    sum + digit
  end
end

def rotate_rightmost_digits(number, n)
  digit_arr = digit_split(number)
  digit_arr = digit_arr[0...-n] + rotate_array(digit_arr[-n..-1])
  digit_join(digit_arr)
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# 12:14
