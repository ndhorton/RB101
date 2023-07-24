# Countdown

=begin

It is attempting to decrement an integer argument within a method
without using the return value in the calling scope. Since the
`counter` parameter is a separate variable from the `counter`
variable passed as argument, and integers are immutable, and
reassignment does not mutate an object anyway, it would be
necessary to reassign the `counter` in the calling scope to the
return value in order to change the integer referenced by the
calling scope variable. The assignment in `decrease` is essentially
redundant and the method body can be changed to `counter - decrease`
to more clearly express what the method does: implicitly return the integer
`1` less than the argument.

Further exploration

The simplest way to refactor might be to change
`10.times do` to `while counter > 0`

You could also do
`10.downto(1) do |counter| ` and remove the `counter = 10`
  initialization before the loop
or various other things
=end

def decrease(counter)
  counter - 1
end

counter = 10

while counter > 0
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'