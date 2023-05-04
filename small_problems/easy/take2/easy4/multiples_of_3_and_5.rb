# Multiples of 3 and 5

# input: an integer greater than 1, limit
# output: the sum of all multiples of 3 or 5 from 1 to limit inclusive

# goal: iterate over range 1..limit testing for divisibility by 3 and then by 5

# implicit requirement: a number that is divisible by both 3 and 5 is only added once

# Given an integer, limit
# Set sum = 0
# For i from 1 to limit
#   If i % 3 == 0
#     sum += i
#   Else if i % 5 == 0
#     sum += i
# Return sum

def multisum(limit)
  sum = 0
  (1..limit).each do |n|
    if n % 3 == 0
      sum += n
    elsif n % 5 == 0
      sum += n
    end
  end
  sum
end

# LS solution

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_value)
  sum = 0
  1.upto(max_value) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum += number
    end
  end
  sum
end

def multisum(limit)
  (1..limit).reduce(0) { |sum, n| (n % 3 == 0 || n % 5 == 0) ? sum + n : sum  }
end

def multisum(limit)
  (1..limit).reduce(0) do |current_total, number|
    if multiple?(number, 3) || multiple?(number, 5)
      current_total + number
    else
      current_total
    end
  end
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
