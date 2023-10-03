# Stack Machine Interpretation

=begin
Notes:

Problem:
input: a string
output: possibly print to screen but no significant return

Write a method that implements a stack-and-register
language interpreter based on given operations

rules:
  no significant return
  for arithmetic ops the value removed from stack
    is the right-hand operand in infix notation
    so for DIV the stack value is the divisor, the
    register is the dividend
  initialize register to 0
  assume all programs are correct programs
 
ops:
number - place number in register
PUSH
POP
ADD
SUB
MULT
DIV
MOD
PRINT

Examples and test cases:

Data structures:

register = a local variable
stack = array

Algorithm:
Given a string, program
Set register := 0
Set stack := empty array
Split program into an array of strings on whitespace, instructions
Iterate over each instruction in instructions
  If instruction == 'PUSH'
    Push register to stack
  Else if instruction == 'POP'
    Pop stack into register
  Else if instruction == 'ADD'
    Add popped value to register and store in register
  Else if instruction == 'SUB'
    Subtract popped value from register and store in register
  Else if instruction == ''
  ...
  Else (only leaving the case of a number)
    Convert instruction to integer
    Store integer in register
Return
=end

def minilang(program)
  instructions = program.split
  register = 0
  stack = []
  instructions.each do |instruction|
    case instruction
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'PRINT' then puts(register)
    else
      register = instruction.to_i
    end
  end
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

# 19:16
