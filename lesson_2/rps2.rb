def win?(player_1, player_2)
  x_beats_y = { case_1: {
                  rock: 'scissors',
                  paper: 'rock',
                  scissors: 'paper',
                  lizard: 'spock',
                  spock: 'rock' },
                case_2: {
                  rock: 'lizard',
                  paper: 'spock',
                  scissors: 'lizard',
                  lizard: 'paper',
                  spock: 'scissors' }}

  x_beats_y[:case_1][player_1.to_sym] == player_2 ||
    x_beats_y[:case_2][player_1.to_sym] == player_2
end

VALID_CHOICES = %w(rock paper scissors spock)

input = 'sp'

valid_shorthand = { 'r'  => 'rock',
                    'p'  => 'paper',
                    'sc' => 'scissors',
                    'l'  => 'lizard',
                    'sp' => 'spock' }
valid_input.each do |shorthand, full|
  if input.start_with?(shorthand)
    input = full
  end
end