# Bubble Sort

=begin

Thoughts:

swaps = sentinel value
n = 0
Iterate until no more swaps
  swaps = 0
  Iterate through each a and b in for array.size - n
    if a > b
      a, b = b, a
      swaps += 1
  n += 1

(0...upper_bound-1) and if upper_bound is less than 0 then an iterator won't iterate
minus 1 because you need to compare current i with i+1

Problem:

Write a bubble_sort! method that sorts in place using bubble sort

You may assume the array will have at least 2 elements

Examples:
given



DS:
given array

Algorithm:

Given an array
Set upper_bound := array.size()

Iterate
  Set swaps := false
  Iterate for i from 0 through upper_bound - 2
    if array[i] > array[i+1]
      Set temp := array[i]
      array[i+1] = array[i]
      array[i] = temp
      swaps = true
  upper_bound -= 1

  break if swaps == false

=end

def bubble_sort!(array)
  upper_bound = array.size
  loop do
    swaps = false

    (0...upper_bound-1).each do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swaps = true
      end
    end

    upper_bound -= 1
    break unless swaps
  end
end

# LS solution

def bubble_sort!(array)
  loop do
    swapped = false

    1.upto(array.size) do |index|
      next if array[index - 1] <= array[index]
      
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# 20:44
