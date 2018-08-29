VALID_CHOICES = %w(rock paper scissors lizard spock)
ABBREVIATIONS = {
  "r"  => "rock",
  "p"  => "paper",
  "sc" => "scissors",
  "l"  => "lizard",
  "sp" => "spock"
}
WINNING_MOVES = {
  "rock"     => ["scissors", "lizard"],
  "paper"    => ["rock", "spock"],
  "scissors" => ["lizard", "paper"],
  "lizard"   => ["paper", "spock"],
  "spock"    => ["scissors", "rock"]
}
WINNING_SCORE = 5

player_points = 0
computer_points = 0

def prompt(message)
  puts "=> #{message}"
end

def display_welcome
  prompt("----------------------------------------------------")
  prompt("Welcome to Rock Paper Scissors Lizard Spock!")
  prompt("The first player to #{WINNING_SCORE} points wins the overall match.")
  prompt("----------------------------------------------------")
end

def clear_screen
  system('clear') || system('cls')
end

def win?(choice1, choice2)
  WINNING_MOVES[choice1].include?(choice2)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

display_welcome()

loop do
  player_choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("(Or just type 'r', 'p', 'sc', 'l' or 'sp')")
    player_choice = gets.chomp.downcase
    player_choice = ABBREVIATIONS[player_choice] if ABBREVIATIONS[player_choice]
    break if VALID_CHOICES.include?(player_choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{player_choice}, computer chose: #{computer_choice}")

  display_results(player_choice, computer_choice)

  if win?(player_choice, computer_choice)
    player_points += 1
  elsif win?(computer_choice, player_choice)
    computer_points += 1
  end

  prompt("So far, player points: #{player_points}," \
         " computer points: #{computer_points}")

  if player_points == WINNING_SCORE || computer_points == WINNING_SCORE
    grand_winner = player_points == WINNING_SCORE ? "Player" : "Computer"
    prompt("----------------------------------------------------")
    prompt("The match is over. #{grand_winner} is the grand winner!!")
    break
  end

  answer = nil
  loop do
    prompt("Do you want to play again? (Y or N)")
    answer = gets.chomp.downcase
    break if %w(y n yes no).include?(answer)
    prompt("That's not a valid choice.")
  end

  break unless %w(y yes).include?(answer)
  clear_screen()
end

prompt("Thank you for playing Rock Paper Scissors Lizard Spock. Goodbye!")
