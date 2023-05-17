# Swap Case

# input: a string
# output: a new string with the value of the input except all
# lowercase letters are now uppercase and vice versa

# Given a string, string
# Set swapped_string = empty string
# Iterate counter from 0 to string length - 1
#   if string[counter] is in the range 'a' to 'z'
#     swapped_string << toupper(string[counter])
#   else if string[counter] is in the range 'A' to 'Z'
#     swapped_string << tolower(string[counter])
#   else
#     swapped_string << string[counter]
# Return swapped_string

def swapcase(string)
  swapped_string = ''

  counter = 0
  loop do
    break if counter >= string.length

    if ('a'..'z').cover?(string[counter])
      swapped_string << string[counter].upcase
    elsif ('A'..'Z').cover?(string[counter])
      swapped_string << string[counter].downcase
    else
      swapped_string << string[counter]
    end

    counter += 1
  end

  swapped_string
end

# LS solution
def swapcase(string)
  characters = string.chars.map do |char|
    if /[a-z]/ =~ char
      char.upcase
    elsif
      /[A-Z]/ =~ char
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
