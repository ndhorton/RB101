#  Combine Two Lists

# input: two arrays, arr1 and arr2
# output: a new array with alternating elements from arr1 and arr2
# beginning with the first element of arr1, then first element of arr2 ...

# Given two arrays, arr1 and arr2
# Set combined_arr := empty array
# Iterate with index from 0 to arr1.size -1
#   Append arr1[index] to combined_arr
#   Append arr2[index] to combined_arr
# Return combined_arr

def interleave(arr1, arr2)
  combined_arr = []
  
  index = 0
  loop do
    break if index >= arr1.size
    combined_arr << arr1[index]
    combined_arr << arr2[index]
    index += 1
  end
  
  combined_arr
end

# LS solution
def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

# Further explorations
def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

