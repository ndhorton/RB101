# Rotation (Part 3)

=begin

Notes:
How do you know when to stop?
1 less rotations than number of digits

questions:

Problem:
input: integer
output: integer

  Write a method that takes an integer as argument and returns
  the maximum rotation of that argument

rules:
  there will be number_of_digits - 1 rotations
  leading zeroes will vanish after the rotation process
    when the conversion to integer happens

Examples:

7 3 5 2 9 1
Hold 0 digits, rotate first remaining digit
3 5 2 9 1 7
Hold 1 digits, rotate first ...
3 2 9 1 7 5
Hold 2 digits, rotate first ...
3 2 1 7 5 9
Hold 3 digits, rotate
3 2 1 5 9 7
Hold 4 digits, rotate
3 2 1 5 7 9
done

8 7 0 3 5 2 9 1 4 6
7 0 3 5 2 9 1 4 6 8
7 3 5 2 9 1 4 6 8 0
7 3 2 9 1 4 6 8 0 5
7 3 2 1 4 6 8 0 5 9
7 3 2 1 6 8 0 5 9 4
7 3 2 1 6 0 5 9 4 8
7 3 2 1 6 0 9 4 8 5
7 3 2 1 6 0 9 8 5 4
7 3 2 1 6 0 9 8 4 5


DS:

integer -> array of digits (easiest if they were string digits since join is possible)
rotations perfored on array
array -> integer

Algorithm:

Given an integer, number
Convert to an array of individual digit strings
Iterate from 0 to array size - 2, holds
  pass array slice from (-array.size + holds) through last index to
    rotate_rightmost_digits
  Reassign return value to indexes -array.size + holds through last index
Join digit strings to one string and convert to integer, result
Return result


=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(number)
  all_digits = number.to_s.chars
  (0..all_digits.size - 2).each do |holds|
    all_digits[-all_digits.size + holds..-1] =
      all_digits[-all_digits.size + holds + 1..-1] +
      [all_digits[-all_digits.size + holds]]
  end
  all_digits.join.to_i
end

=begin

1 0 5 rotate rightmost n digits where n = number of digits = 3
5 1 rotate rightmost n digits where n = 3 - 1
1 5 n = 2 so stop

=end

def max_rotation(number)
  number_size = Math.log10(number).floor + 1
  
  counter = 0
  loop do
    break if counter > number_size - 2
    number = rotate_rightmost_digits(number, number_size - counter)
    counter += 1
  end
  number
end

# LS solution
def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end


# Further exploration
def max_rotation(number)
  number_of_digits = Math.log10(number).floor + 1
  all_digits = number.to_s.chars
  number_of_digits.downto(2) do |n|
    all_digits[-n..-1] = all_digits[-n + 1..-1] + [all_digits[-n]]
  end
  all_digits.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# 41:45 including peeking at answer
# Beginning the algorithm having forgotten that i was dealing in an
# integer rotation method instead of an array one completely blocked me
# when i realised the mistake
# On the other hand, the mistaken version was almost exactly what they ask for
# in the Further Exploration