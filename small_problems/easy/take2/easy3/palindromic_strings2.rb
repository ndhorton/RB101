# Palindromic Strings (Part 2)

# Given a string, string
# Set alphanumerics = empty string
# Iterate over each char in string
#   If char is alphanumeric
#     append char to alphanumerics
# Set is_palindrome = palindrome?(alphanumerics)
# Return is_palindrome

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  downcased_alphanumerics = string.downcase.gsub(/[^A-Za-z0-9]/,'')
  palindrome?(downcased_alphanumerics)
end

# LS solution
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')  # remember `delete` is used this way
  palindrome?(string)                         # like the `[x-y]` character class range syntax in regex
end                                           # including the `^` not at the beginning

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false