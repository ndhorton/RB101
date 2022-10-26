# Matching Parentheses?

=begin
P:
input: a string
output: true if the parentheses open and close properly, false otherwise
counting opening and closing parentheses isn't enough
you could have ')(' and the count is write but usage is wrong
so maybe:
a pairs_open integer, which tracks how many pairs have started
if pairs_open == 0 when you encounter a ')' return false
else if pairs_open > 0 then you decrement and carry on parsing
if you encounter a '(' then increment pairs_open
if you get to the end and pairs_open is not 0
  return false
otherwise return true

A:
given a string
split into array of chars, characters
set pairs_open = 0
iterate over each character in characters
  if pairs_open == 0 AND character == ')'
    return false
  
  if character == '('
    pairs_open+
  else if character == ')'
    pairs_open-
if pairs_open > 0
  return false
return true

=end

# def balanced?(string)
#   characters = string.chars
#   pairs_open = 0
  
#   characters.each do |character|
#     return false if character == ')' && pairs_open == 0
  
#     if character == '('
#       pairs_open += 1
#     elsif character == ')'
#       pairs_open -= 1
#     end
#   end

#   !!(pairs_open == 0)
# end

# LS solution
# def balanced?(string)
#   parens = 0
  
#   string.each_char do |char|
#     parens += 1 if char == '('
#     parens -= 1 if char == ')'
#     break if parens < 0
#   end

#   parens.zero?
# end

# the single quotes thing below is potentially flawed because ASCII doesn't distinguish between
# single quote and apostrophe, and even in unicode you would have to define
# whether ASCII straight quote or unicode right-closing quote is to be used
# as apostrophe and what the rules are.
# Then again, you could do more complex lexical analysis on the position of the
# char, like whether it is followed directly by a letter (apostrophe)
# This would mean having to look ahead though, which would mean refactoring this
# significantly. Of course, if what we're doing here is for an interpreter/compiler,
# it's likely that there's no such thing as an apostrophe.

# Further exploration
def balanced?(string)
  parens = 0
  brackets = 0
  braces = 0
  single_quotes = 0
  double_quotes = 0

  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    
    brackets += 1 if char == '['
    brackets -= 1 if char == ']'

    braces += 1 if char == '{'
    braces -= 1 if char == '}'
    
    if char == "'" && single_quotes == 0
      single_quotes += 1
    elsif char == "'" && single_quotes > 0
      single_quotes -= 1 
    end
    
    if char == '"' && double_quotes == 0
      double_quotes += 1
    elsif char == '"' && double_quotes > 0
      double_quotes -= 1
    end

    break if parens < 0 || brackets < 0 || braces < 0 || 
      single_quotes < 0 || double_quotes < 0
  end

  (parens.zero? && brackets.zero? && braces.zero? &&
    single_quotes.zero? && double_quotes.zero?)
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

p balanced?('[(\'hello\'), ("#{index}")]')
