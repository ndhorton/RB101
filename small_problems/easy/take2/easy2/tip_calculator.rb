# Tip Calculator

print "What is the bill? "
bill = gets.to_f
print "What is the tip percentage? "
tip_percent = gets.to_f

tip = bill * tip_percent / 100.0
total = bill + tip

puts format("The tip is $%.2f", tip)
puts format("The total is $%.2f", total)
