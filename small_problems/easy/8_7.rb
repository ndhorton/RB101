# Double char

# input: a string
# output: a new string where every char from the input string has been doubled

# implicit: an empty string for input returns an empty string
# no special cases for non-alphanumerics

# is type-checking required or can i assume the input will be a string?
# Assume no type checking

# algo:
# -given a string, text
# -set doubled_text = empty string
# -iterate over each character, char, in text
# --append char + char to doubled_text
# -return doubled_text

# def repeater(text)
#   text.chars.each_with_object('') { |char, str| str << char * 2 }
# end

def repeater(string)
  result = ''
  string.each_char do |char|
    # result.<<(char).<<(char)
    result << char << char
  end
  result
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''