# Now I Know My ABCs

=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

=end

=begin

Notes:

tallies[block] = word.count(block)

Problem:
input: a string, word
output: boolean true or false

Write a method that takes a word and returns true
if the word can be spelled using the blocks,
false otherwise

rules:
  must be case-insensitive

Examples / test cases:

Iterate through the blocks

Data Structures:

so first, a constant array of strings
each string is a two-character block

hash where each key was a string of two characters length
that is a block (e.g. 'gt')

Algorithm:

Define a constant BLOCKS as an array containing
  2-character strings each of which is a block

Given a string, word
Normalize case of word to uppercase
Set tallies := empty Hash
iterate through each block in BLOCKS
  Set tallies[block] := count occurrences of both letters in word
Iterate through each tally in tallies
  If tally > 1
    Return false
Return true 
=end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).map(&:freeze).freeze

def block_word?(word)
  word = word.upcase.freeze
  tallies = {}
  BLOCKS.each { |block| tallies[block] = word.count(block) }
  tallies.values.all? { |tally| tally <= 1 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# 13:40
