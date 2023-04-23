# Right Triangles

# input: a positive integer, n
# output: an ascii representation of a right triangle whose legs are of n
# characters ('*') and whose orientation gives the hypotenuse a slope of 1
# goal: print n lines where if n = 5 then 
#   line 1 = (n - 1) spaces + 1 stars
#   line 2 = (n - 2) spaces + 2 stars
#   ...
#   line 5 = (n - n) spaces + n stars
# and done

# Given an integer, n
# Set counter := 1
# For counter from 1 to n inclusive
#   print (' ' * (n - counter)) + ('*' * counter)
# Return

# def triangle(n)
#   steps = (1..n).to_a
#   steps.each { |index| puts (' ' * (n - index)) + ('*' * index) }
# end

# def triangle(n, orientation = 'br')
#   case orientation
#   when 'br'
#     1.upto(n) { |index| puts (' ' * (n - index)) + ('*' * index) }
#   when 'tr'
#     n.downto(1) { |index| puts (' ' * (n - index)) + ('*' * index) }
#   when 'bl'
#     1.upto(n) { |index| puts ('*' * index) + (' ' * (n - index)) }
#   when 'tl'
#     n.downto(1) { |index| puts ('*' * index) + (' ' * (n - index)) }
#   end
# end

def triangle(n, orientation = 'br')
  steps = [*(1..n)]
  step_vector = (orientation[0] == 'b' ? steps : steps.reverse )

  right_orient = Proc.new { |index| puts (' ' * (n - index)) + ('*' * index) }
  left_orient = Proc.new { |index| puts ('*' * index) + (' ' * (n - index)) }
  print_line = (orientation[1] == 'r' ? right_orient : left_orient )
  
  step_vector.each { |index| print_line.call(index) }
end

# def triangle(n, orientation = 'br')
#   lines = []
#   1.upto(n) { |index| lines << (' ' * (n - index)) + ('*' * index) }
  
#   case orientation
#   when 'tr'
#     lines.reverse!
#   when 'bl'
#     lines.map! { |line| line.reverse }
#   when 'tl'
#     lines.map! { |line| line.reverse }.reverse!
#   end
  
#   puts lines
# end

triangle(5, 'tl')
# triangle(9)