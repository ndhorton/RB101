# Sum Square - Square Sum

=begin
P:
seems like in isolation either would be easy to do with recursion
but because there are two distinct processes that then another
operation it seems harder
also it might be slow using recursion
A:
given an integer, n
return nil if n < 1
sum := 0
for number from 1 to n inclusive
  sum = sum + number
sum_square := sum**2
square_sum := 0
for number from 1 to n inclusive
  square_sum := sum + number**2
return sum_square - square_sum
=end

def sum_square_difference(n)
  return nil if n < 1
  
  sum = 0
  1.upto(n) do |number|
    sum += number
  end
  sum_square = sum ** 2

  square_sum = 0
  1.upto(n) do |number|
    square_sum += number ** 2
  end

  sum_square - square_sum
end

# LS solution
# combines them in one loop
def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0

  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end

  sum**2 - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150