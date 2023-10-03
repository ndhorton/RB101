# Word to Digit

=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
=end

=begin
Notes:

Problem:
input:
output:

Write a method that takes a string and returns the same string
with any sequence of the words for digits replaced with
digits

rules:
  assume 'the same string' means object identity? no

Examples and test cases:

Data structures:

need an array of digit words
need a hash to convert digit words to digits

Algorithm:
Define constant DIGIT_WORDS as array of digit words
Define constant DIGIT_MAP as a hash whose keys are
  digit words and whose values are the corresponding digits

Given a string, sentence
Iterate through each digit_word in DIGIT_WORDS
  Globally substitute DIGIT_MAP[digit_word] for digit_word in
    sentence
Return sentence
=end

DIGIT_WORDS = [
  'zero', 'one', 'two', 'three', 'four',
  'five', 'six', 'seven', 'eight', 'nine'
].freeze

DIGIT_MAP = DIGIT_WORDS.zip([*('0'..'9')]).to_h.freeze

def word_to_digit(sentence)
  DIGIT_MAP.each do |digit_word, digit|
    sentence = sentence.gsub(/\b#{digit_word}\b/, digit)
  end
  sentence
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# 14:41
