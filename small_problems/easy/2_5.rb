print 'What is your name? '
name = gets.chomp.strip
if name.end_with?('!')
  name.chomp!('!')
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end