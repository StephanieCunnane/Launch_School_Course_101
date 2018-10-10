WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
WINNING_SCORE = 5
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_MOVER = 'choose'

player_score = 0
computer_score = 0
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

def add_point(old_score)
  old_score + 1
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
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, player_score, computer_score)
  system("clear") || system("cls")
  prompt("You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.")
  prompt("Current score: Player: #{player_score}, Computer: #{computer_score}")
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

def place_piece!(brd, current_player)
  if ['p', 'player'].include?(current_player)
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

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
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

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def detect_game_winner(player_score, computer_score)
  case WINNING_SCORE
  when player_score then 'Player'
  when computer_score then 'Computer'
  end
end

display_welcome_msg

loop do
  board = initialize_board

  if FIRST_MOVER == 'choose'
    loop do
      prompt("Who goes first this round? ('player'/'p' or 'computer'/'c')")
      current_player = gets.chomp.downcase
      break if ['player', 'p', 'computer', 'c'].include?(current_player)
      prompt("That's not a valid answer.")
    end
  end

  loop do
    display_board(board, player_score, computer_score)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won_round?(board) || board_full?(board)
  end

  display_board(board, player_score, computer_score)

  if someone_won_round?(board)
    prompt("#{detect_round_winner(board)} won this round!")

    case detect_round_winner(board)
    when 'Player' then player_score = add_point(player_score)
    when 'Computer' then computer_score = add_point(computer_score)
    end
  else
    prompt("It's a tie!")
  end

  case detect_game_winner(player_score, computer_score)
  when 'Player' then prompt("And Player won the overall game!")
  when 'Computer' then prompt("And Computer won the overall game!")
  end

  break if detect_game_winner(player_score, computer_score)

  answer = ''
  loop do
    prompt("Play again? (y or n)")
    answer = gets.chomp.downcase
    break if ['n', 'no', 'y', 'yes'].include?(answer)
    prompt("That's not a valid answer.")
  end
  break unless ['y', 'yes'].include?(answer)
end

prompt("Thank you for playing Tic Tac Toe! Goodbye!")
