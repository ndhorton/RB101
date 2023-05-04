# Palindromic Strings (Part 1)

def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Further explorations

# This method already works for either an Array or String since both
# classes supply `reverse` and `==` methods. So while

def palindromic_array?(array)
  array == array.reverse
end

def palindromic?(collection)
  collection == collection.reverse
end

# might have different identifiers for the method and parameter they
# still all work for both types of collection (or pseudocollection)
