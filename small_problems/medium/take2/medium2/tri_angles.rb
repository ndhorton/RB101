# Tri-Angles

=begin

Thoughts:

Problem:

Write a method that takes three numbers a, b, c representing angles of triangle
Return symbol :right, :acute, :obtuse, or :invalid

rules:

:invalid means [a, b, c].sum  != 180 || a <= 0, b <= 0, c <= 0

:right means [a, b, c].include?(90)

:acute means a < 90 && b < 90 && c < 90

:obtuse means a > 90 || b > 90 || c > 90

a single case statement that tests invalid first, then right, then acute, then obtuse

Examples:

DS:

Algorithm:

Given three integers, angle1, angle2, angle3
if [a, b, c].sum  != 180 || (angle1 <= 0 || angle2 <= 0 || angle3 <= 0)
  return :invalid
else if [angle1, angle2, angle3].include?(90)
  return :right
else if angle1 < 90 && angle2 < 90 && angle3 < 90
  return :acute
else if [angle1, angle2, angle3].any? { |angle| angle > 90 }
  return :obtuse


=end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  case
  when angles.sum != 180, angles.any? { |angle| angle <= 0 }
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  when angles.any? { |angle| angle > 90 } # LS uses `else` here
    :obtuse
  end
end


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# 19:24