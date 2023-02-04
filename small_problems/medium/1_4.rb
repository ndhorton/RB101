# 1000 Lights

=begin
P:
initial state: all switches off
first pass: toggle multiple of 1 switches (all on)         % 1 == 0
second pass: toggle multiple of 2 switches (not indices)   % 2 == 0
third pass: toggle multiple of 3 switches                  % 3 == 0 etc

input: an int n
output: an array of integers representing switch numbers (1..n) of those switches
that are on after n passes
goal: iterate over n-sized array of bools n times,
pass 1: flip multiples of 1...
pass 10: flip multiples of 10

need to account for index 0 being switch 1
each pass with counter j
if j+1 % current multiple == 0
  boolarray[j] = !boolarray[j]


after n passes need to iterate over bool array with counter i
if boolarray[i]
  push i+1 to results array

DS: array of boolean objects

-given an integer n
-set switches = array (size n, default false)
-set i = 0
-set current_multiple = 1

-repeat n times

--for i from 0 to n - 1

---if i + 1 % current_multiple == 0
----switches[i] = !switches[i]

--current_multiple += 1

-set switches_on = empty array

-for j from 0 to n -1

--if switches[j]
---push j+1 to switches_on

-return switches_on

=end

def toggle_lights(n)
  switches = Array.new(n, false)

  1.upto(n) do |factor|
    n.times do |i|
      switches[i] = !switches[i] if (i+1) % factor == 0
    end
  end

  switches_on = []

  switches.each_with_index do |switch, i|
    switches_on << (i+1) if switch
  end

  switches_on
end

# LS solution

# # initialize the lights hash
# def initialize_lights(number_of_lights)
#   lights = Hash.new
#   1.upto(number_of_lights) { |number| lights[number] = "off" }
#   lights
# end

# # return list of light numbers that are on
# def on_lights(lights)
#   lights.select { |_position, state| state == "on" }.keys
# end

# # toggle every nth light in lights hash
# def toggle_every_nth_light(lights, nth)
#   lights.each do |position, state|
#     if position % nth == 0
#       lights[position] = (state == "off") ? "on" : "off"
#     end
#   end
# end

# # Run entire program for number of lights
# def toggle_lights(number_of_lights)
#   lights = initialize_lights(number_of_lights)
#   1.upto(lights.size) do |iteration_number|
#     toggle_every_nth_light(lights, iteration_number)
#   end

#   on_lights(lights)
# end

def get_lights_string(lights)
  if lights.size > 2
    lights_str = lights[0..-2].map { |light| "#{light}, "}.join + 
      "and #{lights[-1]}"
  elsif lights.size == 2
    lights_str = "#{lights[0]} and #{lights[1]}"
  else
    lights_str = lights[0].to_s
  end

  lights_str
end


def toggle_lights_verbose(n)
  lights_on = toggle_lights(n)
  lights_off = [*(1..n)] - lights_on

  lights_off_str = get_lights_string(lights_off)
  lights_on_str = get_lights_string(lights_on)

  "lights " + lights_off_str + " are now off; " + lights_on_str + " are on."
end

def toggle_lights_short(n)
  (1..n).select { |x| Math.sqrt(x) % 1 == 0 } 
end

p toggle_lights_short(5)
# p toggle_lights(10)
p toggle_lights(1000) == toggle_lights_short(1000)
# p toggle_lights_verbose(5)
