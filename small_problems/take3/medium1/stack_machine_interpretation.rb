# Stack Machine Interpretation

=begin

Notes:

questions:

Problem:
input: a string, program
output: no significant return; output PRINT statements to screen

  Write a method that implements a mini stack-register language

rules:
  all arithmetic operations leave result in register
    Numeric literal - place value in register
    ADD - pops value and adds to register
    MULT - pops value and multiplies with register
    SUB - pops value and subtracts from register
    DIV - pops divisor value and divides into register
    MOD - pops divisor, divides into register and leaves modulo value in register
    POP - pop value and place in register
    PUSH - push register to stack
    PRINT - print value in register

Examples:

DS:

Algorithm:
Given a string, program
Set register := 0
Set stack := empty array
Split program on whitespace into array of strings, instructions
Iterate over each instruction in instructions
  execute instruction according to above rules
Return
=end

def minilang(program)
  register = 0
  stack = []

  program.split.each do |token|
    if token.to_i.to_s == token
      register = token.to_i
      next
    end
  
    if token == "PUSH"
      stack.push(register)
    elsif token == "POP"
      if stack.empty?
        return "Error: stack underflow"
      else
        register = stack.pop
      end
    elsif token == "PRINT"
      puts register
    elsif token == "ADD"
      if stack.empty?
        return "Error: stack underflow"
      else
        register += stack.pop
      end
    elsif token == "MULT"
      if stack.empty?
        return "Error: stack underflow"
      else
        register *= stack.pop
      end
    elsif token == "SUB"
      if stack.empty?
        return "Error: stack underflow"
      else
        register -= stack.pop
      end
    elsif token == "DIV"
      if stack.empty?
        return "Error: stack underflow"
      else
        register /= stack.pop
      end
    elsif token == "MOD"
      if stack.empty?
        return "Error: stack underflow"
      else
        register %= stack.pop
      end
    else
      return "Error: invalid token"
    end
  end

  return # nil return indicates success
end

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# 18:42 - forgot to add interpretation of numeric literal and then forgot to
#         convert string token of number to integer

# Further exploration

p minilang("3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH " \
  "3 ADD SUB DIV PRINT")
p minilang('POB')
p minilang('POP')
