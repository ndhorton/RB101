# 1000 Lights

=begin

Notes:
1 to n
each light starts off
toggle all (multiples of 1)
toggle 2 4 6 (multiples of 2)
toggle multiples of 3

iterate for 1 through n, base
  iterate through every multiple of base <= n, index
    toggle switch at key index    

questions:

Problem:
input: an integer n
output: an array

  Write a method that takes one integer argument n
  which is the number of lightswitches
  After the algorithm they give, return an array
  containing the numbers of the switches that are on

rules:

Examples:

DS:

array whose elements are 1..n
array of booleans false
zip them

Algorithm:

subprocess:
Given an integer n
Define data structure where every key is a number 1 to n and every value is false
Iterate from 1 to n, base
  Iterate through every multiple of base
    toggle switch at multiple
Set result = empty array
Iterate through every key and value in data structure
  If value is true
    Append key to result
Return result

=end

def lights(n)
  switches = [*(1..n)].zip(Array.new(n, false)).to_h
  (1..n).each do |base|
    multiple = base
    while multiple <= n
      switches[multiple] = !switches[multiple]
      multiple += base
    end
  end

  i = 0
  loop do
    break if i >= switches.values.size
    if switches.values[i]
      print"\033[1;33m\u{1f4a1}\033[0m"
    else
      print "\033[1;30m\u{1f4a1}\033[0m"
    end
    i += 1
    print "\n" if i % 10 == 0
  end

  switches.each_with_object([]) do |(switch, state), result|
    if state
      result << switch
    end
  end
end

# p lights(5)
# p lights(10)
# p lights(1000).size == 31

# 22:00

# LS solution

# initialize the hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) do |number|
    lights[number] = "off"
  end
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light!(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
  end
  on_lights(lights)
end

def find_lights_state(lights, state)
  result = []
  lights.each_with_index do |light, index|
    if light == state
      result << index + 1
    end
  end
  result
end

def display_lights(on_lights, off_lights)
  case off_lights.size
  when 1
    print "light #{off_lights.first} is now off; "
  when 2
    print "lights #{off_lights.first} and #{off_lights.last} are now off; "
  when (3..)
    print "lights #{off_lights[0..-2].join(', ')}, and #{off_lights[-1]} are now off; "
  end

  case on_lights.size
  when 1
    print "#{on_lights.first} is on."
  when 2
    print "#{on_lights.first} and #{on_lights.last} are on."
  when (3..)
    print "#{on_lights[0..-2].join(', ')}, and #{on_lights[-1]} are on."
  end
  print "\n"
end

def toggle_lights(n)
  lights = Array.new(n, :off)
  1.upto(n) do |base|
    multiple = base
    while multiple <= n
      lights[multiple - 1] = (lights[multiple - 1] == :off) ? :on : :off
      multiple += base
    end
  end
  on_lights = find_lights_state(lights, :on)
  off_lights = find_lights_state(lights, :off)
  display_lights(on_lights, off_lights)
end


toggle_lights(5)
# p toggle_lights(1000)

