# Triangle Sides

=begin

A triangle is classified as follows:

    equilateral All 3 sides are of equal length
    isosceles 2 sides are of equal length, while the 3rd is different
    scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

=end

=begin
Notes:

Problem:
input: three numbers
output: a symbol

Write a method that checks if a triangle
given as three numbers representing side-lengths
a, b, c is equilateral, isosceles,
or scalene, or invalid, returning a symbol
that denotes these possibilities.

rules:
  equilateral all sides the same length
  isosceles exactly two sides the same length
  scalene all sides different lengths
  invalid - any side is 0 OR
            the longest side is >= sum of shorter sides

Examples and test cases:

Data structures:

Algorithm:
Given three numbers, a, b, c
If a, b, or c are less than or equal to 0 || the sum of the two smallest is not greater than the largest
  Return :invalid
else if all values are unique
  Return :scalene
else if there is only 1 unique value
  Return :equilateral
else
  Return :isosceles
=end

def triangle(a, b, c)
  sides = [a, b, c]
  if sides.include?(0) || sides.min(2).sum <= sides.max
    :invalid
  elsif sides.uniq == sides
    :scalene
  elsif sides.uniq.size == 1
    :equilateral
  else
    :isosceles
  end
end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side >= sides.reduce(:+), sides.include?(0)
    :invalid
  when sides.uniq == sides
    :scalene
  when sides.uniq.size == 1
    :equilateral
  else
    :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# 13:48