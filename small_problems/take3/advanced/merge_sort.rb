# Merge Sort

=begin

Notes:

questions:
should the method return a new array or mutate its argument?

Problem:
input: an array
output: 

  Write a method that implements merge sort

rules:
  elements to be sorted are comparable

Examples:

DS:

if size of array is < 2
  return array

[ 4, 2, 1, 3]
calculate halfway
pass slice from 0...midpoint to merge_sort
pass slice from midpoint to last index to merge_sort


Algorithm:

subprocess merge(array1, array2)
array1 and array2 must be sorted
returns a new sorted array with all elements from both args

Given an unsorted array, array
If array size < 2
  Return array
Set midpoint := array size / 2
Set array1 := slice from index 0 to midpoint exclusive and pass slice to merge_sort
Set array2 := slice from index midpoint to last index and pass slice to merge_sort
Return merge(array1, array2)
=end

def merge_sort!(array)
  return array if array.size == 1

  midpoint = array.size / 2

  sub_array1 = merge_sort(array[0...midpoint])
  sub_array2 = merge_sort(array[midpoint..-1])

  array.replace(merge(sub_array1, sub_array2))
end

def merge_sort(array)
  return array if array.size == 1

  midpoint = array.size / 2

  sub_array1 = merge_sort(array[0...midpoint])
  sub_array2 = merge_sort(array[midpoint..-1])

  merge(sub_array1, sub_array2)
end

def iterative_merge_sort(array)
  groups = array.map { |element| [element] }
  while groups.size > 1
    groups[0..1] = [ merge(groups[0], groups[1]) ]
  end
  groups.first
end


def iterative_merge_sort(array)
  groups = array.map { |element| [element] }
  while groups.size > 1
    i = 1
    new_groups = []
    while i < groups.size
      new_groups << merge(groups[i - 1], groups[i])
      i += 2
    end
    new_groups[-1] = merge(new_groups[-1], groups[-1]) if groups.size.odd?
    groups = new_groups
  end
  groups.first
end

def merge(array1, array2)
  index1 = 0
  index2 = 0

  result = []
  while index1 < array1.size && index2 < array2.size
    if array1[index1] <= array2[index2]
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
end

p iterative_merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# 20:19
