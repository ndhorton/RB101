# Rotation (Part 1)

=begin
input: an array
output: a new array whose elements are rotated so that
  the first element of the input array is now the last element

[0, 1, 2, 3, 4]
[1, 2, 3, 4, 0]

first = array.first
rotated_array = array.slice(1, array.size - 1)

loop 
build array element by element from index 1 through last
then append the first element


Make a copy of an array where the first element has been
removed and placed at the end

questions:
it doesn't say what would happen with an empty array

Given an array, array
Set rotated := empty array
Set first := array[0]
Iterate for index from 1 to array.size
  append to rotated array[index]
If first has a value
  append first to rotated
Return rotated

=end

def rotate_array(array)
  rotated = []
  first = array.first

  1.upto(array.size - 1) { |index| rotated << array[index] }

  rotated << first if first
  rotated
end


def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_string(string)
  rotate_array(string)
end

def rotate_integer(integer)
  digits = integer.to_s.chars
  rotate_array(digits).join.to_i
end

def rotate_integer(integer)
  number_of_digits = Math.log10(integer).floor + 1
  first_digit = integer / ( 10 ** (number_of_digits - 1))
  remaining_digits = integer % (10 ** (number_of_digits - 1))
  remaining_digits * 10 + first_digit
end
  

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

p rotate_string('hello')

p rotate_integer(1234)