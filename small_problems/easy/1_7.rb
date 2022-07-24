# Stringy Strings

def stringy(width, starter=1)
  str = ''
  width.times do |i|
    if i.even?
      str << (starter == 1 ? '1': '0')
    else
      str << (starter == 1 ? '0': '1')
    end
  end
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(5, 0)
puts stringy(5)