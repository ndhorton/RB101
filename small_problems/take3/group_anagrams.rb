# Group Anagrams

=begin

Notes:

Enumerable#group_by { |element| ... } => hash
each key is a return value from the block
each value is an array of those elements for which the block returned that key

You would call group_by on words array
The block would return the string element in sort order of characters
So you need to split the word into characters, sort then join

questions:

Problem:
input: array
output: printed groups of words from array that are anagrams

  Write a program that takes an array of words and
  prints out groups of words that are anagrams

rules:

Examples:

['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
['demo', 'dome', 'mode']
["neon", "none"]

DS:

Algorithm:
Given an array, words
Set anagrams_hash := empty hash
Iterate over each word in words
  Set anagram_key := sort characters in word in alphabetical order
  If anagram_key exists as a key in anagrams_hash
    Append word to array associated with anagram_key
  Else
    Create new key anagram_key in anagrams_hash and associate with an array containing word
Return anagrams_hash
=end

def group_anagrams(words)
  words.each_with_object({}) do |word, anagrams|
    anagram_key = word.chars.sort.join
    if anagrams.key?(anagram_key)
      anagrams[anagram_key] << word
    else
      anagrams[anagram_key] = [word]
    end
  end
end

def groop_by(array, &block)
  result = {}
  array.each do |element|
    key_object = block.call(element)
    if result.key?(key_object)
      result[key_object] << element
    else
      result[key_object] = [element]
    end
  end
  result
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

# anagrams_hash = words.group_by { |word| word.chars.sort.join }
# anagrams_hash = group_anagrams(words)
anagrams_hash = groop_by(words) { |word| word.chars.sort.join }

anagrams_hash.each_value { |words| puts words.to_s }

# 13:52 including writing the algorithm for a custom version of the
# `Enumerable#group_by` method with that block on line 63
