puts "Enter the length of the room in meters:"
length = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width = gets.chomp.to_f
area_m2 = length * width
area_ft2 = area_m2 * 10.7639
puts "The area of the room is #{area_m2.round(2)} square meters (#{area_ft2.round(2)} square feet)."
