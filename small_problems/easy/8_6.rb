# FizzBuzz

# input: given 2 integers, lower limit and upper limit (inclusive range)
# output: print to screen, comma separated, all integers in range except,
# for n divisible cleanly by 3 && by 5 print 'FizzBuzz'
# for n divisible cleanly by 3 but not 5 print 'Fizz'
# for n divisible cleanly by 5 but not 3 print 'Buzz'

# edge cases: if you are having to increment or decrement in a standard control flow
# way, you would need to make sure which argument is greater and which lesser
# I guess you could account for floats but the example makes it seem like this is
# maybe pedantic for this exercise

# implicit requirements:
# the last number needs to have no comma

# algorithm:
# START
# -given two integers, lowest and highest
# -SET print_array = empty array
# -iterate over each num in an inclusive range of integers from lowest to highest
# --IF num % 3 == 0 && num % 5 == 0
# ---push 'Fizzbuzz' to print_array
# --ELSE IF num % 3 == 0
# ---push 'Fizz' to print_array
# --ELSE IF num % 5 == 0
# ---push 'Buzz' to print_array
# --ELSE
# ---push num to print_array
# -SET print_string = return value of joining print_array aroung ", "
# END

# def fizzbuzz(lower, upper)
#   print_array = (lower..upper).each_with_object([]) do |n, arr|
#     if n % 3 == 0 && n % 5 == 0
#       arr << 'FizzBuzz'
#     elsif n % 3 == 0
#       arr << 'Fizz'
#     elsif n % 5 == 0
#       arr << 'Buzz'
#     else
#       arr << n.to_s
#     end
#   end

#   puts print_array.join(', ')
# end

# LS solution

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case 
  when number % 3 == 0 && number % 5 == 0
    'Fizzbuzz'
  when number % 3 == 0
    'Fizz'
  when number % 5 == 0
    'Buzz'
  else
    number
  end
end

fizzbuzz(1, 15)


