# Convert a String to a Signed Number!

# input: a string of digits that might be preceeded with a sign
# output: the integer representation of the input string
# goal: if there is a sign, split it off, convert the number,
# multiply the number by -1 if sign == '-'

# Given a string, string
# If first char of string not a digit
#   Split the string into the first char, sign, and the rest, string
# Set number := string_to_integer(digit_string)
# If sign == '-'
#   number *= -1
# Return number


def string_to_integer(string)
  string.chars.reduce(0) { |sum, char| sum * 10 + (char.ord - 48) }
end

def string_to_signed_integer(string)
  # sign = (string[0] == '-' ? '-' : '+')

  # string = string[1..-1] unless ('0'..'9').cover?(string[0])

  if ('0'..'9').cover?(string[0])
    sign = '+'
  else
    sign, string = string[0], string[1..-1]
  end

  number = string_to_integer(string)
  number *= -1 if sign == '-'
  
  number
end

# Maybe simpler to think of the sign as a boolean 'negative: yes or no?'

def string_to_signed_integer(string)
  negative = (string[0] == '-')
  string = string[1..-1] unless ('0'..'9').cover?(string[0])

  number = string_to_integer(string)

  negative ? -number : number
end

# LS solution

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

# student solutions - Darragh O'Carroll, Samuel Chan

def string_to_signed_integer(string)
  number = string_to_integer(string.delete('+-'))
  string.start_with?('-') ? -number : number
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100