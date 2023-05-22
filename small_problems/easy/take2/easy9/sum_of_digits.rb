# Sum of Digits

# input: an integer, number
# output: the sum of the digits of number

# Given an integer, number
# Set number_string := string(number)
# Set digits := split(number_string, '')
# Set sum := 0
# Iterate over each digit in digits
#   sum += int(digit)
# Return sum

def sum(number)
  digits = number.to_s.chars
  digits.reduce(0) { |sum, digit| sum + digit.to_i }
end

# LS solution
def sum(number)
  sum = 0
  str_digits = number.to_s.chars

  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end

def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
