# Fibonacci Number Location By Length

# def fibonacci(n)
#   return n if n < 2
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

# def fibonacci(n)
#   fibonacci_number = 1
#   last_fibonacci_number = 0
#   2.upto(n) do |_|
#     temp = fibonacci_number
#     fibonacci_number += last_fibonacci_number
#     last_fibonacci_number = temp
#   end

#   fibonacci_number
# end

# def fibonacci(n)
#   fib = 1
#   last_fib = 0
#   index = 2
#   while index <= n
#     new_last_fib = fib
#     fib = fib + last_fib
#     last_fib = new_last_fib
#     index += 1
#   end
#   fib
# end

# input: digit_length, integer number of digits in a fibonacci number
# ouput: the index (starting at 1) of the first fibonacci number with digit_length digits

# goal: iterate through fibonacci numbers checking length;
# return first number where length == digit_length

# given an integer, length_in_digits
# if length_in_digits < 2
#   return 1
# set fibonacci := 1
# set last_fibonacci := 0
# index := 2
# iterate until fibonacci_length_reached?(fibonacci, length_in_digits)
#   set new_last_fibonnaci := fibonacci
#   fibonacci = fibonnaci + last_fibonacci
#   last_fibonacci = new_last_fibonacci
#   index += 1
# return index

def fibonacci_length_reached?(fibonacci, fibonacci_length)
  Math.log10(fibonacci).floor + 1 == fibonacci_length
end

def find_fibonacci_index_by_length(length_in_digits)
  fibonacci = 1
  last_fibonacci = 0

  index = 1
  until fibonacci_length_reached?(fibonacci, length_in_digits)
    new_last_fibonacci = fibonacci
    fibonacci += last_fibonacci
    last_fibonacci = new_last_fibonacci

    index += 1
  end

  index
end

def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
