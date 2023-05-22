# Double Doubles

# input: an integer, number
# output: twice the input integer unless the input number is a double number
# double number has the same digits, in the same order, as the first half of
# its digits and the second
# e.g. 4141

# convert number to string
# the string must be even in character count
# first half indexes: [0...string.size/2)
# second half indexes: [string.size/2..-1]
# must be the same

# edge case for single-digit numbers

# Given an integer, number
# Set number_str := String(number)
# If number_string.size() % 2 == 0
# AND number_string[0...number_string.size()/2] == number_string[number_string.size()/2..-1]
#   Return number
# Else
#   Return number * 2

def twice(number)
  number_string = number.to_s
  if number_string[0...number_string.size/2] == # the exclusive range here takes
    number_string[number_string.size/2..]       # care of the single-digit edge case
    number                                      # string[0...0] returns an empty string
  else
    number * 2
  end
end

# LS solution
def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
