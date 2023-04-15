# Odd Lists

# input: an array
# output: a new array containing only those elements from the even indexes of the
# input array. An empty array as input returns an empty array.

# Given an array, list
# Set odd_list = empty array
# Iterate over each element in list with index
#   if index is even
#     append element to odd_list
# Return odd_list

# Concise
def oddities(list)
  list.select.with_index { |_, index| index.even? }
end

# Imperative
def oddities(list)
  odd_list = []
  index = 0

  while index < list.size
    odd_list << list[index] if index.even?
    index += 1
  end

  odd_list
end

# LS solution leverages knowing how to keep the indexes even to avoid
# branching
# I keep forgetting to do this
def oddities(array)
  odd_elements = []

  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end

  odd_elements
end

# Further explorations

def evenities(array)
  array.reject.with_index { |_, index| index.even? }
end

def evenities(array)
  return [] if array.size < 2
  array.slice((1..).step(2))
end

def oddities(array)
  array[(0..).step(2)]
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

p evenities([2, 3, 4, 5, 6]) 
p evenities([1, 2, 3, 4, 5, 6]) 
p evenities(['abc', 'def']) 
p evenities([123]) 
p evenities([]) 
p evenities([1, 2, 3, 4, 1])