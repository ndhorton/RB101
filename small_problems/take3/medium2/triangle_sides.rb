# Triangle Sides

=begin

Notes:

questions:
  do I need to check the arguments are Numerics? No

Problem:
input: three numbers
output: :equilateral, :isosceles, :scalene, :invalid

  Write a method that takes 3 sides of triangles and returns a
  symbol depending on the type of triangle (or :invalid)

rules:
  a triangle is invalid if the sum of the 2 shortest sides is <= longest side
    or any side has a length <= 0
  
  equilateral: all sides the same
  isosceles:   2 sides the same, 1 different
  scalene:     all sides different

Examples:

3 3 3 = equilateral
3 3 1.5
3 1.5 + = 4.5
4.5 is greater than 3, no side is 0
= isoceles
3 + 4 = 7, 7 > 4, no side is 0 = scalene

3 3 1.5
3 =? 3, 3 =? 1.5 => no
a !=? 3          => no
=> isosceles

DS:

Algorithm:
Given 3 integers, a, b, c
If any side is 0 or the sum of the 2 shortest sides <= longest
  Return :invalid
If a == b && b == c
  Return :equilateral
Else if a != b && b != c && c != a
  Return :scalene
Else
  Return :isosceles
=end

def triangle(a, b, c)
  if [a, b, c].include?(0) || [a, b, c].min(2).sum <= [a, b, c].max
    :invalid
  elsif a == b && b == c
    :equilateral
  elsif a != b && b != c && c != a
    :scalene
  else
    :isosceles
  end
end

# LS solution
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side >= sides.reduce(:+), sides.include?(0) # double largest side, cmp to sum
    :invalid                                                   # effectively removes largest from sum
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3 # only need to know 2 sides match because
    :isosceles                                            # equilateral has already been checked
  else
    :scalene
  end
end

#    2a >= a + b + c
#    -a    -a
# ->  a >= b + c

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# 18:16
