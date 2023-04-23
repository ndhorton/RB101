# Always Return Negative

def negative(number)
  number > 0 ? -number : number
end

def negative(number)
  -number.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby