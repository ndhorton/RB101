# What century is that?

def century(year)
  alternate_endings = { 1 => 'st', 2 => 'nd', 3 => 'rd' }
  century = year / 100
  century += 1 unless (year % 100).zero?
  if (alternate_endings.keys.include? century.digits[0]) &&
     (century.digits[1] != 1)
    century.to_s + alternate_endings[century.digits[0]]
  else
    century.to_s + 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
