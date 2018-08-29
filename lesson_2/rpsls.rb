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

player_win_count = 0
computer_win_count = 0

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear') || system('cls')
end

def win?(first, second)
  WINNING_MOVES[first].include?(second)
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

loop do
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase
    choice = ABBREVIATIONS[choice] if ABBREVIATIONS[choice]
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; computer chose: #{computer_choice}."

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_win_count += 1
  elsif win?(computer_choice, choice)
    computer_win_count += 1
  end

  prompt("So far, player wins: #{player_win_count}," \
         " computer wins: #{computer_win_count}")

  if player_win_count == 5
    prompt("Match is over. Player is the grand winner!!")
    break
  elsif computer_win_count == 5
    prompt("Match is over. Computer is the grand winner!!")
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

prompt("Thank you for playing. Goodbye!")
