# How Long Are You?

# input: a string
# output: an array with each word from input string with a space
# and the number of characters in the original word appended to it

# An empty string should return an empty array

# Given a string, string
# Set words := split(string, ' ')
# Set words_with_count := empty array
# Iterate over each word in words
#   Append to word space and char count
#   Push word to words_with_count
# Return words_with_count

# Given a string, string
# Split string on whitespace to return array of words
# Transform words array such that 
#   each word is replaced with the word + space + char count
# Return transformed array

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.size}" }
end

# LS solution

def word_lengths(string)
  words = string.split

  words.map do |word|
    word + ' ' + word.length.to_s
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
