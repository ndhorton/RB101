# Rotation (part 1)

=begin

Problem:
input: an array
output: a new array with all the original elements but with the first element
moved to last place, all others in sequence

do not mutate array

goal: iterate over elements second up to last pushing to new array, push element 0


Examples given
DS: new array
Algo:

-given an array, arr
-set rotated_arr = empty array
-iterate over each element in arr[1..-1]
--push element to rotated_arr
-push arr element 0 to rotated_arr
-return rotated_arr

=end

# def rotate_array(arr)
#   rotated_arr = arr.select.with_index { |elem, idx| idx > 0 }
#   rotated_arr.push(arr[0])
# end

def rotate_array(array)
  array[1..] + [array[0]]
end

# LS solution

# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

# Further explorations

def string_rotate(string)
  rotate_array(string.chars).join
end

def integer_rotate(integer)
  digit_arr = integer.digits
  rotated_digits = [digit_arr[-1]] + digit_arr[0..-2]

  rotated_digits.each_with_index.reduce(0) do |sum, (digit, idx)|
    sum + digit * (10 ** idx)
  end
end

# Student solutions

def integer_rotate(integer)
  digit_arr = integer.digits
  first = digit_arr.pop
  sum = 0
  until digit_arr.empty?
    sum = (sum * 10) + digit_arr.pop
  end
  sum * 10 + first
end

def integer_rotate(integer)
  rotate_array(integer.digits.reverse).join.to_i
end

def integer_rotate(integer)
  string_rotate(integer.to_s).to_i
end

# Interesting that join converts the integers to strings before attempting
# to join them

p integer_rotate(123456)

p string_rotate('hello')


p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
