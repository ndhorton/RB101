# Rotation (Part 1)

=begin

Notes:

option 1: slicing method

option 2: copy iteratively

questions:

Problem:
input: array
output: new array rotated by 1

  Write a method that rotates an array by moving the first element
  to the back of the array. Should be non-destructive, return new
  array

rules:
  don't mutate argument
  don't use Ruby library rotate methods

Examples:

DS:

Algorithm:

Given an array, array
Set result := empty array
Iterate over each element in array from second onwards
  Append element to result
Append first element from array to result
Return result

=end

def rotate_array(array)
  result = []
  (1...array.size).each do |index|
    result << array[index]
  end
  result << array.first
end

# LS solution
def rotate_array(array)
  array[1..-1] + [array[0]]
end

# Further exploration
def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  rotate_string(integer.to_s).to_i
end

def rotate_integer(integer)
  negative = integer < 0
  integer *= -1 if negative

  digits = []
  while integer > 0
    integer, digit = integer.divmod(10)
    digits.unshift(digit)
  end

  result = rotate_array(digits).reduce(0) do |sum, digit|
    sum *= 10
    sum + digit
  end

  result *= -1 if negative
  result
end

p rotate_string('hello')
p rotate_integer(-4321)

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# 5:34
