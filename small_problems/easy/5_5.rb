# input: string of lowercased words with non-alphabetic chars present
# output: string with non-alphabetic chars replaced by spaces

# algo:
# -given a string
# - set cleaned_str = ''
# -iterate through the characters
# -if char is contained in a list of lowercase alphabetic chars
# --append char to cleaned_str
# -else
# --append ' ' to cleaned_str
# -return string

# def cleanup(str)
#   cleaned_str = ''
#   str.each_char do |char|
#     if ('a'..'z').include?(char)
#       cleaned_str << char
#     else
#       cleaned_str << ' ' unless cleaned_str[-1] == ' '
#     end
#   end
#   cleaned_str
# end

#LS solution

def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end


p cleanup("---what's my +*& line?") == ' what s my line '