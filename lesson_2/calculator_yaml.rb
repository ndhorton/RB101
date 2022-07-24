require 'yaml'

text_output = {
  
  :english => { 
                :op_to_msg     => {'1' => 'Adding', '2' => 'Subtracting',
                                   '3' => 'Multiplying', '4' => 'Dividing'},
                :greeting      => 'Welcome to Calculator! Enter your name:',
                :name_empty    => 'Make sure to use a valid name.',
                :name_greeting => "Hi ",
                :first_num     => "What's the first number?",
                :second_num    => "What's the second number?",
                :invalid_num   => "Hmm... that doesn't look like a valid number",
                :op_prompt     => 
                "What operation would you like to perform?\n   1) add\n   2) subtract\n   3) multiply\n   4) divide",
                :invalid_op    => 'Must choose 1, 2, 3 or 4',
                :wait_msg      => "the two numbers...",
                :result        => "The result is ",
                :again         => 'Do you want to perform another calculation? (Y to calculate again)',
                :goodbye       => "Thank you for using the calculator. Goodbye!"
              },
  :spanish => {
                :op_to_msg     => {'1' => 'Agregar', '2' => 'Restando',
                                   '3' => 'Multiplicando', '4' => 'División'},
                :greeting      => '¡Bienvenido a Calculadora! Introduzca su nombre:',
                :name_empty    => 'Asegúrate de usar un nombre válido.',
                :name_greeting => "Hola, ",
                :first_num     => "¿Cuál es el primer número?",
                :second_num    => "¿Cuál es el segundo número?",
                :invalid_num   => "Hmm... eso no parece un número válido",
                :op_prompt     => "¿Qué operación le gustaría realizar?\n   1) agregar\n   2) restar\n   3) multiplicar\n   4) dividir",
                :invalid_op    => 'Debe elegir 1, 2, 3 o 4',
                :wait_msg      => "los dos números...",
                :result        => "El resultado es ",
                :again         => '¿Quieres realizar otro cálculo? (Y para calcular de nuevo)',
                :goodbye       => "Gracias por usar la calculadora. ¡Adiós!"
                }
}


File.open("calculator2.yml", "w") { |file| file.write(text_output.to_yaml) }
