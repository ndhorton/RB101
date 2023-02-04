# Palindromic Substrings

def leading_substrings(string)
  substrings = []
  counter = 0
  string_length = string.length

  until counter >= string_length
    substrings.push(string[0..counter])
    counter += 1
  end

  substrings
end

def substrings(string)
  all_substrings = []
  last_index = string.length - 1

  0.upto(last_index) do |current_lead_index|
    current_substring = string[current_lead_index..last_index]
    all_substrings += leading_substrings(current_substring)
  end

  all_substrings
end

def is_palindrome?(string)
  test_string = string
  test_string.chars.keep_if { |char| }
  !!(test_string == test_string.reverse)
end

def palindromes(string)
  substrings(string).select do |substring|
    is_palindrome?(substring) && substring.length > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further exploration

def is_palindrome?(string)
  test_string = string.downcase.gsub(/[^a-z0-9]/, '')
  !!(test_string == test_string.reverse)
end

p is_palindrome?('1Abb=a1') # => true
p is_palindrome?('3madam4') # => false