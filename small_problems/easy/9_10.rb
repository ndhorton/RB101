# Grocery List

=begin

Problem:

method called buy_fruit
input: an array of arrays, sub-arrays contain:
  string representing fruit, integer number of that fruit available
output: a flat array of fruit strings from input array, each fruit string
occuring the number of times indicated by the integer element in the
corresponding sub-array

goal: use map invocation to transform inner arrays into arrays of string occuring
integer times as elements. flatten the returned nested array 

Does 'converts' mean mutate argument or return new array?

Examples given
DS: nested array -> flat array

Algorithm:

-given a nested array, grocery_list
-transform outer array elements
-the transformation criteria:
--set str_arr = empty array
--repeat the number of times indicated by integer
---push the fruit string onto the str_arr array
--resulting str_arr object as transformation criteria
-flatten the transformed array
-return

=end

def buy_fruit(grocery_list)
  fruits = grocery_list.map do |fruit, num|
    str_arr = []
    num.times { str_arr << fruit }
    str_arr
  end

  fruits.flatten
end

# remember dup is needed if you want the strings to be different objects

# LS solution

# def buy_fruit(list)
#   expanded_list = []

#   list.each do |item|
#     fruit, quantity = item[0], item[1]
#     quantity.times { expanded_list << fruit }
#   end

#   expanded_list
# end

# def buy_fruit(list)
#   list.map { |fruit, quantity| [fruit] * quantity }.flatten
# end

# Remember Array#* can be used with integer argument as concatonation
# like multiplication in the sense of repeated addition and addition 
# in the sense of concatonation (Array#+)
# It is worth bearing in mind, though, that the LS one-liner does
# foreclude the possibility of returning a different object since
# Array#* will simply make multiple element references to the same object id
# so that even Object#dup will not help

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

p(buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]).map { |x| x.object_id })