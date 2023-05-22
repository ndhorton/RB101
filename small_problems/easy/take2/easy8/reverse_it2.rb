# Reverse It (Part 2)

# input: a string containing one or more words
# output: the input string with words containing
# 5 or more characters reversed

# The wording suggests doing this in place 'the given string' (though
# i doubt that is actually what they mean) 'returns'

# Could do both

# Mutate in place
def reverse_words(sentence)
  words = sentence.split
  words.map! { |word| word.size >= 5 ? word.reverse : word }
  sentence.replace(words.join(' '))
end

# Return a new string
def reverse_words(sentence)
  words = sentence.split
  processed_words = words.map { |word| word.size >= 5 ? word.reverse : word }
  processed_words.join(' ')
end

# Regex solution mutating in place
def reverse_words(string)
  long_words = string.scan(/\S{5,}/)
  long_words.each do |word|
    string.sub!(/#{word}/, word.reverse)
  end
  string
end

# Regex solution return a new string
def reverse_words(string)
  reverse_string = string.dup
  long_words = string.scan(/\S{5,}/)
  long_words.each do |word|
    reverse_string.sub!(/#{word}/, word.reverse)
  end
  reverse_string
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
