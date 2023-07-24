# Draw an ascii sine wave

# So this draws a wave of sorts with the x and y flipped
# and the zero point at 40 spaces into an 80 space grid
# TODO: find a way to iterate through values that can
#       act as inputs to the Math.sin() method so as to
#       calculate horizontal displacement according to sin
#       function value

grid_size = 80

direction = :up
displacement = 0
loop do
  if displacement >= 0
    point = (" " * 40) << (" " * displacement.abs) << "*"
  else
    point = (" " * (40 - displacement.abs)) << "*" 
  end
  puts point
  if direction == :up && displacement < 40
    displacement += 1
  elsif direction == :down && displacement > -40
    displacement -= 1
  elsif displacement == 40 && direction == :up
    direction = :down
    displacement -= 1
  elsif displacement == -40 && direction == :down
    direction = :up
    displacement += 1
  else
    puts "something went wrong"
    break
  end
  sleep(0.05)
end