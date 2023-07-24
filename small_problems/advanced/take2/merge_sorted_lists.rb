# Merge Sorted Lists

=begin

Notes:
questions:
sort order ascending, descending? (ascending)
need to validate? (no, too expensive)
should both argument arrays being empty return a new empty array? yes

you will need to keep track of the indexes of the input arrays and
increment each only when an element is copied to the output array
There must be a check in place to prevent out-of-bounds access

vars:
array1, array2
index1, index2 initialized to 0

while index1 < array1.size && index2 < array2.size
{ 
  if array2[index2] smaller than array1[index1]
    copy element from array2 to output array
    increment index2
  else
    copy element from array1 to output array
    increment index1
  
}

if array1.empty? && array2.size >= 1
  { copy all remaining elements from array2 }
elsif array2.empty? && array1.size >= 1
  { copy all remaining elements from array1}

Problem:
input: two sorted arrays
output: a new array containing all elements from original in correct sort order

  Write a method that takes two sorted arrays and returns a new array
  with all elements from the inputs in sorted order

rules:
  do not mutate input arrays
  do not sort the new array; it must be built in correct order,
    one element at a time
  method must still work if one or other argument array is empty

Examples:



DS:

Algorithm:

Given two sorted arrays, array1 and array2
Set index1 := 0
Set index2 := 0
Set merged_array := empty array
Iterate while index1 < array1 size AND index2 < array2 size
  If the element at index2 of array2 is smaller than element at index1 of array1
    Non-destructively append element at index2 of array2 to merged_array
    Increment index2
  else
    Non-destructively append element at index1 of array1 to merged_array
    Increment index1

If index1 >= array1 size
  Append remaining elements from array2 into merged_array
Else if index2 >= array2 size
  Append remaining elements from array1 into merged_array

Return merged_array

=end

def merge(array1, array2)
  merged_array = []
  index1 = 0
  index2 = 0

  loop do
    break unless index1 < array1.size && index2 < array2.size
    if array2[index2] < array1[index1]
      merged_array << array2[index2]
      index2 += 1
    else
      merged_array << array1[index1]
      index1 += 1
    end
  end

  if index1 >= array1.size
    merged_array.concat(array2[index2..-1])
  elsif index2 >= array2.size
    merged_array.concat(array1[index1..-1])
  end
  
  merged_array
end

# LS Solution
def merge(array1, array2)
  result = []
  index2 = 0

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

arr1 = [1, 3, 5]
arr2 = [2, 4, 6]

p merge([], [])
p merge(arr1, arr2)
p arr1
p arr2

# 27:24
