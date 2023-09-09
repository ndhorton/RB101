# Fibonacci Numbers (Procedural)

=begin

Notes:

questions:
Should I check argument?

Problem:
input: an integer nth
output: the Fibonacci number at index nth

  Write a procedural method that calculates the nth Fibonacci
  number

rules:
  must be procedural rather than recursive
  nth must be a positive integer

Examples:

DS:

Algorithm:
Given an integer nth
Set acc1 := 1
Set acc2 := 1
Iterate from 3 to nth, index
  acc1, acc2 = acc2, acc1 + acc2
Return acc2
=end

def fibonacci(nth)
  acc1 = 1
  acc2 = 1
  3.upto(nth) { acc1, acc2 = acc2, acc1 + acc2 }
  acc2
end

# LS solution
def fibonacci(nth)
  first, last = [1, 1] # array constructor seems redundant
  3.upto(nth) do
    first, last = [last, first + last] # array constructor seems redundant
  end

  last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

# 7:30
