# How old is Teddy?

print "Enter a name: "
name = gets.chomp
name = "Teddy" if name.empty?

puts "#{name} is #{rand(20..200)} years old!"