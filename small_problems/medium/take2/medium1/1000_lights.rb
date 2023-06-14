# 1000 Lights

=begin

Notes:
The switches are numbered 1 to n but the data structure
is a zero-indexed array. So the array has n elements,
indexed 0 to n-1

The array that is returned only contains the light-number
of the lights that are left on. (index + 1)

Problem:

Write a method that, given a positive integer n, returns an array containing the numbers of lights
left on after the procedure described.

The procedure:
all lights off
press the switches for multiples of 1
press the switches for multiples of 2
...
press the switches for multiples of n

input: an integer n
output: an array containing the index+1 of each element in the boolean
array set to true

rules:

Examples:

1. toggle multiples of 1 (i.e. every one)
2. toggle multiples of 2 (odd-numbered indexes)
3. toggle multiples of 3
4. toggle multiples of 4
5. toggle multiples of 5

DS:

An array of booleans
An array of integers

Algorithm:

Given an integer n
Set light_bank = create n-sized array of boolean `false` elements
Iterate for each base from 1 to n
  Set multiple := base
  Iterate while multiple smaller than or equal to n
    light_bank[multiple-1] = !light_bank[multiple-1]
    multiple += base
Set result := empty array
Iterate for each light in light_bank with index
  If (light)
    Push index+1 to result array
Return result

=end

def lights(n)
  light_bank = Array.new(n, false)
  1.upto(n) do |base|
    multiple = base
    loop do
      break if multiple > n
      light_bank[multiple-1] = !light_bank[multiple-1]
      multiple += base
    end
  end
  result = []
  light_bank.each_with_index do |light_on, index|
    result.push(index+1) if light_on
  end
  result
end

# LS solution

def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) do |position|
    lights[position] = "off"
  end
  lights
end

def toggle_every_nth_light!(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "on" ? "off" : "on")
    end
  end
end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |position, state|
    toggle_every_nth_light!(lights, position)
  end
  
  on_lights(lights)
end

def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

p toggle_lights(1000) == lights(1000)

# further exploration

def on_lights(lights)
  on, off = lights.partition { |_postion, state| state == "on" }
  on.map! { |subarray| subarray.first }
  off.map! { |subarray| subarray.first }
  puts "Lights #{off[0..-2].join(', ')}, and #{off.last} are now off; "\
  "lights #{on[0..-2].join(', ')}, and #{on.last} are on."
end

toggle_lights(10)
# 24:10 minutes
# Although I finished in time, it would have been nice to extract some of the code
# to methods but there would be limited time for refactoring.