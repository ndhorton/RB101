# Odd Numbers

# 1.step(to: 99, by: 2) { |n| puts n }

# puts (1..99).select { |n| n.odd? }

1.upto(99) { |n| puts n if n % 2 == 1 }