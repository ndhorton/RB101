# 1000 lights

# lost all my work by accidentally hitting the side button on the mouse
# and that is set to go back a page, so coderpad lost all my work
# now disabled on Chrome with an extension

def lights(n)
  switches = {}
  (1..n).each { |index| switches[index] = :off }
  (1..n).each do |multiple|
    index = multiple
    while index <= n
      switches[index] = (switches[index] == :off ? :on : :off)
      index += multiple
    end
  end
  switches.select { |_, state| state == :on }.keys
end

def lights(n)
  (1..n).each_with_object([]) do |switch, result|
    root = Math.sqrt(switch)
    result << switch if root == root.truncate
  end
end

def lights(n)
  result = []
  switch = 1
  difference_to_next = 3
  while switch <= n
    result << switch
    switch += difference_to_next
    difference_to_next += 2
  end
  result
end

p lights(5)
p lights(10)
p lights(100)

# ~24:04, just under 25mins