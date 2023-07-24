# Password

=begin

The first problem in order of execution is the call to the `set_password` method,
specifically that at invocation the return value of `set_password` is
being ignored.

Since variable `password`, initialized on line 1, is a
local variable, it is not available within the `set_password`
method and so the assignment to `password` on the final line
of the method definition body is in fact an initialization of
a variable local to that method and not a reassignment of the
`password` initialized on line 1 in the `main`/toplevel scope.

To fix this, we could simply reassign the `password` variable
initialized on line 1 to the return value of `set_password`.
We could also remove the redundant initialization of the
`password` variable in the `set_password` method definition
on line 6 and move the initialization of the local variable
`password` below the method definitions, where it is easier to
see that it has local scope.

The second problem is again one of scope. The `password` variable
is not being passed in to the `verify_password` method. Therefore,
when we attempt to compare `input` to `password` on line 14,
a `password` varible has not been initialized in the method's scope
so a `NameError` is raised.

This can be fixed by redefining `verify_password` with a parameter,
`password`, and then by passing in the local variable `password` 
as argument at invocation.

=end

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

password = nil

if !password
  password = set_password
end

verify_password(password)