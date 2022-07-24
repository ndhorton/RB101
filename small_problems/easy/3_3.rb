# Counting the number of characters

print "Please write word or multiple words: "
input_string = gets.chomp
# number_of_chars = input_string.split.join.length
# LS solution:
number_of_chars = input_string.delete(' ').size
puts "There are #{number_of_chars} characters in \"#{input_string}\"."