# Matching Parentheses?

=begin

Thoughts:

easiest way that jumps out is to have an integer that must never be negative
so it begins at 0 and is incremented when we encounter a ( and decremented
when we encounter )
after iterating through the characters of the string, we will return the
result of asking, is the integer 0?
if it is positive, then there's an open bracket that hasn't been closed
if it is negative (we should have picked that up already) there's a closing
  bracket where none was opened

Need to iterate through each character
Check if it is '(' 
  in which case state += 1
or ')'
  in which case state -= 1
  if state < 0 return false
After iteration:
state == 0

Problem:

    write a method that returns true only if there are evenly matched opening
    and closing brackets in logically correct order, false otherwise

implicit:
  if there are an equal number of opening and closing brackets, they
    must be in the logical correct sequence. First ( and then )

    if there are no open brackets and we encounter a closing bracket, it
      seems safe to return false immediately


Examples:

'What (is) this?'
What is) this?'
What (is this?')

DS:
variable to track how many pairs are open
if it falls below 0, return false
if it is positive after iterating through all chars, return false

Algorithm:

Given a string
Set pairs_open := 0
Iterate through each char in string
  if char == '('
    pairs_open += 1
  else if char == ')'
    pairs_open -= 1
    if pairs_open < 0
      return false
Return result of comparison pairs_open == 0

=end

def balanced?(string)
  pairs_open = 0
  string.each_char do |char|
    if char == '('
      pairs_open += 1
    elsif char == ')'
      pairs_open -= 1
      return false if pairs_open < 0
    end
  end
  pairs_open == 0
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


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false

# 19:49



# Further exploration
=begin

square brackets and curly brackets work on same principle as parentheses
single- and double-quotes simply need to have an even count of each type
The problem with single-quotes, however, is that single-quotes double as apostrophes in
most computer situations outside of word processors and publishing software
(and even in a word processor one types an apostrophe with the same key and
the software infers from context how to treat the character)
A rudimentary inference from context could be
  - if there are adjacent letters on both sides of the ', then it's an apostrophe
  - however if there is an s to the left of the ' and a space to the right it is possibly
      an apostrophe: e.g. "the Jones' house" 
      This is not always the case though, e.g. 'dark satanic mills'
  - one would expect in most printed, edited work that a closing single-quote
    would have left-adjacent to it some kind of ,.!? punctuation such as 'Oh,' he said, 'I see.'
    but this only really applies to dialogue or reported speech of some kind.
  Ultimately this is a fairly non-trivial problem that would require a lot of research.
  
So 'Can you expand this method to take into account those characters?' -- in the
case of single-quotes, No, or at least, not unless apostrophes are forbidden as
valid elements of the input string, since the kind of word-processing engine
necessary to approximate reasonable judgement on what is an apostrophe and what
a single quote would require a lot more logic than a single method, or even a helper method.

The best compromise seems to be that if ' is surrounded by a letter either side then
it's an apostrophe. So "the Jones's house" is valid but not "the Jones' house"

This requires an index to do a simple lookaround

=end

ALPHABET = [*('a'..'z')] + [*('A'..'Z')]

def balanced?(string)
  parens = 0
  brackets = 0
  braces = 0
  single_quotes = 0
  string.each_char.with_index do |char, index|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    brackets += 1 if char == '['
    brackets -= 1 if char == ']'
    braces += 1 if char == '{'
    braces -= 1 if char == '}'
    if char == "'" && 
      !(ALPHABET.include?(string[index-1]) && ALPHABET.include?(string[index+1]))
      single_quotes += 1
    end
    break if parens < 0 || brackets < 0 || braces < 0
  end
  parens.zero? && brackets.zero? && braces.zero? &&
    string.count('"').even? && single_quotes.even?
end

p balanced?("[hello[]there]") == true
p balanced?("oh{hi{there}I}will(be)with you[{(in]}) a moment") == true
p balanced?("'hello,' he said. I didn't reply.")
p balanced?('{{}') == false
p balanced?(']good morning[') == false
p balanced?('" um this"" should not work') == false
p balanced?('"Good," he said, "its settled."') == true
p balanced?('can you escape single quotes or can\'t you') == true