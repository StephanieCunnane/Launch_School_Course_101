VALID_CHOICES = ["rock", "paper", "scissors"]

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  player_wins = "You won!"
  computer_wins = "Computer won!"

  case [player, computer]
  when ['rock', 'scissors'] then player_wins
  when ['paper', 'rock'] then player_wins
  when ['scissors', 'paper'] then player_wins
  when ['rock', 'paper'] then computer_wins
  when ['paper', 'scissors'] then computer_wins
  when ['scissors', 'rock'] then computer_wins
  else "It's a tie!"
  end
end

loop do
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; computer chose: #{computer_choice}."

  puts display_results(choice, computer_choice)

  answer = nil
  loop do
    prompt("Do you want to play again? (Y or N)")
    answer = gets.chomp.downcase
    break if %w(y n yes no).include?(answer)
    prompt("That's not a valid choice.")
  end
  break if %w(n no).include?(answer)
end

prompt("Thank you for playing. Goodbye!")
