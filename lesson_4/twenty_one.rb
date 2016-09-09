CARD_VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K).freeze
SUITS = %w(hearts spades clubs diamonds).freeze
MASTER_DECK = CARD_VALUES.product(SUITS)

UPPER_LIMIT = 21
DEALER_STAY = 17

def prompt(msg)
  puts"=> #{msg}"
end

def initialize_deck
  MASTER_DECK.shuffle
end

def display_cards(player_cards)
  cards = []
  player_cards.each do |card|
    cards << "#{card[0]} of #{card[1]}"
  end
  cards.join(', ')
end

def display_dealer_cards(dealer_cards)
  cards = "#{dealer_cards[0][0]} of #{dealer_cards[0][1]} and an unknown card"
  cards
end

def total(cards)
  card_value = cards.map { |card| card[0] }
  total = 0
  card_value.each do |val|
    total +=
      if val == 'A'
        11
      elsif val == 'J' || val == 'Q' || val == 'K'
        10
      else
        val.to_i
      end
  end
  card_value.select { |val| val == 'A' }.count.times do
    total -= 10 if total > UPPER_LIMIT
  end
  total
end

def hit(deck, cards)
  cards << deck.shift
end

def player_turn(deck, player_cards)
  answer = ''
  loop do
    loop do
      prompt("It is Your Turn. Would you like to Hit or Stay?")
      answer = gets.chomp.downcase
      break if %w(hit stay).include?(answer)
      prompt "Invalid choice. You must Hit or Stay."
    end

    if answer == 'hit'
      hit(deck, player_cards)
      prompt("You hit! Your cards are now: #{display_cards(player_cards)}")
      prompt("Total: #{total(player_cards)}")
    end

    break if answer == 'stay' || bust?(total(player_cards))
  end
end

def dealer_turn(deck, dealer_cards)
  loop do
    break if bust?(total(dealer_cards)) || total(dealer_cards) >= DEALER_STAY
    if total(dealer_cards) <= DEALER_STAY
      hit(deck, dealer_cards)
    end
  end
  prompt("The Dealers turn has ended.")
  prompt("Dealers Cards: #{display_cards(dealer_cards)}")
  prompt("Total: #{total(dealer_cards)}")
end

def bust?(cards_total_val)
  cards_total_val > UPPER_LIMIT
end

def calculate_winner(player_total, dealer_total)
  if player_total > dealer_total
    'player'
  elsif dealer_total > player_total
    'dealer'
  else
    'tie'
  end
end

def display_winner(player_cards, dealer_cards)
  result = calculate_winner(player_cards, dealer_cards)

  case result
  when "player"
    prompt("You Win!")
  when "dealer"
    prompt("Dealer Wins!")
  when "tie"
    prompt("It's a Push!")
  end
end

def play_again?
  answer = nil
  loop do
    prompt("Play Again? Yes or No?")
    answer = gets.chomp.downcase
    break if %w(yes y n no).include?(answer)
    prompt("Please Answer Yes or No")
  end
  answer
end

prompt("Welcome to 21. No Splits, No Doubling Down, Just You vs. the Dealer")
# Main Game Loop
loop do
  sleep(1)
  # Initalize / Reset Deck
  current_deck = initialize_deck

  # Deal Cards to Player & Dealer
  player_cards = current_deck.shift(2)
  dealer_cards = current_deck.shift(2)
  prompt("Your Cards: #{display_cards(player_cards)}")
  prompt("Total: #{total(player_cards)}")
  sleep(1)
  prompt("Dealers Cards: #{display_dealer_cards(dealer_cards)}")

  loop do
    player_turn(current_deck, player_cards)
    if bust?(total(player_cards))
      prompt("You Busted! Dealer Wins.")
      break
    end
    dealer_turn(current_deck, dealer_cards)
    if bust?(total(dealer_cards))
      prompt("The Dealer Busted! You Win!")
      break
    end
    prompt("You both stayed. Calculating Results...")
    prompt("Your Total #{total(player_cards)} | Dealer #{total(dealer_cards)}")
    display_winner(total(player_cards), total(dealer_cards))
    break
  end
  break if play_again?.start_with?('n')
end
prompt("Thank You for Playing 21. Good-Bye!")
