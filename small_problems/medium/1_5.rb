# Diamonds!

=begin
input: an odd integer, n
output: n / 2 rows of centred asterisks, each i is size (i-1) + 2,
middle (odd) row is n asterisks, then symmetrical. The first and last have
one asterisk
goal: print spaces and * to fit above requirements

integer n will always be odd

so 
line 1 -> n / 2 spaces and stars(=1) asterisk
line 2 -> n / 2 - 1 spaces and stars += 2 asterisks
half = n / 2 
middle line half * asterisks
next line 1 space, half - 2 asterisks etc

ds: could use a multidimensional array but would be the same maths

algorithm:

-given an int n
-set half = n / 2
-set stars = 1
-for i from 0 to half - 1
--print " " * half - i
--print "*" * stars + "\n"
--stars += 2
-print "*" * n
-stars = n - 2
-for j from 1 to half
--print " " * j
--print "*" * stars + "\n"
--stars -= 2

=end

# def diamond(n)
#   half = n / 2
#   stars = 1
#   half.times do |i|
#     print " " * (half - i)
#     print "*" * stars + "\n"
#     stars += 2
#   end
#   print "*" * n + "\n"
#   stars = n - 2
#   1.upto(half) do |j|
#   print " " * j
#   print "*" * stars + "\n"
#   stars -= 2
#   end
# end

# LS solution

# def print_row(grid_size, distance_from_center)
#   number_of_stars = grid_size - 2 * distance_from_center
#   stars = "*" * number_of_stars
#   puts stars.center(grid_size)
# end

# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end

# Further explorations

def build_grid(n)
  Array.new(n) { Array.new(n) { String.new(" ") } }
end

def display_row(row)
  row.each { |sq| print sq }
  print "\n"
end

def display_diamond(grid)
  grid.each { |row| display_row(row) }
end

def star_fill(grid, n)
  half = n / 2
  0.upto(half) do |i|
    grid[i][half - i] = "*"
    grid[i][half + i] = "*"
  end

  1.upto(half) do |i|
    grid[half + i][i] = "*"
    grid[half + i][n - 1 - i] = "*"
  end
end

def diamond(n)
  grid = build_grid(n)
  star_fill(grid, n)
  display_diamond(grid)
end

diamond(5)