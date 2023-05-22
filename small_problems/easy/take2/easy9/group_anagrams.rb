# Group Anagrams

# input: an array of words
# output: print groups of words that are anagrams

# the example output suggests the groups should be arrays with
# `inspect` called on them before being passed to `puts`

# to test for anagrams:
# string1.chars.sort == string2.chars.sort

# after finding an anagram add to group and then delete from array
# make a shallow copy. deleting elements from the copy will not affect the
# original array or mutate the elements themselves

# Given an array of strings, words
# Set groups := empty array
# Set words_copy := shallow_copy(words)
# Iterate while words_copy.size() > 0
#   Set current_word := words_copy.pop
#   Set current_group := Select strings from words_copy: anagram?(current_word, potential_anagram)
#   Push current_word to current_group 
#   Delete all words from words_copy that are anagrams of current_word (reject!)
#   Push current_group to groups
# Iterate over each group in groups
#   PrettyPrint group
# Return

# Subroutine: anagram?(current_word, potential_anagram)
# Return (current_word.chars.sort == potential_anagram.chars.sort)

def anagram?(word, potential_anagram)
  word.chars.sort == potential_anagram.chars.sort
end

def group_anagrams(words)
  groups = []
  words_copy = words.dup
  loop do
    break if words_copy.empty?
    current_word = words_copy.pop
    current_group = words_copy.select do |potential_anagram|
      anagram?(current_word, potential_anagram)
    end

    current_group.push(current_word)
    
    words_copy.reject! do |potential_anagram|
      anagram?(current_word, potential_anagram)
    end

    groups.unshift(current_group)
  end

  groups.each { |group| puts group.inspect }
  return
end

# LS solution much better

def group_anagrams(words)
  result = {}

  words.each do |word|
    key = word.split('').sort.join
    if result.has_key?(key)
      result[key].push(word)
    else
      result[key] = [word]
    end
  end

  result.each_value do |v|
    puts "------"
    p v
  end
end


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

group_anagrams(words)
