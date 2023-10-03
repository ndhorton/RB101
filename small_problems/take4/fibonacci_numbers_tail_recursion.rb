# Fibonacci Numbers (Tail Recursion)

=begin
F(4) -> FT(3, 1, 1)
F(3) -> FT(3, 1, 2)
FT(2, 2, 3) -> 3

=end

def fibonacci_tail(nth, last, current)
  return current if nth <= 2
  fibonacci_tail(nth - 1, current, current + last)
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
