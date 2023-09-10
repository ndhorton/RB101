# Lettercase Percentage Ratio

=begin

Notes:


questions:

Problem:
input: string
output: hash

  Write a method that takes a string argument and returns a hash
  containing three entries:
    1) :lowercase - percentage of lowercase characters in the string
    2) :uppercase - percentage of uppercase ...
    3) :neither   - percentage of non-letter chars

rules:
  string argument will always contain at least 1 char

Examples:

a b d e f  - 5
C          - 1
123space   - 4

string size = 10
lowercase = 5
uppercase = 1
neither = 4

5 / 10 = .5  .5 * 100 = 50

AbCd +Ef = 8
A C E  = 3
b d f
' '+ = 2

3 / 8 * 100
3 / 8 * 100
2 / 8 * 100

DS:

{
  lowercase: 0,
  uppercase: 0,
  neither:   0
}

('a'..'z')
('A'..'Z')

Algorithm:
Given a string, text
Instantiate hash as above, percentages
lower_count = (count lowercase letters)
upper_count = count uppercase letters
neither_count = size of string - lower_count - upper_count
set percentages[lowercase] =  lower_count / (size of string) * 100 - These must be float division
set percentages[uppercase] = upper_count / (size of string) * 100
set percentages[neither] =  neither_count / size of string * 100
Return percentages
=end

def letter_percentages(text)
  percentages = {}
  
  total = text.size
  lower_count = text.chars.count { |char| ('a'..'z').cover?(char) }
  upper_count = text.chars.count { |char| ('A'..'Z').cover?(char) }
  neither_count = total - lower_count - upper_count

  percentages[:lowercase] = (100 * lower_count).fdiv(total)
  percentages[:uppercase] = (100 * upper_count).fdiv(total)
  percentages[:neither] = (100 * neither_count).fdiv(total)
  percentages
end

# LS solution
def letter_percentages(string)
  counts = {}
  percentages = {}
  characters = string.chars
  length = string.length

  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither]   = characters.count { |char| char =~ /[^a-zA-Z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:neither]   = (counts[:neither] / length.to_f) * 100
end

# Further exploration
def letter_percentages(string)
  percentages = {}
  total = string.length
  characters = string.chars

  lower_count   = characters.count { |char| char =~ /[a-z]/ }
  upper_count   = characters.count { |char| char =~ /[A-Z]/ }
  neither_count = total - lower_count - upper_count

  percentages[:lowercase] = percent(lower_count, total)
  percentages[:uppercase] = percent(upper_count, total)
  percentages[:neither]   = percent(neither_count, total)
  
  percentages
end

def percent(numerator, denominator)
  ( numerator.fdiv(denominator) * 100 ).round(1)
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

p letter_percentages('abcdefGHI')

# 30:36 - basically kept messing up the order of computations to calculate the percentages,
#         should just test computations in a repl instead of doing the math in your head
#         as it would have shaved about 10 minutes off
