# Running totals

# def running_total(array)
#   running_total = []
#   current_total = 0
#   array.each do |n|
#     current_total += n
#     running_total << current_total
#   end
#   running_total
# end

# LS solution
# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

# Further exploration
# def running_total(array)
#   sum = 0
#   array.each_with_object([]) { |n, running_totals| running_totals << sum += n }
# end

# def running_total(array)
#   sum = 0
#   array.inject([]) { |new_arr, num| new_arr << sum += num }  
# end

# student submitted solutions
# def running_total(array)
#   array.map.with_index { |_, idx| array[0..idx].inject(:+) }
# end

def running_total(array)
  array.each_with_object([]).with_index do | (num, arr), idx|
    arr.empty? ? arr << num : arr << num + arr[idx - 1]
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []