arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

test = arr.map do |sub_arr|
  sub_arr.select { |i| i % 3 == 0 }
end

p test
