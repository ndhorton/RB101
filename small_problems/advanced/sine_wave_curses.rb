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
