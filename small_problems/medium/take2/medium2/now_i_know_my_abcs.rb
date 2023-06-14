# Now I Know My ABCs

=begin

Problem:

  Write a method that returns `true` if the word passed in can be spelled
  using each block only once.

Examples:

Implicit: that the comparison be case-insensitive
          all letters of alphabet are included once in set of blocks

use casecmp?() ?

DS:

two options jump out:
  a 2d array in which each block is an array of two letters;
  delete block once one letter has been used

  a 2d array in which each block contains two letters and a Boolean

  a 2s array for each block with two letters; the index of a used block
  is added to a seperate array

Algorithm:

Given a string, word
Set characters := split word into array of characters
Set used_blocks := empty array
Iterate through each char in characters
  Iterate through each block in BLOCKS array with index, index
    if block includes uppercase(char) && used_blocks does NOT include index
      append index to used_blocks
      break
    else if block includes char && used_block does include index
      return false
    end
Return true

=end

# BLOCKS = [
#   ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
#   ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
#   ['V', 'I'], ['L', 'Y'], ['Z', 'M']
# ]

# def block_word?(word)
#   used_blocks = []

#   word.each_char do |char|
#     BLOCKS.each_with_index do |block, index|
#       if block.include?(char.upcase) && !used_blocks.include?(index)
#         used_blocks.push(index)
#         break
#       elsif block.include?(char.upcase) && used_blocks.include?(index)
#         return false
#       end
#     end
#   end

#   true
# end

# LS solution - data structure much better

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

p block_word?('hello') == false

# 28:41 - had a couple of typos including a variable name I forgot to change
#         after I decided to switch method to `each_char`
# I think I was in too much of a rush to work out the data structure and algorithm
# and didn't fix the rules clearly enough at the problem domain level
# ALSO FORGOT TO UPCASE char after writing that in the algorithm

# Further thoughts - we're assuming that the string passed in contains only letters