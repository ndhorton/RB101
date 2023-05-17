# ddaaiillyy ddoouubbllee

# def crunch(text)
#   crunched_string = ''
#   text.each_char do |char|
#     crunched_string << char if crunched_string[-1] != char
#   end
#   crunched_string
# end

# LS solution

# def crunch(text)
#   index = 0
#   crunch_text = ''
#   while index <= text.length - 1
#     crunch_text << text[index] unless text[index] == text[index + 1]
#     index += 1
#   end
#   crunch_text
# end

# Further explorations

# If we stop iterating at `text.length` it actually works fine because
# on the final iteration the `unless` condition is met (`nil` is equal to `nil`)
# and so the method does not attempt to concatenate `nil` to the String object

# LS has avoided `each_char` because their solution wants to check the next char
# and an index counter is the easiest way to do that
# Since my version checked the last character in the output string instead
# of checking the next char in the input string, `each_char` works fine

def crunch(text)
  # The overall match selects a single char `(.)` and one or more consecutive
  # reccurrences of that char `\1{1,}`
  # Here capture group `\1` is only the char itself so when that is used
  # to replace the entire match `'\\1'` the `gsub` method substitutes the single char
  # for the whole match of consecutive same chars and since it is global, it does this
  # for any char with more than one consecutive occurrence.
  # 'Match any char with one or more occurrences of that same char immediately following'
  # 'Substitute capture group 1 for that match'
  text.gsub(/(.)\1{1,}/, "\\1")
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
