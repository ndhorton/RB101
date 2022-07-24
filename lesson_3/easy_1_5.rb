if (10..100) === 42
  p 'yes'
else
  p 'no'
end

# LS solution
p (10..100).cover?(42)