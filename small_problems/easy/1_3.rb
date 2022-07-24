# List of digits

def digit_list(num)
  # convert the positive integer to a string and split into an array of chars 
  digits = num.to_s.split("")
  # convert each char in the array to integer and implicitly return integer array
  digits.map { |n| n.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) === [4, 4, 4]