# Longest Sentence

=begin

Thoughts:

How do I handle newline characters?

text = File.open(path) { |file| file.read }

Problem:

Examples:

DS:

Algorithm:

=end

# PATH = "pg84.txt"
# text = File.open(PATH) { |file| file.read }
# text.gsub!(/\r\n/, ' ')
# sentences = text.split(/[.?!]/).map(&:lstrip)
# word_groups = sentences.map { |sentence| sentence.split }
# largest_word_group = word_groups.max { |a, b| a.length <=> b.length }
# longest_sentence = largest_word_group.join(' ')
# longest_word_count = largest_word_group.size

# puts "The longest sentence by word count is:"
# puts longest_sentence
# puts "word count: #{longest_word_count}"

# 31:40 - I really need to practice working with text files
# almost all of the solution time was reading documentation and Stack Overflow
# about whether I should use file.close, best practices, etc.

# LS solution - main difference is that only the chosen sentence
# gets cleaned up and the `/r/n` Windows newline formatting is not removed.
# However, for the word count, the non-destructive `strip` method is called so
# that `size` can be chained to get a word count minus the `/r/n` joining some words
# together, but only the return value of `size` is assigned to a variable. This way,
# the words are counted without the problematic non-printing newline chars, but they are left
# in the string itself to facilitate formatting when it is printed out.

# text = File.read("pg84.txt")
# sentences = text.split(/\.|\?|!/)
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# largest_sentence = largest_sentence.strip
# number_of_words = largest_sentence.split.size

# puts largest_sentence
# puts "Containing #{number_of_words}"

# Further explorations

# Keeping in the seperators.

# text = File.read("pg84.txt")
# sentences = text.scan(/[^.?!]+[.?!]/)
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# largest_sentence = largest_sentence.strip
# number_of_words = largest_sentence.split.size

# puts largest_sentence
# puts "Containing #{number_of_words}"

# Longest Paragraph and Longest Word
# This very much depends on definitions of paragraph and word

# Paragraphs are divided by '\r\n\r\n' double-newline

# Longest Paragraph
text = File.read("pg84.txt")
paragraphs = text.split(/\r\n\r\n/)
longest_paragraph = paragraphs.max_by(&:length)
longest_paragraph_word_count = longest_paragraph.split.map(&:strip).size
puts longest_paragraph
puts "--"
puts "#{longest_paragraph_word_count} words."

# I would say a word can only contain letters and hyphens
# so you could `scan` for /[\-a-zA-Z/

# Longest Word
# text = File.read("pg84.txt")
# words = text.scan(/[-a-zA-Z]+/)
# longest_word = words.max { |a, b| a.length <=> b.length }
# puts "The longest word is '#{longest_word}' at #{longest_word.length} characters"