# Letter Swap

# input: a string of words seperated by spaces
# output: a string in which the first and last letters
# of every word from the input string are swapped

# goal: 
# split words on whitespace
# use element reassignment and double assignment syntax
# to swap letters at indexes 0 and -1
# join around a space

def swap(text)
  words = text.split
  words.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  words.join(' ')
end

# LS solution

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

# Further exporation

# The proposed method would not work because the `String#[]` method is not
# the same as e.g. Array element reference; the objects returned by this String
# method are new single-character String objects with the same value as the
# character at the indexed position of the calling string, rather than being member
# objects in a collection. Any mutation performed on these newly-
# created strings will not change the value of the string they were derived
# from.


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
