# Triangle Sides

=begin

Thoughts:

working with integers or floats

the conditional check logic could be two seperate if statements,
checking for invalid first

remaining_sides = [a, b, c]
longest_side = sides.delete(sides.max)
  
if (a <= 0 || b <= 0 || c <= 0) ||
  longest_side > remaining_sides.sum
  return :invalid


if a == b && b == c
  :equilateral
else if a == b || b == c || c == a
  :isosceles
else
  :scalene
end


Problem:

  Write a method that takes 3 integer arguments representing the measures
  of the sides of a triangle.
  Return :equilateral, :isoceles, :scalene or :invalid

rules:   
  max value must be < sum of other two values
  no argument can be 0 and probably shouldn't be negative either
    otherwise return :invalid

  if all 3 values are equal, return :equilateral
  if 2 values are the same but not the other, return :isosceles
  if all 3 values are different, return :scalene

Examples:

DS:

Algorithm:

Given 3 numbers, a, b, c
Set remaining_sides := [a, b, c]
longest_side = max(remaining_sides)
remove longest_side from remaining_sides

if (a <= 0 || b <= 0 || c <= 0) ||
  longest_side > remaining_sides.sum
  return :invalid

if a == b && b == c
  return :equilateral
elsif a == b || b == c || c == a
  return :isosceles
else
  return :scalene

=end

def triangle(a, b, c)
  remaining_sides = [a, b, c].sort
  longest_side = remaining_sides.pop

  # longest_side = (remaining_sides = [a, b, c].sort).pop

  if (a <= 0 || b <= 0 || c <= 0) ||
    longest_side >= remaining_sides.sum
    return :invalid
  end
  
  if a == b && b == c
    :equilateral
  elsif a == b || b == c || c == a
    :isosceles
  else
    :scalene
  end
end

# LS solution

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  # or largest_side >= sides.reduce(:+) - largest_side
  when 2 * largest_side >= sides.reduce(:+), sides.include?(0) # the comma just functions as || here
    :invalid                                                   # but can be used in a case (variable)
  when side1 == side2 && side2 == side3                        # statement to have multiple values
    :equilateral                                               # lead to one branch `when 2, 4, 6 then ...`
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end



p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# 32:00

# I made a mistake in the logic:
# I originally had `longest_side > remaining_sides.sum` signifying that the values
# are invalid, but it should be `>=` since the sum of the shortest sides has to be
# greater than the longest side
# valid: longest < others.sum
# invalid: longest >= others.sum
# When you want to reverse the expected boolean result

# I originally tried to do
# ```
# remaining_sides = [a, b, c]
# longest_side = remaining_sides.delete(remaining_sides.max)
# ```
# but `delete` is global, so it deleted every occurrence of the max value,
# which meant that isosceles and equilateral triangles would be marked invalid
# so then I changed it to
# ```
# longest_side = remaining_sides.max
# remaining_sides.delete_at(remaining_sides.index(longest_side))
# ```
# and it's possible this has less overhead than `sort` but i don't know and it reads
# terribly, so I used `sort` and `pop` instead.
# So, anyway, a good little pattern to find and remove the min or max value is
# ```
# array.sort
# max_val = array.pop
# ...
# array2.sort
# min_val = array.shift
# ```
# though obviously for really big collections it might be better to use a faster
# if less easily readable solution
