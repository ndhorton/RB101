# Palindromic numbers

# def palindromic_number?(num)
#   num.digits
#   num.digits == num.digits.reverse
# end

def palindromic_number?(number)
  number.to_s == number.to_s.reverse ||
    number.to_s(8) == number.to_s(8).reverse
end

# def palindromic_number?(int)
#   return false if int < 0
#   int_digits = []
#   while int > 0
#     int_digits << int % 10
#     int = int / 10
#   end
#   int_digits == int_digits.reverse
# end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

p palindromic_number?(0) == true
p palindromic_number?(-454) == false
p palindromic_number?(000000101) == true
p palindromic_number?(07) == true