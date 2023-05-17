# Spin Me Around in Circles

# Given the implementation, `spin_me` returns a new string object.
# The `split` method returns a new array of new strings
# and all subsequent operations in the chain of method calls
# no longer have the opportunity to mutate the object passed as
# argument.

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

def spin_me(arr)
  arr.each do |word|
    word.reverse!
  end
end

arr = %w(hello world)
puts arr.object_id
puts spin_me(arr).object_id
