# Fibonacci Numbers (recursion)

=begin
P: 
input: an integer n
ouput: the Fibonnaci number at n in the sequence (Where F(1) = 1 etc)

algorithm:
-given an integer n

-if n < 2  <- This
  return n <- would make more sense in relation to math definition i think (F(0))

-if n <= 2 <-  This
  return 1 <-  would make more sense in relation to problem description itself

-end if
-return F(n-1) + F(n-2)

=end

# def fibonacci(n)
#   return n if n < 2

#   fibonacci(n - 1) + fibonacci(n - 2)
# end

# # LS solution

# def fibonacci(nth)
#   return 1 if nth <= 2

#   fibonacci(nth - 1) + fibonacci(nth - 2)
# end

=begin

-given an integer n
-if n < 2
--return n
-set sum = nil
-set this_fib = 1
-set previous_fib = 0
-for i from 2 to n
--sum = previous_fib + this_fib
--set previous_fib = this_fib
--set this_fib = sum
-end loop
-return this_fib
=end

# procedural fib

# def fibonacci(n)
#   return n if n < 2

#   this_fib = 1
#   previous_fib = 0

#   2.upto(n) do |_|
#     sum = this_fib + previous_fib
#     previous_fib = this_fib
#     this_fib = sum
#   end
1
#   this_fib
# end

# LS tail recursion

# def fibonacci_tail(nth, acc1, acc2)
#   if nth == 1
#     acc1
#   elsif nth == 2
#     acc2
#   else
#     fibonacci_tail(nth -1, acc2, acc2 + acc1)
#   end
# end


# def fibonacci(nth)
#   fibonacci_tail(nth, 1, 1)
# end

# More tail recursion

def fibonacci(n, acc1 = 1, acc2 = 1)
  if n == 0
    0
  elsif n == 1
    1
  elsif n == 2
    acc2
  else
    fibonacci(n - 1, acc2, acc2 + acc1)
  end
end

p fibonacci(0)
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(50)