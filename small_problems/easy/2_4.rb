print "What is your age? "
age = gets.chomp.strip.to_i
print "At what age would you like to retire? "
retirement_age = gets.chomp.strip.to_i

year_now = Time.new.year
years_left = retirement_age - age
retirement_year = year_now + years_left

puts "It's #{year_now}. You will retire in #{retirement_year}."
puts "You only have #{years_left} years of work to go!"