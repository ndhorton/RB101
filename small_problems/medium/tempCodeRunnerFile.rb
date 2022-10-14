LINE_LENGTH = 80

def print_word_wrap(text)
  words = text.split
  stream_buffer = ''
  i = 0
  loop do
    break if i >= words.size - 1
    # if 2 words fit on line and the next word does NOT contain alphanumerics OR
    # 1 word fits on line and the next word does contain alphanumerics
    if ((words[i] + words[i+1] + stream_buffer + '  ').length <= LINE_LENGTH) &&
      ((words[i+1] =~ /[^A-Za-z0-9]/)) ||
      ((words[i] + stream_buffer + ' ').length <= LINE_LENGTH) &&
      (words[i+1] =~ /[A-Za-z0-9]/)
      stream_buffer << words[i] + ' '
    else
      puts stream_buffer
      stream_buffer = words[i] + ' '
    end
    i += 1
  end
  if (words[-1] + stream_buffer).length <= LINE_LENGTH
    puts stream_buffer + words[-1]
  else
    puts stream_buffer
    puts words[-1]
  end
end

def longest_paragraph(file_name)
  file = File.open(file_name)
  text = file.read
  file.close
  paragraphs = text.split("\n\n")
  paragraphs.map! { |paragraph| paragraph.gsub(/\n/, ' ') }
  longest = paragraphs.max_by { |paragraph| paragraph.split.size }
  word_count = longest.split.size
  print_word_wrap(longest)
  puts "--"
  puts "Containing #{word_count} words"
end