def remove_vowels(arr)
  arr.map do |str|
    str.delete('[aeiouAEIOU]')
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# input: an array of strings
# output: a new array of new strings, same but with the vowels removed

# implicit requirements: must remove capitals and lower case

# -given an array
# -iterate through the array
# --transform each string value into the same but with vowels removed
# -return new array
