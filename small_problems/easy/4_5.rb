# Multiples of 3 and 5

# def multisum(num)
#   multiples_of_three = []
#   counter = 3
#   while counter <= num
#     multiples_of_three << counter
#     counter += 3
#   end
  
#   multiples_of_five = []
#   counter = 5
#   while counter <= num
#     multiples_of_five << counter
#     counter += 5
#   end

#   (multiples_of_three + multiples_of_five).uniq.sum
# end

# def multisum(num)
#   total = 0
#   1.upto(num) do |i|
#     if i % 3 == 0 || i % 5 == 0
#       total += i
#     end
#   end
#   total 
# end

# Further exploration

# mine, not great
# def multisum(limit)
#   multiples = []
#   1.upto(limit) do |n|
#     if n % 3 == 0 || n % 5 == 0
#       multiples << n
#     end
#   end
#   multiples.inject(:+)
# end

# student submitted
# def multisum(limit)
#   (3..limit).to_a.select { |n| n % 3 == 0 || n % 5 == 0 }.sum
# end
#best use of inject i saw
def multisum(limit)
  (1..limit).inject(0) { |sum, n| n % 3 == 0 || n % 5 == 0 ? sum += n : sum }
end


p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

