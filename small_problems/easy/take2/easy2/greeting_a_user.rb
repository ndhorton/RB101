# Greeting a user

# print "What is your name? "
# name = gets.chomp
# if name[-1] == '!'
#   puts "HELLO #{name[0...-1].upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

# LS solution / further exploration
print "What is your name? "
name = gets
name.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end