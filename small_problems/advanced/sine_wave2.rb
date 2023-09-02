# Draw a horizontal ascii sine wave over a single period

DENOMINATOR = 15
AMPLITUDE = 15
PERIOD = DENOMINATOR * 2 + 1

def screen_hash_new
  screen_hash = {}
  (-AMPLITUDE).upto(-1) do |input_value|
    screen_hash[input_value] = AMPLITUDE + input_value.abs
  end
  (0).upto(AMPLITUDE) do |input_value|
    screen_hash[input_value] = AMPLITUDE - input_value
  end
  screen_hash
end

def screen_new
  Array.new(AMPLITUDE * 2 + 1) { Array.new(PERIOD) { "   " } }
end

thetas = []
0.upto(PERIOD - 1) do |coefficient|
  # thetas << Rational(coefficient * Math::PI, DENOMINATOR)
  thetas << (coefficient * Math::PI).fdiv(DENOMINATOR)
end

sin_values = []
thetas.each do |theta|
  sin_values << (Math.sin(theta) * AMPLITUDE).round
end

screen = screen_new()
screen_hash = screen_hash_new()

sin_values.each_with_index do |row_placement, column|
  screen[screen_hash[row_placement]][column] = " * "
end

# screen.each do |row|
#   if row.count(" * ") == 3
#     row.map! do |square|
#       if square == " * "
#         '=*='
#       else
#         '==='
#       end
#     end
#   end
# end

screen.each do |row|
  puts row.join
end
