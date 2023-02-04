
def sequence(count, base)
  multiples = []
  count.times { |counter| multiples << (base * (counter + 1)) }
  multiples
end
