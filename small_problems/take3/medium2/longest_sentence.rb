# Longest Sentence

=begin

Notes:

questions:
Should newlines and non-space whitespace be included? Yes

Problem:
input:
output:

  Write a program that reads in a text file and then prints the longest
  sentence based on number of words. It should also print the number
  of words

rules:
  sentences end with `.` '!' or '?'
  any sequence of characters that are not spaces or sentence ending chars
    should be treated as a word

Examples:

DS:

Algorithm:
Set filestring := read in text file
Set sentences := split sentences on /.|?|!/
=end
t = Time.now
filestring = File.read("#{__dir__}/pg84.txt")
# sentences = filestring.split(/!|\?|\./)
# sentences = nil
# File.open("#{__dir__}/pg84.txt") do |f|
#   sentences = f.read.scan(/.+?[?!.]/m)
# end


# Further exploration

sentences = filestring.scan(/.+?[?!.]/m)
longest = sentences.max { |a, b| a.split.size <=> b.split.size }
puts "File.open, f.read, regex in block:"
puts Time.now - t
# Without regex
# Version with no period
# sentences = filestring.chars.chunk_while do |a, b|
#   b != '?' && b != '!' && b != '.'
# end
# sentences = sentences.map do |sentence|
#   sentence.reject { |char| char == '.' || char == '!' || char == '?' }.join
# end

# Without regex, with period - slice_when is just reverse-logic chunk_while
#                              used here just to test functionaliy
#                              could just as well use chunk_while and != instead of ==
#                              the parameter difference is the significant thing
# sentences = filestring.chars.slice_when do |a, b|
#   a == '?' || a == '!' || a ==  '.'
# end.map { |ch| ch.join }
# longest = sentences.max { |a, b| a.split.size <=> b.split.size }

# puts longest
# puts "--"
# puts "Word count: #{longest.split.size}"

# 38:30 - basically kept making mistakes with regex

# Further exploration

# paragraphs = filestring.split(/\r\n\r\n/) # how paragraphs are denoted in this text
# longest = paragraphs.max { |a, b| a.split.size <=> b.split.size } # assuming longest by word count
# puts longest
# puts "--"
# puts "Longest paragraph word count: #{longest.size}"

# words = filestring.scan(/[a-zA-Z\-']+/) 
# longest = words.max { |a, b| a.size <=> b.size } # max by chars
# puts "--"
# puts "Longest word: \"#{longest}\""
# puts "--"
# puts "#{longest.size} characters"
t = Time.now
sentences = [""]
File.open("#{__dir__}/pg84.txt") do |file|
  file.each_char do |char|
    if char == '.' || char == '?' || char == '!'
      sentences.last << char
      sentences << ""
    else
      sentences.last << char
    end
  end
end

longest = sentences.max { |a, b| a.split.size <=> b.split.size }
# puts longest
puts "File.open, each_char:"
puts Time.now - t