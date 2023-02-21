# Right Triangles: easy 1

# input: an integer, n
# output: print to screen an ascii right triangle composed of * characters,
#   oriented right

# first line: n - 1 spaces, 1 star
# second line: n - 2 spaces, 2 stars
# ...
# last line: n stars

# Given an integer, n
# For i from 1 to n
#   Print n-i spaces and i stars
# Return

def triangle(n)
  1.upto(n) { |i| puts(('*' * i).rjust(n)) }
end

# LS solution
def triangle(n)
  spaces = n - 1
  stars = 1
  
  n.times do |_|
    puts (' ' * spaces) + ('*' * stars)
    stars += 1
    spaces -= 1
  end
end 

# Further explorations

def triangle(n, orientation=:lower_right)
  case orientation
  when :lower_right
    1.upto(n) { |i| puts(('*' * i).rjust(n)) }
  when :upper_right
    n.downto(1) { |i| puts(('*' * i).rjust(n)) }
  when :lower_left
    1.upto(n) { |i| puts(('*' * i).ljust(n)) }
  when :upper_left
    n.downto(1) { |i| puts(('*' * i).ljust(n)) }
  end
end

triangle(5, :lower_left)
# triangle(9)