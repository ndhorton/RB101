# Palindromic Substrings

def leading_substrings(string)
  substrings_arr = []
  string.size.times { |end_index| substrings_arr << string[0..end_index] }
  substrings_arr
end

def substrings(string)
  substrings_arr = []
  string.size.times do |start_index|
    substrings_arr.concat(leading_substrings(string[start_index..-1]))
  end
  substrings_arr
end

def palindrome?(string)
  string.reverse == string && string.size > 1
end

def palindromes(string)
  substrings(string).select { |substring| palindrome?(substring) }
end

def case_palindrome?(string)
  clean_string = string.downcase.gsub(/[^a-z0-9]/, '')
  clean_string.reverse == clean_string && clean_string.size > 1
end

def case_palindromes(string)
  substrings(string).select { |substring| case_palindrome?(substring) }
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

p case_palindromes("m-Adam i'm Adam")