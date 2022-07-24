# def integer_to_string(num)
#   digits = Array('0'..'9')
  
#   num_arr = []
#   loop do
#     current_digit = num % 10
#     num /= 10
#     num_arr << current_digit
#     break if num <= 0
#   end
  
#   num_arr.reverse!
#   num_string = ''
#   num_arr.each do |digit|
#     num_string += digits[digit]
#   end

#   num_string
# end

def integer_to_string(num)
  digits = Array('0'..'9')

  num_string = ''
  loop do
    current_digit = num % 10
    num /= 10
    num_string.prepend(digits[current_digit])
    break if num <= 0
  end

  num_string
end

# LS solution
# DIGITS = Array('0'..'9')

# def integer_to_string(number)
#   result = ''
#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(DIGITS[remainder])
#     break if number == 0
#   end
#   result
# end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# input: an integer
# output: a string representation of that integer

# Cannot use to_s, String(), format, etc

# need to take one digit at a time and add to an array
# until the remaining sum is 0
# then contstruct a string with hash lookup for digits 0-9

# algo:
# - Given a number
# - Set a hash = 0 => '0', 1 => '1' etc
# - set a string var = empty
# - set remaining = number
# - set array var = empty
# - while remaining is not zero
# -- set current_digit = remaining % 10
# -- set remaining = remaining / 10
# -- push current_digit to array
# - reverse order of array
# - for each digit in array,
# -- set string = string + hash lookup for digit
# - return string

