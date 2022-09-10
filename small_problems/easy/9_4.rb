# Counting Up

# input: given an integer
# output: an array of integers ranging from 1 up to the given integer

# -given an integer, n
# -set count_up = empty array
# -set counter = 1
# -loop while counter <= n
# --append counter to count_up
# --counter ++
# -end loop
# -return count_up

# def sequence(n)
#   count_up = []
#   counter = 1
#   loop do
#     break if counter > n
#     count_up << counter
#     counter += 1
#   end
#   count_up
# end

# def sequence(n)
#   [*1..n]
# end

# Further exploration

def sequence(n)
  if n > 0
    [*1..n]
  elsif n < 0
    [*n..-1]
  else
    [0, 1]
  end
end

# LS solution
# def sequence(n)
#   (1..n).to_a
# end


p sequence(5) #== [1, 2, 3, 4, 5]
p sequence(3) #== [1, 2, 3]
p sequence(1) #== [1]

p sequence(-5) #== [1, 2, 3, 4, 5]
p sequence(-3) #== [1, 2, 3]
p sequence(-1) #== [1]
p sequence(0)