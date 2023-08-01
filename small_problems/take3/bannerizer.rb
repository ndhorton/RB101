=begin

Notes:
questions:
  How long can the string be?

print top
print blank
print stringline
print blank
print top

Problem:
input: a string
output: output to screen the string in a box

  Write a method that will generate a surrounding box when
  outputting a given string

rules:
  box top and botton begin and end with '+'
    and '-' * length of string + 2
  blank line '|' begin and end with length of
    string + 2 spaces
  the above remains true for an empty string

Examples:

+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
a space either side the string
a 'blank' line above and below
top and bottom of box need length of string + 2 dashes

empty string produces
+--+
|  |
|  |
|  |
+--+

DS:

Algorithm:

Given a string, message
1) Print '+' and as many '-' as the length of the string + 2, then '+'
2) Print  '|' and as many spaces as the length of the string + 2, then '|'
3) Print '|', 1 space, the string, 1 space, '|'
repeat 2
repeat 1
Return

=end

def print_in_box(message)
  lid = "+#{'-' * (message.length + 2)}+"
  padding = "|#{' ' * (message.length + 2)}|"
  message_line = "| #{message} |"

  puts lid
  puts padding
  puts message_line
  puts padding
  puts lid
end

# Further exploration
=begin

easiest with regex though it might be worth remembering the iterative
buffer-based solution I used the first time

scan /[^ ].{1, #{width - 1}}(?=\s|\Z)/}

I think what gets difficult is knowing how to handle whitespace
basically, you need to test whether the word-buffer will fit in the line-buffer
if so push it. Then check if the whitespace char will fit
  I think this is where i started constructing a second word-buffer to do look ahead
    

iterate through each char pushing characters to a word-buffer until
you reach whitespace
if whitespace is reached check the size of the line-buffer
  if the word-buffer fits on the end of the line-buffer without exceeding width
    push word-buffer to line-buffer
    clear word-buffer
  else
    push line-buffer to the lines array
else    
  push character to word-buffer

=end

MAX_WIDTH = 80 - 4 # 2 spaces padding plus the 2 wall characters '|'

def print_in_box(message)
  width = (message.size > MAX_WIDTH) ? MAX_WIDTH : message.size
  lid = "+#{'-' * (width + 2)}+"
  padding = "|#{' ' * (width + 2)}|"
  lines = message.scan(/[^ ].{1,#{width - 1}}(?=\s|\z)/)

  puts lid
  puts padding
  lines.each do |line|
    extra_pad = width - line.length
    line = "#{line}#{' ' * extra_pad}"
    puts "| #{line} |"
  end    
  puts padding
  puts lid
end
# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')

# This implementation
# does not preserve multiple spaces
# does not preserve indentation
# does not preserve paragraphs formatting, or empty lines
# DOES ensure that there is no extraneous whitespace
# at the start or end of each line
def split_lines(text)
  width = (text.size > MAX_WIDTH) ? MAX_WIDTH : text.size
  words = text.split

  line_buffer = ''
  lines = words.each_with_object([]) do |word, lines|
    if line_buffer.empty?
      line_buffer << word
    elsif line_buffer.size + word.size + 1 <= width
      line_buffer << ' ' << word
    else
      lines << line_buffer
      line_buffer = word
    end
  end
  lines << line_buffer
end

def print_in_box(message)
  width = (message.size > MAX_WIDTH) ? MAX_WIDTH : message.size
  lid = "+#{'-' * (width + 2)}+"
  padding = "|#{' ' * (width + 2)}|"
  lines = split_lines(message)

  puts lid
  puts padding
  lines.each do |line|
    extra_pad = width - line.length
    line = "#{line}#{' ' * extra_pad}"
    puts "| #{line} |"
  end    
  puts padding
  puts lid
end

text = File.read("#{__dir__}/death_in_venice.txt")
print_in_box(text)
print_in_box('To boldly go where no one has gone before.')
print_in_box('')
# 14:00
