# Squaring an Argument

def multiply(a, b)
  a * b
end

def square(number)
  multiply(number, number)
end

# Further exploration

# Only works for integer exponents
# If exponent is positive, returns an Integer;
# if exponent if negative, returns a Rational
def power(base, exponent)
  power = 1
  
  (1..exponent.abs).each do |_|
    power = multiply(power, base)
  end
  
  if exponent < 0
    power = Rational(1, power)
  end

  power
end

p square(5) == 25
p square(-8) == 64

p power(2, 4)
p power(2, -4)
