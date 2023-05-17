# Reversed Arrays (Part 1)

# input: an array
# output: the same array object with its elements in reverse order

# [1, 2, 3, 4, 5]
# 0 <-> 4
# 1 <-> 3

# break if left_index == right_index

# half_way = 5 idiv 2 = 2

# [1, 2, 3, 4, 5, 6]

# half_way_rindex = 6 idiv 2 = 3

# Given an array, array
# Set left_index = 0
# Set right_index = max(array length - 1, 0)
# Iterate until left_index >= right_index
#   array[left_index], array[right_index] = array[right_index], array[left_index]
#   right_index -= 1
#   left_index += 1
# Return

def reverse!(array)
  left_index = 0
  right_index = array.size - 1
  loop do
    break if left_index >= right_index
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end
  array
end

# LS solution
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2 # middle index on odd-sized array, middle-right on even
    array[left_index], array[right_index] = array[right_index], array[left_index]
    right_index -= 1
    left_index += 1
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
