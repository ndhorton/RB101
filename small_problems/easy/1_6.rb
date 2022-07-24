# Reverse It (Part 2)

def reverse_words(string)
  string.split.map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
