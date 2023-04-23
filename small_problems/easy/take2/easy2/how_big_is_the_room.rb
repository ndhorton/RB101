# How big is the room?

# input: get user input for length and width
# output: print a string containing the float representation of the area
# in both m^2 and ft^2 as floating point numbers

# Set METERS_TO_FT := 10.7639
# Prompt user "Enter the length of the room in meters:\n"
# Set length := get user input
# Prompt user "Enter the width of the room in meters:\n"
# Set width := get user input
# Convert length to float
# Convert width to float
# Set area_m2 = length * width
# Set area_ft2 = (length * METERS_TO_FT) * (width * METERS_TO_FT)
# Print("The area of the room is %f square meters (%f square feet)", area_m2, area_ft2)

# METERS2_TO_FT2 = 10.7639

# puts "Enter the length of the room in meters:"
# length = gets.chomp.to_f
# puts "Enter the width of the room in meters:"
# width = gets.chomp.to_f

# area_m2 = length * width
# area_ft2 = area_m2 * METERS2_TO_FT2

# puts "The area of the room is #{area_m2.round(2)} " \
#   "square meters (#{area_ft2.round(2)} square feet)."

# Further exploration

SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCM = 929.0304

puts "Enter the length of the room in feet:"
length = gets.to_f
puts "Enter the width of the room in feet:"
width = gets.to_f

area_sqfeet = length * width
area_sqinches = area_sqfeet * SQFEET_TO_SQINCHES
area_sqcm = area_sqfeet * SQFEET_TO_SQCM

puts format("The area of the room is %.2f square feet " \
  "(%.2f square inches, or %.2f square centimeters).",
  area_sqfeet, area_sqinches, area_sqcm)
