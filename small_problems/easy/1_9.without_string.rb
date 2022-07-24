# Sum of digits

def sum(num)
  total = 0
  while num > 0
    total += (num % 10)
    num /= 10
  end
  total
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
