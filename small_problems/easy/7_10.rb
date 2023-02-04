# The End is Near But Not Here

# input: a string of words (sequences of non-space chars) separated by spaces
# output: the penultimate word

# every string passed in as argument will contain at least two words

# def penultimate(text)
#   text.split[-2]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'


# Further exploration
# input: a string containing a phrase or sentence
# output: the middle word of this phrase or sentence

# edge cases:

# if there is an even number of words, which counts as the 'middle word'?
#   on the principle of first-found, one could choose the first of the pair of middle words

# what if the string is empty?
#   return the empty string

# what if there is only one word?
#   return the word

# what if you are passed something other than a string?
#   return object (or you could return nil perhaps)


# algo:

# -given a string, text
# -if text is not actually a string, return invalid object
# -if text is empty, return text
# -split text into array of words
# -if size of words is odd
# --set middle_word = word at words index [words size / 2] 
# -else
# --set middle_word = word at words index [words size / 2 - 1]
# -return middle_word

def middle_word(text)
  return text if text.class != String || text.empty?
  words = text.split

  if words.size.odd?
    middle_word = words[words.size / 2]
  else
    middle_word = words[words.size / 2 - 1]
  end
  
  middle_word
end

p middle_word('where now for man raised by puffins?') == 'man'
p middle_word('the road not taken') == 'road'
p middle_word('') == ''
p middle_word(8) == 8