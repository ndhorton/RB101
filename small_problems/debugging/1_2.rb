# HEY YOU!

def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you')

# or

def shout_out_to(name)
  uppercase_name = name.chars.map { |c| c.upcase }.join

  puts 'HEY ' + uppercase_name
end

shout_out_to('you') # expected: 'HEY YOU'

# LS solution

def shout_out_to(name)
  puts 'HEY ' + name.upcase
end

shout_out_to('you')