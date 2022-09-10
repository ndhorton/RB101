# Leetcode RB109

# input: given a string, s
# output: integer length of longest substring with no repeating characters

# if string empty return string

# algorithm:
# START
# -given a string, s
# -if s is empty
# --return s 
# -split s into array of characters, chars
# -set sub_strings = empty array
# -set counter = 0
# -loop until counter has reached the length of s
# --set sub_string = empty string
# --iterate over each char in chars starting at index value represented by counter
# ---if char is not already in sub_string
# ----concatonate char to sub_string
# ---else
# ----append sub_string to sub_strings
# ----break from iteration
# --counter ++
# -end loop
# -set longest_sub_string = 1
# -iterate over each string in sub_strings
# --if length of current string > longest_sub_string
# ---set longest_sub_string = length of current string
# -return longest_sub_string 

def length_of_longest_substring(s)
  return s if s.empty?
  sub_strings = []
  0.upto(s.length - 1) do |index|
    sub_string = ''
    s.chars[index...s.length].each do |char|
      if sub_string.include?(char)
        sub_strings << sub_string
        break
      else
        sub_string << char
      end
    end
    sub_strings << sub_string
  end
  sub_strings.max_by { |sub_string| sub_string.length }.length
end

p length_of_longest_substring('aaaabbcba') == 3
p length_of_longest_substring('aaaaaa') == 1
p length_of_longest_substring('pwwkea') == 4
p length_of_longest_substring('') == ''
p length_of_longest_substring('a') == 1
p length_of_longest_substring('robtuunop') == 5
p length_of_longest_substring('tucccaassaa') == 3
