# When Will I Retire?

print "What is your age? "
age = gets.to_i
print "At what age would you like to retire? "
retirement_age = gets.to_i

this_year = Time.now.year
years_to_retirement = retirement_age - age
retirement_year = years_to_retirement + this_year

puts "It's #{this_year}. You will retire in #{retirement_year}."
puts "You have only #{years_to_retirement} years of work to go!"