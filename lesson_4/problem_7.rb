statement = "The Flintstones Rock"

statement_chars = statement.chars.uniq.sort
statement_chars.keep_if { |char| ('A'..'z').include?(char) }

letter_frequencies = {}
statement_chars.each_with_index do |char, index|
  letter_frequencies[char] = statement.count(char)
end

p letter_frequencies

# LS solution

# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a

# letters.each do |letter|
#   letter_frequency = statement.count(letter)
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# p result