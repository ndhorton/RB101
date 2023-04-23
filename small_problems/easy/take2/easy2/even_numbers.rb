# Even Numbers

# 2.step(to: 99, by: 2) { |n| puts n }

puts (1..99).reject { |n| n.odd? }

# 1.upto(99) { |n| puts n if n % 2 == 0 }