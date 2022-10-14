# Fibonacci numbers (Procedural)

=begin
input: an integer n
ouput: the Fibonacci number at postition n in the sequence
goal: find a procedural way to calculate the nth Fibonacci number

algorithm:

given an integer n
if n < 1 # wrong, n < 2, see below
  return 0
set previous = 0
set latest = 1

for i from 1 to n # wrong, for i from 2 to n, otherwise previous becomes 1 on first iteration
  set buffer = latest
  set latest = previous + latest
  set previous = buffer

return latest

=end

# def fibonacci(n)
#   return n if n < 2
#   previous = 0
#   latest = 1
#   2.upto(n) do
#     buffer = latest
#     latest = latest + previous
#     previous = buffer
#   end
#   latest
# end

# LS solution
# not sure why array decomposition is used when not needed

# def fibonacci(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, first + last]
#   end

#   last
# end

def fibonacci(nth)
  first, last = 1, 1
  3.upto(nth) do
    first, last = last, first + last
  end

  last
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(6)
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
