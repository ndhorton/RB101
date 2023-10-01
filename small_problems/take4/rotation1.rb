# Rotation (Part 1)

=begin
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.
=end

=begin
Notes:

Problem:
input: an array
output: a new array

Write a method that rotates an array
left 1 element

rules:
  cannot use Array#rotate or #rotate!
  do not mutate argument
  do I need to handle empty array? not in examples

Examples and test cases:

1 2 3 4
2 3 4 1

Data structures:

Algorithm:
Given an array, array
Set result := empty array
Iterate for index from 1 upto array size, exclusive
  Append array[index] to result
Append first element of array to result
Return result
=end

def rotate_array(array)
  result = []
  (1...array.size).each { |index| result << array[index] }
  result << array.first unless array.empty?
  result
end

def rotate_array(array)
  return [] if array.empty?
  array[1..-1] + [ array[0] ]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# 9:31
