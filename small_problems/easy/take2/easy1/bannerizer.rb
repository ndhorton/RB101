# Bannerizer

# input: a string, message
# output: print to screen a banner containing the message, such that
#   the top and bottom of the banner contain a '+' followed by 2 + len(message) hyphens
#     followed by another '+'
#   above and below the message are padding lines consisting of
#     '|' and then 2 + len(message) spaces and then '|'
#   The message itself in the middle. '|' plus a space precedes it,
#     a space plus a '+' follows it

# Given a string, message
# Set message_length := length(message)
# Set limit := '+' + ('-' * (message_length + 2)) + '+'
# Set padding := '|' + (' ' * (message_length + 2)) + '|'
# Print limit
# Print padding
# Print '| ' + message + ' |'
# Print padding
# Print limit
# Return

# def print_in_box(message)
#   message_length = message.length
  
#   limit = '+' << ('-' * (message_length + 2)) << '+'
#   padding = '|' << (' ' * (message_length + 2)) << '|'

#   puts limit
#   puts padding
#   puts "| #{message} |"
#   puts padding
#   puts limit
# end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')

# Further explorations

# Imperative string buffer version
# The problem I see with this is that strings as objects in other
# languages are often immutable, so building strings is very costly
# In that situation though, you could simply use arrays of chars and
# then join them once at the end

def scan_lines(message)
  # Given a string, message
  # Set lines := empty array
  # Set word := empty string
  # Set line := empty string
  # Iterate over each char in message
  #   if (char == ' ') && (line.length + word.length + 1 < 77)
  #     word << char
  #     line << word
  #     word.clear
  #   else if char == ' '
  #     word << char
  #     lines << line
  #     line = word
  #     word.clear
  #   else
  #     word << char
  # if line.size + word.size < 77
  #   lines << line + word
  # else
  #   lines << line
  #   line << word
  # end

  # If lines is empty
  #   lines << message
  
  # Iterate over each line in lines
  #   strip(line)
  
  # Return lines

  lines = []
  line = ''
  word = ''
  message.each_char do |char|
    if char == ' ' && line.length + word.length + 1 <= 76
      word << char
      line << word
      word = ''
    elsif char == ' '
      word << char
      lines << line.strip
      line = word
      word = '' # nb, you cannot use `word.clear` here because `line`
                # has just been set to point to the same string object as `word`
                # so if you destructively remove the content of that object from word
                # `line` will reflect that operation too. So you need to set `word` to
                # a *new* empty string object.
    else
      word << char
    end
  end
  if line.size + word.size <= 76
    lines << (line + word).strip
  else
    lines << line.strip
    lines << word.strip
  end

  lines << message if lines.empty?
  lines #.map(&:strip)
end

# Regex version

# def scan_lines(message)
#   lines = message.scan(/.{1,76}\z|.{1,75}\W/)
#   lines << message if lines.empty?
#   lines.map(&:strip)
# end


def print_in_box(message)
  lines = scan_lines(message)

  message_length = lines.max_by(&:size).length
  
  limit = '+' << ('-' * (message_length + 2)) << '+'
  padding = '|' << (' ' * (message_length + 2)) << '|'

  puts limit
  puts padding

  lines.each do |line|
    line_length = line.length
    formatted_line = '| ' + line + (' ' * (message_length - line_length)) + ' |'
    puts formatted_line
  end
  
  puts padding
  puts limit
end

text = 'One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked.'

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box(text)