# Odd

def is_odd?(integer)
  integer.abs % 2 == 1
end

# LS solution
# The meaning of the absolute value thing was that
# the modulo operator will always return a non-negative
# value if the right hand operand is positive (here 1)
# so it's just

def is_odd?(integer)
  integer % 2 == 1
end

# whereas remainder operations return a negative value if
# the left hand operand is negative

# Further explorations
# Here, however, if we need to use the `Integer#remainder` method,
# taking the absolute value is the easiest solution

def is_odd?(integer)
  integer.abs.remainder(2) == 1
end

# or without the method

def is_odd?(integer)
  if integer < 0
    -integer.remainder(2) == 1
  else
    integer.remainder(2) == 1
  end
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true