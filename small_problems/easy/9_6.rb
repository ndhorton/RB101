# How long are you?

=begin
P-------
input: a string
output: an array of the words from the input string with a space and the number of chars
in the word appended to each word
goal: break the string into words, append to each word " #{size of word}"

implicit: an empty string should return an empty array
a string with one word should still have the number of chars appended after a space

A-------
-given a string
-split string on spaces and assign the resulting array of substrings to a var
-iterate over each word in words array
-append to each word a space and the integer representation of its char count
-return array

=end

def word_lengths(text)
  text.split.map { |word| "#{word} #{word.length}" }
end

# LS solution

def word_lengths(text)
  words = text.split

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