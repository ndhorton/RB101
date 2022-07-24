def dot_calc(str)
  expression = str.split
  first_operand = expression[0].size
  second_operand = expression[2].size
  case expression[1]
  when '+'
    dot_factor = first_operand + second_operand
  when '-'
    dot_factor = first_operand - second_operand
  when '*'
    dot_factor = first_operand * second_operand
  when '//'
    dot_factor = first_operand / second_operand
  end
  '.' * dot_factor
end

p dot_calc('... * ..')