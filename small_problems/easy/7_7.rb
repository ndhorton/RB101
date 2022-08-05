def show_multiplicative_average(int_arr)
  puts(format("%.3f\n", int_arr.inject(:*) / int_arr.size.to_f))
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667