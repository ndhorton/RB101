def titleize(string)
  words = string.split
  capital_words = words.map { |word| word.capitalize }
  titleized_string = string
  capital_words.each_with_index do |word, idx|
    titleized_string = titleized_string.gsub(words[idx], word)
  end
  titleized_string
end

words = "the flintstones rock"

p titleize(words)
p words

# ls solution
p words.split.map { |word| word.capitalize }.join(' ')
# this would not preserve original spacing unless it is regular.
# though since the method is called "titleize" making the spacing
# regular is probably an ok side-effect