def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

limit = 15
result = fib(0, 1, limit)
puts "result is #{result}"

# you could also have changed limit to a constant or initialized it within
# the method definition if you wanted it to be fixed rather than
# changeable