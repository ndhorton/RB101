# Reversed Arrays

=begin

Notes:

0 1 2 3 4 5

6 / 2 = 3 (integer division)

sizeof(array) - 1 - 0
"" - 1 = -2

0 1 2 3 4

5 / 2 = 2 (int div)



So if you iterate up to but not including
  index (size of array / 2)
That should cover the left hand of the swap


questions:

Problem:
input: an array
output: the same array but mutated

  Write a method that destructively reverses the order of elements
  in the array passed as argument and also returns a reference
  to the array argument

rules
  as well as mutating array argument, must also return reference to argument
  empty input array, should still be empty
  odd and even length arrays must be dealt with

Examples:

DS:

Algorithm:

Given an array, list
Set midpoint := size of list / 2
Set index := 0
Iterate while index is less than midpoint
  Swap element at index with element at list size - 1 - index
Return reference to arr

=end

def reverse!(list)
  (0...list.size/2).each do |index|
    list[index], list[list.size - 1 - index] =
      list[list.size - 1 - index], list[index]
  end
  list
end

# LS solution

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] =
      array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

# 12:52
