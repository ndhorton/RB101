# Merge Sort

=begin

Notes:
questions:
  should the array be sorted in place or should the methd return a new array?
    assume from the lack of `!` in the method example name that it returns a new
    array

Partition array into two arrays of half-ish sizes (one will be
bigger than the other if odd number of elements)

Recursive algorithm
----
base case: the array contains only one element
  return array
The next call up the stack receives a sorted array (of 1)


arr1 = merge_sort(first half array) -> [1] or another call to merge_sort ...
arr2 = merge_sort(first half array) -> [5] or another call to merg_sort ...

merge([1],[5]) -> [1, 5]


Will need merge method from last time

Given an unsorted array, array
Base case: array size is less than 2
  Return array (either a necessarily-sorted 1 or 0 element array)
Set first_half := merge_sort(slice(array, 0, (array size / 2)))
Set second_half := merge_sort(slice(array, (array size / 2), up to last element)
Return merge(first_half, second half)

Problem:
input: an unsorted array
output: a 

  Write a method that implements merge sort.

rules:
  assume all elements in argument array are comparable
  assume that the method returns a new array without mutating arg

Examples:

9 5 7 1

9 5     7 1

9   5    7    1

DS:

Algorithm:

Given an unsorted array, array
Base case: array size is less than 2
  Return array (either a necessarily-sorted 1 or 0 element array)
Set first_half := merge_sort(slice(array, 0, (array size / 2)))
Set second_half := merge_sort(slice(array, (array size / 2), up to last element)
Return merge(first_half, second half)

=end

def merge(arr1, arr2)
  # merge two sorted arrays in sort order
  index2 = 0
  merged_arr = []

  arr1.each do |element1|
    while index2 < arr2.size && arr2[index2] <= element1
      merged_arr << arr2[index2]
      index2 += 1
    end
    merged_arr << element1
  end

  while index2 < arr2.size
    merged_arr << arr2[index2]
    index2 += 1
  end

  merged_arr
end

def merge_sort(array)
  return array if array.size < 2

  first_half = merge_sort(array[0...array.size/2])
  second_half = merge_sort(array[array.size/2..-1])

  merge(first_half, second_half)
end

# 36:45 - spent nearly ten minutes debugging because I had forgotten to
#         append all remaining elements from `arr2` to the `merged_array`
#         in the `merge` method I wrote hastily from memory before starting the
#         problem. The `merge_sort` method itself, which I had worked through in
#         problem breakdown and pseudocode worked without modification once the
#         `merge` method was working. Importance of applying PEDAC.

# LS solution
def merge_sort(array)
  return array if array.size == 1

  sub_array1 = array[0...array.size/2]
  sub_array2 = array[array.size/2...array.size]

  sub_array1 = merge_sort(sub_array1)
  sub_array2 = merge_sort(sub_array2)
  
  merge(sub_array1, sub_array2)
end

# Further exploration
# Very hack-and-slash
def merge_sort(array)
  return array if array.size < 2
  array2d = array.map { |element| [element] }

  loop do
    merging_arr = []
    index = 1
    loop do
      break unless index < array2d.size
      merging_arr << merge(array2d[index], array2d[index - 1])
      index += 2
    end

    if array2d.size.odd?
      merging_arr[-1] = merge(merging_arr.last, array2d.last)
    end
    if merging_arr.size == 1
      break merging_arr.first
    else
      array2d = merging_arr unless merging_arr.empty?
    end
  end
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
