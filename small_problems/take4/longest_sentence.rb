# Longest Sentence

=begin
Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

 (Note that each -- counts as a word.)
=end

=begin

Notes:

Problem:
input: a text file
output: print to screen, no significant return

Write a method that takes a text file and prints the longest sentence
by word-count followed by the word-count for that sentence.

Examples / test cases:
  sentences end with '.', '!', '?'
  a word is any sequence of chars execept spaces and sentence-ending characters

Data Structures:

Algorithm:
Given the name of a text file, pathname
Set text := open, read and close pathname
Set sentences := split text into sentences on sentence-ending characters
Set longest := empty string
Set longest_word_count := 0
Iterate through each sentence in sentence
  Set word_count := split sentence into words and count words
  If word_count > longest_word_count
    longest = sentence
    longest_word_count = word_count
Print longest
Print longest_word_count
=end

PATHNAME = "#{__dir__}/pg84.txt"
PUNCTUATION = %w( . ? ! )

def longest_sentence(pathname)
  text = File.read(pathname)
  # sentences = text.split(/\.|\!|\?/) # original solution
  
  # Further exploration lines below
  # sentences = text.scan(/[^!?.]+[.?!]/)
  # alternative without Regex
  sentences = text.each_char.slice_when do |a, b|
    PUNCTUATION.include?(a)
  end.map(&:join)
  # end further exploration

  longest = ''
  longest_word_count = 0
  sentences.each do |sentence|
    word_count = sentence.split.size
    if word_count > longest_word_count
      longest = sentence
      longest_word_count = word_count
    end
  end
  puts longest
  puts '--'
  puts longest_word_count
end

longest_sentence(PATHNAME)

# 13:49
