# Leading Substrings

# input: a string
# output: an array containing all leading substrings (substrings
# starting at index 0) from the input string, arranged in order
# of length

# 'string' -> %w(s st str stri strin string)

# Given a string
# Set substrings = empty array
# Iterate for each i from 0 exclusive upto string.size
#   Push to substrings the string sliced from 0 to i
# Return substrings

def leading_substrings(string)
  substrings = []
  string.size.times { |end_index| substrings << string[0..end_index] }
  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
p leading_substrings('')
