# Triangle Sides

=begin
P:
input: three integers
output: :invalid, if the two smaller integers add to a number <= largest
:equilateral if all three integers are the same
:isoceles if only two of the integers are the same
:scalene if they are all different

A:
-subprocess invalid?
  given array triangle
  iterate over each int in triangle
    if int <= 0
      return true
  sort triangle
  set maximum = pop triangle
  if triangle[0] + triangle[1] <= maximum
    return :invalid

given three integers
set triangle = array of the three integers
if invalid?(triangle)
  return :invalid
if triangle[0] == triangle[1] && triangle[0] == triangle[2]
  return :equilateral
else if triangle[0] == triangle[1] || triangle[0] == triangle[2] || triangle[1] == triangle[2]
  return :isosceles
else
  return :scalene

=end

# def invalid?(triangle_arr)
#   triangle_arr.each { |side| return true if side <= 0 }
#   triangle_arr = triangle_arr.sort
#   longest = triangle_arr.pop
#   return true if triangle_arr[0] + triangle_arr[1] <= longest
#   false
# end

# def triangle(a, b, c)
#   return :invalid if invalid?([a, b, c])
#   if a == b && a == c
#     return :equilateral
#   elsif a == b || b == c || a == c
#     return :isosceles
#   end
#   :scalene
# end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
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

