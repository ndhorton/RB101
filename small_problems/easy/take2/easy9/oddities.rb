# Odd Lists

# input: an array
# output: a new array with the elements from the input array at even indexes

# Given an array
# Select each element from array whose index is even

def oddities(array)
  array.select.with_index { |element, index| index.even? }
end

# LS solution
def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

# Further exploration

def evenities(array)
  even_elements = []
  index = 1
  while index < array.size
    even_elements << array[index]
    index += 2
  end
  even_elements
end

def oddities(array)
  odd_elements = []
  0.step(array.size - 1, 2) do |index|
    odd_elements << array[index]
  end
  odd_elements
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
