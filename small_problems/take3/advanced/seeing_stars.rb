# Seeing Stars

=begin

Notes:

You need to handle middle line separately:
'*' times n

For the other lines, k=distance from center line:
center(n)
'*' plus ' ' times k-1 plus '*' plus ' ' times k-1 plus '*' 

questions:
do i need to check the argument? No

Problem:
input: an odd integer >= 7
output: print to screen an 8-pointed star in 7*7 grid

  Write a method that displays an 8-pointed star in a n*n grid,
  where n is an ODD integer.

rules:
  the integer argument will be odd and >= 7

Examples:

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *
*  *  *
 * * * 
  ***  
*******
  ***  
 * * * 
*  *  *

DS:

Algorithm:

subprocess draw_line
Given an integer, grid_size, and an integer, distance_from_center
Set spaces := ' ' * (distance_from_center - 1)
Set line := '*' + spaces + '*' + spaces + '*'
Print line centered in field of size n
Return

subprocess star
Given an integer, grid_size
Set half_size := (grid_size - 1) / 2
Iterate for half_size to 1 inclusive, distance_from_center
  draw_line(grid_size, distance_from_center)
Print "*" grid_size times
Iterate for 1 to half_size inclusive, distance_from_center
  draw_line(grid_size, distance_from_center)
Return
=end

def draw_line(grid_size, distance_from_center)
  spaces = ' ' * (distance_from_center - 1)
  line = '*' + spaces + '*' + spaces + '*'
  puts line.center(grid_size)
end

def star(grid_size)
  half_size = (grid_size - 1) / 2
  half_size.downto(1) do |distance_from_center|
    draw_line(grid_size, distance_from_center)
  end

  puts '*' * grid_size

  1.upto(half_size) do |distance_from_center|
    draw_line(grid_size, distance_from_center)
  end
end

# # LS solution
# def print_row(grid_size, distance_from_center)
#   number_of_spaces = distance_from_center - 1
#   spaces = ' ' * number_of_spaces
#   output = Array.new(3, '*').join(spaces)
#   puts output.center(grid_size)
# end

# def star(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(1) { |distance| print_row(grid_size, distance) }
#   puts '*' * grid_size
#   1.upto(max_distance) { |distance| print_row(grid_size, distance) }
# end

# star(7)
# star(9)

# 19:39

# Circle

=begin

Notes:

diameter determines grid size = radius * 2

