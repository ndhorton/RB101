# Multiplicative Average

def show_multiplicative_average(list)
  average = list.reduce(:*).fdiv(list.size)
  puts format("The result is %.3f", average)
end

def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format("%.3f", average)}"
end

# Further exploration
# If you omit the `#to_f` on the `product` then the average will be calculated
# using integer division which is not what we want.

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
