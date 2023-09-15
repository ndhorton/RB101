# Merge Sorted Lists

=begin

Notes:

questions:

Problem:
input:
output:

  Write a merge function that takes two sorted arrays and
  returns a new array with the elements from both input arrays
  in sorted order

rules:
  must not sort after merging but during merge
  must not mutate input arrays
  one or other input array might be empty

Examples:

1 5 9
2 6 8

1 2 5 6 8

<< 9

array1 size = 3
array2 size = 3
l = array1 index = 0
r = array2 index = 0
We will iterate until either l == size of array1 or r == size of array2
We compare array1[l] to array2[r] and whichever is lesser is added to output array,
with a default if the elements are equal

After this, whichever array index is still less than the size of the array,
copy that array's remaining elements to the output array  

DS:

Algorithm:
Given two arrays, array1 and array2
Set index1 := 0
Set index2 := 0
Set result := an empty array
Iterate while index1 < size of array1 AND index2 < size of array2
  Compare array1[index1] to array2[index2]
  If array1[index1] <= array2[index2]
    Copy array1[index1] to result array
    Increment index1
  Else
    Copy array2[index2] to result array
    Increment index2
If index1 < size of array1
  Copy remaining elements
Else if index2 < size of array2
  Copy remaining elements
Return result
=end

def merge(array1, array2)
  index1 = 0
  index2 = 0
  result = []
  loop do
    break if index1 >= array1.size || index2 >= array2.size
    if array1[index1] <= array2[index2]
      result << array1[index1]
      index1 += 1
    else
      result << array2[index2]
      index2 += 1
    end
  end

  if index1 < array1.size
    loop do
      break if index1 >= array1.size
      result << array1[index1]
      index1 += 1
    end
  elsif index2 < array2.size
    loop do
      break if index2 >= array2.size
      result << array2[index2]
      index2 += 1
    end
  end

  result
end

# refactor
def merge(array1, array2)
  index1 = 0
  index2 = 0

  result = []
  loop do
    break unless index1 < array1.size && index2 < array2.size
    if array1[index1] < array2[index2]
      result << array1[index1]
      index1 += 1
    else
      result << array2[index2]
      index2 += 1
    end
  end

  if index1 < array1.size
    result.concat(array1[index1..-1])
  else
    result.concat(array2[index2..-1])
  end

  result
end

# LS solution
def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
# 19:08
