def egyptian(rat)
  units = []
  denom = 1
  while units.sum != rat
    unit = Rational(1, denom)
    units << unit if unit + units.sum <= rat
    denom += 1
  end
  units.map { |ration| ration.denominator }
end