# Reversed Arrays (Part 1)

=begin
Notes:

one approach:
iterate for 0 upto (array size / 2) exclusive
i = 0
j = array size - 1
i++
j--

Problem:
input: an array
output: the same array object

  Write a method that destuctively mutates a given array in-place so that
  the elements are placed in reverse order

rules:
  must handle situation where array size is one or array is empty 

Examples and test cases:

1 2 3 4
size = 4
5 / 2 intdiv = 2
iterate 0 1 swapping with 2 3

a b e d c
0 1 2 3 4, size = 5, 5 / 2 intdiv = 2

Data structures:

Algorithm:
Given an array, array
Set midpoint := size of array / 2 (integer division)
Set up_counter := 0
Set down_counter := size of array - 1
Iterate while up_counter < midpoint
  Swap array[up_counter] with array[down_counter]
  up_counter = up_counter + 1
  down_counter = down_counter - 1
Return array
=end

def reverse!(array)
  midpoint = array.size / 2
  up_counter = 0
  down_counter = array.size - 1
  loop do
    break unless up_counter < midpoint
    array[up_counter], array[down_counter] = array[down_counter], array[up_counter]
    up_counter += 1
    down_counter -= 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

# 10:28
