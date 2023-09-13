# Bubble Sort

=begin

Notes:

questions:

Problem:
input:
output:

  Write a method that takes an array as argument and sorts
  the array using bubble-sort in-place

rules:
  mutate the argument
  array will contain at least two elements

Examples:

6 2 7 1 4
first pass:  2 6 1 4 7 last is sorted
second pass: 2 1 4 6 7 last 2 are sorted
third pass:  1 2 4 6 7 swaps occurred, now sorted
fourth pass: 1 2 4 6 7 no swaps, return

7 6 5 4 3 2 i
6 5 4 3 2 7 ii
5 4 3 2 6 7 iii
4 3 2 5 6 7 iv
3 2 4 5 6 7 v
2 3 4 5 6 7 vi


DS:

Algorithm:

Given an array, array
Iterate array size times
  Set swaps := false
  Iterate for 1 through array size - 1, index
    if array at index is less than array at index - 1
      swap array elements
      swaps = true
  if swaps == false
    return
=end

def bubble_sort!(array)
  array.size.times do
    swaps = false
    (1...array.size).each do |index|
      if array[index] < array[index - 1]
        array[index], array[index - 1] = array[index - 1], array[index]
        swaps = true
      end
    end
    return unless swaps
  end
end

# LS solution
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

# with first optimization
def bubble_sort!(array)
  array.size.times do |offset|
    swaps = false
    (1...array.size - offset).each do |index|
      next if array[index] >= array[index - 1]
      array[index], array[index - 1] = array[index - 1], array[index]
      swaps = true
    end
    return unless swaps
  end
end

# with futher optimization
def bubble_sort!(array)
  n = array.size
  loop do
    new_n = 0
    (1...n).each do |index|
      next if array[index] > array[index - 1]
      array[index], array[index - 1] = array[index - 1], array[index]
      swaps = true
      new_n = index
    end
    n = new_n
    break if n <= 1
  end
end

# 15:09

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
