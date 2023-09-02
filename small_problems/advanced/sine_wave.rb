# Draw an ascii sine wave with x and y flipped

DENOMINATOR = 8
AMPLITUDE = 10
PERIOD = DENOMINATOR * 2
CENTER_LINE = AMPLITUDE * 2

while true
  (0).upto(PERIOD - 1) do |coefficient|
    # theta = (coefficient * Math::PI).fdiv(DENOMINATOR)
    theta = Rational(coefficient * Math::PI, DENOMINATOR)
    sin_value = (Math.sin(theta) * AMPLITUDE).round
    print ' ' * (CENTER_LINE + sin_value)
    print "*\n"
    sleep 0.3
  end
end
