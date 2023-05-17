# Sum of Sums

# input: an array
# output: the sum of the sums of all leading subsequences
# a leading subsequence includes the first element
# so [1, 2, 3] -> (1) + (1 + 2) + (1 + 2 + 3)

# Given an array
# Set sum := 0
# Iterate end_index for [0 : array.size - 1]
#   Set sub_sum := 0
#   Iterate each element in array from 0 to end_index
#     sub_sum += element
#   sum += sub_sum
# Return sum

def sum_of_sums(array)
  total_sum = 0
  array.each_index do |end_index|
    total_sum += array[0..end_index].sum
  end
  total_sum
end

# LS solution

def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num       # each element is added once to ACC
    sum_total += accumulator # but first element is added array.size times to SUM,
  end                        # second element array.size-1 times, etc.

  sum_total
end

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
