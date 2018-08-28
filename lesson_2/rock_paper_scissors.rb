VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
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
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; computer chose: #{computer_choice}."

  display_results(choice, computer_choice)

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
