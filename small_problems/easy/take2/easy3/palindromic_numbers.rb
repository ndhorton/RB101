# Palindromic Numbers

# Given an integer, number
# Set digit_count = floor(log10(number)) + 1
# Set reverse_number = 0
# For exp from 1 to digit_count
#   reverse_number *= 10
#   reverse_number += number % (10 ** exp) / (10 ** (exp - 1))
# Return (number == reverse_number) 


def palindromic_number?(number)
  digit_count = Math.log10(number).floor + 1
  reverse_number = 0
  1.upto(digit_count) do |exp|
    reverse_number *= 10
    reverse_number += number % (10 ** exp) / (10 ** (exp - 1))
  end
  reverse_number == number
end

def palindromic_number?(number)
  number.to_s.reverse.to_i == number
end

# LS solution

def palindrome?(string)
  string.reverse == string
end

def palindromic_number?(number)
  palindrome?(number.to_s)
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true