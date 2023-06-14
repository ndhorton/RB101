# Word to Digit

=begin

Thoughts:
sentence = string with words

gsub with an array of digit words which map to the integer indexes
the integer indexes must be converted to strings somehow

Problem:

write a method that takes a string representing a sentence but whose
words are not guaranteed to be space-seperated
the method should return the same string with any word-digits like 'four'
converted to digits like '4'

questions:
should the returned string be a new object? i assume so

Examples:
The example demonstrates that the word-digits are simply replaced
by character-digits

DS:
Done in place in the string

Algorithm:

Given a string, sentence
Set digit_words := array of string words for digits from 'zero' to 'nine' matching indexes
Iterate over each word in digit_words
  Globally substitute index of current word ### Fuzziness: important to keep in mind which collection
                                            ### we are looking in for the index
   ... in string format for current word
Return reference to argument string

=end

def word_to_digit(sentence)
  digit_words = [
    'zero', 'one', 'two', 'three', 'four',
    'five', 'six', 'seven', 'eight', 'nine'
  ]

  digit_words.each_with_index do |word, index|
    sentence.gsub!(word, index.to_s)
  end
  sentence
end

# LS Hint 2 - The advantage of this regex is that it checks for word boundaries
# so that e.g. 'eight' in 'freight' will not be converted to 'fr8'
# word boundaries are defined as alternation between non-word and word chars
# word chars are alphanumerics and underscore
def word_to_digit(sentence)
  digit_words = %w(zero one two three four five six seven eight nine)

  digit_words.each_with_index do |word, index|
    sentence.gsub!(/\b#{word}\b/, index.to_s)
  end
  sentence
end

# LS solution - uses hash where key and value are strings
# which makes a lot of sense in avoiding index retrieval and potential TypeErrors
DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}
def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

# Further explorations
# account for uppercase and capitalized words
def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/i, DIGIT_HASH[word])
  end
  words
end

# Further further exploration
def contains_number?(word)
  DIGIT_HASH.keys.each do |digit_word|
    return true if word.match?(/\b#{digit_word}\b/)
  end
  false
end

def convert_phone_numbers(sentence)
  phone_numbers = sentence.scan(/\d{10}/).map do |number|
    "(#{number[0, 3]}) #{number[3, 3]}-#{number[6..-1]}"
  end
  phone_numbers.each { |number| sentence.sub!(/\d{10}/, number) }
  sentence
end

def collapse_word_to_digit(sentence)
  words = sentence.scan(/\S+\s*/)
  words.each_with_index do |word, index|
    DIGIT_HASH.each do |digit_word, digit|
      next unless word.match?(/#{digit_word}/)
      if words[index + 1] &&
        contains_number?(words[index + 1])
        digit_regex = /\b#{digit_word}\s*/
      else
        digit_regex = /\b#{digit_word}\b/
      end
      word.sub!(digit_regex, digit)
    end
  end
  convert_phone_numbers(words.join)
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

p word_to_digit('Please call me at Five five FIVE one two thrEe four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

p collapse_word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5551234. Thanks.'

p collapse_word_to_digit('Please 8 0 8 call me at five five five eight zero nine seven eight nine one, ok?' \
  ' Otherwise you can call me on six nine six two zero five one one two nine. Thanks. 9 1 1 ')
# 17:46
# got an error when i ran it because i was searching in `sentence` for the index of `word`
# instead of searching `digit_words`
# Should have spent a little time making clear the mechanism for transliteration between
# digits and words using the array before coding
# Thinking about it, you could refactor using `each_with_index` to have the
# index on hand, though still need to convert to string

=begin
Further exploration

hello, my number is five five five nine zero nine 

=end