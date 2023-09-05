# Sum of Sums

=begin

Notes:

questions:

Problem:
input:
output:

  Write a method that takes and array and sums
  the sums of each leading subsequence

rules:
  array always contains at least one number

Examples:

3 5 2
= 3 + (3 + 5) + (3 + 5 + 2)

0..0, 0..1, 0..2 where max = array.size - 1

DS:

Algorithm:

Given an array, array
Set overall_sum := 0
Iterate for 1 through array size, slice_size
  Set current_subsequence := slice array starting at index 0, slice slice_size elements
  Reduce current_subsequence to sum and add to overall_sum
Return overall_sum

=end

def sum_of_sums(array)
  overall_sum = 0
  1.upto(array.size) do |slice_size|
    current_subsequence = array[0, slice_size]
    overall_sum += current_subsequence.sum
  end
  overall_sum
end

# LS solution
def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |number|
    accumulator += number
    sum_total += accumulator
  end

  sum_total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
