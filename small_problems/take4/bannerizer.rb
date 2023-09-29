# Bannerizer

=begin
Notes:

'+-' plus '-' * message length plus '-+'
'| ' plus ' ' * message length plus ' |'
'| ' plus message plus ' |'
bottom line same as first

Problem:
input: a string
output: print to screen, no significant return

  Write a method that takes a string argument and prints the string
  to the screen in the style of ASCII box given in the examples.

rules:
  must able to handle empty string
  assume 'short line of text' means it can be printed in one terminal line

Examples and test cases:

Data structures:

Algorithm:

subprocess print_border
Print to screen '+-' then '-' message length times then '-+'

subprocess print_empty_line
Print to screen '| ' then ' ' message length times then ' |'

Given a string, message
print_border(length of message)
print_empty_line(length of message)
Print to screen '| ' then message then ' |'
print_empty_line(length of message)
print_border(length of message)
=end

def print_border(message_length)
  puts "+-#{"-" * message_length}-+" 
end

def print_empty_line(message_length)
  puts "| #{" " * message_length} |"
end

# def print_in_box(message)
#   print_border(message.length)
#   print_empty_line(message.length)
#   puts "| #{message} |"
#   print_empty_line(message.length)
#   print_border(message.length)
# end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')

# 12:37

# Further exploration

MAXIMUM_LINE_LENGTH = 80
PADDING = 4
LINE_LENGTH = MAXIMUM_LINE_LENGTH - PADDING

def print_in_box(text)
  lines = text.scan(/.{1,#{LINE_LENGTH}}\Z|.{1,#{LINE_LENGTH}}\s/)
  print_border(LINE_LENGTH)
  print_empty_line(LINE_LENGTH)
  lines.each do |line|
    line = line.strip
    line = line + (' ' * (LINE_LENGTH - line.length))
    puts "| #{line} |"
  end
  print_empty_line(LINE_LENGTH)
  print_border(LINE_LENGTH)
end

text = File.read('/home/nicholas/trial.txt')

print_in_box(text)
