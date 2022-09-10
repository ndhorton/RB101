# Get the Middle Character

# input: a non-empty string
# output: a string with either the middle character if input string is odd, or the
# middle two characters if the string is even
# The problem states the string will not be empty



# algorithm:
# START
# -given a non-empty string, text
# -if the length of the string is even
# --return the characters from the length / 2 -1 up to length / 2
# -else
# --return the character from the length / 2
# -end if
# END

def center_of(text)
  str_len = text.length
  if str_len.even?
    text[str_len / 2 - 1, 2]
  else
    text[str_len / 2]
  end
end

# LS solution
# def center_of(string)
#   center_index = string.size / 2
#   if string.size.odd?
#     string[center_index]
#   else
#     string[center_index - 1, 2]
#   end
# end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'