# def compute_sum(limit)
#   i = 1
#   sum = 0
#   while i <= limit.to_i
#     sum = sum + i
#     i += 1
#   end
#   sum
# end

def compute_sum(limit)
  number_set = Array(1..limit)
  number_set.inject(:+)
end

# def compute_product(limit)
#   i = 1
#   product = 1
#   while i <= limit.to_i
#     product = product * i
#     i += 1
#   end
#   product
# end

def compute_product(limit)
  number_set = Array(1..limit)
  number_set.inject { |product, elem| product * elem }
end

while true
  puts ">> Please enter an integer greater than 0:"
  limit = gets.chomp.strip
  break if limit.to_i.to_s == limit && limit.to_i > 0
end

while true
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  sum_or_product = gets.chomp.strip.downcase
  break if sum_or_product == 's' || sum_or_product == 'p'
end

if sum_or_product == 's'
  sum = compute_sum(limit.to_i)
  puts ">> The sum of the integers between 1 and #{limit} is #{sum}."
else
  product = compute_product(limit.to_i)
  puts ">> The product of the integers between 1 and #{limit} is #{product}."
end