# Sum of Sums

=begin
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.
=end

=begin
Notes:

subsequence_sum = 0
within loop
subsequence_sum += current_number
total += subsequence_sum

subsequence_sum += 5
subsequence_sum += 2



Problem:
input: an array of numbers
output: a number

Write a method that takes an array of numbers and
sums the sums of every leading subsequence in the array

rules:
  assume the input array contains at least one number

Examples and test cases:

3 5 2
3     +
3+5   +
3+5+2  = (3) + (3+5) + (3+5+2) = 21

Data structures:

Algorithm:
Given an array, numbers
Set subsequence_sum := 0
Set total := 0
Iterate over each number in numbers
  subsequence_sum = subsequence_sum + number
  total = total + subsequence_sum
Return total
=end

def sum_of_sums(numbers)
  subsequence_sum = 0
  numbers.reduce(0) do |total, number|
    subsequence_sum += number
    total + subsequence_sum
  end
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# 7:59
