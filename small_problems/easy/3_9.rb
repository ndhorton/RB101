# frozen_string_literal: true

# Palindromic strings 2

# LS solution
def real_palindrome?(str)
  str = str.downcase.delete('^a-z0-9')
  str == str.reverse
end

# def real_palindrome?(str)
#   forward_str = ''
#   reverse_str = ''
#   letters = ('A'..'z')
#   numbers = ('0'..'9')
#   i = 0
#   while i < str.size
#     if letters.include?(str[i]) || numbers.include?(str[i])
#       forward_str << str[i]
#     end
#     i += 1
#   end
#   forward_str.downcase!
#   i = -1
#   while i >= -(forward_str.length)
#     reverse_str << forward_str[i]
#     i -= 1
#   end
#   forward_str == reverse_str
# end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

str = 'Ab3Ba'
p real_palindrome?(str)
p str
