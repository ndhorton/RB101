# Fibonacci Number Location by Length

=begin
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

You may assume that the argument is always greater than or equal to 2.
=end


=begin
Notes:

Problem:
input: an integer
output: an integer index

Write a method that takes an integer argument, target_digits
and returns the index of the first Fibonacci number that has
target_digits digits. The first Fibonacci number is 1 - index 1
the second is 1 - index 2, the third 2 - index 3, etc...

rules:
  you may assume the argument is always >= 2

Examples and test cases:



Data structures:

Algorithm:
subprocess digit_count
Given an integer, number
If number == 0
  Return 1
Return floor( log_10( number ) ) + 1

subprocess find_fibonacci_index_by_length
Given an integer, target_digits (>= 2)
Set last := 1
Set current := 1
Set index := 2
Iterate
  current = current + last
  last = current - last
  index = index + 1
  If digit_count(current) == target_digits
    Return index
=end

def digit_count(number)
  return 1 if number == 0
  return nil if number < 0
  Math.log10(number).floor + 1
end

def find_fibonacci_index_by_length(target_digits)
  last = 1
  current = 1
  index = 2
  loop do
    current = current + last
    last = current - last
    index += 1
    return index if digit_count(current) == target_digits
  end
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# forgot to start timer, definitely less than 20 mins
