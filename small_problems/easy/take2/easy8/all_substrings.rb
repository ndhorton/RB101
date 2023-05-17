# All Substrings

# input: a string
# output: a list of all substrings of input string in order of starting index,
# then by order of length of substrings starting from each position

# Given a string
# Set substrings := empty array
# Iterate for each index in string
#   substrings.push(leading_substrings(string.slice(index..string.size - 1)))
# Flatten substrings
# Return substrings

def leading_substrings(string)
  substrings = []
  string.size.times { |end_index| substrings << string[0..end_index] }
  substrings
end

def substrings(string)
  substrings = []
  string.size.times do |start_index|
    substrings << leading_substrings(string[start_index..])
  end
  substrings.flatten
end

# LS solution

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

def substrings(string)
  substrings = []
  string.size.times do |start_index|
    substrings.concat(leading_substrings(string[start_index..]))
  end
  substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
