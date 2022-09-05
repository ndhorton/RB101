# All Substrings

# I originally misunderstood the problem definition and took
# "You may (and should) use the leading_substrings method you wrote in the previous exercise"
# to mean, you should rewrite the leading_substrings method to give every substring
# Rather, LS meant, you should call leading_substrings from your new substrings method
# I will make sure to rememeber the implication of this wording in future

# def substrings(text)
#   substrings = []
#   last_index = text.length - 1

#   0.upto(last_index) do |current_lead_index|

#     current_lead_index.upto(last_index) do |current_last_index|
#       substrings << text[current_lead_index..current_last_index]
#     end

#   end

#   substrings
# end


# input: given a string, text
# output: an array containing every substring of text in ascending order of leading index
# and shortest to longest for set of substrings from each leading index

# The array should be 1-dimensional

# START
# -given a string, text
# -set substring_list = []
# -set last_index = length of text - 1
# -iterate over each possible leading index number in text
# --iterate over each possible last current index
# ---push to substring_list << substring selected from current leading index to current last index
# -return substring_list
# END

# ---------------------

# Revised answer based on glancing at LS solution and realising mistake

# input: given a string, text
# output: an array containing every substring of text in ascending order of leading index
# and shortest to longest for set of substrings from each leading index

# The array should be 1-dimensional
# You should invoke leading_substrings from the last exercise

# START
# -given a string, text
# -SET all_substrings = empty array
# -SET last_index = text length - 1
# -iterate over a range representing each current index between 0 and last_index
# --SET current_substring = text selected from current index to last_index
# --invoke leading_substrings method with current_substring passed in as argument
# --concatinate the return value to all_substrings array
# -return all_substrings
# END

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


def substrings(text)
  all_substrings = []
  last_index = text.length - 1

  0.upto(last_index) do |current_lead_index|
    current_substring = text[current_lead_index..last_index]
    all_substrings += leading_substrings(current_substring)
  end

  all_substrings
end

# LS solution

def substrings(string)
  results = []
  (0..string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
