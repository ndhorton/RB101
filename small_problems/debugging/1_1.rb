# Countdown

# def decrease(counter)
#   counter -= 1
# end

# counter = 10

# 10.times do
#   puts counter
#   counter = decrease(counter)
# end

# puts 'LAUNCH!'

# Further explorations
# def decrease(counter)
#   counter - 1
# end

# counter = 10

# loop do
#   puts counter
#   counter = decrease(counter)
#   break if counter <= 0
# end

# puts 'LAUNCH!'

def decrease(counter)
  counter - 1
end

counter = 10

while counter > 0
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'