# The End is Near But Not Here

# def penultimate(string)
#   words = string.split
#   words[-2]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# Further exploration

# input: a string containing a sentence
# output: a new string containing the middle word of the input sentence

# edge cases:

# even-sized word arrays:
#   you would have to decide whether to return the two middle words or
#   pick left-middle or right-middle
#   Right-middle would be easiest since the math would be the same as
#   for odd-numbered lists of words

# an empty string: decide whether to return an empty string or nil
#   nil would be easiest since that is the default out-of-bounds element reference return

# Choosing to return an empty string for an empty string
# Choosing to return both middle words

# Given a string
# If string is empty
#   Return an empty string
# Set words := split(string)
# If len(words) is odd
#   Return words[len(words) / 2]
# Else
#   Return words[len(words) / 2 - 1, 2].join(' ')

def middle_word(string)
  return string if string.empty?
  words = string.split
  if words.size.odd?
    words[words.size / 2]
  else
    words[words.size / 2 - 1, 2].join(' ')
  end
end

p middle_word('')
p middle_word('the')
p middle_word('the quick brown fox')
p middle_word('jumped over the lazy dog')