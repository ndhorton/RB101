# Array Average

def average(array)
  sum = 0
  array.each do |number|
    sum += number
  end
  sum / array.size if array.size > 0
end

# LS solution - I didn't realise we could use reduce
def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Further exploration

def average(numbers)
  numbers.reduce(:+).fdiv(numbers.size)
end

puts average([1, 6])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
