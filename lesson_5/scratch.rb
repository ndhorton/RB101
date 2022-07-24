def string_to_integer(string)
  numbers = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9
  }
  integer_version = 0

  string.reverse.each_char.with_index do |char, idx|
    integer_version += numbers[char] * (10 ** idx)
  end

  integer_version
end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('9348327').class

#input: a string of numberic characters
# output: an integer which corresponds to that text representation of a number

# rules: cannot use String#to_i or Integer()
# do not need to worry about invalid input
# no input will include a sign
# analyze characters in a string
# you will have to find a numeric way to construct the number digit-wise:
#   perhaps reversing the string so that its indices correspond to powers of ten
# you will also need a method for converting each individual character to its integer
# equivalent

# DS: a hash table to convert character keys to integer values

# algo:
# - Given a string
# - Define a hash table which links numeric numbers to their integer equivalent
# - Define an integer, integer_version, and set = 0
# - Create a reverse of the string
# - Iterate over the reversed string with an index
# -- for each char, add the hash value for that char to integer_version * (10 ** index)
# - return integer_version