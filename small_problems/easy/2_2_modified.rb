FACTOR_INCHES = 144
FACTOR_CM     = 6.4516

puts 'Enter the length of the room in feet:'
length = gets.chomp.to_f
puts 'Enter the width of the room in feet:'
width = gets.chomp.to_f

area_ft2     = length       * width
area_inches2 = area_ft2     * FACTOR_INCHES
area_cm2     = area_inches2 * FACTOR_CM

puts "The area of the room is #{area_ft2.round(2)} square feet " \
     "(#{area_inches2.round(2)} square inches, or #{area_cm2.round(2)} square centimeters)."
