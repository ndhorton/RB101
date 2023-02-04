# Rotation (part 2)

=begin
input: an integer, number, another integer, n
output: the nth-from-right digit moved to rightmost place
goal: slice array up to but not including -n and concatonate with
return value of rotate_array called on slice from -n to last index

n

-given an integer number, and a integer marker n
-if n is greater than size of number's digits
--return number
-get array of number's digits in the right order
-slice array from index 0 to index -(n + 1) and
-concatonate with return from rotate_array() with
  array sliced from -n to -1
-join digits
-return as integer

examples:
n = 1, the last digit moves to last place (does not really move)
n = 2, the second-to-last moves to last place
n = 3, the third-to-last moves to last place
n = 4, ...

possibly check that n is not bigger than size of integer's digits

n is always positive

=end

def rotate_array(array)
  array[1..] + [array[0]]
end

# def rotate_rightmost_digits(number, n)
#   return number if n > Math.log10(number).floor + 1
#   digit_arr = number.digits.reverse
#   rotated_number = digit_arr[0...-n] +
#     rotate_array(digit_arr[-n..-1])
#   rotated_number.join.to_i
# end

# LS solution

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
