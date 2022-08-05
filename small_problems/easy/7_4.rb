def benchmark(block_name)
  start_time = Time.new
  yield if block_given?
  stop_time = Time.new
  time_taken = stop_time - start_time
  digits = Math.log10(time_taken)
  puts "#{block_name} runtime: #{time_taken}"
end



def swapcase(string)
  swap_str = ''

  string.chars.each do |char|
    if /[a-z]/ =~ char
      swap_str << (char.ord - 32).chr
    elsif
      /[A-Z]/ =~ char
      swap_str << (char.ord + 32).chr
    else
      swap_str << char
    end
  end

  swap_str
end

def swapcase2(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      (char.ord - 32).chr
    elsif char =~ /[A-Z]/
      (char.ord + 32).chr
    else
      char
    end
  end

  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

benchmark('string builder') { swapcase('Test') }
benchmark('array transform') { swapcase2('Test') }