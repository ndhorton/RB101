# Uppercase Check

# input: given a string, text
# output: true or false Boolean object depending on whether all the alphabetic characters
# in the string are uppercase (true) or not (false)

# def uppercase?(text)
#   text == text.upcase
# end

def uppercase?(text)
  text.count("a-z") > 0 ? false : true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

