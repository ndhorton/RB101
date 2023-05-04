# Short Long Short

# Given two strings, string1 and string2
# If string1 length is greater than string2 length
#   Return string2 + string1 + string2
# Else
#   Return string1 + string2 + string1

def short_long_short(string1, string2)
  if string1.length > string2.length
    "#{string2}#{string1}#{string2}"
  else
    "#{string1}#{string2}#{string1}"
  end
end

# LS solutions

def short_long_short(string1, string2)
  arr = [string1, string2].sort_by { |el| el.length }
  arr.first + arr.last + arr.first
end

def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
