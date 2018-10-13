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
  deck = []
  card_values = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  suits = %w[H D C S]
  suits.each do |suit|
    13.times { |num| deck << [suit, card_values[num].to_s] }
  end
  deck
end

def get_hand!(deck_of_cards)
  hand = deck_of_cards.sample(2)
  deck_of_cards.delete_if { |card| hand.include?(card) }
  hand
end

def display_hands(player_hand, dealer_hand)
  system("clear") || system("cls")
  prompt("Your hand right now: #{player_hand}")
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

def player_turn!(player_hand, dealer_hand, deck_of_cards)
  loop do
    display_hands(player_hand, dealer_hand)
    answer = ''
    loop do
      prompt("Would you like to hit or stay? ('hit'/'h' or 'stay'/'s')")
      answer = gets.chomp
      break if valid_choice?(answer)
      prompt("That's not a valid answer.")
    end
    break if ['stay', 's'].include?(answer) || busted?(player_hand)
    hit!(player_hand, deck_of_cards)
  end
end

def dealer_turn!(dealer_hand, deck_of_cards)
  loop do
    break if calculate_hand_value(dealer_hand) >= 17
    hit!(dealer_hand, deck_of_cards)
  end
end

def hit!(hand, deck_of_cards)
  new_card = deck_of_cards.sample
  deck_of_cards.delete(new_card)
  hand << new_card
end

def busted?(hand)
  calculate_hand_value(hand) > 21
end

# we should only compare hands if neither player has busted
def compare_hands(player_hand, dealer_hand)
  top_score = [calculate_hand_value(player_hand),
               calculate_hand_value(dealer_hand)].max

  player_score = calculate_hand_value(player_hand)
  dealer_score = calculate_hand_value(dealer_hand)

  case top_score
  when player_score then 'Player'
  when dealer_score then 'Dealer'
  end
end

def display_winner(overall_winner, player_hand, dealer_hand)
  prompt("And the final hands:")
  prompt("You: #{player_hand}")
  prompt("Dealer: #{dealer_hand}")
  puts overall_winner ? "#{overall_winner} wins!" : "It's a tie!"
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

loop do
  deck = initialize_deck

  player_hand = get_hand!(deck)
  dealer_hand = get_hand!(deck)

  player_turn!(player_hand, dealer_hand, deck)

  if busted?(player_hand)
    overall_winner = 'Dealer'
    display_winner(overall_winner, player_hand, dealer_hand)
  else
    prompt("You chose to stay. Dealer's turn now...")
  end

  dealer_turn!(dealer_hand, deck)

  if busted?(dealer_hand)
    overall_winner = 'Player'
    display_winner(overall_winner, player_hand, dealer_hand)
  else
    overall_winner = compare_hands(player_hand, dealer_hand)
    display_winner(overall_winner, player_hand, dealer_hand)
  end

  break unless ['y', 'yes'].include?(check_if_we_play_again)
end

prompt("Thank you for playing 21! Goodbye!")
