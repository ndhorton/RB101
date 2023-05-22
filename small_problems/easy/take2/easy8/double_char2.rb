# Double Char (Part 2)

# CONSONANTS = /[bcdfghjklmnpqrstvwxyz]/i

# def double_consonants(string)
#   string.chars.each_with_object("") do |char, double_string|
#     if char.match?(CONSONANTS)
#       double_string << char << char
#     else
#       double_string << char
#     end
#   end
# end

# LS solution

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
