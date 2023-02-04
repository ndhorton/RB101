# Double char 2

# input: a string of potentially any ascii chars
# output: a new string with only the consonants doubled

# should include both upper and lower case
# an empty string as input returns an empty string

# A bcd E fgh I jklmn O pqrst U vwxyz

# if /[B-Db-dF-Hf-hJ-Nj-nP-Tp-tV-Zv-z]/ =~ char

# algo:
# -given a string
# -set consonant_doubled = empty string
# -iterate over chars in input string
# --if char is a consonant
# ---append char + char to consonant_doubled string
# --else
# ---append char to consonant_doubled string
# --end if
# -return consonant_doubled

CONSONANTS = /[B-Db-dF-Hf-hJ-Nj-nP-Tp-tV-Zv-z]/

def double_consonants(text)
  text.chars.each_with_object('') do |char, str|
    if CONSONANTS =~ char
      str << char * 2
    else
      str << char
    end
  end
end

# LS solution

# CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

# def double_consonants(string)
#   result = ''
#   string.each_char do |char|
#     result << char
#     result << char if CONSONANTS.include?(char.downcase)
#   end
#   result
# end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""