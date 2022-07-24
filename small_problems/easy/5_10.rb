# input: a short string of text
# output: that string output to screen in an appropriately sized box

# the box needs to be:
# 2 spaces longer than the string, so a minimum of two spaces long even if the string is
# empty

# the top and bottom line is:
# '+', and then '-' the number of times the length of the string plus two, and then '+'
# next inner line would be the same but:
# '|', ' ', '|'

# the text line is:
# '|', ' ' (once), then the string, then ' ' (once), then '|'

# algo:
# -given a string
# -set border = the top and bottom according to above
# -set blank_line = the second and fourth according to above
# -print first two lines
# -print text line according to above
# -print the last two lines
# -return nil

LINE_LENGTH = 80

def break_into_lines(text)
  lines = []
  words = text.split(' ')
  until words.empty?
    line = ''
    loop do
      break if words.empty? || line.size + words[0].size >= LINE_LENGTH
      line << words.shift + ' '
    end
    line = line.ljust(LINE_LENGTH, ' ')
    lines << line
  end
  lines
end

def print_in_box(text)
  if text.size > LINE_LENGTH
    lines = break_into_lines(text)
  else
    lines = [text]
  end

  border = '+' + ('-' * (lines[0].size + 2)) + '+'
  blank_line = '|' + (' ' * (lines[0].size + 2)) + '|'

  puts border
  puts blank_line
  
  lines.each do |line|
    puts "| #{line} |"
  end

  puts blank_line
  puts border
  nil
end

text = 'Through the fence, between the curling flower spaces, I could see them hitting. They were coming toward where the flag was and I went along the fence. Luster was hunting in the grass by the flower tree. They took the flag out, and they were hitting. Then they put the flag back and they went to the table, and he hit and the other hit. Then they went on, and I went along the fence. Luster came away from the flower tree and we went along the fence and they stopped and we stopped and I looked through the fence while Luster was hunting in the grass.'

print_in_box(text)