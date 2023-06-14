# Diamonds!

=begin

Notes:

Problem:
  Given an odd integer n, print a diamond such that the middle row is n * '*',
  there are n rows, and each row from the first to the middle goes from 1 * '*' to
  3, 5, etc * '*', to the n * '*' in the middle and then back again

  so each row has an odd number of stars increasing from 1 to 3 to ... to n and then back
  The size of each row including blank spaces will be n

  for any odd number n, n/2 will give you the number of blank spaces for the first row
  next row will have n/2-1 blank spaces

rules:

subtractor from spaces must increment from 0 to n/2, then decrement from n/2-1 to 0
number of stars must increase by a step of 2 from 1 to n and then from n-2 to 1

need a function that prints a row

input: an integer n
output: print a diamond

Examples:

Let n = 9
first row: n/2 blank spaces, 1 star
second row: n/2-1 blank spaces, 3 stars
third row: n/2-2 blank spaces, 5 stars
fourth row: n/2-3 blank spaces, 7 stars
fifth (middle) row: n/2-4 blank spaces (0 spaces), 9 stars (n stars)
sixth row: n/2-3 blank spaces, 7 stars
seventh row: n/2-2 blank spaces, 5 stars
eigth row: n/2-1 blank spaces, 3 stars
ninth row: n/2 blank spaces,  1 star

DS:

Algorithm:

subprocess print_row(spaces, stars)
  print (n/2 - spaces) spaces and (stars) stars

Given an integer n
Set spaces_offset := 0
Set stars := 1
Iterate until stars > n
  print_row(n/2 - spaces_offset, stars)
  spaces_offset += 1
  stars += 2
spaces_offset = n/2 - 1
stars = n - 2
Iterate until stars < 1
  print_row(n/2 - spaces_offset, stars)
  spaces_offset -= 1
  stars -= 2
Return

=end

def print_row(spaces, stars)
  puts (' ' * spaces) << ('*' * stars)
end

def diamond(n)
  spaces_offset = 0
  stars = 1
  loop do
    break if stars > n
    print_row(n/2 - spaces_offset, stars)
    spaces_offset += 1
    stars += 2
  end
  spaces_offset = n/2 - 1
  stars = n - 2
  loop do
    break if stars < 1
    print_row(n/2 - spaces_offset, stars)
    spaces_offset -= 1
    stars -= 2
  end
end

# LS solution
# first row: center n - (2 * distance from middle row) stars
# xxxx*xxxx here, the star is 4 rows from the middle, you need 4 spaces before and after star to center it
#                 the number of stars is 9 - 2 * 4 = 1
# so
# first row: center 9 - (2 * (n-1 / 2 = 4)) stars
# second row: center 9 - (2 * 3) stars
# third row: center 9 - (2 * 2) stars
# fourth row: center 9 - (2 * 1) stars
# fifth row: center 9 - (2 * 0) stars

# sixth row: center 9 - (2 * 1) stars
# seventh row: center 9 - (2 * 2) stars
# eight row: center 9 - (2 * 3) stars
# ninth row: center 9 - (2 * 4) stars

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - (2 * distance_from_center)
  if number_of_stars == 1
    stars = '*' * number_of_stars
  else
    number_of_spaces = number_of_stars - 2
    stars = '*' + (' ' * number_of_spaces) + '*'
  end
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end




diamond(9)

# 24:59

