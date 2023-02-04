# Longest word

def longest_word(file_name)
  file = File.open(file_name)
  text = file.read
  file.close
  words = text.split(/[^A-Za-z]/).map { |word| word.strip }
  longest = words.max_by { |word| word.size }
  char_count = longest.size
  puts longest
  puts "--"
  puts "Containing #{char_count} characters"
end

longest_word("/home/nicholas/launch_school/rb101/small_problems/medium/2_1.txt")
puts
longest_word("/home/nicholas/launch_school/rb101/small_problems/medium/paragraphs.txt")
