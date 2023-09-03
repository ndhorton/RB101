# Fibonacci Location by Length

=begin

Notes:

Math way to determin length:
  Take log_10 of number, l
  Floor(l), f
  f + 1

MATH WAY IS THE FASTER SOLUTION BY MILES
The type conversion way took 10.47 seconds overall on the given test cases
The math way took 0.04 seconds


Type conversion way:
  Convert number to string, s
  s.size()

questions:
  Should argument be checked? It says the arg will be greater than or equal to 2

Problem:
input: integer length in digits
output: index of first Fib with the given length

  Write a method that calculates and returns the index of the
  first Fibonacci number that has the number of digits given
  as an integer argument

rules:
  argument must be a positive integer

Examples:

DS:

Algorithm:

subprocess fib_length(fib)
  fib = log_10 of fib
  fib = floor(fib)
  fib = fib + 1
  Return fib

find_fibonacci_by_length(len)
  Set fib1 := 1
  Set fib2 := 1
  Set index := 2
  Iterate
    index = index + 1
    Set temp := fib1
    fib1 = fib2
    fib2 = fib2 + temp
    If fib_length(fib2) == len
      Return index  
=end

def fibonacci_length(fib)
  Math.log10(fib).floor + 1
end

def find_fibonacci_index_by_length(len)
  index = 2
  fib1 = 1
  fib2 = 1
  loop do
    index += 1
    fib1, fib2 = fib2, fib1 + fib2
    return index if fibonacci_length(fib2) >= len
  end
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
# 21:50
