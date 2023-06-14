# Fibonacci Numbers (Procedural)

=begin

Thoughts:

What to do if the argument is not a positive integer?

This seems to call for the approach that starts at the base case
Fibonacci(1) = 1
Fibonacci(2) = 1
and successively adds the previous value to the value before that to give
Fibonacci(3) onwards

Problem:
  Write a method that calculates the Fibonacci number at the given integer
  index, where index 1 = 1, index 2 = 1, index 3 = 2, ... etc

Examples:

DS:
need two variables representing one-before-last and last Fibonacci numbers on each iteration
need a temporary variable to store sum of last and current on each iteration

Algorithm:
Given an integer nth
Set last := 1
Set current := 1
Set index := 3
Iterate until index > nth
  Set sum := last + current
  last = current
  current = sum
  index += 1
Return current
=end

def fibonacci(nth)
  last = 1
  current = 1
  index = 3
  loop do
    break if index > nth

    sum = last + current
    last = current
    current = sum

    index += 1
  end
  current
end

# LS solution

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) { first, last = [last, first + last] }

  last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501

# 13:11