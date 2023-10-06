# Bubble Sort

=begin
A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.
We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.
Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.
=end

=begin
Notes:

Problem:
input: an array
output: sort array in place, no significant return

Write a method that performs bubble sort in-place on the array
given as argument.

rules:
  sort in-place
  use bubble sort algorithm
  assume array contains at least 2 elements

Examples and test cases:

   6 2 7 1 4
1) 2 6 1 4 7 - so you only need to check array[0..-2]
2) 2 1 4 6 7 - next time only array[0..-3]
3) 1 2 4 6 7 - next time only array[0..-4]
4) 1 2 4 6 7 - no swaps, return

   5 4 3 2 1 0 - check array[0..array size - 1]
1) 4 3 2 1 0 5 - next time check array[0..-2]
2) 3 2 1 0 4 5 - next time check array[0..-3]
3) 2 1 0 3 4 5 - next time check array[0..-4]
4) 1 0 2 3 4 5 - [0..-5]
5) 0 1 2 3 4 5 - done

   5 4 3 2 1
   
   4 3 2 1 5
   3 2 1 4 5
   2 1 3 4 5
   1 2 3 4 5

so you have to do at most array size - 1 passes
first time array range [0..array size - 1]
next time array range [0..array size - 2] etc

Data structures:

Algorithm:
Given an array, array
Iterate for offset from 1 to array size - 1
  Set swaps := 0
  Iterate for index from 1 to array size - offset
    if array[index - 1] > array[index]
      Set temp := array[index - 1]
      array[index - 1] = array[index]
      array[index] = temp
      swaps += 1
  if swaps == 0
    break from iteration
Return
=end

def bubble_sort!(array)
  1.upto(array.size - 1) do |offset|
    swaps = false
    1.upto(array.size - offset) do |index|
      if array[index - 1] > array[index]
        array[index - 1], array[index] = array[index], array[index - 1]
        swaps = true
      end
    end
    break unless swaps
  end
end


# optimization
def bubble_sort!(array)
  limit = array.size
  loop do
    new_limit = 0
    1.upto(limit - 1) do |index|
      if array[index - 1] > array[index]
        array[index - 1], array[index] = array[index], array[index - 1]
        new_limit = index
      end
    end
    limit = new_limit
    break if limit <= 1
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

# 21:16
