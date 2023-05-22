# Counting Up

def sequence(number)
  (1..number).to_a
end

# Further exploration
def sequence(number)
  number > 0 ? (1..number).to_a : (number..1).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

p sequence(-1)