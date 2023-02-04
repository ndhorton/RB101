# def display_personal_info(name, options = {})
#   if options.empty?
#     puts "Your name is #{name}"
#   elsif options[:weight] && options[:shoesize]
#     puts "Your name is #{name}, your weight is #{options[:weight]}, "\
#       "and your shoe size is #{options[:shoesize]}"
#   elsif options[:weight]
#     puts "Your name is #{name} and your weight is #{options[:weight]}"
#   end
# end

# display_personal_info('Bob')
# display_personal_info('Greebstalker', weight: '55 lbs')
# display_personal_info('Baal', weight: '578 lbs', shoesize: 900)

def spaceship_case(a, b)
  case (a <=> b)
  when -1
    puts "#{a} is smaller than #{b}"
  when 0
    puts "They are the same"
  when 1
    puts "#{b} is smaller than #{a}"
  end
end

spaceship_case(67, 12)