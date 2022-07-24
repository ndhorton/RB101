# A. it will print: 'one is one' etc because the method mess_with_vars()
# only reassigns its local variables and in Ruby that does not change
# the assignment of the outer scope local variables passed in as arguments

# B. Again, only reassignment is used by the method, so the outer scope
# variables will still point to the original, unmutated objects
# because the only reference passed by Ruby is the object id and
# this can be pointed to by any number of variables whose reassignment
# to a different object id will not affect the reference of those
# other variables to the original object id

# C. Here it will print: "one is two", "two is three", "three is one"
# This is because the .gsub! method mutates the object it is called on
# so any variables referencing the object id of this mutated object
# will continue to reference it but its state is now changed

