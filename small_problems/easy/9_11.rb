# Group Anagrams

# input: an array of strings, some of which are anagrams of other words
# in the array
# output: print to screen as arrays [,,,] the groups of anagrams,
# one line after another

# goal: remove all items from array which have exactly the same letters and
# place them into subarrays before printing them

# Does it matter if the input array is mutated? If so, a deep copy would
# seem the easiest solution. Since we are printing to screen, does it
# matter if there is a second side-effect of annihilating mutation?

# need to unshift because 'demo' is first? the second example has the
# same anagram letters as the second item but here, 'none' is not the 
# first item in the array of those letter anagrams...
# Perhaps this is to suggest that order is not important...

# given an array of strings, words
# set anagram_arr = empty array
# until words empty
#   set keyword = words unshift
#   set current_arr = array with keyword in it
#   for current_word in words
#       set keep_word = true
#       for each letter in keyword
#         unless current word includes letter
#           set keep_word = false 
#       if keep_word
#         push current_word onto current_arr
#   push current_arr onto anagram_arr
# print each subarray in anagram_arr on new line with [] notation

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']
  
# anagram_arr = []
# until words.empty?
#   keyword = words.shift
#   current_arr = [keyword]
#   words.each do |current_word|
#     keep_word = true
#     keyword.each_char do |letter|
#       keep_word = false unless current_word.include?(letter)
#     end
#     current_arr << current_word if keep_word
#   end
#   anagram_arr << current_arr
#   current_arr.each { |moved_word| words.delete(moved_word) }
# end
# anagram_arr.each { |anagram_group| puts anagram_group.inspect }

# LS solution

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end