# Word to Digit (without Regex)

=begin
Notes:

Problem:
input:
output:

rules:

Examples and test cases:

Data structures:

Algorithm:
define constant DIGIT_WORDS =  { 'zero', 'one', ... , 'nine' }
define constant DIGIT_MAP = hash mapping each digit word to '0', '1', ..., '9'

Given a string, sentence
Iterate through each char in sentence
  if char is a lowercase letter AND 
        (buffer is empty OR buffer[-1] is a lowercase letter)
      append char to buffer
    else if char is a lowercase letter
      push buffer to chunks
      buffer = char
    else if buffer is not empty and buffer[-1] is a lowercase letter AND buffer is in DIGIT_WORDS
        append DIGIT_MAP[buffer] to chunks
        buffer = char
    else
      append char to buffer
if buffer is in DIGIT_WORDS
  append DIGIT_MAP[buffer] to chunks
else
 append buffer to chunks
join chunks to a single string
return joined string
=end

DIGIT_WORDS = %w(zero one two three four five six seven eight nine).freeze

DIGIT_MAP = DIGIT_WORDS.zip([*('0'..'9')]).to_h.freeze

LOWERCASE_LETTERS = ('a'..'z').freeze

def word_to_digit(sentence)
  buffer = ''
  chunks = []
  sentence.each_char do |char|
    if LOWERCASE_LETTERS.cover?(char) &&
       (buffer.empty? || LOWERCASE_LETTERS.cover?(buffer[-1]))
      buffer << char
    elsif LOWERCASE_LETTERS.cover?(char)
      chunks << buffer
      buffer = char
    elsif !buffer.empty? && LOWERCASE_LETTERS.cover?(buffer[-1]) &&
          DIGIT_WORDS.include?(buffer)
      chunks << DIGIT_MAP[buffer]
      buffer = char
    else
      buffer << char
    end
  end
  if DIGIT_WORDS.include?(buffer)
    chunks << DIGIT_MAP[buffer]
  else
    chunks << buffer
  end
  chunks.join
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
