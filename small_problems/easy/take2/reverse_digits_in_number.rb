# Reverse the Digits in a Number

# input: intger
# output: integer whose digits are the same as input integer but in reverse
  
# Given an integer, x
# Set y, reversed := 0
# Set number_of_digits := ceiling(log10(x))
# Iterate number_of_digits times
#   x, y = divmod(x, 10)
#   reversed *= 10
#   reversed += y
# Return reversed


def reversed_number(x)
  y = 0
  reversed = 0
  number_of_digits = Math.log10(x).floor + 1 # `floor + 1`` works where `log10(1) => 0.0`
  number_of_digits.times do |_|              # whereas `ceil` will give you `0` in that case
    x, y = x.divmod(10)
    reversed *= 10
    reversed += y
  end
  reversed
end

# def reversed_number(x)
#   x.to_s.reverse.to_i
# end

# def reversed_number(x)
#   reversed = 0
#   digs = x.digits
#   while digs.any?
#     reversed *= 10
#     reversed += digs.shift
#   end
#   reversed
# end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1