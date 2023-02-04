# Lettercase Percentage Ratio
=begin
P:
input: a string of at least one character
output: hash with keys as shown, values expressing the count of
lowercase, uppercase and neither chars as a percentage of the
total number of chars

All floating point maths
add three numbers = total
one_percent = total / 100
divide each part number by one_percent
round to 2 places past .

A:
-given a string, text
-total_sum = text.length
-set uppercase = count of uppercase chars
-set lowercase = count of lowercase chars
-set neither = total_sum - uppercase - lowercase
-cent = total_sum / 100.0
-up_percent = uppercase / cent
-low_percent = lowercase / cent
-neither_percent = lowercase / cent
=end

def letter_percentages(text)
  total_sum = text.length
  return nil if total_sum == 0
  uppercase = text.count('A-Z')
  lowercase = text.count('a-z')
  neither = total_sum - uppercase - lowercase
  percent = total_sum / 100.0
  {
    lowercase: (lowercase / percent).round(1),
    uppercase: (uppercase / percent).round(1),
    neither: (neither / percent).round(1)
  }
end

# def calculate(percentages, counts, length)
#   percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
#   percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
#   percentages[:neither] = (counts[:neither] / length.to_f) * 100
# end

# def letter_percentages(string)
#   counts = {}
#   percentages = {}
#   characters = string.chars
#   length = string.length

#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

#   calculate(percentages, counts, length)

#   percentages
# end

# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

p letter_percentages('abcdefGHI')