for our purposes the origin begins in the top-left corner
  of the grid (we're in quadrant IV) so x-axis is positive
  y-axis is negative

for each point in the ascii grid determine distance from center

0,0 1,0 2,0 3,0 4,0 5,0 6,0
sqrt(|x-h|^2 + |-y-k|^2) = length of line drawn to center (h,k)
h = radius
k = -radius

It would probably be easier to use quadrant I values

questions:

Problem:
input:
output:

  Write a method that draws an ascii circle whose size
  is determined by an integer argument, radius

rules:

Examples:

DS:

Algorithm:

=end


def circle(radius)
  # (x - h)^2 + (y - k)^2 == r^2
  # where x is x-coordinate of point on circle, h is x-coordinate of center
  #       y is y-coordinate of point on circle, k is y-coordinate of center
  #       r is radius
  h = radius
  k = radius # k = -radius
  diameter = radius * 2 # grid size is (diameter + 1) * (diameter + 1) which allows
                        # the (radius, -radius) point to be the center
                        # (diameter + 1 is always odd since radius * 2 is always even
                        # so you get a genuine central point instead of four near-center points)
  (0..diameter).each do |y|
    # y = -y # we are in Quadrant IV, with origin at top-left of ascii grid
    # if you do the calculations as though we were in Quadrant 1 it makes no difference
    # but obviously the center point is now just (radius, radius) not (radius, -radius)
    (0..diameter).each do |x|
      distance_to_center = Math.sqrt(((x - h) ** 2) + ((y - k) ** 2))
      difference_to_ideal_circle = (distance_to_center - radius).abs
      if difference_to_ideal_circle < 0.3
        print "* " # compensate for ascii square being taller than wide
      else
        print "  "
      end
    end
    print "\n"
  end
end

# sine wave research... Finished version at the bottom

# AMPLITUDE = 10
# DENOMINATOR = 8
# FREQUENCY = Rational(Math::PI, DENOMINATOR)
# PERIOD = DENOMINATOR * 2
# SPACE = '  '.freeze
# STAR = '* '.freeze

# def sine_wave
#   samples = []
#   current_sample = 0
#   PERIOD.times do
#     samples << (Math.sin(current_sample) * AMPLITUDE).round
#     current_sample += FREQUENCY
#   end
#   grid = Array.new(AMPLITUDE * 2 + 1) { Array.new(PERIOD) { SPACE } }
  
#   (0...PERIOD).each do |column_index|
#     grid[AMPLITUDE - samples[column_index]][column_index] = STAR
#   end
  
#   grid.each do |line|
#     2.times do
#       line.each { |square| print square }
#     end
#     print "\n"
#   end
# end



# include Curses # leaving this out for now
require 'io/console'

# from Rosetta Code
def winsize
  begin
    IO.console.winsize
  rescue LoadError
    [Integer(`tput lines`), Integer(`tput cols`)]
  end
end

def term_lines
  winsize.first
end

def term_cols
  winsize.last
end

# below two methods from https://github.com/cldwalker/
# determines if a shell command exists by searching for it in ENV['PATH']
def command_exists?(command)
  ENV['PATH'].split(File::PATH_SEPARATOR).any? { |d| File.exist?(File.join(d, command)) }
end

# Returns [width, height] of terminal when detected, nil if not detected
# Think of this as a simpler version of Highline's
# Highline::SystemExtensions.terminal_size()
def detect_terminal_size
  if (ENV['COLUMNS'] =~ /^\d$/) && (ENV['LINES'] =~ /^\d$/)
    [ENV['COLUMNS'].to_i, ENV['LINES'].to_i]
  elsif (RUBY_PLATFORM =~ /java/ || (!STDIN.tty? && ENV['TERM'])) && command_exists?('tput')
    [`tput cols`.to_i, `tput lines`.to_i]
  elsif STDIN.tty? && command_exists?('stty')
    `stty size`.scan(/\d+/).map { |s| s.to_i }.reverse
  else
    nil
  end
end

# def winsize
#   begin
#     IO.console.winsize
#   rescue
#     if (ENV['COLUMNS'] =~ /^\d$/) && (ENV['LINES'] =~ /^\d$/)
#       [ENV['COLUMNS'].to_i, ENV['LINES'].to_i].reverse
#     elsif (RUBY_PLATFORM =~ /java/ || (!STDIN.tty? && ENV['TERM'])) && command_exists?('tput')
#       [`tput cols`.to_i, `tput lines`.to_i].reverse
#     elsif STDIN.tty? && command_exists?('stty')
#       `stty size`.scan(/\d+/).map { |s| s.to_i }
#     else
#       nil
#     end
#   end
# end

# Sine wave using Curses

require 'curses'

MARKER = "*".freeze
DENOMINATOR = 8
FREQUENCY = Rational(Math::PI, DENOMINATOR)

def discrete_sin(radians, amplitude)
  (Math.sin(radians) * amplitude).round
end

def discrete_cos(radians, amplitude)
  (Math.cos(radians) * amplitude).round
end

# Initialize general Curses settings
Curses.init_screen
Curses.start_color
Curses.curs_set(0)
Curses.noecho
Curses.init_pair(1, Curses::COLOR_CYAN, Curses::COLOR_BLACK) # 1 now refers to (fg CYAN, bg BLACK)
Curses.init_pair(2, Curses::COLOR_YELLOW, Curses::COLOR_BLACK) # 2 etc
Curses.init_pair(3, Curses::COLOR_MAGENTA, Curses::COLOR_BLACK) # 3 etc
# Initialize viewport window
win = Curses::Window.new(Curses.lines, Curses.cols, 0, 0)
win.nodelay = true
win.refresh

theta_radians = 0
x = 0
midline = win.maxy / 2
amplitude = win.maxy / 2 - 1


begin
  loop do
    # Uncomment the commented lines of code below to get duelling
    # sine and cosine with highlighted intersection points
    sine = midline - discrete_sin(theta_radians, amplitude)
    win.attrset(Curses.color_pair(1) | Curses::A_BOLD)
    win.setpos(sine, x)
    win.addch(MARKER)
    # cosine = midline - discrete_cos(theta_radians, amplitude)
    # if sine == cosine
    #   win.attrset(Curses.color_pair(3) | Curses::A_BOLD)
    # else
    #   win.attrset(Curses.color_pair(2) | Curses::A_BOLD)
    # end
    # win.setpos(cosine, x)
    # win.addch(MARKER)
    x += 2

    if x >= win.maxx
      win.clear
      x = 0
    end
    theta_radians += FREQUENCY

    # Update window-relative settings in case console GUI window gets resized
    midline = win.maxy / 2
    amplitude = win.maxy / 2 - 1
    break if win.getch == 'q'
    # win.refresh
    sleep 0.075
  end
ensure
  Curses.close_screen
end

Curses.close_screen
