# Delete Vowels

# input: an array of strings
# output: a new array whose elements are new strings with the
# same values as the input array except with vowels removed

# deletion should cover both upper and lower case

# Given an array of strings, strings
# Set cleaned_strings := transform each string in strings
#   delete(string, 'aeiou')
# Return cleaned_strings

def remove_vowels(strings)
  strings.map {|string| string.delete('aeiouAEIOU') }
end

def remove_vowels(strings)
  strings.map { |string| string.gsub(/[aeiouAEIOU]/, '') }
end

def remove_vowels(strings)
  strings.map { |string| string.tr('aeiouAEIOU', '') }
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
