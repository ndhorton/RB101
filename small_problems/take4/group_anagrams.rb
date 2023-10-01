# Group Anagrams

=begin
Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:
["demo", "dome", "mode"]
["neon", "none"]
#(etc)
=end

=begin
Notes:

One approach: using a Hash
Iteratively building hash
Each key is the sorted current word
If key exists, add current word to value array
If key does not exist, then hash[current word sorted] = [current word]

Then set groups := get values as an array
Iterate through each group
  Print explicit representation of each sub-array

Problem:
input:
output:

Write a method that prints out groups of words that are anagrams
from the `words` array.

rules:

Examples and test cases:

Data structures:

Algorithm:
Given an array, words
Set anagram_groups := an empty hash
Iterate through each word in words
  Set sorted_word := sort characters in word
  If sorted_word is a key in anagram_groups
    Append word to anagram_groups[sorted_word] array
  Else
    Set anagram_groups[sorted_word] := array containing word
Set groups := get array of values from anagram_groups
Iterate through each group in groups
  Print explicit representation of group array
Return
=end

def print_anagram_groups(words)
  anagram_groups = {}
  words.each do |word|
    sorted_word = word.chars.sort.join
    if anagram_groups.key?(sorted_word)
      anagram_groups[sorted_word] << word
    else
      anagram_groups[sorted_word] = [ word ]
    end
  end

  anagram_groups.each_value do |group|
    puts group.inspect
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

print_anagram_groups(words)

# 10:55 - a couple of typos, probably should have read code before running it
