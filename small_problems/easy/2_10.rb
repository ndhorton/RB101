# the puts command will print "Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo"
# This is because the << operator is adding references to the same objects
# to array2, so when upcase! mutates the objects referenced by array1, they
# are also changed if one accesses them from array2

# To avoid copying object_ids, one can duplicate the objects and pass in to array2
# object_id references to the duplicate objects instead

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts "array2: #{array2}"
puts "array1: #{array1}"