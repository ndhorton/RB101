# Leading substrings

# input: a string
# output: an array containing every substring of the input string that begins at
# the first character of the string, with each element in this array sorted by length
# from shortest to longest

# edge cases: 
# I will assume an empty string should return an empty array

# implicit requirements:
# a string with a single character should be returned as its only substring within
# an array of one element

# algo:
# -given a string
# -set substrings = empty array
# -set counter = 0
# -loop until counter == array size
# --append string from 0 to counter to substrings array
# --increment counter
# -return substrings

def leading_substrings(text)
  substrings = []
  counter = 0
  text_length = text.length

  until counter >= text_length
    substrings.push(text[0..counter])
    counter += 1
  end

  substrings
end

# LS solution

# def leading_substrings(string)
#   result = []
#   0.upto(string.size - 1) do |index|
#     result << string[0..index]
#   end
#   result
# end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']