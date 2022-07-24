# the string will be displayed "pumpkins"
# the array will be displayed ["pumpkins", "rutabaga"]
# This is because += is a concatonation and reassignment operation,
# it does not mutate the string, so when you return from the method
# my_string still references the original string
# << mutates the array, so after the method the original array is changed
