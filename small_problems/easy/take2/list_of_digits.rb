# List of Digits

# Given a positive integer, number
# Set digs = empty array
# Set number_of_digits = floor(log10(number)) + 1
# Set digits_remaining = number_of_digits
# Iterate number_of_digits times
#   Append to digs number % (10 ** digits_remaining) / (10 ** (digits_remaining - 1))
#   digits_remaining -= 1
# Return digs

# def digit_list(number)
#   digs = []
#   number_of_digits = Math.log10(number).floor + 1
#   number_of_digits.downto(1) do |remaining_digits|
#     digs << number % (10 ** remaining_digits) / (10 ** (remaining_digits - 1))
#   end
#   digs
# end

# def digit_list(number)
#   number.digits.reverse
# end

# def digit_list(number)
#   number.to_s.chars.map { |digit| digit.to_i }
# end

# LS solution
# Brute force
# def digit_list(number)
#   digits = []
#   loop do
#     number, remainder = number.divmod(10)
#     digits.unshift(remainder)
#     break if number == 0
#   end
#   digits
# end

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
