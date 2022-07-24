# squaring an argument

def multiply(n1, n2)
  n1 * n2
end

def square(n)
  multiply(n, n)
end

def power(base, exp)
  product = 1
  1.upto(exp) { product = multiply(product, base) }
  product
end

p square(5) == 25
p square(-8) == 64
p power(5, 3)
p power(584, 0)
p power(8, 1)
p power(10, 6)
p power(5, 2)
