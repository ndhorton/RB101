# Sum of sums

# input: an array of numbers
# output: a number whose value is derived from adding the sum of the first number (identical to
# the first number itself of course) to the sum of the first number + second number and adding
# that to the sum of the first number + the second + the third, and so on

# the array will always have at least one number

# algo:
# -given an array of numbers, sequence
# -set total_sum = 0
# -set counter = 1
# -loop with break condition counter > size of sequence
# --slice sequence from index 0 for as many terms as indicated by counter
# --total_sum += the sum of the numbers in that slice
# --increment counter
# -return total_sum

def sum_of_sums(sequence)
  total_sum = 0
  counter = 1

  until counter > sequence.size
    total_sum += sequence[0, counter].sum
    counter += 1
  end

  total_sum
end

# LS solutions

# def sum_of_sums(numbers)
#   sum_total = 0
#   accumulator = 0

#   numbers.each do |num|
#     accumulator += num
#     sum_total += accumulator
#   end

#   sum_total
# end

# def sum_of_sums(numbers)
#   sum_total = 0

#   1.upto(numbers.size) do |count|
#     sum_total += numbers.slice(0, count).reduce(:+)
#   end

#   sum_total
# end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35