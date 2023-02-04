# Longest Palindromic Substring

# input: given a string, s
# output: the longest substring in s that is a palindrome

# if there is no palindrome, return an empty string
# numbers are included. non-alphanumerics?

# algorithm:
# START
# -given a string, s
# -set longest = ''
# -set sub_strings = empty array
# -set start_index = 0
# -set current_index = 0
# -loop until start_index <= length of s
# --loop while current_index <= length of s
# ---if s sliced from start_index to current index is a palindrome
# ----append to sub_strings
# ---end if
# ---current_index ++
# --end loop
# -start_index ++
# -end loop
# -set longest = the longest palindrome unless sub_strings is empty
# -return longest
# END

def palindrome?(string)
  !!(string.reverse == string)
end

def longest_palindrome(s)
  substrings = ['']
  start_index = 0
  loop do
    break if start_index >= s.length - 1
    current_index = start_index + 1
    loop do
      break if current_index >= s.length 
        current_substring = s[start_index..current_index]
        substrings << current_substring if palindrome?(current_substring)
      current_index += 1
    end
    start_index += 1
  end
  substrings.max_by { |str| str.length }
end

p longest_palindrome("babad") == "bab"
p longest_palindrome("cbbd") == "bb"
p longest_palindrome("abcd") == ""
p longest_palindrome("aa") == "aa"
p longest_palindrome("12231221") == "1221"
