numbers = [1, 2, 3, 4]

# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# 1
# 3


# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# i would guess it will print 1 and 2

# ...and that is correct

numbers.each_with_index do |number, index|
  p "#{index} #{numbers.inspect} #{number}"
  numbers.shift(1)
end
