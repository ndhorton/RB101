# Matching Parentheses?

=begin

Notes:

questions:

Problem:
input: string, text
output: true if parentheses balance orthographically correct, false otherwise

  Write a method that takes a string and determines if all parentheses
  in the string balance. This means, an opening parentheses must be
  followed by a closing parentheses and a closing parentheses must
  be preceded by a an opening parentheses

rules:
  order is important as well as pairing

Examples:

( + 1 = 1
) - 1 = 0

) - 1 = -1 return false

DS:

Algorithm:
Given a string, text
Set parentheses := 0
Iterate over each character in text
  If character == '('
    Increment parentheses
  Else if character == ')'
    Decrement parentheses
  End if
  If parentheses < 0
    Return false
  End if
End iteration
Return parentheses == 0
=end

def balanced?(text)
  parentheses = 0
  text.each_char do |character|
    if character == '('
      parentheses += 1
    elsif character == ')'
      parentheses -= 1
    end
    return false if parentheses < 0
  end
  parentheses == 0
end

# LS solution
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

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
    single_quotes += 1 if char == "'"
    double_quotes += 1 if char == '"'

    break if parens < 0 || brackets < 0 || braces < 0
  end

  parens.zero? && brackets.zero? && braces.zero? &&
    single_quotes.even? && double_quotes.even?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false

# 8:38 -- important to remember that you also need to test whether parentheses == 0
#         at the end of the iteration rather than just returning true
#         working through an example of each pattern would have avoided that misstep

p balanced?("{([test])}") == true
p balanced?("}(]test)") == false
