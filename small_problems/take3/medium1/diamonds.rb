# Diamonds!

=begin

Notes:

so something like ('*' * line_value).center

questions:
do i need to validate input? no
is integer always positive? yes

Problem:
input: an odd
output:

  Write a method that displays a 4-pointed diamond on an n by n grid

rules:
  n will always be an odd integer
  when n is 1, output should be a single star
Examples:

1, 3, 5, 7, 9, 7, 5, 3, 1
So line_value always starts at 1
increments by 2 up to max of n
then back down in the same decrements

DS:

Algorithm:
Given an integer, n
Iterate by 2 for 1 through n, line_value
  print "*" line_value times, centered in n grid
Iterate by 2 for n-2 down to 1, line_value
  print "*" line_value times, centered in n grid
Return
=end

def print_row(grid_size, number_of_stars)
  puts ("*" * number_of_stars).center(grid_size)
end

def diamond(grid_size)
  star_sequence = 1.step(grid_size, 2) + 1.step(grid_size, 2).reverse_each
  star_sequence.each do |number_of_stars|
    print_row(grid_size, number_of_stars)
  end
end

# LS solution
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

diamond(1)
diamond(3)
diamond(9)

# 15:05

# Further exploration

def print_line(grid_size, distance_from_center)
  spaces = grid_size - 2 - (2 * distance_from_center)
  if spaces < 0
    puts "*".center(grid_size)
  else
    puts ("*" + " " * spaces + "*").center(grid_size)
  end
end

def diamond(grid_size)
  max_distance = grid_size / 2
  distances = max_distance.downto(0) + 1.upto(max_distance)

  distances.each do |distance_from_center|
    print_line(grid_size, distance_from_center)
  end
end

diamond(1)
diamond(5)
diamond(9)
