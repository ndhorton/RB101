# The string method << pushes characters onto the original string object,
# whose object id is referenced both by a_string_param and my_string.
# So when after the method, the original string has been mutated.

# The reassignment of an_array_param to a new array does not effect the object
# whose id is referenced by my_array, so after the method the original
# array is not mutated