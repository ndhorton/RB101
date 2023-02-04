# Rotation (part 3 further exploration)

=begin
input: an int, number
output: an int whose digits are number after maximum rotation
goal: rotate the first digit to the back, then rotate the second
digit to the back, etc, until the digit to be considered is the final
one.

edge cases: when a zero is out front during the rotation, if it
is currently stored as a Numeric, it will disappear in the sum

So all rotations should be performed on the digits as chars and/or
elements in an array. 

If it does need to be returned as a Numeric, then there is no way
of avoiding the loss of leading zeros at that point

logic for the rotation:
for i from 0 to length of array - 2
  arr[i..-1] = arr[i+1..-1] + [arr[i]]
  i++

-given an integer, number
-set characters = convert number to string and split to array
-set limit = size of characters - 2
-set i = 0
-repeat while i <= limit
--characters[i..-1] = characters[i+1..-1] + [characters[i]]
--i += 1
-end loop
(here the characters/digits are in the right order for max rotation and
zeros are preserved. but if we now convert it to int, leading zeros will
be lost)
-join characters to string and convert to int, rotated_number
-return rotated number

=end

# def max_rotation(number)
#   characters = number.to_s.chars
  
#   limit = characters.size - 2
#   i = 0
#   loop do
#     break if i > limit
#     characters[i..-1] = characters[i+1..-1] + [characters[i]]
#     i += 1
#   end

#   characters.join.to_i
# end

def max_rotation(number)
  characters = number.to_s.chars

  0.upto(characters.size - 1) do |i|
    characters[i..-1] = characters[i+1..-1] + [characters[i]]
  end

  # All zeros have been preserved up to this point but after this
  # conversion any leading zeros will be lost
  characters.join.to_i
end

# Interesting student submission, tweaked here

# def max_rotation(number)
#   digits_arr = number.to_s.chars
#   rotated_digits = []

#   until digits_arr.empty?
#     digits_arr << digits_arr.shift
#     rotated_digits << digits_arr.shift
#   end

#   rotated_digits.join.to_i
# end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845