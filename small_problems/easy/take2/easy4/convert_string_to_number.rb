# Convert a String to a Number!

# input: string of digits
# output: integer version of that digit-string

# ascii numerics start at 48 - '0'

# goal: iterate over characters using ascii value to build integer;
# use multiplication by 10 and addition of each digit value

# Given a string, digit_string
# Set number := 0
# Iterate over each char in digit_string
#   Set digit := ascii value of char
#   number *= 10
#   number += digit
# Return number

# def string_to_integer(digit_string)
#   digit_string.chars.reduce(0) do |sum, char|
#     sum * 10 + (char.ord - 48)
#   end
# end

# def string_to_integer(digit_string)
#   number = 0
#   digit_string.each_char do |char|
#     digit = char.ord - 48
#     number *= 10
#     number += digit
#   end
#   number
# end

# LS solution

# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# DIGITS = [*'0'..'9'].zip([*0..9]).to_h

# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }
  
#   value = 0

#   digits.each { |digit| value = 10 * value + digit }
#   value
# end

# Further explorations

HEX_DIGITS = ([*'0'..'9'] + [*'A'..'F']).zip(([*0..9] + [*10..15])).to_h
p HEX_DIGITS
def hexadecimal_to_integer(string)
  hex_digits = string.upcase.chars.map { |char| HEX_DIGITS[char] }

  hex_digits.reduce(0) { |sum, digit| sum * 16 + digit }
end

def hexadecimal_to_integer(string)
  string.upcase.chars.reduce(0) do |sum, char| 
    char_value = char.ord

    digit = case char_value
            when (48..57)
              char_value - 48
            when (65..70)
              char_value - 65 + 10
            end

    sum * 16 + digit
  end
end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

# So the hash option seems better for the hexadecimal conversion

p hexadecimal_to_integer('4D9f') #== 19871