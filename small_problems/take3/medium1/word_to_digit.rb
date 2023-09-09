# Word to Digit

=begin

Notes:

questions:
does 'returns the same string' mean
a destructive action and return a reference to the mutated argument
return a new string with the same value except for modifications? <-

does exact whitespace need to be preserved or can i assume single space
separators? <- assume single space

Are the digit-words to be replaced always in lowercase? No

Problem:
input: string, sentence
output: new string with same value except all sequences of number words are digit strings

  Write a method that takes a string and returns a new string with the same value
  but all number words have been replaced by digits

rules:
  return a new string, do not mutate argument
  words are separated by a single space, digits also in the new string

Examples:

DS:

create an array of the digit words from 'zero' to 'nine'
this effectively creates a simple map between index (digit) and element (digit-word)

Algorithm:
Given a string, sentence
Set digit_map_lower := an array of lowercase digit-words from 'zero' to 'nine'
Set digit_map_capital := same but capitalized
Set new_sentence := sentence
Iterate over each word in digit_map_lower
  new_sentence = globally substitute each word in new_sentence with a string version of its index
Iterate over each word in digit_map_capital
  new_sentence = globally substitute each word in new_sentence with a string version of its index
Join processed_words into a new string with single-space separator
Return new_sentence

Further exploration
===================
Given a string, sentence
Iterate over each digit-word in a list of digit-words
  Substitute actual digit for current digit-word in sentence
Substitute for a digit followed by a space only the digit unless the space
  seperates the digit from a character that is not a digit
Return sentence

=end

DIGIT_MAP = (
  [
    'zero', 'one', 'two', 'three', 'four',
    'five', 'six', 'seven', 'eight', 'nine'
  ] + 
  [
    'Zero', 'One', 'Two', 'Three', 'Four',
    'Five', 'Six', 'Seven', 'Eight', 'Nine'
  ]
).zip([*('0'..'9')] + [*('0'..'9')]).to_h.freeze

def word_to_digit(sentence)
  new_sentence = sentence
  DIGIT_MAP.keys.each do |word|
    new_sentence = new_sentence.gsub(word, DIGIT_MAP[word])
  end

  new_sentence
end

# destructive version
def word_to_digit(sentence)
  DIGIT_MAP.keys.each do |word|
    sentence.gsub!(/\b#{word}\b/, DIGIT_MAP[word])
  end
  sentence
end

# LS solution
DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# 28:17 - I took completely the wrong course and split the sentence into words and forgot
#         that some of the digit-words might be connected directly with '.' or '?' etc
#         This means either a character-by-character stream processing with buffer
#         or regex. The fastest way to fix this was with two version of the digit-word array
#         one capitalized words, one lowercase. Probably better to refactor using a hash

# I have refactored using a hash, the Algorithm section still reflects the twin arrays approach
# Lmao it appears 'returns the same string' means mutate argument and return a reference to the mutated 
# argument

# Further explorations - the until-but-not-including regex syntax from Tim Pietzcker on StackOverflow
def word_to_digit(sentence)
  DIGIT_MAP.keys.each do |word|
    sentence.gsub!(/\b#{word}\b/, DIGIT_MAP[word])
  end
  sentence.gsub!(/(\d)( )(?![^\d])/, '\1\3')
  sentence
end
p word_to_digit('Please call me at five five five one two three four as soon as possible. Thanks.')
