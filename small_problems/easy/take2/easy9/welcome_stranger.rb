# Welcome Stranger

# input: an array, names, and a hash, professional_details
# output: print greeting using name and details

# print "Hello, #{name}! Nice to have a #{title} #{occupation} around."

# Given an array, names, and a hash, professional_details
# Set name := join(names, ' ')

def greetings(names, professional_details)
  "Hello, #{names.join(' ')}! " \
  "Nice to have a #{professional_details[:title]} " \
  "#{professional_details[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
