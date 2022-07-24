# Practice problem 1
# The block will return a truthy value each time.
# The last evaluated expression in the block is 
# a string, and strings are truthy. So the method will
# return an array containing all items from the 
# calling array.

# Practice problem 2
# Count treats the return value as a Boolean whose value
# determines whether to count the current element
# in the iteration. If the block evaluates as truthy
# during that iteration, that element will count toward
# the value of the integer the count method returns.
# One can find this out by reading the docs.

# Practice problem 3
# reject will return an array containing every element
# from the calling array. This is because reject evaluates
# whether to add an item to the returning array based on
# whether the block's return value for that element was
# falsey. Since the puts method always returns nil,
# every element's block iteration will return nil also,
# puts being the last evaluated expression in the block.

# Practice problem 4
# the return value will be the following hash:
hash = { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
# The reason for this is that the block takes each
# string element that is passed in from the calling
# array and uses its first character (index 0) to 
# create a key in the hash object 'hash' and assigns
# the whole string element as the value for that key.

# Practice problem 5
# Hash#shift will remove the first key-value pair
{ :a => "ant" }
# and return it as an array
[:a, "ant"]
# This information can be found in its doc entry.
# Hash tables, in theory, are not sequentially ordered data structures,
# though in Ruby, since v1.9, they retain the order of each
# pair's addition to the hash.

# Practice problem 6
# The statement will return the number of characters in the string
# 'caterpillar' (11). The pop method removes the last element in the
# array and returns it to the size method, which when called on
# a string returns the number of characters it contains.

# Practice problem 7
# The block's return value will be true for the odd numbers
# in the array and false for the even. It is determined by
# the last evaluated expression, in this case the Integer#odd? method.
# The return value of any? will be true, since only one 
# iteration of the block needs to return true for the
# method to return true. INCORRECT-->It will output every number
# in the array to screen because the puts method is called
# on each iteration of the block.-- It actually stops iterating as soon
# as it recieves a truthy value from a block iteration.
# In this case, it will only print the first entry since
# the first block iteration will return true. In a sense, the
# method short circuits like an || statement if any one value is true.

# Practice problem 8
# Array#take returns the first n elements from an array where n
# is an integer argument passed to the method. This can be found by
# reading the docs entry for take. A REPL can be used to clarify further.
# The method is non-destructive and functions somewhat like 
# the method #first if #first is passed an argument.

# Practice problem 9
# Enumberable#map will return an array. When called on a hash,
# each element in the returned array will be the return value
# of the block for its iteration over the corresponding 
# key-value pair in the (ordered in Ruby) hash. In this case,
# the if statement provides the value of the key-value pair
# as the return value only if the number of characters in the
# string is greater than 3. Otherwise the block here provides
# no value, so any key-value pairs whose value contains 3 or less
# characters will produce a nil in the corresponding position in
# the returned array. The array will look like:
[nil, 'bear']
# addendum: an if statement which evaluates as false and has
# no else statement will also return nil, though in the
# case of #map, a totally empty block will also return nil for
# each pair in the original hash. The nil in the case of problem 9
# is still technically from the if statement, however.

# Practice problem 10
# The return value will be an array like this:
[1, nil, nil]
# The if statement calls puts if an element is greater than 1
# and puts returns nil. 1 is not greater than 1, so the else
# condition functions as an implicit return of the element
# which it names and 1 is added to the returned array.