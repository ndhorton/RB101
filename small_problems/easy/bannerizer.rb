# Bannerizer

# input: line of text
# output: text printed within box according to examples

# text must have 1 space either side, line of space above and below
# first and last line identical:
#   '+' then '-' * length of text plus 2 spaces then '+'
# blank lines need '|' plus ' ' * length of text + 2 plus '|'
# text line needs '| ' plus text plus ' |'

# START
# print '+-' + ('-' * text_length) + '-+'
# print '| ' + (' ' * text_length) + ' |'
# print '| ' + text + ' |'
# print '+-' + ('-' * text_length) + '-+'
# END

def print_in_box(text)
  puts '+-' + '-' * text.length + '-+'
  puts '| ' + ' ' * text.length + ' |'
  puts '| ' + text + ' |'
  puts '| ' + ' ' * text.length + ' |'
  puts '+-' + '-' * text.length + '-+'
end

# LS solution

# def print_in_box(message)
#   horizontal_rule = "+#{'-' * (message.size + 2)}+"
#   empty_line = "|#{' ' * (message.size + 2)}|"

#   puts horizontal_rule
#   puts empty_line

#   puts "| #{message} |"
#   puts empty_line
#   puts horizontal_rule
# end

def split_lines(text, len=70)
  line_buffer = ''
  words = text.split
  lines = []

  words.each do |word|
    if word.size + line_buffer.size < len
      line_buffer << word + ' '
    else
      lines << line_buffer
      line_buffer = word + ' '
    end
  end

  lines << line_buffer
end

def print_in_box(text)
  # lines = text.split(/(.{1,70} )/).reject(&:empty?)
  lines = split_lines(text, 40)
  max_line_length = lines.max_by(&:size).size

  horizontal_rule = "+#{'-' * (max_line_length + 2)}+"
  empty_line = "|#{' ' * (max_line_length + 2)}|"

  puts horizontal_rule
  puts empty_line
  lines.each do |line|
    puts "| #{line}#{' ' * (max_line_length - line.length)} |"
  end
  puts empty_line
  puts horizontal_rule
end


str = "The reality that I had known no longer existed. It sufficed that Mme. Swann did not appear, in the same attire and at the same moment, for the whole avenue to be altered. The places that we have known belong now only to the little world of space on which we map them for our own convenience. None of them was ever more than a thin slice, held between the contiguous impressions that composed our life at that time; remembrance of a particular form is but regret for a particular moment; and houses, roads, avenues are as fugitive, alas, as the years"
print_in_box(str)
