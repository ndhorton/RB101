# Rotation (Part 3)

=begin

Thoughts:
735291 -> rotate whole array
3 52917 -> rotate array[1..] 
32 9175 -> rotate array[2..]
321 759 -> rotate array[3..]
321 59 7 -> rotate array[4..] ... 4 is array.size - 2
3215 7 9 -> 321579            so [0, array.size - 2]


Problem:

input: an integer
output: the integer which is the maximum rotation of the digits
of the input number

leading zeros are dropped
you don't need to handle multiple zeroes

Examples:

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

Questions:

DS:

array of digits (number.to_s.chars to preserve order)

Algorithm:

Given a number
Iterate for counter from 0 through array.size - 2
  number = rotate_rightmost digits(number, counter)
Return number

=end
def rotate_array(array)
  array[1..-1] + [array[0]]
end

# def rotate_rightmost_digits(number, n)
#   digits = number.to_s.chars
#   front = digits.slice(0, digits.size - n)
#   last_n = digits.slice((digits.size - n)..(digits.size - 1))
#   rotated_number = front + rotate_array(last_n)
#   rotated_number.join.to_i
# end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(number)
  num_of_digits = number.to_s.size
  num_of_digits.downto(2) do |counter|
    number = rotate_rightmost_digits(number, counter)
  end
  number
end



# p rotate_rightmost_digits(735291, 6)
# p rotate_rightmost_digits(352917, 5)
# p rotate_rightmost_digits(329175, 4)
# p rotate_rightmost_digits(321759, 3)
# p rotate_rightmost_digits(321597, 2) # == 321579


# Further exploration

def max_rotation(number)
  num_str = number.to_s
  # num_str                      = num_str[0, 0] + num_str[1..] + num_str[0]
  #                              = num_str[0, 1] + num_str[2..] + num_str[1]
  #                              = num_str[0, 2] + num_str[3..] + num_str[2]
  #                              = num_str[0, 3] + num_str[4..] + num_str[3]
  # = num_str[0, num_str.size-2] + num_str[num_str.size-1..] + num_str[num_str.size-2]
  (0..num_str.size-2).each do |counter|
    num_str = num_str[0, counter] + num_str[counter+1..] + num_str[counter]
  end
  num_str.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

p max_rotation(111001)
