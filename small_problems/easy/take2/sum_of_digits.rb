# Sum of Digits

# def sum(int)
#   int.digits.sum
# end

# LS solutions

# The iterative way you were challenged to avoid
# def sum(number)
#   sum = 0
#   str_digits = number.to_s.chars

#   str_digits.each do |str_digit|
#     sum += str_digit.to_i
#   end

#   sum
# end

# The non-iterative LS solution
# I should definitely remember to use type conversion more often
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end




# iterative method without type conversion
def sum(number)
  number_of_digits = Math.log10(number).floor + 1
  digits = []
  number_of_digits.downto(1) do |exponent|
    digits << number % (10 ** exponent) / (10 ** (exponent - 1))
  end
  digits.reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45