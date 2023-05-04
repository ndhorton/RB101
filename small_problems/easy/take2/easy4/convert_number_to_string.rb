# Convert a Number to a String!

# input: a non-negative integer
# output: a string representation of the number

# special case: you cannot take log10 of 0
  # and if you use 0 as the signal to stop iterating
  # this will cause problems if the number is 0 or
  # the last digit is zero
  # BUT ONLY if you don't start with the lowest order
  # digit.
  # So if you do 
  #   number % 10 to get the lowest order digit
  #   number /= 10 to remove it from the number
  #   then when number == 0 it really will mean it's done
  # However in both cases you will have to check for 0
  # at the start and return '0' if it is so

# Given a non-negative integer, number
# If number is zero
#   Return '0'
# End if
# Set digits := empty array
# While number > 0
#   Set digit := number % 10 to obtain the last digit
#   number /= 10
#   Set char := ascii(digit + 48)
#   Append char to digits
# Reverse digits array
# Set digit_string := join(digits)
# Return digit_string

def integer_to_string(integer)
  return '0' if integer == 0

  digit_string = ''

  while integer > 0
    digit = integer % 10
    integer /= 10
    digit_string.prepend((digit + 48).chr)
  end

  digit_string
end

# LS solution
# important to note here that by using, essentially, a do/while loop
# this solution works for a `0` input without an initial check and special return

DIGITS =  [*'0'..'9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end



p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

