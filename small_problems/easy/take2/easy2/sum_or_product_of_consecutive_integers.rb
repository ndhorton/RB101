# Sum or Product of Consecutive Integers

def sum(limit)
  (1..limit).inject(:+)
end

def product(limit)
  (1..limit).inject(:*)
end

def valid_integer?(integer)
  integer.to_i.to_s == integer && integer.to_i > 0
end

limit = nil
loop do
  puts ">> Please enter an integer greater than 0:"
  limit = gets.chomp
  break if valid_integer?(limit)
end

operation = nil
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  break if operation == 's' || operation == 'p'
end

limit = limit.to_i

if operation == 's'
  puts "The sum of the integers between 1 and #{limit} is #{sum(limit)}."
else operation == 'p'
  puts "The product of the integers between 1 and #{limit} is #{product(limit)}."
end