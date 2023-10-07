=begin

Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

=end

=begin

Notes:

Problem:
input: an odd integer
output: print to screen, no significant return

Write a method that prints to screen an 8-pointed
star in a grid-size given as an odd integer argument.

rules:
  do I need to check argument is odd? No
  The argument will be at least 7


Examples / test cases:

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

center line print grid_size stars
every other line has 3 stars centered in grid but
  the spaces between stars grow from 0, at distance=1
  + 1 each line further
spaces = distance - 1

Data Structures:

Algorithm:
subprocess draw_line
Given an integer, grid_size and an integer, distance_from_center
Set stars := 
  if stars is zero
    '*' * grid_size
  else
    '*' + (' ' * (distance_from_center - 1)) + '*' + (' ' * (distance_from_center - 1)) + '*'
Print stars centered in grid_size line
Return

subprocess star
Given an integer, grid_size
Set furthest := ( grid_size - 1 ) / 2
Iterate distance from furthest downto 0 inclusive
  draw_line(grid_size, distance)
Iterate distance from 1 upto furthest inclusive
  draw_line(grid_size, distance)
Return
=end

def draw_line(grid_size, distance_from_center)
  stars =
    if distance_from_center.zero?
      '*' * grid_size
    else
      '*' + (' ' * (distance_from_center - 1)) + '*' + (' ' * (distance_from_center - 1)) + '*'
    end
  puts stars.center(grid_size)
end

def star(grid_size)
  furthest = (grid_size - 1) / 2
  furthest.downto(0) do |distance|
    draw_line(grid_size, distance)
  end
  1.upto(furthest) do |distance|
    draw_line(grid_size, distance)
  end
end

star(7)
star(9)

# 19:13
