=begin

Thoughts:
is Forth a stack-and-register language?

so MULT is: acc = MULT(stack.POP(), acc)

Problem:

implement:
n - place value n in register
PUSH - push register to stack, leave in register also
POP - pop value and place in register

ADD
SUB - pop value from stack and subtract from register value
MULT - 
DIV - pop val from stack and divide INTO register dividend, leaving quotient in register
MOD - pop val and divide INTO register dividend, leaving remainder in register

PRINT - print register

Examples:

DS:

variable for register
array for stack

Algorithm:

Given a string, program
Set register := 0

Convert program to array of tokens, split(program, ' ')
Send each token in turn, the register, the stack, to a function that interprets them and
set register = return value

Switch (token)
Case 'PUSH':
  stack.push(acc)
...
Default: (assume integer if not instruction)
  acc = Integer(token)
Return acc
=end

def interpret(stack, register, token)
  case token
  when 'PUSH'
    stack.push(register)
  when 'POP'
    register = stack.pop
  when 'PRINT'
    puts register
  when 'ADD'
    register += stack.pop
  when 'SUB'
    register -= stack.pop
  when 'MULT'
    register *= stack.pop
  when 'DIV'
    register /= stack.pop
  when 'MOD'
    register %= stack.pop
  else
    register = token.to_i
  end
  register
end

def minilang(program)
  stack = []
  register = 0
  tokens = program.split
  tokens.each { |token| register = interpret(stack, register, token) }
end

# LS solution with further exp mods
def minilang(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when 'ADD'
      return 'Error: stack underflow.' if stack.empty?
      register += stack.pop
    when 'MULT'
      return 'Error: stack underflow.' if stack.empty?
      register *= stack.pop
    when 'DIV'
      return 'Error: stack underflow.' if stack.empty?
      register /= stack.pop
    when 'MOD'
      return 'Error: stack underflow.' if stack.empty?
      register %= stack.pop
    when 'SUB'
      return 'Error: stack underflow.' if stack.empty?
      register -= stack.pop
    when 'POP'
      return 'Error: stack underflow.' if stack.empty?
      register = stack.pop
    when 'PUSH'  then stack.push(register)
    when 'PRINT' then puts register
    else
      if token.to_i.to_s == token
        register = token.to_i
      else
        return 'Error: invalid token.'
      end
    end
  end
  nil
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Further exploration
puts "Further exploration:"
minilang('3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT')

puts minilang('POP')
puts minilang('ADD')
puts minilang('SUB')
puts minilang('MULT')
puts minilang('DIV')
puts minilang('MOD')
puts minilang('BORK')
puts minilang('4 PUSH 5 ADD PRINT').inspect
# 27:51, most of it spent reading, would have finished on time but
# forgot I named the register acc at one point and had that name left
# in the `each` block.
# It might be more of an idea to keep looking at the clock earlier on.
