# Longest Sentence

=begin
-given a file text.txt
-open file
-set file_data = read file
-close file
-remove newline characters
-set sentences = split file_data on '.' || '!' || '?'
-set sentence_lengths = []
-iterate over every sentence in sentences
--append length of sentence to sentence_lengths
-find maximum in sentence_lengths
=end
# ("/home/nicholas/launch_school/rb101/small_problems/medium/pg84.txt")

# file = File.open("/home/nicholas/launch_school/rb101/small_problems/medium/2_1.txt")

# file = File.open(file_name)
# file_data = file.read
# file.close
# file_data.gsub!(/\n/, ' ')
# sentences = file_data.split(/[.?!]/)
# sentences.map { |sentence| sentence.size}.max

# file_data.gsub!(/  /, ' ')

# sentences = []
# buffer = ""

# file_data.chars.each do |char|
#   if char == '.' || char == '!' || char == '?'
#     buffer << char
#     sentences << buffer
#     buffer = ''
#   else
#     buffer << char
#   end
# end
# sentences << buffer unless buffer.empty?

# sentence_lengths = sentences.each_with_object([]) do |sentence, lengths|
#   lengths << sentence.split(' ').size
# end

# I forgot that I had to print the sentence rather than just the word count
# Always re-check question after researching implementation details
# def longest_sentence(file_name)
#   file = File.open(file_name)
#   file_data = file.read
#   file.close

#   file_data.gsub!(/\n/, ' ')
#   sentences = file_data.split(/[.?!]/)
#   sentence_word_counts = sentences.map { |sentence| sentence.split.size }

#   largest_word_count = sentence_word_counts.max
# end

# # LS solution

# def longest_sentence(file_name)
#   text = File.read(file_name)
#   # This solution leaves in some of the newline characters
#   sentences = text.split(/\.|\?|!/)
#   largest_sentence = sentences.max_by { |sentence| sentence.split.size }
#   largest_sentence = largest_sentence.strip
#   number_of_words = largest_sentence.split.size

#   puts "#{largest_sentence.inspect}"
#   puts "Containing #{number_of_words} words"
# end

LINE_LENGTH = 80

# def print_word_wrap(text)
#   words = text.split
#   stream_buffer = ''
#   words.each_with_index do |word, i|

#     if word.length + stream_buffer.length + 1 <= LINE_LENGTH

#       if words[i + 1] =~ /[A-Za-z0-9]/ 
#         if stream_buffer.length + word.length + words[i + 1].length + 2 <= LINE_LENGTH
#           stream_buffer << word + ' '
#         else
#           puts stream_buffer
#           stream_buffer = word + ' '
#         end
#       else
#         stream_buffer << word + ' '
#       end
#     else
#       puts stream_buffer
#       stream_buffer = word + ' '
#     end
#   end
#   puts stream_buffer unless stream_buffer.empty?   
# end




def print_word_wrap(text)
  words = text.split
  stream_buffer = ''
  i = 0
  loop do
    break if i >= words.size - 1
    if (words[i] + stream_buffer + ' ').length <= LINE_LENGTH
      if words[i+1] =~ /[A-Za-z0-9]/
        stream_buffer << words[i] + ' '
      else
        if (words[i] + words[i+1] + stream_buffer + '  ').length <= LINE_LENGTH 
          stream_buffer << words[i] + ' '
        else
          puts stream_buffer
          stream_buffer = words[i] + ' '
        end
      end
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


def longest_sentence(file_name)
  file = File.open(file_name)
  text = file.read
  file.close

  text.gsub!(/\n/, ' ')
  buffer = ''
  sentences = []
  text.each_char do |char|
    if /\.|\?|!/ =~ char
      buffer << char
      sentences << buffer
      buffer = ''
    else
      buffer << char
    end
  end
  sentences << buffer unless buffer.empty?
  
  longest_sentence = sentences.max_by { |sentence| sentence.split.size }.strip
  word_count = longest_sentence.split.size

  print_word_wrap(longest_sentence)
  puts "--"
  puts "Containing #{word_count} words"
end


longest_sentence("/home/nicholas/launch_school/rb101/small_problems/medium/2_1.txt")
puts
longest_sentence("/home/nicholas/launch_school/rb101/small_problems/medium/pg84.txt")