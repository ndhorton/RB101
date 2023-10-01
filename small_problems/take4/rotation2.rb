# Rotation (Part 2)

=begin
Write a method that can rotate the last n digits of a number
Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.
=end

=begin
Notes:

Problem:
input: an integer, number, and an integer, n
output: an integer

Write a method that can rotate the last n digits of a number

rules:

Examples and test cases:

7 3 5 2 9 1, n = 3
      _
7 3 5 9 1 2
          _
Data structures:

Need to convert integer to array of digits

Algorithm:
Given an integer, number and an integer n,
Set digits := Convert number to String
              Split string into array of character-strings
Pass digits from index digits size - n to digits size - 1 to rotate_array and save in-place
Concatenate elements from digits to a single String
Convert string to integer
Return new number
=end

def rotate_array(array)
  return [] if array.empty?
  array[1..-1] + [ array[0] ]
end

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# 9:07
