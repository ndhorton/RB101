# Reversed Arrays (Part 2)

# input: an array, array
# output: a new array whose elements are the elements of array in reverse order

# Given an array, array
# Set reversed_array := empty array
# Iterate over each element in array
#   Prepend element to reversed_array
# Return reversed_array

def reverse(array)
  array.each_with_object([]) do |element, reversed_array|
    reversed_array.unshift(element)
  end
end

def reverse(array)
  reversed_array = []
  array.reverse_each { |element| reversed_array << element }
  reversed_array
end

def reverse(array)
  reversed_array = []
  index = array.size - 1
  loop do
    break if index < 0
    reversed_array.append(array[index])
    index -= 1
  end
  reversed_array
end

def reverse(array)
  array.reduce([]) do |reversed_array, element|
    reversed_array.unshift(element)
  end
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
