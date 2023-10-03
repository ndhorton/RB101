# Diamonds!

=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.
=end

=begin
Notes:

Problem:
input: an odd integer
output: print to screen, no significant return

Write a method that takes an odd integer n
and prints a diamond in an n*n grid

rules:
  assume input will be an odd integer always
  middle line has n stars filling grid horizontally
  1 line away you have n - 2 stars and so on until 1 star at the furthest lines

Examples and test cases:

9 grid size

line that's centered
'*' * 9
'*' * 7 lose 2
      5 lose 2
      3 ...
      1

integer is always odd

middle line will be 9 / 2 == 4 (intdiv) + 1
3 / 2 = 1 + 1 == 2

Data structures:

Algorithm:
subprocess draw_line
Given an integer, grid_size and an integer, distance_from_center
Set number_of_stars := the grid_size - (distance_from_center * 2)
Set stars := '*' * number_of_stars
Print stars centered padded with spaces to center it in grid_size characters
Return

subprocess diamonds
Given an odd integer, grid_size
Set furthest_distance := grid_size / 2
Iterate for distance_from_center from furthest_distance downto 0 inclusive
  draw_line(grid_size, distance_from_center)
Iterate for distance_from_center from 1 upto furthest_distance inclusive
  draw_line(grid_size, distance_from_center)
Return
=end

def draw_line(grid_size, distance_from_center)
  number_of_stars = grid_size - (distance_from_center * 2)
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  furthest_distance = grid_size / 2
  furthest_distance.downto(0) do |distance_from_center|
    draw_line(grid_size, distance_from_center)
  end
  1.upto(furthest_distance) do |distance_from_center|
    draw_line(grid_size, distance_from_center)
  end
end

diamond(1)
diamond(3)
diamond(9)

# 19:02
