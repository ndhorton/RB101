# Rotation (part 3)

=begin
input: an int number
output: maximum rotation of number
goal: 

the difficulty is feeding the rrd method an integer rather than slices
of an array (NO IT WASN'T)

digit_arr = empty array
counter = get number of digits
loop until counter < 1
  rrd method called on number % 10 ** counter
  convert to string and push to digit_arr
  counter -= 1
end  
join digit_arr and convert to int

totally lost hold of how the rotate right digit method worked
totally wrong algorithm
should have been just:

given an integer, number
counter = get number of digits
loop while counter > 0
  set number = rrd method called with number, n as arguments
  counter -= 1
end loop
return number

the lesson should be understand the problem thoroughly before algorithm, 
though in this case that meant understanding the methods I had to work with too

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

# def max_rotation(number)
#   counter = Math.log10(number).floor + 1
#   while counter > 0
#     number = rotate_rightmost_digits(number, counter)
#     counter -=1
#   end
#   number
# end

# LS solution

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
