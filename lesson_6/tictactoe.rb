WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
WINNING_SCORE = 5
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_MOVER = nil

game_score = { player: 0, computer: 0 }
current_player = FIRST_MOVER

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter=', ', joining_word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{joining_word} ")
  else
    arr[-1] = "#{joining_word} #{arr.last}"
    arr.join(delimiter)
  end
end

def display_welcome_msg
  prompt("############################################################" \
         "##############################")
  prompt("Welcome to Tic Tac Toe! The first player to win 5 rounds is " \
         "the overall winner. Good luck!")
  prompt("(Press Enter to begin.)")
  gets
end

def initialize_board
  (1..9).each_with_object({}) { |num, board| board[num] = INITIAL_MARKER }
end

def pick_who_starts(present_player)
  loop do
    prompt("Who goes first this game? ('player'/'p' or 'computer'/'c')")
    present_player = gets.chomp.downcase.to_sym
    break if valid_player_choice?(present_player)
    prompt("That's not a valid answer.")
  end
  present_player
end

def valid_player_choice?(user_input)
  [:player, :p, :computer, :c].include?(user_input)
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, score)
  system("clear") || system("cls")
  prompt("You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.")
  prompt("Current score: Player: #{score[:player]}, " \
         "Computer: #{score[:computer]}")
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
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(brd, present_player)
  if [:p, :player].include?(present_player)
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid square.")
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = if detect_two_in_a_row(brd, COMPUTER_MARKER)
             detect_two_in_a_row(brd, COMPUTER_MARKER)
           elsif detect_two_in_a_row(brd, PLAYER_MARKER)
             detect_two_in_a_row(brd, PLAYER_MARKER)
           elsif empty_squares(brd).include?(5)
             5
           else
             empty_squares(brd).sample
           end

  brd[square] = COMPUTER_MARKER
end

def alternate_player(present_player)
  present_player == :player || present_player == :p ? :computer : :player
end

def detect_two_in_a_row(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line.select { |square| brd[square] == INITIAL_MARKER }[0]
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won_round?(brd)
  !!detect_round_winner(brd)
end

def update_score!(score, brd)
  case detect_round_winner(brd)
  when :player then score[:player] += 1
  when :computer then score[:computer] += 1
  end
end

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return :player
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return :computer
    end
  end
  nil
end

def detect_game_winner(score)
  case WINNING_SCORE
  when score[:player] then :player
  when score[:computer] then :computer
  end
end

def display_game_winner(score)
  case detect_game_winner(score)
  when :player then 'And Player won the game!'
  when :computer then 'And Computer won the game!'
  end
end

def check_if_we_play_again
  answer = ''
  loop do
    prompt("Play again? (y or n)")
    answer = gets.chomp.downcase
    break if valid_play_again_choice?(answer)
    prompt("That's not a valid answer.")
  end
  answer
end

def valid_play_again_choice?(user_input)
  ['n', 'no', 'y', 'yes'].include?(user_input)
end

display_welcome_msg

first_player = pick_who_starts(current_player) unless FIRST_MOVER

loop do
  board = initialize_board
  current_player = first_player unless FIRST_MOVER

  loop do
    display_board(board, game_score)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won_round?(board) || board_full?(board)
  end

  display_board(board, game_score)

  if someone_won_round?(board)
    prompt("#{detect_round_winner(board).capitalize} won this round!")
    update_score!(game_score, board)
  else
    prompt("It's a tie!")
  end

  if game_score.values.include?(WINNING_SCORE)
    prompt(display_game_winner(game_score))
  end

  break if detect_game_winner(game_score)
  break unless ['y', 'yes'].include?(check_if_we_play_again)
end

prompt("Thank you for playing Tic Tac Toe! Goodbye!")
