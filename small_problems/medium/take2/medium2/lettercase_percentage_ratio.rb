# Lettercase Percentage Ratio

=begin

Thoughts:

Let total = overall size of string
    lowercase = count of lowercase characters
    uppercase = count of uppercase characters

Problem:
input: a string
output: a hash with three pairs: % of lowercase letters, % of uppercase, % neither

rules: 
The string will always contain at least one character

Examples:

output hash of the form
{ lowercase: float percentage, uppercase: float percentage, neither: float percentage }

'abCdef 123'
total = 10
lowercase = 5
uppercase = 1
neither = 4

100 / total = 10
10 * lowercase = 50
so lowercase * (100 / total)

'AbCd +Ef'
total = 8
lowercase = 3
uppercase = 3
neither = 2

(lowercase * 100) / total

DS:

create a hash with three keys, lowercase, uppercase, neither

Algorithm:

Given a string
Set total := string.size
Set lowercase := count(string, 'a-z') * 100 fdiv total
Set uppercase := count(string, 'A-Z') * 100 fdiv total
Set neither := count(string, '^a-zA-Z') * 100 fdiv total
Set percentages := {
  lowercase: lowercase,
  uppercase: uppercase,
  neither: neither
}
Return percentages
=end

def letter_percentages(string)
  total = string.size
  
  lowercase = (string.count('a-z')).fdiv(total) * 100
  uppercase = (string.count('A-Z')).fdiv(total) * 100
  neither = (string.count('^a-zA-Z')).fdiv(total) * 100
    
  {
    lowercase: lowercase,
    uppercase: uppercase,
    neither: neither
  }
end

# LS solution
def letter_percentages(string)
  counts = {}
  percentages = {}  
  characters = string.chars
  length = string.length

  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:lowercase] = counts[:lowercase] / length.to_f * 100
  percentages[:uppercase] = counts[:uppercase] / length.to_f * 100
  percentages[:neither] = counts[:neither] / length.to_f * 100
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# 32:12 - completely forgot how to calculate percentages, total mental blank
# remember if we are trying to find x as a percentage of y, we essentially have
# a fraction x/y that needs to be put into a denominator of (x*?)/(y*?=100)
# so the easiest way is to do the division of the fraction x/y to get the decimal
# ratio (already a way of rewriting the percentage as a factor) and then multiply by 100
# eg 3 as a percentage of 12 = (3/12 = 0.25)
# since divisions and multiplications are inverse operations, you could also
# multiply the numerator x by 100 and then divide by y

# Further explorations

def letter_percentages(string)
  total = string.size
  lowercase = string.count('a-z').fdiv(total).round(2)
  uppercase = string.count('A-Z').fdiv(total).round(2)
  neither = string.count('^a-zA-Z').fdiv(total).round(2)
  {
    lowercase: lowercase,
    uppercase: uppercase,
    neither: neither
  }
end

p letter_percentages('abcdefGHI')