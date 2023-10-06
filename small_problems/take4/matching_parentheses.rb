# Matching Parentheses?

=begin

Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).

=end

=begin
Notes:

approach:
create one variable open_pairs
iterate through characters
  if character is '('
    open_pairs = open_pairs + 1
  else if character is ')'
    open_pairs = open_pairs - 1
  if open_pairs is ever negative, return false
Return boolean result of (open_pairs == 0)

Problem:
input: a string
output: boolean true or false

rules:
  balanced pairs must start with '(' not ')'
  if there are no parentheses return true

Examples and test cases:

Data structures:

Algorithm:
Given a string, string
Set open_pairs := 0
Iterate through each character in string
  if character is '('
    open_pairs = open_pairs + 1
  else if character is ')'
    open_pairs = open_pairs - 1
  if open_pairs is negative, return false
Return boolean result of (open_pairs == 0)
=end

def balanced?(string)
  open_pairs = 0
  string.each_char do |char|
    open_pairs += 1 if char == '('
    open_pairs -= 1 if char == ')'
    break if open_pairs.negative?
  end
  open_pairs.zero?
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

# 6:56
