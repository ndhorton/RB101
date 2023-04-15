# Reverse It (Part 1)

# input: a string, str, containing alphabet words seperated by one space
# output: return a string with the order of the words reversed (though not
# their characters)

# goal: split the string into words, join in reverse order around a single space

# The examples have suggested that words are all alphabetic characters seperated
# # by a single case. Is that a safe assumption?
# Actually, the test cases show that a string full of whitespace as input returns an empty
# string, therefore the quantity of whitespace is not preserved. So yes.

# Given a string, text
# Set words = split text on whitespace into an array of words
# reverse(words)
# Set reversed_words = join(words, ' ')
# Return reversed_words

def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
