# Seeing Stars

=begin

Problem:

  Write a method that displays an 8-pointed star
  in an n x n grid, where n is an ODD integer passed
  as argument. The smallest n should be 7

input: an integer n >= 7
output: print to screen 8-pointed star in n-size grid

rules:
  no significant return value

Examples:

star(7)
*12*12* 0 space * 2 space * 2 space * 0 space
1*1*1*1 1 space * 1 space * 1 space * 1 space
12***12 2 space * 0 space * 0 space * 2 space
******* n = 7 stars
12***12 reverse of above
1*1*1*1 ...
*12*12* ...

star(9)
0 space * 3 space * 3 space *
1 space * 2 space * 2 space *
2       * 1       * 1       *
3       * 0       * 0       *

So need to count down from n/2 - 1
AND count up from n/2 - 1

Thoughts:

two variables count_up, count_down
for count_up = 0; count_up < n/2; count_up++
for count_down = n/2 - 1; count_down >= 0; count_down--

print_line method
  given two integers outer, inner
  output ' ' * outer
  output *
  output ' ' * inner
  output *
  output ' ' * inner
  output *


questions:
  do I need to validate argument?
    assume no

DS:

Algorithm:

subroutine print_line(outer, inner)
  print outer spaces
  print '*'
  print inner spaces
  print '*'
  print inner spaces
  print '*'
  print newline
end subroutine

Given an integer, n
Iterate from 0 to (n/2-1) as count_up
  count_down = (n/2-1) - count_up
  print_line(count_up, count_down)
print '*' n times and newline
Iterate from 0 to (n/2-1) as count_up
  count_down = (n/2-1) - count_up
  print_line(count_down, count_up)
Return

=end

def print_line(outer, inner)
  puts "#{' ' * outer}*#{' ' * inner}*#{' ' * inner}*"
end

def star(grid_size)
  space_limit = grid_size / 2 - 1
  0.upto(space_limit) do |count_up|
    count_down = space_limit - count_up
    print_line(count_up, count_down)
  end
  puts '*' * grid_size
  0.upto(space_limit) do |count_up|
    count_down = space_limit - count_up
    print_line(count_down, count_up)
  end
end

# print_line(0, 3)

star(7)

puts

star(9)