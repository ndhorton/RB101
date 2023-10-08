# Merge Sorted Lists

=begin

Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

=end

=begin

Notes:

Problem:
input: two arrays
output: one new merged array

Write a method that merges two sorted arrays
in sort order. Return as a new array.

rules:
  do not mutate input arrays
  do not use library sort methods
  the arrays may not be the same size
  one array could be empty

Examples / test cases:

1 5 9    2 6 8
1 2 5 6 8 9

Data Structures:

Algorithm:
Given two arrays, array1, array2
Set result := empty array
Set index2 := 0
Iterate through each element1 in array1
  Iterate while array2[index2] is in bounds AND
    array2[index2] <= element1
    Push array2[index2] to result
    index = index + 1
  Push element1 to result
Copy remaining elements from array2 to back of result
Return result
=end

def merge(array1, array2)
  result = []
  index2 = 0
  array1.each do |element1|
    while index2 < array2.size &&
        array2[index2] <= element1
      result << array2[index2]
      index2 += 1
    end
    result << element1
  end
  result.concat(array2[index2..-1]) unless index2 >= array2.size
  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# 13:59
