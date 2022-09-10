arr = []
(0..9).each do |i|
  if i == 7
    arr = arr.map { |n| n * n}
    break
  else
    arr << i
  end
end

p arr
