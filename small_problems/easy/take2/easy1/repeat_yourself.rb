# Repeat Yourself

# input: a string, str, and an integer, n
# output: print str n times

def repeat(str, n)
  n.times { |_| puts str }
end

repeat('Hello', 3)