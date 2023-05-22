# Double Char (Part 1)

# input: a string
# output: a new string where every character from the input string
# is doubled

# Given a string, string
# Set double_string := empty string
# Iterate over each char in string
#   Append char to double_string twice
# Return double_string

def repeater(string)
  string.chars.each_with_object('') do |char, double_string|
    double_string << char * 2
  end
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
