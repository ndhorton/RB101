# Reverse It (Part 1)

# input: a string
# output: a new string with the words from the input string in reverse
# order

# edge cases:
# empty string returns empty string
# a string full of whitespace returns empty string
# seems ok to not preserve quantity or king of whitespace

# Given a string, sentence
# Set words := split(sentence, ' ')
# Reverse words array
# Set reverse_sentence := join words array around ' '
# Return reverse_sentence

def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
