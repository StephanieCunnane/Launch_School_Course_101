def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome_msg
  prompt("############################################################" \
         "##############################################")
  prompt("Welcome to 21! Your goal is to get as close to 21 as possible " \
         "without going over and 'busting'. Good luck!")
  prompt("(Press Enter to begin.)")
  gets
end

def initialize_deck
  card_values = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  suits = %w[H D C S]
  suits.product(card_values).shuffle
end

def get_hand!(deck_of_cards)
  deck_of_cards.pop(2)
end

def display_hands(player_hand, dealer_hand)
  system("clear") || system("cls")
  prompt("Your hand right now: #{player_hand}, for a total of: " \
         "#{calculate_hand_value(player_hand)}")
  prompt("Dealer's hand right now: #{dealer_hand.first} and an unknown card")
  prompt("*****************************************************************")
end

def calculate_hand_value(hand)
  values = hand.map(&:last)

  sum = 0
  values.each do |value|
    sum += if value == 'A'
             11
           elsif value.to_i == 0
             10
           else
             value.to_i
           end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def valid_choice?(user_input)
  %w[hit h stay s].include?(user_input)
end

def player_turn!(player_hand, deck_of_cards)
  loop do
    answer = ''
    loop do
      prompt("Would you like to hit or stay? ('hit'/'h' or 'stay'/'s')")
      answer = gets.chomp
      break if valid_choice?(answer)
      prompt("That's not a valid answer.")
    end
    break if ['stay', 's'].include?(answer) || busted?(player_hand)

    hit!(player_hand, deck_of_cards)

    prompt("You chose to hit!")
    prompt("Your hand right now: #{player_hand}, for a total of: " \
           "#{calculate_hand_value(player_hand)}")
    prompt("******************************************************************")
  end
end

def dealer_turn!(dealer_hand, deck_of_cards)
  loop do
    break if calculate_hand_value(dealer_hand) >= 17
    hit!(dealer_hand, deck_of_cards)
  end
end

def hit!(hand, deck_of_cards)
  hand << deck_of_cards.pop
end

def busted?(hand)
  calculate_hand_value(hand) > 21
end

def detect_results(player_hand, dealer_hand)
  player_score = calculate_hand_value(player_hand)
  dealer_score = calculate_hand_value(dealer_hand)

  if player_score > 21
    :player_busted
  elsif dealer_score > 21
    :dealer_busted
  elsif player_score > dealer_score
    :player
  elsif dealer_score > player_score
    :dealer
  else
    :tie
  end
end

def display_results(player_hand, dealer_hand)
  result = detect_results(player_hand, dealer_hand)

  prompt("And the final hands:")
  prompt("You: #{player_hand}, for a total of: " \
         "#{calculate_hand_value(player_hand)}")
  prompt("Dealer: #{dealer_hand}, for a total of: " \
         "#{calculate_hand_value(dealer_hand)}")

  case result
  when :player_busted then prompt("You busted! Dealer wins!")
  when :dealer_busted then prompt("Dealer busted! You win!")
  when :player then prompt("You win!")
  when :dealer then prompt("Dealer wins!")
  when :tie then prompt("It's a tie!")
  end
end

def play_again?
  answer = ''
  loop do
    prompt("Play again? (y or n)")
    answer = gets.chomp.downcase
    break if valid_play_again_choice?(answer)
    prompt("That's not a valid answer.")
  end
  ['y', 'yes'].include?(answer)
end

def valid_play_again_choice?(user_input)
  ['n', 'no', 'y', 'yes'].include?(user_input)
end

display_welcome_msg

loop do
  deck = initialize_deck

  player_hand = get_hand!(deck)
  dealer_hand = get_hand!(deck)

  display_hands(player_hand, dealer_hand)

  player_turn!(player_hand, deck)

  if busted?(player_hand)
    display_results(player_hand, dealer_hand)
    play_again? ? next : break
  else
    prompt("You chose to stay. Dealer's turn now...")
  end

  dealer_turn!(dealer_hand, deck)

  if busted?(dealer_hand)
    display_results(player_hand, dealer_hand)
    play_again? ? next : break
  end

  break unless play_again?
end

prompt("Thank you for playing 21! Goodbye!")
