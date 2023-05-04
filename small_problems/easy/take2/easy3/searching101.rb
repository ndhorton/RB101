# Searching 101

ORDINALS = %w(1st 2nd 3rd 4th 5th)

def prompt(message)
  print "==> #{message}"
end

first_five = ORDINALS.each_with_object([]) do |ordinal, array|
  prompt("Enter the #{ordinal} number: ")
  array << gets.chomp.to_i
end

prompt("Enter the final number: ")
final = gets.chomp.to_i

if first_five.include?(final)
  puts "The number #{final} appears in #{first_five}."
else
  puts "The number #{final} does not appear in #{first_five}."
end

