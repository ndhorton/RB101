# Tri-Angles

=begin

Notes:

questions:
do I need to check for negative arguments? No

Problem:
input: 3 integer angles
output: :right, :acute, :obtuse or :invalid

  Write a method that checks:
  if any angle == 0 or sum of angles != 180 then invalid
  if any angle == 90 then right
  if any angle > 90 then obtuse
  otherwise acute 

rules:
  angles will be non-negative integers representing degrees

Examples:

60 70 50 -
no angle is 90, no angle > 90
acute

30 90 60 -
one angle is 90 so right

DS:

Algorithm:
Given three angles, angle1, angle2, angle3
Set angles = array of angle1, angle2, angle3
If angles contains 0 or sum of angles != 180
  Return :invalid
Else if angles contains 90
  Return :right
Else if angles maximum value > 90
  Return :obtuse
Else
  Return :acute
=end

def triangle(*angles)
  if angles.include?(0) || angles.sum != 180
    :invalid
  elsif angles.include?(90)
    :right
  elsif angles.max > 90
    :obtuse
  else
    :acute
  end
end

# LS solution
def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180 || angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# 9:49
