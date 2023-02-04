# Tri-Angles

=begin
P:
input: three integers representing angle measures in degrees
output: a symbol expressing if the triangle is
:invalid -> a + b + c != 180 || [a, b, c].include?(0)
:right -> [a,b,c].include?(90)
:obtuse -> [a,b,c] contains any member > 90
:acute -> [a,b,c] contains not one member >= 90 (else?)

A:
given three integers a, b, c
if a + b + c != 180 || 0 E {a,b,c}
  return :invalid
else if 90 E {a,b,c} 
  return :right
else if {a,b,c} has any member greater than 90
  return :obtuse
else if {a,b,c} has not one member >= 90
  return :acute
=end

def triangle(a, b, c)
  angles = [a, b, c]
  if angles.reduce(:+) != 180 || angles.include?(0)
    :invalid
  elsif angles.include?(90)
    :right
  elsif angles.any? { |angle| angle > 90 }
    :obtuse
  elsif angles.none? { |angle| angle >= 90 }
    :acute
  end
end

# LS solution
def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180, angles.include?(0)
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