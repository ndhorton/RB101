# Reverse the Digits in a Number

# input: a positive integer
# output: the number that has the digits of the input integer in reverse order
# goal: convert input integer to string, reverse, convert back to integer and return it

# Given an integer, number
# Convert number to String object
# number = reverse(number)
# Convert number to Integer object
# Return number

def reversed_number(number)
  number.to_s.reverse.to_i
end

# Given an integer, number
# Set number_of_digits := floor(log10(number)) + 1
# Set modulo_exponent := number_of_digits
# Set digits_array := empty array
# Iterate number_of_digits times
#   Append to digits_array (number % (10 ** (modulo_exponent)) / (10 ** (modulo_exponent - 1)))
#   Decrement modulo_exponent
# Set reversed_number := 0
# Iterate over each digit in digits_array in reverse order
#   reversed_number *= 10
#   reversed_number += digit
# Return reversed_number

def reversed_number(number)
  number_of_digits = Math.log10(number).to_i + 1

  digits_array = []

  number_of_digits.downto(1) do |modulo_exponent|
    digits_array << (number % (10 ** modulo_exponent) / (10 ** (modulo_exponent - 1)))
  end

  reversed_number = 0

  digits_array.reverse_each do |digit|
    reversed_number *= 10
    reversed_number += digit
  end

  reversed_number
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1