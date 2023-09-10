# Now I Know My ABCs

=begin

Notes:

Given a string, word
Iterate through the characters in word
  If the current character is in a block that has already been used
    Return false
  Else 
    Check off the block containing the current character
Return true

So if the collection of blocks is instantiated each time the method
is called, you could simply delete that block from the collection

The alternative might be a smaller data structure that works like
a bitfield or bool collection

questions:

Problem:
input: string
output: boolean

  Write a method that accepts a string argument, word, and returns true
  if the word can be spelled using one letter from each block in the
  collection of blocks described in the DS section.

rules:
  case-insensitive so input must be case-normalized by the method
  each letter in a block can be used only once
  each block can be used only once

Examples:

DS:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

Algorithm:

Define constant BLOCKS to hold 2-element arrays for the blocks

Given a string, word
Instantiate an array of booleans set to true, block_valid
Iterate through each char in word
  Iterate through each block in blocks with index
    If current block contains the uppercase char && block_valid[index] is true
      Set boolean in block_valid at index to false
    Elsif current block contains the char && block_valid[index] is false
      Return false
Return true

=end

# BLOCKS = [
#   %w(B O),
#   %w(X K),
#   %w(D Q),
#   %w(C P),
#   %w(N A),
#   %w(G T),
#   %w(R E),
#   %w(F S),
#   %w(J W),
#   %w(H U),
#   %w(V I),
#   %w(L Y),
#   %w(Z M)
# ].freeze

def block_word?(word)
  block_valid = Array.new(BLOCKS.size, true)
  word.each_char do |char|
    BLOCKS.each_with_index do |block, index|
      if block.include?(char.upcase) && block_valid[index]
        block_valid[index] = false
      elsif block.include?(char.upcase) && !block_valid[index]
        return false
      end
    end
  end
  true
end

# LS solution
=begin
so pseudocode would be something like
Instantiate a BLOCKS constant array of two-character strings each
  of which is a block

subprocess block_word?
Given a string, word
Set uppercase_word := uppercase version of word
Iterate through each block in BLOCKS
  If the count of the chars in block within uppercase_word exceeds 1 (for both chars)
    Return false
Return true
=end
t = Time.now
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

# count works by counting the occurrences in the calling string of each character
# from the argument string individually and then summing the counts of the individual characters
# It doesn't search for the argument as a substring (you need scan for that)
def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

# def block_word?(string)
#   uppercase_string = string.upcase
#   BLOCKS.each do |block|
#     return false if uppercase_string.count(block) >= 2
#   end
#   true
# end

# def block_word?(string)
#   uppercase_string = string.upcase
#   BLOCKS.each do |block|
#     count = 0
#     uppercase_string.each_char do |char|
#       if char == block[0] || char == block[1]
#         count += 1
#       end
#     end
#     return false if count >= 2
#   end
#   true
# end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

puts format("%.10f", Time.now - t)
# 23:38
