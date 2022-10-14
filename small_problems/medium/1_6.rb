# Stack Machine Interpretation

=begin

Read-Evaluate-Print Loop

loop
  get_instruction
  evaluate_instruction
  print_result
end loop

maybe after instructions that simply store, still print a little confirmation
equivalent to irb's "=> "

get instructions:

instructions = []
instructions = gets.chomp.upcase.split

parsing instructions:

n: put an integer in register, so needs a method to test for integers (true/false)
does not modify stack

PUSH: push the register value to the stack array, keep value in register also

POP: remove topmost element from stack array and store in register

PRINT: print register value

ADD: pop value from stack and add to register value, store result in register

SUB: pop value from stack and subtracts it from the register value, store result in register

MULT: pop a value from the stack and multiply by register value, store result in register

DIV: " " divide register number (dividend) by popped stack value (divisor)
or divide stack value _into_ register value, store integer part of quotient in register

MOD: as DIV but store integer remainder in register


anything other than above commands: print SYNTAXERROR, loop

so initially, loop over a string rather than REPL

The instructions will be converted to array, so essentially an
instruction stack?

POP and n are special cases that are difficult to abstract to
one method controlling all instructions. The stack array object
can be passed and mutated but the register is an integer.
You would therefore need to store as a string in order to mutate
and do something like

register.clearbefore repl, however, just do the loop based on string
or

register << instruction (if instruction is n)

BUT i don't think this is worth it, because the need to
clear the string object means that you would need a swap register

what you could do is simply have the register be an array of 1 element

-given a string, instruction_string
-set instructions = split instruction_string into an array
-evaluate and execute instructions


=end

# def n?(instruction)
#   instruction.to_i.to_s == instruction
# end

# def execute(instruction, stack, register)
#   if n?(instruction)
#     register[0] = instruction.to_i
#     return
#   end

#   case instruction
#   when 'PUSH'
#     stack << register[0]
#   when 'POP'
#     register[0] = stack.pop
#   when 'PRINT'
#     puts register[0]
#   when 'ADD'
#     register[0] += stack.pop
#   when 'SUB'
#     register[0] -= stack.pop
#   when 'MULT'
#     register[0] *= stack.pop
#   when 'DIV'
#     register[0] /= stack.pop
#   when 'MOD'
#     register[0] %= stack.pop
#   end
# end

# def evaluate(instruction_stack, stack, register)
#   instruction_stack.each { |instruction| execute(instruction, stack, register) }
# end

# def minilang(instruction_string)
#   stack = []
#   register = [0]
#   instruction_stack = instruction_string.split

#   evaluate(instruction_stack, stack, register)
# end

def minilang(program)
  stack = []
  register = 0
  program.split.each do |token|
    if token.to_i.to_s == token
      register = token.to_i
      next
    end

    case token
    when 'ADD'
      return "Stack underflow" if stack.empty?
      register += stack.pop
    when 'DIV'
      return "Stack underflow" if stack.empty?
      return "Zero Division Error" if stack.last == 0
      register /= stack.pop
    when 'MULT'
      return "Stack underflow" if stack.empty?
      register *= stack.pop
    when 'MOD'
      return "Stack underflow" if stack.empty?
      return "Zero Division Error" if stack.last == 0
      register %= stack.pop
    when 'SUB'
      return "Stack underflow" if stack.empty?
      register -= stack.pop
    when 'PUSH'
      stack.push(register)
    when 'POP'
      return "Stack underflow" if stack.empty?
      register = stack.pop
    when 'PRINT'
      puts register
    else
      return "Syntax Error: unrecognized token: #{token}"
    end
  end

  return nil
end


minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
minilang('-3 PUSH 5 SUB PRINT')
minilang('6 PUSH')

p minilang('ADD 6 PUSH 7 ADD PRINT')
p minilang('4.5 PUSH AD PINRT')
p minilang('PUSH 5 DIV')
p minilang('0 PUSH 5 MOD')

minilang('3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT')
