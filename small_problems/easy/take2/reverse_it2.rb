# Reverse It (Part 2)

# input: a string containing one or more alphabetic-character 'words',
# separated by a single space if ther is more than one.
# output: a copy of the string in which the characters of any word whose size is >= 5
# characters are reversed

# Given a string, text
# Set words = split text into array on whitespace
# Iterate over each word in words
#   If word length >= 5
#     reverse word
# Return words joined to string around a single space

def reverse_words(text)
  text.split.map { |word| (word.size >= 5) ? word.reverse : word }.join(' ')
end

# LS solution

def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS