# Clean up the words

# input: a string whose letters are all lowercase which contains non-alphabetic
# characters
# output: a string based on the input string with all non-alphabetic characters
# replaced with spaces; if two or more non-alphabetic chars appear in a row, there
# will only be one space

# Given a string, string
# Set clean_string := ''
# Set index := 0
# While index < string length
#   if string[index] >= 97 and <= 122
#     Concatenate string[index] to clean_string
#   else if the last letter of clean_string != a space
#       Concatenate a space to clean_string
#   index += 1
# Return clean_string

def cleanup(string)
  # replaces one or more consecutive non-lowercase letter
  # chars with a single space. `gsub` applies throughout the
  # string
  string.gsub(/[^a-z]+/, ' ')
end

def cleanup(string)
  clean_string = ''

  string.each_char do |char|
    if ('a'..'z').cover?(char)
      clean_string << char
    elsif clean_string[-1] != ' '
      clean_string << ' '
    end
  end
  
  clean_string
end

# LS solutions

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
