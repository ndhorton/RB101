# Always Return Negative

# input: given a number
# output: if the number if positive, return the opposite number, else return the number

# def negative(n)
#   n > 0 ? -n : n
# end

# LS solution
def negative(number)
  -number.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby