# input: a string
# output: a new string with all consecutive duplicate chars reduced to one instance of that char

# empty string should return empty string

# algo:
# -Given a string
# -set compact_string = ''
# -iterate over chars of string
# --if char is not the same as last char of compact_string
# ---append char to compact_string
# -return compact_string

def crunch(str)
  crunched_string = ''
  str.each_char do |char|
    crunched_string << char unless crunched_string[-1] == char
  end
  crunched_string
end

#LS solution

# def crunch(text)
#   index = 0
#   crunch_text = ''
#   while index <= text.length
#     crunch_text << text[index] unless text[index] == text[index + 1]
#     index += 1
#   end
#   crunch_text
# end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''