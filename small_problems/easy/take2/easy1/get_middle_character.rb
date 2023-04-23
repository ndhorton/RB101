# Get Middle Character

# input: non-empty string
# output: for odd-length string, middle char; even-length -> middle two chars
#
# Odd
# 'I love ruby' == 'e' == index 5 of 10 == (string.size - 1) / 2
# but it's integer math so just string.size / 2
# Even
# 'Launch' == 'un' == indexes 2, 3  == (string.size / 2 - 1) and 1 after

# Given a non-empty string, str
# Set str_size := len(str)
# If str_size is even
#   Return slice(str, str_size / 2 - 1, 2)
# Else
#   Return slice(str, str_size / 2)

def center_of(str)
  str.size.even? ? str[str.size / 2 - 1, 2] : str[str.size / 2]
end

# LS solution easier to read
def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'