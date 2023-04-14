# Get middle character

# input: non-empty string
# output:
#   if string length is odd: middle character
#   if string length is even: middle two characters

# 'hello' = 5, so middle char is index 2, which is integer division of 5 by 2
# 'bemuse' = 6, so middle two chars are indices 2, 3. this is length / 2 - 1 and length / 2

# goal: slice(length / 2) OR slice(length / 2 - 1, 1)

# Given a string, str
# strlen = str length
# midpoint = strlen / 2 (int division)
# if strlen is even
#   slice 2 characters from index midpoint - 1
# else
#   slice 1 character at midpoint index
# end if

def center_of(str)
  strlen = str.length
  midpoint = strlen / 2
  str.slice( *(strlen.even? ? [midpoint-1, 2] : midpoint) )
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
