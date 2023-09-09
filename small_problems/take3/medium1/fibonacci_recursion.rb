# Fibonacci Numbers (Recursion)

=begin

Notes:

questions:

Problem:
input: an integer nth
output: the Fibonacci number of index nth

  Write a recursive method to calculate the nth Fibonacci number
  where nth is given as an integer argument

rules:
  must use recursion

Examples:

F(4) = F(3) + F(2)
  F(3) = F(2) + F(1) = 1 + 1 (base case nth < 3 return 1)
  F(2) = 1
= 3

DS:

Algorithm:

subprocess fibonacci(nth)
Given an integer nth
If nth < 3
  Return 1
Return fibonacci(nth - 1) + fibonacci(nth - 2)
=end

def fibonacci(nth)
  return 1 if nth < 3
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

# Tail recursion version (note similarity to the iterative version, almost
# as though tail recursion uses function calls instead of a loop counter)
def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# 9:45
