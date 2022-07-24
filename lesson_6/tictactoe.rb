# Constants
INITIAL_MARKER = ' '
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

# Method definitions
def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, player_score, computer_score)
  system('clear')
  puts "Player is #{@player_marker}. Computer is #{@computer_marker}."
  puts "Player score: #{player_score}. Computer score: #{computer_score}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator1 = ', ', separator2 = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{separator2} ")
  else
    arr[-1] = "#{separator2} #{arr.last}"
    arr.join(separator1)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = @player_marker
end

def find_significant_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

# rubocop:disable Metrics/CyclomaticComplexity
def computer_places_piece!(brd)
  square = nil

  # offense
  WINNING_LINES.each do |line|
    square = find_significant_square(line, brd, @computer_marker)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_significant_square(line, brd, @player_marker)
      break if square
    end
  end

  square = 5 if !square && empty_squares(brd).include?(5)

  square = empty_squares(brd).sample if !square

  brd[square] = @computer_marker
end
# rubocop:enable Metrics/CyclomaticComplexity

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(@player_marker) == 3
      return 'Player'
    elsif brd.values_at(*line).count(@computer_marker) == 3
      return 'Computer'
    end
  end
  nil
end

def declare_game_winner(brd, player_score, computer_score)
  display_board(brd, player_score, computer_score)
  prompt "#{detect_winner(brd)} won!"
  puts
  prompt "At the end of the game, Player scored #{player_score}, "\
         "Computer scored #{computer_score}."
  if player_score > computer_score
    prompt "Player has won the game!"
  else
    prompt "Computer has won the game!"
  end
  puts
  nil
end

def place_piece!(brd, current_player)
  case current_player
  when 'Player' then player_places_piece!(brd)
  when 'Computer' then computer_places_piece!(brd)
  end
  nil
end

def choose_who_begins
  system('clear')
  prompt "Who goes first? Choose:"
  prompt "1. Player"
  prompt "2. Computer"
  move_order = ''
  loop do
    move_order = gets.chomp
    break if move_order == '1' || move_order == '2'
    prompt "That is not a valid choice."
  end
  move_order.to_i
end

def alternate_player(current_player)
  case current_player
  when 'Player'   then 'Computer'
  when 'Computer' then 'Player'
  end
end

# Main program
player_score = 0
computer_score = 0

move_order = choose_who_begins
case move_order
when 1
  @player_marker = 'X'
  @computer_marker = 'O'
when 2
  @player_marker = 'O'
  @computer_marker = 'X'
end

loop do
  board = initialize_board
  current_player = move_order == 1 ? 'Player' : 'Computer'

  loop do
    display_board(board, player_score, computer_score)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, player_score, computer_score)

  case detect_winner(board)
  when 'Player'
    player_score += 1
    prompt "Player won!"
  when 'Computer'
    computer_score += 1
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end

  if player_score >= 5 || computer_score >= 5
    declare_game_winner(board, player_score, computer_score)
    player_score = 0
    computer_score = 0
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp.downcase

  break unless answer.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
