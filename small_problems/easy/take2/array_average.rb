# Array Average

=begin

constraint: do not use array.sum (and presumably not reduce(&:+))
  instead use more imperative iteration

input: an array of integers
output: a mean average of the integers using integer division with no remainder

Given an array of integers, numbers
Set total := 0
Iterate over each number in numbers
  total = total + number
Set integer_mean := truncate(total / numbers.size)
Return integer_mean

=end

# def average(numbers)
#   total = 0

#   numbers.each { |number| total += number }

#   total / numbers.size
# end

# LS solution DOES use reduce

# def average(numbers)
#   sum = numbers.reduce { |sum, number| sum + number }
#   sum / numbers.count
# end

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# Further explorations (float division)

def average(numbers)
  numbers.reduce(:+).fdiv(numbers.size)
end

p average([100, 5, 32]) # => 45.6 recurring