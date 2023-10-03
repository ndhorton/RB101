# Fibonacci Numbers (Recursion)

=begin
Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.
=end

=begin
Notes:

Problem:
input: an integer
output: an integer

Write a method that uses recursion to calculate the nth
Fibonacci number, where nth is a given integer

rules:
  must use recursive call and base case

Examples and test cases:

F(3) = F(2) + F(1)
F(3) = 1 + 1 = 2

Data structures:

Algorithm:
Given an integer, nth
If nth < 3
  Return 1
Return fibonacci(nth - 1) + fibonacci(nth - 2)
=end

def fibonacci(nth)
  return 1 if nth < 3
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# 5:25
