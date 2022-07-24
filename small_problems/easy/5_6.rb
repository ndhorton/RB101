# input: a string of words seperated by spaces
# output: a hash that lists the sizes of the words in the string as keys and
# the number of words of each size as a value

# edge case: empty string should yield empty hash
# examples show punctuation is included in word length

# so you could iterate through the words split into an array
# each word you could check whether the word length exists in hash
# if not, add a key pointing to 1
# else
#   increment the value of that key

# -given a string
# -set hsh = empty hash
# -split string into words
# -iterate over words
# --if word size exists as key
# ---increment the value of that key
# --else
# ---create that key and assign value of 1
# -return hash 

# def word_sizes(text)
#   words = text.split
#   word_length_frequencies = {}
#   words.each do |word|
#     if word_length_frequencies.has_key?(word.length)
#       word_length_frequencies[word.length] += 1
#     else
#       word_length_frequencies[word.length] = 1
#     end
#   end
#   word_length_frequencies
# end

# LS solution
def word_sizes(words_string)
  counts = Hash.new(0)  # this is the part that allows incrementing new key values
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}