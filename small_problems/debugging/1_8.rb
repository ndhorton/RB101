# Password

# The problem is that `password` is a local variable initialized outside the scope 
# created by the `set_password` method.
# This can be fixed by reassigning `password` in the `main` scope to the return
# value of the `set_password` method and removing the reference to the out-of-scope
# variable from the method.
# The password also needs to be passed in to the `verify_password` method, which
# needs a parameter to accept it.

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)
