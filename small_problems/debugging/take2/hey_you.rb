# HEY YOU!

=begin

The first line of the method body calls `chars` on
the string object referenced by the parameter `name`.
This returns a new array of new strings.
The `each` method is invoked on this array of new strings,
so calling a mutating method like `String#upcase!` in the `each`
block merely mutates the newly created strings and
does not mutate the string object referenced by
`name`.

If we do want to mutate the argument string, then
we can remove the calls to `chars` and `each`
altogether and simply call the destructive `upcase!`
method on the `name` string itself.

If we do not wish to mutate the argument,
we could could change the line to
`name = name.upcase` which uses the non-destructive
`upcase` method to return a new string, which is
then reassigned to the `name` variable. This
reassignment does not mutate the object passed
as argument.

=end

def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
