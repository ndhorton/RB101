arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

ordered_arr = []
arr.each do |sub_arr|
  ordered_arr << sub_arr.sort { |a, b| b <=> a }
end
# p ordered_arr

#LS solution

test = arr.map do |sub_arr|
  sub_arr.sort { |a, b| b <=> a }
end

p test