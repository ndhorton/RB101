# Uppercase check

# input: a string
# output: a boolean object
# goal: check only the alphabetic characters for case;
#   return true if they are all uppercase, false otherwise

# special case: the empty string => return true

# Given a string, str
# Iterate over each char in str
#   If char is a lowercase letter
#     return false
# Return true

def uppercase?(str)
  str.chars.none? { |char| (97..122) === char.ord }
end

# LS solution

def uppercase?(str)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true