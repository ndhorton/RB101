puts ">> What is your name?"
name = gets.chomp
if name.empty?
  name = "Teddy"
end
puts "#{name} is #{rand(20..200)} years old!"