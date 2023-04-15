# How Many

# input: an array of strings
# output: print a hash-like table representing each string and the count
# of times it occurs in the input array. The count is case-sensitive.

# goal: iterate over each unique element in the input array, count that
# elements' occurences in the actual input array
# output to screen: "#{string} => #{count}"

# Given an array of strings, arr
# Set unique_terms = only unique elements from arr
# Set occurences = empty hash
# Iterate over each element in unique_terms
#   Set occurences[element] = count(element) in arr
# Iterate over each key-value pair in occurences
#   Print "{key} => {value}"
# Return

# def count_occurrences(arr)
#   occurrences = arr.tally
#   occurrences.each do |string, count|
#     puts "#{string} => #{count}"
#   end
#   return
# end

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

# LS solution and further exploration (make case insensitive)

def count_occurrences(array)
  occurrences = {}

  caseless_array = array.map(&:downcase)

  caseless_array.uniq.each do |element|
    occurrences[element] = caseless_array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'sUv', 'suv'
]

count_occurrences(vehicles)