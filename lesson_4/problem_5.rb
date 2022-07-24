flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.find_index { |name| name.start_with?('Be') }