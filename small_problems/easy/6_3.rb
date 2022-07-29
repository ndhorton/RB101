# input: an integer representing number of digits
# output: the first Fibonacci number with that number of digits.

# easiest to loop until the size check succeeds?
# so:
# fib1 = 1
# fib2 = 2
# do
#   fib1, fib2 = fib2, fib1 + fib2
# loop until fib2.digits == length


def find_fibonacci_index_by_length(len)
  return 1 if len < 2
  fib1 = 1
  fib2 = 1
  index = 2
  until (Math.log10(fib2) + 1).truncate >= len
    fib1, fib2 = fib2, fib1 + fib2
    index += 1
  end
  index
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
