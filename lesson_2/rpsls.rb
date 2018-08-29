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

def announce_grand_winner(player_points)
  grand_winner = player_points == WINNING_SCORE ? "Player" : "Computer"
  prompt("----------------------------------------------------")
  prompt("The match is over. #{grand_winner} is the grand winner!!")
end

prompt("----------------------------------------------------")
prompt("Welcome to Rock Paper Scissors Lizard Spock!")
prompt("The first player to #{WINNING_SCORE} points wins the overall match.")
prompt("----------------------------------------------------")

loop do
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("(Or just type 'r', 'p', 'sc', 'l' or 'sp')")
    choice = gets.chomp.downcase
    choice = ABBREVIATIONS[choice] if ABBREVIATIONS[choice]
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}, computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_points += 1
  elsif win?(computer_choice, choice)
    computer_points += 1
  end

  prompt("So far, player points: #{player_points}," \
         " computer points: #{computer_points}")

  if player_points == WINNING_SCORE || computer_points == WINNING_SCORE
    announce_grand_winner(player_points)
    break
  end

  answer = nil
  loop do
    prompt("Do you want to play again? (Y or N)")
    answer = gets.chomp.downcase
    break if %w(y n yes no).include?(answer)
    prompt("That's not a valid choice.")
  end

  if %w(y yes).include?(answer)
    clear_screen
  else
    break
  end
end

prompt("Thank you for playing Rock Paper Scissors Lizard Spock. Goodbye!")
