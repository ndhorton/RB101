board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

def draw_board(board_state)
  first_two_lines = ['_','|','_','|','_']
  last_line = [' ', '|',' ','|', ' ']

  system('clear')

  2.times do |time|
    counter  = 0
    first_two_lines.each_with_index do |char, index|
      if index.odd?
        print char
      else
        if board_state[time][counter]
          print board_state[time][counter]
        else
          print char
        end
        counter += 1
      end
    end
    puts
  end
  counter = 0
  last_line.each_with_index do |char, index|
    if index.odd?
      print char
    else
      if board_state[2][counter]
        print board_state[2][counter]
      else
        print char
      end
      counter += 1
    end
  end
  puts
end

draw_board(board)