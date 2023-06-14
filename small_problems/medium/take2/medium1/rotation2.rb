# Rotation (Part 2)

=begin
Thoughts:
use the rotate_array method
implies using string conversion and then array conversion
slicing
front = [0, digits.size - n]

Problem:
input: an integer
output: an integer whose last n digits have been rotated

rotate here means that the front digit in the digit substring
has been moved to the back of the substring (and therefore in this
case the back of the whole digit string)

n is always positive integer -> what happens if n is greater than
number of digits?

goal:
convert integer to string
convert string to array
pass a slice of the array to the rotate_array method
save the return value as rotated_subarray
return rest of the array concatenated to rotated_subarray

Questions:

what happens if n is greater than
number of digits?

DS:
integer -> string -> array -> string -> integer
since we are using the rotate_array method, do the
  conversions in the rotate_rightmost_digits method

Algorithm:

Given an integer, number, and another integer, n
Set digits := convert number to string, then to array of chars
Set front := slice (size of digits - n) characters from digits starting at 0
Set last_n := slice from (size of digits - n) to (size of digits - 1) of digits
Set rotated_last_n := rotate(last_n)
Set rotated_number := concatenate front and rotated_last_n
rotated_number = convert rotated number to string and then integer
Return rotated_number

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  front = digits.slice(0, digits.size - n)
  last_n = digits.slice((digits.size - n)..(digits.size - 1))
  rotated_number = front + rotate_array(last_n)
  rotated_number.join.to_i
end

# LS solution
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1]) # uses range-indexed assignment
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
