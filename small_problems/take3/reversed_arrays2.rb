# Reversed Arrays (Part 2)

=begin

Notes:

questions:

Problem:
input: an array
output: a new, reversed array

  Write a method that takes an array and returns a new array
  whose elements are the elements from the caller in reverse
  order

rules:
  do not mutate argument
  empty array argument returns empty new array

Examples:

DS:

Algorithm:

Given an array, array
Set new_array := empty array
Iterate over each element in array
  Prepend element to new_array
Return new_array

=end

def reverse(array)
  array.each_with_object([]) do |element, new_array|
    new_array.unshift(element)
  end
end

# LS solution
def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

def reverse(array)
  array.reduce([]) { |new_array, element| new_array.unshift(element) }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# 4:02
