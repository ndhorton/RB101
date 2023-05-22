# fizzbuzz

# input: two integers, start and limit
# output: print out all integers from the starting integer
# to the limit, but for any multiple of 3 and 5 print 'FizzBuzz',
# for any multiple of 3 print 'Fizz', for any multiple of 5
# print 'Buzz'

# Given two integers, start and limit
# Iterate for each integer [start : limit]
#   if current integer % 3 == 0 && current integer % 5 == 0
#     print "FizzBuzz"
#   else if current integer % 3 == 0
#     print "Fizz"
#   else if current integer % 5 == 0
#     print "Buzz"
#   else
#     print current integer

# def fizzbuzz(start, limit)
#   (start..limit).each do |current_number|
#     if current_number % 3 == 0 && current_number % 5 == 0
#       puts "FizzBuzz"
#     elsif current_number % 3 == 0
#       puts "Fizz"
#     elsif current_number % 5 == 0
#       puts "Buzz"
#     else
#       puts current_number
#     end
#   end
# end

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
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

