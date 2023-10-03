# Fibonacci Numbers (Procedural)

=begin
every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.
=end

=begin
Notes:

Problem:
input:
output:

Write a non-recursive Fibonacci method

rules:
  must be efficient enought to handle 100_101
  cannot use any form of recursion

Examples and test cases:

F(1) = 1
F(2) = 1
F(3) = 1 + 1

Data structures:

Algorithm:
Given an integer, nth
Set last := 1
Set current := 1
Iterate for index from 3 upto nth inclusive
  current = current + last
  last = current - last
Return current
=end

def fibonacci(nth)
  last = 1
  current = 1
  3.upto(nth) do |_index|
    current = current + last
    last = current - last
  end
  current
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

# 7:39