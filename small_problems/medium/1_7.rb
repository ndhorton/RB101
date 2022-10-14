# Word to Digit

# input: given a string containing numbers in word form
# output: a new string with the input string value but all digit
# words converted to digits

# goal: split words into array and iterate through replacing digit-word
# elements with digit counterpart

# edge cases: punctuation
# example includes 'four.'
# could be remedied by include? or Regex

# also if this means joining around spaces, irregular whitespace would be
# omitted

# you will need to replace only the word and not the punctuation
# something like gsub called on the array string element

# could scan each letter but the logic is tricky
# if arr[i..i+3] == 'zero'
#   arr[i..i+3] = 0

# -given a string, text
# -set DIGIT_WORDS = { 'zero' => '0', ...}
# -set i = 0
# -set text_size = text size
# -for i from 0 to text size - 1
# --for each pair[word, digit] in DIGIT_WORDS
# ---if text[i..i+word.size - 1] == word
# ----text[i..i+word.size] = digit
# ---end if

DIGIT_WORDS = {
  'zero'  => '0',
  'one'   => '1',
  'two'   => '2',
  'three' => '3',
  'four'  => '4',
  'five'  => '5',
  'six'   => '6',
  'seven' => '7',
  'eight' => '8',
  'nine'  => '9'
}

# def word_to_digit(text)
#   i = 0
#   text_size = text.size

#   loop do
#     break if i >= text_size
#     DIGIT_WORDS.each do |word, digit|
#       if text[i..i+word.size-1] == word 
#         text[i..i+word.size-1] = digit
#       end
#     end
#     i += 1
#   end
#   text
# end

# LS solution & further exploration

# def clean_spaces(text)
#   i = 0
#   text_size = text.size
#   digits = DIGIT_WORDS.values.join
#   loop do
#     break if i >= text_size || text[i].nil?
#     if digits.include?(text[i]) && text[i+1] == ' '
#       text[i..i+1] = text[i]
#     end
#     i += 1
#   end
#   text
# end

def clean_spaces(text)
  DIGIT_WORDS.each_value do |digit|
    text.gsub!(/#{digit} /, digit)
  end
end

def convert_phone_number(text)
  i = 0
  digit_count = 0
  text_size = text.size

  loop do
    break if i >= text_size || text[i].nil?
    if /[0-9]/ =~ text[i]
      digit_count += 1
    else
      digit_count = 0
    end

    if digit_count == 10
      text[i-9..i] = "(#{text[i-9..i-7]}) #{text[i-6..i-4]}-#{text[i-3..i]}"
    end
    i += 1
  end
  text
end

def word_to_digit(text)
  DIGIT_WORDS.each_key do |word|
    text.gsub!(/\b#{word}\b/, DIGIT_WORDS[word])
  end

  clean_spaces(text)

  text = convert_phone_number(text)
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

p word_to_digit('Please call now on one two three four five six seven eight nine zero!')