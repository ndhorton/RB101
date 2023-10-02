# Rotation (Part 3)

=begin
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.
=end

=begin
Notes:

Problem:
input: an integer
output: another integer

Write a method that takes a number and performs
maximum rotation on its digits

rules:
  you do not have to handle multiple 0 digits

Examples and test cases:

7 3 5 2 9 1, n = number_of_digits in number - 0
3 5 2 9 1 7, n = "" - 1
3 2 9 1 7 5, n = "" - 2
3 2 1 7 5 9, "" - 3
3 2 1 5 9 7, "" - 4
3 2 1 5 7 9

n in (number of digits down to number of digits - (2 less than number of digits))

rotate number_of_digits - 1 times
count from 0 to number_of_digits - 1, exclusive

Data structures:

Algorithm:
subprocess rotate_array (given)
subprocess rotate_rightmost_digits (given)
subprocess max_rotation
Given an integer, number
Set number_of_digits := find number of digits
Iterate for n from 0 upto number_of_digits - 1, exclusive
  number = rotate_rightmost_digits(number, number_of_digits - n)
Return number
=end

def max_rotation(number)
  number_of_digits = number.to_s.size
  (0...number_of_digits - 1).each do |n|
    number = rotate_rightmost_digits(number, number_of_digits - n)
  end
  number
end

def max_rotation(number)
  number_of_digits = number.to_s.size
  number_of_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end


def rotate_array(array)
  return [] if array.empty?
  array[1..-1] + [ array[0] ]
end

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# 22:00
