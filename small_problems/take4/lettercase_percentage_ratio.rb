# Lettercase Percentage Ratio

=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.
=end

=begin
Notes:

one approach:
total = take size of String
lower_count = count lowercase characters
upper_count = count uppercase
neither_count = count neither
set the hash values by e.g lower_count.fdiv(total) * 100

Problem:
input: a string
output: a hash, :symbol => float

Write a method that takes a string and returns a hash where the key-value pairs
represent: 
- percentage of lowercase characters
- percentage of uppercase characters
- percentage neither

rules:
  the percentage value should be a float
  the keys should be symbols

Examples and test cases:

a b C d e f ' ' 1 2 3 -> 10
lowercase = 5
uppercase = 1
neither = 4

{
  :lowercase => 50.0
  :uppercase => 10.0
  :neither => 40.0

}

Data structures:

Algorithm:
Given a string, string
Set total := size of string
Set lowercase_count := count lowercase letters in string
Set uppercase_count := count uppercase in string
Set neither_count := count characters other than letters in string
Set percentages := empty hash
For :lowercase, :uppercase, :neither, set the value := e.g. lowercase float divided by total * 100
Return percentages
=end

def letter_percentages(string)
  total = string.size
  lowercase_count = string.count('a-z')
  uppercase_count = string.count('A-Z')
  neither_count = string.count('^a-zA-Z')

  {
    lowercase: (lowercase_count.fdiv(total) * 100).round(1),
    uppercase: (uppercase_count.fdiv(total) * 100).round(1),
    neither:   (neither_count.fdiv(total) * 100).round(1)
  }
end

p letter_percentages('abcdefGHI')

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# 18:38