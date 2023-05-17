# List of Digits

# input: a positive integer, number
# output: an array of the digits in descending place value
# from highest order to lowest (as number is written)

def digit_list(number)
  number_of_digits = Math.log10(number).floor + 1
  digit_list = []
  number_of_digits.times do |_|
    digit_list.unshift(number % 10)
    number /= 10
  end
  digit_list
end

# LS solutions

# def digit_list(number)
#   digits = []
#   loop do
#     number, remainder = number.divmod(10)
#     digits.unshift(remainder)
#     break if number == 0
#   end
#   digits
# end

# def digit_list(number)
#   number.to_s.chars.map(&:to_i)
# end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
