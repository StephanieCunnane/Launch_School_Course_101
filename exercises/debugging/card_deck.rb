# We started working on a card game but got stuck. Check out why the code below raises a TypeError.
# The cards arrays that are the values in the deck hash contain both integers and symbols, and we're getting a TypeError when we try to add a symbol to an integer.

# Once you get the program to run and produce a sum, you might notice that the sum is off: It's lower than it should be. Why is that?
# cards, deck[:hearts], deck[:diamonds], deck[:clubs] and deck[:spades] are 5 different ways to reference the exact same Array object. As we build up the player_cards array, we've destructively modified cards, which means that all of our value arrays in the deck hash are affected as well.

# Corrected code
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit
player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck
sum = deck.reduce(0) do |sum, (_suit, cards)|
  scores = cards.map { |card| score(card) }
  sum += scores.sum
end
    
puts sum

