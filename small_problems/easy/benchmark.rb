def benchmark(block_name)
  start_time = Time.new
  yield
  stop_time = Time.new
  time_taken = stop_time - start_time
  digits = Math.log10(time_taken)
  puts "#{block_name} runtime: #{time_taken}"
end

