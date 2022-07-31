# Right triangles

def triangle(n)
  (1..n).each { |i| puts (' ' * (n - i)) + ('*' * i) }
end

# LS solution
def triangle(n)
  spaces = n - 1
  stars = 1

  n.times do |_|
    puts (' ' * spaces) + ('*' * stars)

    spaces -= 1
    stars += 1
  end
end

triangle(5)
triangle(9)