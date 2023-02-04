# Name Swapping

=begin

P-----
input: a string in the format "first_name last_name"
output: a string in the format "last_name, first_name"
goal: split the string, use element 1 as last_name, element 0 as first_name,
and concatonate around a comma and space to derive the return value

A-----

-given a string
-split the string on whitespace and capture array in var
-return a string with element 1 + " " + element 0

=end

def swap_name(name)
  names = name.split
  names[1] + ", " + names[0]
end

# LS solution
def swap_name(name)
  name.split.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'