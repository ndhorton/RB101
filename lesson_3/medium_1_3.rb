# Bonus 1: The purpose of number % divisor == 0 here is to check
# which numbers divide the input number cleanly without remainder.
# When a division is found to yield no remainder, the division is
# performed and the quotient is pushed onto the factors array.

# Bonus 2: this is an implicit return

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors 0
p factors -9
p factors 99
p factors 1024