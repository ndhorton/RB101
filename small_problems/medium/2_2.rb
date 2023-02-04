# Now I Know My ABCs

=begin
P:
input: string
output: boolean true or false, depending on rules outlined
goal: check string has no duplicate chars; loop over blockpairs;
check each for a match; if match check other char in blockpair for
match;

each char from string need to be checked against pairs of blockchars
each block can only be used once, which means
- any repeat letters in a word is instant disqualifier
- any word that needs both blockchars in a pair is disqualified
all alphabet letters appear once

check for duplicate chars in string
loop over pairs of chars
-if char from string is found, check string for other char
  if not needed skip to next string char
  else return false

implicit requirements: case insensitive

create multidimensional array of pairs of chars
given a string
convert string to upper case
split into chars
if chars contains duplicate chars
  return false
loop while chars is not empty
  pop char
  iterate over each pair in blockpairs
    if char matches a letter in pair
      if other char matches remaining chars
        return false
      else
        next char iteration
return true
=end

# BLOCKPAIRS = [
#   ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
#   ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
#   ['V', 'I'], ['L', 'Y'], ['Z', 'M']
# ]

# def block_word?(text)
#   letters = text.upcase.chars
#   return false if letters != letters.uniq
#   until letters.empty?
#     current_char = letters.shift
#     BLOCKPAIRS.each do |pair|
#       if current_char == pair[0]
#         return false if letters.member?(pair[1])
#         break
#       elsif current_char == pair[1]
#         return false if letters.member?(pair[0])
#         break
#       end
#     end
#   end

#   true
# end

# LS solution

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true