def circle(radius)
  # a y-loop and x-loop
  # y goes first because we scan downwards slower than across
  # inside x loop we use the diameter as the range of testable values for each axis
  # we take the distance between the current (x,y) and the center of the circle
  #   using the distance formula/Pythagorean theory
  # the centre of the circle is (radius,radius)
  # we take the |difference| between the discrete point on the ascii grid
  #   and the radius of the ideal circle in continuous Cartesian space
  # if the distance is less than 0.5, print the point (this value can be
  #   adjusted downwards to be more circular)
  # a point needs to be "* " because ascii chars are taller than wide by close to 2:1
  # if we don't plot a point, we need to skip ahead by printing "  " two spaces
  diameter = radius * 2
  (0..diameter).each do |y|
    (0..diameter).each do |x|
      distance = Math.sqrt(((x - radius) ** 2) + ((y - radius) ** 2))
      difference_from_ideal_circle = (radius - distance).abs
      if difference_from_ideal_circle < 0.2
        print("* ")
      else
        print("  ")
      end
    end
    print("\n")
  end
end

circle(10)
circle(5)