# def swap(str)
#   words = str.split
#   words.map! do |word|
#     next word if word.size < 2
#     first_letter = word[0]
#     last_letter = word[-1]
#     word.delete_prefix!(word[0])
#     word.delete_suffix!(word[-1])
#     word.prepend(last_letter)
#     word << first_letter
#     word
#   end
#   words.join(' ')
# end

#LS solution
require 'pry-byebug'

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  new_words = words.split.map do |word|
    swap_first_last_characters(word)
    word
  end
  new_words.join(' ')
end

# further exploration:
# require 'pry-byebug'

# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# def swap(str)
#   words = str.split.map do |word|
#     word[0], word[-1]  = swap_first_last_characters(word[0], word[-1])
#     word
#   end
  
#   words.join(' ')
# end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') == 'a'

# further explorations:
# To get it to work, you need to assign the return value of 
# swap_first_last_characters() to the first and last places of the word,
# then restate word as the return value of the map block
# essentially splitting the original swap_first_last_characters() method between
# the two methods, a strange design decision
